-------------------------------------------------------------------------------
--
-- File: Ni6583Core.vhd
-- Author: National Instruments
-- Original Project: Ni6583
-- Date: 13 July 2009
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
-- Purpose: Core file includes all the main modules such as:
--   Voltage control state machine (safely switches single ended IO voltage)
--   Direction control (safely changes single ended IO direction) 
--   Base file (maps GPIO to logical signal names)
--
--   This file also includes clocking elements such as the global input clock 
--   buffers, and the DCM that creates a 200 MHz clock for the direction
--   control logic. 
--
-- NOTE: All modules in the core file are necessary for safe functioning of
--       the NI 6583 and should only be modified with great care.
-- 
-- vreview_reviewers kygreen rortega dhearn dcabrera
-- vreview_group 6583Core
-- vreview_closed http://review-board.natinst.com/r/75820/
-------------------------------------------------------------------------------

library ieee;
use ieee.Std_Logic_1164.all;
use ieee.numeric_std.all;


entity Ni6583Core_Delayed is
  port(

    -- Adapter Module I/O
    aUserGpio           : inout std_logic_vector(67 downto 0);
    aUserGpio_n         : inout std_logic_vector(67 downto 0);
    rIoModGpioEn        : in    std_logic;
    
    --Extra socket signals
    aResetSl            : in  std_logic;
    rClkToSocket        : in  std_logic;
    rLvFpgaReqI2cBus    : out std_logic;
    rLvFpgaAckI2cBus    : in  std_logic;
    --I2c Ctrl          
    rLvFpgaI2cGo        : out std_logic;
    rLvFpgaI2cStart     : out std_logic;
    rLvFpgaI2cStop      : out std_logic;
    rLvFpgaI2cRd        : out std_logic;
    rLvFpgaI2cWtData    : out std_logic_vector(7 downto 0);
    -- I2c Status       
    rLvFpgaI2cAck       : in  std_logic;
    rLvFpgaI2cDone      : in  std_logic;
    rLvFpgaI2cRdData    : in  std_logic_vector(7 downto 0);
    
    aClkGateLv          : in  std_logic;
    StrobeA             : out std_logic;
    StrobeB             : out std_logic;
       
    -- LabVIEW FPGA I/O  
    aSeDir                : in std_logic_vector(31 downto 0);
    aSeInput              : out std_logic_vector(31 downto 0);
    aSeOutput             : in std_logic_vector(31 downto 0);
    SeClkOut              : in std_logic; -- Se generation clock
    aSeClkOutInvert       : in std_logic;
    aSeClkOutEn           : in std_logic;
    aSePfiDir             : in std_logic_vector(2 downto 0);
    aSePfiInput           : out std_logic_vector(2 downto 0);
    aSePfiOutput          : in std_logic_vector(2 downto 0);
    aLvdsDir              : in std_logic_vector(15 downto 0);
    aLvdsInput            : out std_logic_vector(15 downto 0);
    aLvdsOutput           : in std_logic_vector(15 downto 0);
    aLvdsPfiDir           : in std_logic_vector(2 downto 0);
    aLvdsPfiInput         : out std_logic_vector(2 downto 0);
    aLvdsPfiOutput        : in std_logic_vector(2 downto 0);
    LvdsClkOut            : in std_logic; -- Lvds generation clock
    aLvdsClkOutInvert     : in std_logic;
    aLvdsClkOutEn         : in std_logic;
    rVoltageFamily        : in std_logic_vector(7 downto 0);
    rSetVoltageFamily     : in std_logic;
    rSetVoltageDAC        : in std_logic;
    rVoltageDAC           : in std_logic_vector(15 downto 0);
    rSetVoltageDone       : out std_logic;
    aDCMLocked            : out std_logic;
    
        ---- Additional Lines
    ---- Author: Kalyan
    ---  Date: 10/20/2015
   iIdelayClk       : in  std_logic; 
   iIdelayReset    	: in  std_logic;
   iIdelayInc		: in  std_logic_vector(31 downto 0);
   iIdelayEn		: in  std_logic_vector(31 downto 0);
   Clk200			: in  std_logic;
   iDelayTapOut		: out std_logic_vector(159 downto 0); -- Store 128 bits (32 channelsx5 bits)
   idelayCtrlRst	: in  std_logic	
    );

end Ni6583Core_Delayed;

architecture rtl of Ni6583Core_Delayed is

  component ODDR
    generic (
      DDR_CLK_EDGE : string := "OPPOSITE_EDGE";
      INIT : bit := '0';
      SRTYPE : string := "SYNC");
    port (
      Q : out std_logic;
      D1 : in std_logic;
      D2 : in std_logic;
      C : in std_logic;
      CE : in std_logic;
      R : in std_logic;
      S : in std_logic);
  end component;
  --vhook_nowarn rLvFpgaI2cRdData
  
  --vhook_sigstart
  signal aDirCtrlReset: std_logic;
  signal aLvdsClkOutD1: std_logic;
  signal aLvdsClkOutD2: std_logic;
  signal aLvdsClkOutGen: std_logic;
  signal aSeClkOutD1: std_logic;
  signal aSeClkOutD2: std_logic;
  signal aSeClkOutGen: std_logic;
  signal aSePfiOutputEn: std_logic_vector(2 downto 0);
  --vhook_sigend

  
  component BUFG
    port (
      I : in std_logic;
      O : out std_logic);
  end component;

  component BUFGCE
    port (
      CE : in std_logic;
      I : in std_logic;
      O : out std_logic);
  end component;
  
  component DCM_BASE is
    generic ( 
      DFS_FREQUENCY_MODE : string := "HIGH";
      CLKFX_MULTIPLY      : integer := 5); -- 40Mhz * 5 = 200Mhz
    port (
      CLKIN : in std_logic;
      CLKFB : in std_logic;
      RST   : in std_logic;
      CLK0, CLK90, CLK180, CLK270,
      CLK2X, CLK2X180, CLKDV, CLKFX, CLKFX180 : out std_logic;
      LOCKED : out std_logic);
  end component;
 
  signal SeUserGClk   : std_logic;
  signal LvdsUserGClk : std_logic;
  signal RegisterClk : std_logic;
  signal aSeOutputEn : std_logic_vector(31 downto 0);
  signal DcmClkFeedbackIn, DcmClkFeedbackOut, aDirCtrlDcmLocked : std_logic;
  
  signal rEnableClocks : std_logic;
  signal rClkGateLv, rClkGateLv_ms : std_logic;

begin
    
  GenSeDataDirCtrl:
  for i in 0 to 31 generate
    --vhook_e DirectionStateControl SeDataDirCtrl
    --vhook_a aReset aDirCtrlReset
    --vhook_a aSeDir aSeDir(i)
    --vhook_a aSeOutputEn aSeOutputEn(i)
    SeDataDirCtrl: entity work.DirectionStateControl (rtl)
      port map (
        aReset      => aDirCtrlReset,   -- in  std_logic
        RegisterClk => RegisterClk,     -- in  std_logic
        aSeDir      => aSeDir(i),       -- in  std_logic
        aSeOutputEn => aSeOutputEn(i)); -- out std_logic
  end generate;
   
  GenSePfiDirCtrl:
  for i in 0 to 2 generate
    --vhook_e DirectionStateControl SePfiDirCtrl
    --vhook_a aReset aDirCtrlReset
    --vhook_a aSeDir aSePfiDir(i)
    --vhook_a aSeOutputEn aSePfiOutputEn(i)
    SePfiDirCtrl: entity work.DirectionStateControl (rtl)
      port map (
        aReset      => aDirCtrlReset,      -- in  std_logic
        RegisterClk => RegisterClk,        -- in  std_logic
        aSeDir      => aSePfiDir(i),       -- in  std_logic
        aSeOutputEn => aSePfiOutputEn(i)); -- out std_logic
  end generate;
  
  --vhook_e VoltageSelectTop 
  VoltageSelectTopx: entity work.VoltageSelectTop (rtl)
    port map (
      aResetSl          => aResetSl,           -- in  std_logic
      rIoModGpioEn      => rIoModGpioEn,       -- in  std_logic
      rSetVoltageFamily => rSetVoltageFamily,  -- in  std_logic
      rSetVoltageDAC    => rSetVoltageDAC,     -- in  std_logic
      rSetVoltageDone   => rSetVoltageDone,    -- out std_logic
      rVoltageFamily    => rVoltageFamily,     -- in  std_logic_vector(7 downto 0)
      rVoltageDAC       => rVoltageDAC,        -- in  std_logic_vector(15 downto 0)
      rLvFpgaReqI2cBus  => rLvFpgaReqI2cBus,   -- out std_logic
      rLvFpgaAckI2cBus  => rLvFpgaAckI2cBus,   -- in  std_logic
      rLvFpgaI2cGo      => rLvFpgaI2cGo,       -- out std_logic
      rLvFpgaI2cStart   => rLvFpgaI2cStart,    -- out std_logic
      rLvFpgaI2cStop    => rLvFpgaI2cStop,     -- out std_logic
      rLvFpgaI2cRd      => rLvFpgaI2cRd,       -- out std_logic
      rLvFpgaI2cWtData  => rLvFpgaI2cWtData,   -- out std_logic_vector(7 downto 0)
      rLvFpgaI2cAck     => rLvFpgaI2cAck,      -- in  std_logic
      rLvFpgaI2cDone    => rLvFpgaI2cDone,     -- in  std_logic
      rClkToSocket      => rClkToSocket);      -- in  std_logic
        
  --vhook_e Ni6583BaseS7
  Ni6583BaseS7x: entity work.Ni6583BaseS7_Delayed (rtl)
    port map (
      aUserGpio      => aUserGpio,       -- inout std_logic_vector(67 downto 0)
      aUserGpio_n    => aUserGpio_n,     -- inout std_logic_vector(67 downto 0)
      rIoModGpioEn   => rIoModGpioEn,    -- in  std_logic
      aSeDir         => aSeDir,          -- in  std_logic_vector(31 downto 0)
      aSeInput       => aSeInput,        -- out std_logic_vector(31 downto 0)
      aSeOutput      => aSeOutput,       -- in  std_logic_vector(31 downto 0)
      aSeOutputEn    => aSeOutputEn,     -- in  std_logic_vector(31 downto 0)
      aSeClkOutGen   => aSeClkOutGen,    -- in  std_logic
      aSeClkOutEn    => aSeClkOutEn,     -- in  std_logic
      aSePfiDir      => aSePfiDir,       -- in  std_logic_vector(2 downto 0)
      aSePfiInput    => aSePfiInput,     -- out std_logic_vector(2 downto 0)
      aSePfiOutput   => aSePfiOutput,    -- in  std_logic_vector(2 downto 0)
      aSePfiOutputEn => aSePfiOutputEn,  -- in  std_logic_vector(2 downto 0)
      aLvdsDir       => aLvdsDir,        -- in  std_logic_vector(15 downto 0)
      aLvdsInput     => aLvdsInput,      -- out std_logic_vector(15 downto 0)
      aLvdsOutput    => aLvdsOutput,     -- in  std_logic_vector(15 downto 0)
      aLvdsPfiDir    => aLvdsPfiDir,     -- in  std_logic_vector(2 downto 0)
      aLvdsPfiInput  => aLvdsPfiInput,   -- out std_logic_vector(2 downto 0)
      aLvdsPfiOutput => aLvdsPfiOutput,  -- in  std_logic_vector(2 downto 0)
      aLvdsClkOutGen => aLvdsClkOutGen,  -- in  std_logic
      aLvdsClkOutEn  => aLvdsClkOutEn,   -- in  std_logic
      SeUserGClk     => SeUserGClk,      -- out std_logic
      LvdsUserGClk   => LvdsUserGClk,
      
    -- Additional Connections
    -- Author:Kalyan
    -- Date: 10/21/2015
    iIdelayClk      => 	iIdelayClk , 
   	iIdelayReset    =>	iIdelayReset,
   	iIdelayInc		=>	iIdelayInc,
   	iIdelayEn		=>	iIdelayEn,
   	Clk200			=>	Clk200,
   	iDelayTapOut	=>	iDelayTapOut,
   	idelayCtrlRst	=> 	idelayCtrlRst);   -- out std_logic
        
      
  -- Single-Ended Clock Output
  aSeClkOutD1 <= not aSeClkOutInvert;
  aSeClkOutD2 <= aSeClkOutInvert;
  --vhook ODDR SeClkOutOddr
  --vhook_a DDR_CLK_EDGE "SAME_EDGE"
  --vhook_a INIT '0'
  --vhook_a SRTYPE "ASYNC"
  --vhook_a Q   aSeClkOutGen
  --vhook_a C   SeClkOut
  --vhook_a CE  aSeClkOutEn
  --vhook_a D1  aSeClkOutD1
  --vhook_a D2  aSeClkOutD2
  --vhook_a R   aResetSl
  --vhook_a S   '0'
  SeClkOutOddr: ODDR
    generic map (
      DDR_CLK_EDGE => "SAME_EDGE",  -- in  string := "OPPOSITE_EDGE"
      INIT         => '0',          -- in  bit := '0'
      SRTYPE       => "ASYNC")      -- in  string := "SYNC"
    port map (
      Q  => aSeClkOutGen,  -- out std_logic
      D1 => aSeClkOutD1,   -- in  std_logic
      D2 => aSeClkOutD2,   -- in  std_logic
      C  => SeClkOut,      -- in  std_logic
      CE => aSeClkOutEn,   -- in  std_logic
      R  => aResetSl,      -- in  std_logic
      S  => '0');          -- in  std_logic
         
   
  -- LVDS Clock Output
  aLvdsClkOutD1 <= not aLvdsClkOutInvert;
  aLvdsClkOutD2 <= aLvdsClkOutInvert;
  --vhook ODDR LvdsClkOutOddr
  --vhook_a DDR_CLK_EDGE "SAME_EDGE"
  --vhook_a INIT '0'
  --vhook_a SRTYPE "ASYNC"
  --vhook_a Q   aLvdsClkOutGen
  --vhook_a C   LvdsClkOut
  --vhook_a CE  aLvdsClkOutEn
  --vhook_a D1  aLvdsClkOutD1
  --vhook_a D2  aLvdsClkOutD2
  --vhook_a R   aResetSl
  --vhook_a S   '0'     
  LvdsClkOutOddr: ODDR
    generic map (
      DDR_CLK_EDGE => "SAME_EDGE",  -- in  string := "OPPOSITE_EDGE"
      INIT         => '0',          -- in  bit := '0'
      SRTYPE       => "ASYNC")      -- in  string := "SYNC"
    port map (
      Q  => aLvdsClkOutGen,  -- out std_logic
      D1 => aLvdsClkOutD1,   -- in  std_logic
      D2 => aLvdsClkOutD2,   -- in  std_logic
      C  => LvdsClkOut,      -- in  std_logic
      CE => aLvdsClkOutEn,   -- in  std_logic
      R  => aResetSl,        -- in  std_logic
      S  => '0');            -- in  std_logic
   
  -- --------------------------------------------------------------------------
  -- CLIP input clock connections
  -- --------------------------------------------------------------------------
  
  EnableClocks: process (aResetSl, rClkToSocket)
  begin
    if aResetSl = '1' then
      rClkGateLv_ms <= '0';
      rClkGateLv    <= '0';
      rEnableClocks <= '0';
    elsif rising_edge(rClkToSocket) then
      rClkGateLv_ms <= aClkGateLv;
      rClkGateLv    <= rClkGateLv_ms;
      rEnableClocks <= rClkGateLv and rIoModGpioEn;
    end if;
  end process EnableClocks;
  
  -- Buffer SE Strobe input. 
  --vhook_e SafeBUFGCE SeBufG
  --vhook_a ClkIn SeUserGClk
  --vhook_a aClkEn rEnableClocks
  --vhook_a ClkOut StrobeA
  SeBufG: entity work.SafeBufgce (rtl)
    port map (
      ClkIn  => SeUserGClk,     -- in  std_logic
      aClkEn => rEnableClocks,  -- in  std_logic
      ClkOut => StrobeA);       -- out std_logic
  
  -- Buffer LVDS Strobe input.
  -- Note: UserGClkLvds uses LVCMOS25 IOSTANDARD and UserGClkLvds
  -- receives single-ended clock from hardware Lvds strobe buffer.
  -- The other input UserGClkLvds_n is unused.
  --vhook_e SafeBUFGCE LvdsBufG
  --vhook_a ClkIn LvdsUserGClk
  --vhook_a aClkEn rEnableClocks
  --vhook_a ClkOut StrobeB
  LvdsBufG: entity work.SafeBufgce (rtl)
    port map (
      ClkIn  => LvdsUserGClk,   -- in  std_logic
      aClkEn => rEnableClocks,  -- in  std_logic
      ClkOut => StrobeB);       -- out std_logic

  -- --------------------------------------------------------------------------
  -- Direction control connections
  -- --------------------------------------------------------------------------
      
  -- Buffer DcmClkFeedback loop for DCM clock.
  DcmClkFeedbackBufG: BUFG
    port map (
      I => DcmClkFeedbackIn,
      O => DcmClkFeedbackOut
    );
        
  -- Generate 200Mhz clock for direction control state machine
  GenDirSMClk: DCM_BASE
    port map (
      CLKIN => rClkToSocket,        -- 40Mhz input
      CLKFB => DcmClkFeedbackOut,
      RST => '0',
      CLK0 => DcmClkFeedbackIn,
      CLKFX => RegisterClk,         -- 200Mhz output
      LOCKED => aDirCtrlDcmLocked);

  aDcmLocked <= aDirCtrlDcmLocked;
  
  -- Keep the single ended FPGA outputs in tristate by holding direction
  -- control in reset if the module GPIO is unpowered or if the DCM is unlocked.
  aDirCtrlReset <= '1' when (aDirCtrlDcmLocked='0' or rIoModGpioEn='0') else '0';
  
end rtl;
