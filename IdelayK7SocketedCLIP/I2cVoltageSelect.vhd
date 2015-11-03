-------------------------------------------------------------------------------
--
-- File: I2cVoltageSelect.vhd
-- Author: National Instruments
-- Original Project: Ni6583
-- Date: 8 July 2009
--
-------------------------------------------------------------------------------
-- Copyright © 2010 National Instruments Corporation.
--
-- Use of this file is subject to the Software License Agreement provided with 
-- the NI FlexRIO Adapter Module Support software and, without limiting any of 
-- the provisions in that license, modifying or distributing this file is 
-- prohibited.
--
-- Adding to, deleting from, or otherwise modifying the contents of this file 
-- may cause the software to malfunction.
-------------------------------------------------------------------------------
--
-- Purpose: State machine responsible setting DAC voltage for SE IO
-- power supply. Requires I2cIssueCycle.vhd.
--
-- vreview_reviewers kygreen rortega dhearn dcabrera
-- vreview_group VoltageSelect
-- vreview_closed http://review-board.natinst.com/r/75822/
-------------------------------------------------------------------------------

Library IEEE;
use IEEE.Std_Logic_1164.all; 


entity I2cVoltageSelect is
  port( -- CLIP interface connections
        rSetVoltage           : in std_logic;
        rSetVoltageDone       : out std_logic;
        rDAC                  : in std_logic_vector(15 downto 0);
        -- Adapter connections
        aResetSl              : in  std_logic;
        rIoModGpioEn          : in  std_logic;
        rLvFpgaReqI2cBus      : out std_logic;
        rLvFpgaAckI2cBus      : in  std_logic;
        rLvFpgaI2cGo          : out std_logic;
        rLvFpgaI2cStart       : out std_logic;
        rLvFpgaI2cStop        : out std_logic;
        rLvFpgaI2cRd          : out std_logic;
        rLvFpgaI2cWtData      : out std_logic_vector(7 downto 0);
        rLvFpgaI2cAck         : in  std_logic;
        rLvFpgaI2cDone        : in  std_logic;
        rLvFpgaI2cRdData      : in  std_logic_vector(7 downto 0);
        rClkToSocket          : in  std_logic); 
end I2cVoltageSelect;

architecture rtl of I2cVoltageSelect is

  --vhook_sigstart
  --vhook_sigend
  type State_type is (Idle,CheckAck,DeviceSelect,DeviceSelectStart,
                      CommandByte,CommandByteStart,LSData,
                      LSDataStart,MSData,MSDataStart);
                      
  signal state : State_type := Idle;
  signal rCycleStart            : std_logic;
  signal rReady                 : std_logic;
  signal rI2cStartBit           : std_logic;
  signal rI2cStopBit            : std_logic;
  signal rI2cWriteData          : std_logic_vector(7 downto 0) := x"00";
  signal rLSDataByteHold        : std_logic_vector(7 downto 0) := x"00";
  signal rMSDataByteHold        : std_logic_vector(7 downto 0) := x"00";
  signal rDevSel                : std_logic;
  signal rCmdByteSel            : std_logic;
  signal rMSDataSel             : std_logic;
  signal rLSDataSel             : std_logic;
  signal rWrDataSelect          : std_logic_vector(3 downto 0);

begin
    
  --vhook_e I2cIssueCycle
  --vhook_a rI2cReadData open 
  --vhook_a rI2cRead '0'
  I2cIssueCyclex: entity work.I2cIssueCycle (behavioral)
    port map (
      rCycleStart      => rCycleStart,       -- in  std_logic
      rReady           => rReady,            -- out std_logic
      rI2cStartBit     => rI2cStartBit,      -- in  std_logic
      rI2cStopBit      => rI2cStopBit,       -- in  std_logic
      rI2cRead         => '0',               -- in  std_logic
      rI2cWriteData    => rI2cWriteData,     -- in  std_logic_vector(7 downto 0)
      rI2cReadData     => open,              -- out std_logic_vector(7 downto 0)
      aResetSl         => aResetSl,          -- in  std_logic
      rIoModGpioEn     => rIoModGpioEn,      -- in  std_logic
      rLvFpgaI2cGo     => rLvFpgaI2cGo,      -- out std_logic
      rLvFpgaI2cStart  => rLvFpgaI2cStart,   -- out std_logic
      rLvFpgaI2cStop   => rLvFpgaI2cStop,    -- out std_logic
      rLvFpgaI2cRd     => rLvFpgaI2cRd,      -- out std_logic
      rLvFpgaI2cWtData => rLvFpgaI2cWtData,  -- out std_logic_vector(7 downto 0)
      rLvFpgaI2cAck    => rLvFpgaI2cAck,     -- in  std_logic
      rLvFpgaI2cDone   => rLvFpgaI2cDone,    -- in  std_logic
      rLvFpgaI2cRdData => rLvFpgaI2cRdData,  -- in  std_logic_vector(7 downto 0)
      rClkToSocket     => rClkToSocket);     -- in  std_logic 
  
  -- ! STATE MACHINE STARTUP !
  -- The state machine begins in the idle state and cannot leave until
  -- rIoModGpioEn and rSetVoltage is set. rSetVoltage is set safely by the top
  -- level state machine VoltageSelectTop.    
          
  I2cIssueCycleSM: process (aResetSl,rClkToSocket) is
  begin
    if aResetSl = '1' then
      state <= Idle;
      rLSDataByteHold <= (others=>'0');
      rMSDataByteHold <= (others=>'0');
  
    elsif rising_edge(rClkToSocket) then           
      case state is
        when Idle =>
          if rIoModGpioEn = '1' then  
            -- Voltage Set Cycle will be issued on rising edge of SetVoltage.
            if rSetVoltage = '1' then
              rLSDataByteHold <= rDAC(7 downto 0); 
              rMSDataByteHold <= rDAC(15 downto 8);
              state <= CheckAck;
            end if;
          end if;  
        when CheckAck =>
          if rLvFpgaAckI2cBus='1' and rReady='1' then
              state <= DeviceSelect;
          else
              state <= CheckAck;
          end if;
        when DeviceSelect =>
          state <= DeviceSelectStart;
        when DeviceSelectStart =>
          if rReady='1' then
              state <= CommandByte;
          else
              state <= DeviceSelectStart;
          end if;
        when CommandByte =>
          state <= CommandByteStart;
        when CommandByteStart =>
          if rReady='1' then
              state <= LSData;
          else
              state <= CommandByteStart;
          end if;
        when LSData =>
          state <= LSDataStart;
        when LSDataStart =>
          if rReady='1' then
              state <= MSData;
          else
              state <= LSDataStart;
          end if;
        when MSData =>
          state <= MSDataStart;
        when MSDataStart =>
          if rReady='1' then
              state <= Idle;
          else
              state <= MSDataStart;
          end if;
        when others =>
          state <= Idle;
      end case;
    end if;
  end process;

  rLvFpgaReqI2cBus <= '0' when state = Idle else '1';
  rCycleStart <= '1' when state = DeviceSelect or state = CommandByte
                         or state = LSData or state = MSData else '0';
  rSetVoltageDone <= '1' when state = Idle else '0';
  
  -- Combine states into a selection signal that connects correct data to I2C write input
  -- Note that all these signals are mutually exclusive and span two clock cycles!
  rDevSel <= '1' when state = DeviceSelect or state = DeviceSelectStart else '0';
  rCmdByteSel <= '1' when state = CommandByte or state = CommandByteStart else '0';
  rLSDataSel <= '1' when state = LSData or state = LSDataStart else '0';
  rMSDataSel <= '1' when state = MSData or state = MSDataStart else '0';
  
  rI2cStartBit <= '1' when rDevSel = '1' else '0';
  rI2cStopBit <= '1' when rMSDataSel = '1' else '0';
  
  rWrDataSelect <= rMSDataSel & rLSDataSel & rCmdByteSel & rDevSel;
  
  WrDataMux: process (rWrDataSelect,rLSDataByteHold,rMSDataByteHold) is
  begin
    case rWrDataSelect is
      when x"1" =>  -- DAC Address Device Select
        rI2cWriteData <= x"40";
      when x"2" =>  -- DAC Command Byte
        rI2cWriteData <= x"04";
      when x"4" =>  -- DAC LSData Byte
        rI2cWriteData <= rLSDataByteHold;
      when x"8" =>  -- DAC MSData Byte
        rI2cWriteData <= rMSDataByteHold;
      when others => -- Idle value
        rI2cWriteData <= x"00";
    end case;
  end process;
     
end rtl;
