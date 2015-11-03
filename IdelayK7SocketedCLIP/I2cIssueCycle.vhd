-------------------------------------------------------------------------------
--
-- File: I2cIssueCycle.vhd
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
-- Purpose: State machine responsible for timing of issuing one I2C cycle to
-- the FlexRIO I2c Controller.
-- 
-- vreview_reviewers kygreen rortega dhearn dcabrera
-- vreview_group VoltageSelect
-- vreview_closed http://review-board.natinst.com/r/75822/
-------------------------------------------------------------------------------

Library IEEE;
use IEEE.Std_Logic_1164.all; 


entity I2cIssueCycle is
  port( -- LVFPGA connections
        rCycleStart            : in std_logic;
        rReady                 : out std_logic;
        rI2cStartBit           : in std_logic;
        rI2cStopBit            : in std_logic;
        rI2cRead               : in std_logic; -- high = read, low = write
        rI2cWriteData          : in std_logic_vector(7 downto 0);
        rI2cReadData           : out std_logic_vector(7 downto 0);
        -- I2C control connections
        aResetSl              : in  std_logic;
        rIoModGpioEn          : in  std_logic;
        rLvFpgaI2cGo          : out std_logic;
        rLvFpgaI2cStart       : out std_logic;
        rLvFpgaI2cStop        : out std_logic;
        rLvFpgaI2cRd          : out std_logic;
        rLvFpgaI2cWtData      : out std_logic_vector(7 downto 0);
        rLvFpgaI2cAck         : in  std_logic;
        rLvFpgaI2cDone        : in  std_logic;
        rLvFpgaI2cRdData      : in  std_logic_vector(7 downto 0);
        rClkToSocket          : in  std_logic); 
        --vhook_nowarn rLvFpgaI2cAck
end I2cIssueCycle;

architecture behavioral of I2cIssueCycle is
  type State_t is (Idle,RunCycle,CheckBusy,StopCycle,CheckStop,Acknowledge);
  signal rState : State_t := Idle;
  signal rCycleStartD1 : std_logic;
begin
  
  -- ! State MACHINE STARTUP !
  -- The State machine begins in the idle State and cannot leave until
  -- rIoModGpioEn is set and a rising edge of rCycleStart is detected. 
  -- rCycleStart is set safely by a higher level State machine.  
      
  I2cIssueCycle: process (aResetSl,rClkToSocket) is
  begin
    if aResetSl = '1' then
      rState <= Idle;
      rCycleStartD1 <= '0';
    elsif rising_edge(rClkToSocket) then
      rCycleStartD1 <= rCycleStart;
            
      case rState is
        when Idle =>
          if rIoModGpioEn = '1' then
            -- A new cycle will be issued on rising edge of rCycleStart.
            if rCycleStart='1' and rCycleStartD1='0' then
              rState <= RunCycle;
            end if;
          end if;  
        when RunCycle =>
          rState <= CheckBusy;
        when CheckBusy =>
          -- Make sure rLvFpgaI2cDone is deasserted while I2C cycle is running.
          if rLvFpgaI2cDone='0' then
            rState <= StopCycle;
          end if;
        when StopCycle =>
          rState <= CheckStop;
        when CheckStop =>
          -- Make sure rLvFpgaI2cDone is asserted before checking acknowledge bit.
          if rLvFpgaI2cDone='1' then
            rState <= Acknowledge;
          end if;
        when Acknowledge =>
          rState <= Idle; 
        when others =>
          rState <= Idle;
      end case;
    end if;
  end process;
        
  rLvFpgaI2cGo <= '1' when rState = RunCycle or rState = CheckBusy else '0';
  rLvFpgaI2cStart <= rI2cStartBit;
  rLvFpgaI2cStop <= rI2cStopBit;
  rLvFpgaI2cRd <= rI2cRead;
  rLvFpgaI2cWtData <= rI2cWriteData; 
  rI2cReadData <= rLvFpgaI2cRdData when rState = Acknowledge or rState = Idle else x"00";
  rReady <= '1' when rState = Idle else '0';
  
end behavioral;

