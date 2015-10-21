-------------------------------------------------------------------------------
--
-- File: VoltageSelectTop.vhd
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
-- Purpose: Top level control of buffer voltage settings. State machine issues 
--   voltage select I2c cycles in steps/intervals to avoid current spikes.  
--   Requires I2cVoltageSelect.vhd and I2cIssueCycle.vhd.
--
-- vreview_reviewers kygreen rortega dhearn dcabrera
-- vreview_group VoltageSelect
-- vreview_closed http://review-board.natinst.com/r/75822/
-------------------------------------------------------------------------------

Library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.numeric_std.all; 


entity VoltageSelectTop is
  port(
    -- Reset and module power
    aResetSl              : in std_logic;
    rIoModGpioEn          : in std_logic;
    -- LVFPGA interface connections
    rSetVoltageFamily     : in std_logic;
    rSetVoltageDAC        : in std_logic;
    rSetVoltageDone       : out std_logic;
    rVoltageFamily        : in std_logic_vector(7 downto 0);
    rVoltageDAC           : in std_logic_vector(15 downto 0);
    -- I2C Interface connections
    rLvFpgaReqI2cBus      : out std_logic;
    rLvFpgaAckI2cBus      : in  std_logic;
    rLvFpgaI2cGo          : out std_logic;
    rLvFpgaI2cStart       : out std_logic;
    rLvFpgaI2cStop        : out std_logic;
    rLvFpgaI2cRd          : out std_logic;
    rLvFpgaI2cWtData      : out std_logic_vector(7 downto 0);
    rLvFpgaI2cAck         : in  std_logic;
    rLvFpgaI2cDone        : in  std_logic;
    rClkToSocket          : in  std_logic); 
end VoltageSelectTop;

architecture rtl of VoltageSelectTop is

  --vhook_sigstart
  signal rDACDone: std_logic;
  signal rSetVoltage: std_logic;
  --vhook_sigend

  type State_t is (Idle, DetermineSteps, DeassertSetVoltage, 
                   WaitForDACDone, SetNextDACStep);
  signal State: State_t;
  
  signal rVoltageFamilyDAC, rStoredDAC: std_logic_vector(15 downto 0);
  signal rSetVoltageDAC1, rSetVoltageFamily1: std_logic;

  signal rStepDifference : unsigned (15 downto 0);
  signal rStepUpDAC : boolean;
  signal rCurrentDAC: std_logic_vector(15 downto 0) := X"0000"; 
  
begin

  --vhook_e I2cVoltageSelect
  --vhook_a rDAC rCurrentDAC
  --vhook_a rSetVoltageDone rDACDone
  --vhook_a rLvFpgaI2cRdData (others=>'0')
  I2cVoltageSelectx: entity work.I2cVoltageSelect (rtl)
    port map (
      rSetVoltage      => rSetVoltage,       -- in  std_logic
      rSetVoltageDone  => rDACDone,          -- out std_logic
      rDAC             => rCurrentDAC,       -- in  std_logic_vector(15 downto 0)
      aResetSl         => aResetSl,          -- in  std_logic
      rIoModGpioEn     => rIoModGpioEn,      -- in  std_logic
      rLvFpgaReqI2cBus => rLvFpgaReqI2cBus,  -- out std_logic
      rLvFpgaAckI2cBus => rLvFpgaAckI2cBus,  -- in  std_logic
      rLvFpgaI2cGo     => rLvFpgaI2cGo,      -- out std_logic
      rLvFpgaI2cStart  => rLvFpgaI2cStart,   -- out std_logic
      rLvFpgaI2cStop   => rLvFpgaI2cStop,    -- out std_logic
      rLvFpgaI2cRd     => rLvFpgaI2cRd,      -- out std_logic
      rLvFpgaI2cWtData => rLvFpgaI2cWtData,  -- out std_logic_vector(7 downto 0)
      rLvFpgaI2cAck    => rLvFpgaI2cAck,     -- in  std_logic
      rLvFpgaI2cDone   => rLvFpgaI2cDone,    -- in  std_logic
      rLvFpgaI2cRdData => (others=>'0'),     -- in  std_logic_vector(7 downto 0)
      rClkToSocket     => rClkToSocket);     -- in  std_logic
        
  -- This mux sets the fixed DAC codes for the common voltage families
  DACCodeMux: process (rVoltageFamily) is
  begin
    case rVoltageFamily is
      when x"00" =>  -- 1.2V
        rVoltageFamilyDAC <= x"0387";
      when x"01" =>  -- 1.5V
        rVoltageFamilyDAC <= x"0317";
      when x"02" =>  -- 1.8V
        rVoltageFamilyDAC <= x"02A8"; 
      when x"03" =>  -- 2.5V
        rVoltageFamilyDAC <= x"01A4";
      when x"04" =>  -- 3.3V
        rVoltageFamilyDAC <= x"007C"; 
      when others => -- 1.2V if invalid select
        rVoltageFamilyDAC <= x"0387"; 
    end case;
  end process;
  
  -------------------------------------------------------------------------
  -- This is the main state machine for stepping voltages
  -------------------------------------------------------------------------

  -- ! STATE MACHINE STARTUP !
  -- The state machine begins in the idle state and cannot leave until
  -- rIoModGpioEn is high and a voltage setting is set when it is ready.
  -- Therefore the state machine cannot immediately transition.
  
  VoltageSettingSM: process (aResetSl, rClkToSocket) is
  begin
    if aResetSl = '1' then
      State <= Idle;
      rStoredDAC <= (others=>'0');
      rSetVoltageFamily1 <= '0';
      rSetVoltageDAC1 <= '0';
      rSetVoltage <= '0';
      rStepDifference <= (others=>'0');
      rStepUpDAC <= false;
      rCurrentDAC <= (others=>'0');
      
    elsif rising_edge(rClkToSocket) then
      -- Sample voltage enable signals for rising edge detect
      rSetVoltageFamily1 <= rSetVoltageFamily;
      rSetVoltageDAC1 <= rSetVoltageDAC;
      
      case State is
        when Idle =>         
          if rIoModGpioEn = '1' then   
           
            -- Store voltage data to be issued, on rising edge of 
            -- rSetVoltageFamily or rSetVoltageDAC.
            if rSetVoltageFamily='1' and rSetVoltageFamily1='0' then
              State <= WaitForDACDone;
              rStoredDAC <= rVoltageFamilyDAC;              
            elsif rSetVoltageDAC='1' and rSetVoltageDAC1='0' then
              State <= WaitForDACDone;
              rStoredDAC <= rVoltageDAC;        
            end if;
          end if;
               
        when WaitForDACDone =>    
          -- Make sure another voltage setting transaction is not in progress.
          -- If there is, wait until it is done.   
          if rDACDone = '1' then
            if rCurrentDAC = rStoredDAC then
              State <= Idle;
            else 
              State <= DetermineSteps;
            end if;
          end if;  
          
        when DetermineSteps =>
          -- This state compares the desired DAC code with the current DAC code
          -- and determines whether it is stepping the DAC codes up or down.
          State <= SetNextDACStep;
          if rStoredDAC > rCurrentDAC then
            rStepUpDAC <= true;  
            rStepDifference <= unsigned(rStoredDAC) - unsigned(rCurrentDAC);
          else
            rStepUpDAC <= false;  
            rStepDifference <= unsigned(rCurrentDAC) - unsigned(rStoredDAC);
          end if;
          
        when SetNextDACStep =>
          -- This state actually starts a DAC voltage transaction.      
          State <= DeassertSetVoltage;
          rSetVoltage <= '1';        
          
          -- If the desired voltage is greater than 750 mV (0x0100) than the 
          -- current voltage, step the current voltage by 750 mV for this cycle.  
          if rStepDifference >= X"0100" then
            if rStepUpDAC then
              rCurrentDAC <= std_logic_vector(unsigned(rCurrentDAC) + X"0100");
            else
              rCurrentDAC <= std_logic_vector(unsigned(rCurrentDAC) - X"0100");
            end if;
          else
            -- This is the last step that changes the current voltage to the
            -- desired voltage      
            if rStepUpDAC then 
              rCurrentDAC <= std_logic_vector(unsigned(rCurrentDAC) + rStepDifference);
            else
              rCurrentDAC <= std_logic_vector(unsigned(rCurrentDAC) - rStepDifference);
            end if;  
          end if;
          
        when DeassertSetVoltage =>                    
          rSetVoltage <= '0';
          State <= WaitForDACDone;           
          
      end case;    
    end if;  
  end process;
  
  rSetVoltageDone <= '1' when State = Idle else '0'; 

end rtl;
