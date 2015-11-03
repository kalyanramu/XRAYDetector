-------------------------------------------------------------------------------
--
-- File: SafeBufgce.vhd
-- Date: 9 November 2010
--
-------------------------------------------------------------------------------
-- Copyright (c) 2010 National Instruments Corporation.
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
-- Purpose:
--  This implements a "safe" version of a BUFGCE. The standard BUFGCE uses the
--  CE pins only, which could glitch if changed near a clock edge. This is due
--  to backwards compatibility reasons with Virtex II.
--  This version of a BUFGCE uses both the select pins and CE pins. The select
--  pins do not have any setup and hold requirements, while the CE pins allow
--  the clock to be switched to and from the constant input. 
-------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
library unisim;
  use unisim.vcomponents.all;

entity SafeBufgce is
  port (
    ClkIn   : in  std_logic;
    aClkEn  : in  std_logic;
    ClkOut   : out std_logic
  );
end SafeBufgce;

architecture rtl of SafeBufgce is

  component BUFGCTRL
    port (
      I1 : in std_logic;
      I0 : in std_logic;
      S1 : in std_logic;
      S0 : in std_logic;
      CE1 : in std_logic;
      CE0 : in std_logic;
      IGNORE1 : in std_logic;
      IGNORE0 : in std_logic;
      O : out std_logic);
  end component;
  --vhook_sigstart
  --vhook_sigend
  --use a default assignment because this only needs to happen once
  signal aClkEn_n: std_logic;
begin

  aClkEn_n <= not aClkEn;

  --vhook BUFGCTRL SafeBUFGCTRLx
  --vhook_a I0  '1'
  --vhook_a I1  ClkIn
  --vhook_a S0  aClkEn_n
  --vhook_a S1  aClkEn
  --vhook_a CE0 '1'
  --vhook_a CE1 '1'
  --vhook_a IGNORE0 '0'
  --vhook_a IGNORE1 '0'
  --vhook_a O ClkOut
  SafeBUFGCTRLx: BUFGCTRL
    port map (
      I1      => ClkIn,     -- in  std_logic
      I0      => '1',       -- in  std_logic
      S1      => aClkEn,    -- in  std_logic
      S0      => aClkEn_n,  -- in  std_logic
      CE1     => '1',       -- in  std_logic
      CE0     => '1',       -- in  std_logic
      IGNORE1 => '0',       -- in  std_logic
      IGNORE0 => '0',       -- in  std_logic
      O       => ClkOut);   -- out std_logic
end rtl;
