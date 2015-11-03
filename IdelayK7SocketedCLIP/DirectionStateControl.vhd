-------------------------------------------------------------------------------
--
-- File: DirectionStateControl.vhd
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
-- Purpose: This is a simple state machine intended to delay the output
-- enables of the se buffer io after the direction changes to output to
-- prevent double driving. 
-- 
-- vreview_reviewers kygreen rortega dhearn dcabrera
-- vreview_group 6583Core
-- vreview_closed http://review-board.natinst.com/r/75820/
-------------------------------------------------------------------------------

Library IEEE;
use IEEE.Std_Logic_1164.all; 


entity DirectionStateControl is
  port( 
    aReset          : in std_logic;
    RegisterClk     : in std_logic;  -- 200mhz for 5ns clock cycles
    aSeDir          : in std_logic;  -- SeDir input
    aSeOutputEn     : out std_logic  -- To SE output FPGA buffer enables        
  );
end DirectionStateControl;


architecture rtl of DirectionStateControl is
  signal rgOutputEn_ms, rgOutputEnD1, rgOutputEnD2 : std_logic;
  
begin

  -- Double sync SeDir
  -- signals to allow for safe crossing of clock domains.
  -- Delay between SeDir and SeOutputEn ranges from 10 to 15ns
  -- (2 to 3 cycles of RegisterClk).
  DirectionStateControl: process (aReset, RegisterClk) is
  begin
    if aReset = '1' then
        rgOutputEn_ms <= '0';
        rgOutputEnD1 <= '0';
        rgOutputEnD2 <= '0';
    elsif rising_edge(RegisterClk) then
        rgOutputEn_ms <= aSeDir;
        rgOutputEnD1 <= rgOutputEn_ms;
        rgOutputEnD2 <= rgOutputEnD1;
    end if;
  end process;
  
  -- Since the output enable is asynchronous, the output may glitch 
  -- if aSeDir is changed from '1' to '0' around the same time aSeOutputEn
  -- goes to '1'. To be safe, aSeDir should stay high for 20 ns (or 4 cycles 
  -- of RegisterClk).   
  aSeOutputEn <= '1' when rgOutputEnD2='1' and aSeDir='1' else '0';

end rtl;

