-------------------------------------------------------------------------------
--
-- File: Ni6583Channel.vhd
-- Author: National Instruments
-- Original Project: Ni6583
-- Date: 30 June 2009
--
-------------------------------------------------------------------------------
-- Copyright © 2010 National Instruments Corporation.
--
-- You may only modify and distribute this file as expressly permitted in the 
-- Software License Agreement provided with the NI FlexRIO Adapter Module 
-- Support software.  Without limiting any of the provisions in that license 
-- agreement, you may only distribute modified versions of this file to
-- end-users who 
-- (a) you have verified have a valid license to the NI-RIO software and the 
--     NI LabVIEW FPGA Module, and 
-- (b) you restrict from using the file for any purpose other than the 
--     customization of the FPGA functionality of FPGA Enabled NI Hardware 
--     (as that term is defined in Section 4 of the license agreement).
-------------------------------------------------------------------------------
--
-- Purpose: This CLIP exposes all IO as individual signals to LVFPGA.
-- 32 SE IO, SE CLKOUT, SE STROBE, 3 SE PFI
-- 16 LVDS IO, LVDS CLKOUT, LVDS STROBE, 3 LVDS PFI
--
-- vreview_reviewers kygreen rortega dhearn dcabrera
-- vreview_group 6583K7Top
-- vreview_closed http://review-board.natinst.com/r/75821/
-------------------------------------------------------------------------------

library ieee;
use ieee.Std_Logic_1164.all;
use ieee.numeric_std.all;


entity Ni6583Channel is
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
    -- TDC
    TdcAssertClk        : in  std_logic;
    tTdcAssert          : out std_logic;
    Clk100              : in  std_logic;
    c100TdcDeassert     : out std_logic;
    rTdcPulseWidth      : in  std_logic_vector(15 downto 0);
    rTdcPulseWidthValid : in  std_logic;
        
    -- LabVIEW FPGA Clocks
    aClkGateLv          : in  std_logic;
    StrobeA             : out std_logic;
    StrobeB             : out std_logic;
    
    -- LabVIEW FPGA I/O  
    --***StartPorts***
    aSeDir0                : in std_logic;
    aSeDir1                : in std_logic;
    aSeDir2                : in std_logic;
    aSeDir3                : in std_logic;
    aSeDir4                : in std_logic;
    aSeDir5                : in std_logic;
    aSeDir6                : in std_logic;
    aSeDir7                : in std_logic;
    aSeDir8                : in std_logic;
    aSeDir9                : in std_logic;
    aSeDir10               : in std_logic;
    aSeDir11               : in std_logic;
    aSeDir12               : in std_logic;
    aSeDir13               : in std_logic;
    aSeDir14               : in std_logic;
    aSeDir15               : in std_logic;
    aSeDir16               : in std_logic;
    aSeDir17               : in std_logic;
    aSeDir18               : in std_logic;
    aSeDir19               : in std_logic;
    aSeDir20               : in std_logic;
    aSeDir21               : in std_logic;
    aSeDir22               : in std_logic;
    aSeDir23               : in std_logic;
    aSeDir24               : in std_logic;
    aSeDir25               : in std_logic;
    aSeDir26               : in std_logic;
    aSeDir27               : in std_logic;
    aSeDir28               : in std_logic;
    aSeDir29               : in std_logic;
    aSeDir30               : in std_logic;
    aSeDir31               : in std_logic;
    aSeInput0              : out std_logic;
    aSeInput1              : out std_logic;
    aSeInput2              : out std_logic;
    aSeInput3              : out std_logic;
    aSeInput4              : out std_logic;
    aSeInput5              : out std_logic;
    aSeInput6              : out std_logic;
    aSeInput7              : out std_logic;
    aSeInput8              : out std_logic;
    aSeInput9              : out std_logic;
    aSeInput10             : out std_logic;
    aSeInput11             : out std_logic;
    aSeInput12             : out std_logic;
    aSeInput13             : out std_logic;
    aSeInput14             : out std_logic;
    aSeInput15             : out std_logic;
    aSeInput16             : out std_logic;
    aSeInput17             : out std_logic;
    aSeInput18             : out std_logic;
    aSeInput19             : out std_logic;
    aSeInput20             : out std_logic;
    aSeInput21             : out std_logic;
    aSeInput22             : out std_logic;
    aSeInput23             : out std_logic;
    aSeInput24             : out std_logic;
    aSeInput25             : out std_logic;
    aSeInput26             : out std_logic;
    aSeInput27             : out std_logic;
    aSeInput28             : out std_logic;
    aSeInput29             : out std_logic;
    aSeInput30             : out std_logic;
    aSeInput31             : out std_logic;
    aSeOutput0             : in std_logic;
    aSeOutput1             : in std_logic;
    aSeOutput2             : in std_logic;
    aSeOutput3             : in std_logic;
    aSeOutput4             : in std_logic;
    aSeOutput5             : in std_logic;
    aSeOutput6             : in std_logic;
    aSeOutput7             : in std_logic;
    aSeOutput8             : in std_logic;
    aSeOutput9             : in std_logic;
    aSeOutput10            : in std_logic;
    aSeOutput11            : in std_logic;
    aSeOutput12            : in std_logic;
    aSeOutput13            : in std_logic;
    aSeOutput14            : in std_logic;
    aSeOutput15            : in std_logic;
    aSeOutput16            : in std_logic;
    aSeOutput17            : in std_logic;
    aSeOutput18            : in std_logic;
    aSeOutput19            : in std_logic;
    aSeOutput20            : in std_logic;
    aSeOutput21            : in std_logic;
    aSeOutput22            : in std_logic;
    aSeOutput23            : in std_logic;
    aSeOutput24            : in std_logic;
    aSeOutput25            : in std_logic;
    aSeOutput26            : in std_logic;
    aSeOutput27            : in std_logic;
    aSeOutput28            : in std_logic;
    aSeOutput29            : in std_logic;
    aSeOutput30            : in std_logic;
    aSeOutput31            : in std_logic;
    aSePFIDir1            : in std_logic;
    aSePFIDir2            : in std_logic;
    aSePFIDir3            : in std_logic;
    aSePFIInput1          : out std_logic;
    aSePFIInput2          : out std_logic;
    aSePFIInput3          : out std_logic;
    aSePFIOutput1         : in std_logic;
    aSePFIOutput2         : in std_logic;
    aSePFIOutput3         : in std_logic;
    SeClkOut              : in std_logic;
    aSeClkOutInvert        : in std_logic;
    aSeClkOutEn           : in std_logic;
    aLvdsDir0              : in std_logic;
    aLvdsDir1              : in std_logic;
    aLvdsDir2              : in std_logic;
    aLvdsDir3              : in std_logic;
    aLvdsDir4              : in std_logic;
    aLvdsDir5              : in std_logic;
    aLvdsDir6              : in std_logic;
    aLvdsDir7              : in std_logic;
    aLvdsDir8              : in std_logic;
    aLvdsDir9              : in std_logic;
    aLvdsDir10             : in std_logic;
    aLvdsDir11             : in std_logic;
    aLvdsDir12             : in std_logic;
    aLvdsDir13             : in std_logic;
    aLvdsDir14             : in std_logic;
    aLvdsDir15             : in std_logic;
    aLvdsInput0            : out std_logic;
    aLvdsInput1            : out std_logic;
    aLvdsInput2            : out std_logic;
    aLvdsInput3            : out std_logic;
    aLvdsInput4            : out std_logic;
    aLvdsInput5            : out std_logic;
    aLvdsInput6            : out std_logic;
    aLvdsInput7            : out std_logic;
    aLvdsInput8            : out std_logic;
    aLvdsInput9            : out std_logic;
    aLvdsInput10           : out std_logic;
    aLvdsInput11           : out std_logic;
    aLvdsInput12           : out std_logic;
    aLvdsInput13           : out std_logic;
    aLvdsInput14           : out std_logic;
    aLvdsInput15           : out std_logic;
    aLvdsOutput0           : in std_logic;
    aLvdsOutput1           : in std_logic;
    aLvdsOutput2           : in std_logic;
    aLvdsOutput3           : in std_logic;
    aLvdsOutput4           : in std_logic;
    aLvdsOutput5           : in std_logic;
    aLvdsOutput6           : in std_logic;
    aLvdsOutput7           : in std_logic;
    aLvdsOutput8           : in std_logic;
    aLvdsOutput9           : in std_logic;
    aLvdsOutput10          : in std_logic;
    aLvdsOutput11          : in std_logic;
    aLvdsOutput12          : in std_logic;
    aLvdsOutput13          : in std_logic;
    aLvdsOutput14          : in std_logic;
    aLvdsOutput15          : in std_logic;
    aLvdsPFIDir1          : in std_logic;
    aLvdsPFIDir2          : in std_logic;
    aLvdsPFIDir3          : in std_logic;
    aLvdsPFIInput1        : out std_logic;
    aLvdsPFIInput2        : out std_logic;
    aLvdsPFIInput3        : out std_logic;
    aLvdsPFIOutput1       : in std_logic;
    aLvdsPFIOutput2       : in std_logic;
    aLvdsPFIOutput3       : in std_logic;
    LvdsClkOut           : in std_logic;
    aLvdsClkOutInvert     : in std_logic;
    aLvdsClkOutEn         : in std_logic;
    rVoltageFamily        : in std_logic_vector(7 downto 0);
    rSetVoltageFamily     : in std_logic;
    rVoltageDAC           : in std_logic_vector(15 downto 0);
    rSetVoltageDAC        : in std_logic;
    rSetVoltageDone       : out std_logic;
    aDCMLocked            : out std_logic;
    VoltageCtrlClk        : in std_logic;
    
    ---- Additional Lines
    ---- Author: Kalyan
    ---  Date: 10/20/2015
   iIdelayClk       : in  std_logic; 
   iIdelayReset    	: in  std_logic;
   iIdelayInc		: in  std_logic_vector(31 downto 0);
   iIdelayEn		: in  std_logic_vector(31 downto 0);
   Clk200			: in  std_logic;
   iDelayTapCnt1	: out std_logic_vector(63 downto 0); -- Lower 64 bits of Tap Cnt	
   iDelayTapCnt2	: out std_logic_vector(63 downto 0); -- Upper 64 bits of Tap Cnt	
   idelayCtrlRst	: in  std_logic

  );
    --vhook_nowarn rClkToSocket
    --***EndPorts***
end Ni6583Channel;

architecture rtl of Ni6583Channel is

  --vhook_sigstart
  signal aLvdsDir: std_logic_vector(15 downto 0);
  signal aLvdsInput: std_logic_vector(15 downto 0);
  signal aLvdsOutput: std_logic_vector(15 downto 0);
  signal aLvdsPfiDir: std_logic_vector(2 downto 0);
  signal aLvdsPfiInput: std_logic_vector(2 downto 0);
  signal aLvdsPfiOutput: std_logic_vector(2 downto 0);
  signal aSeDir: std_logic_vector(31 downto 0);
  signal aSeInput: std_logic_vector(31 downto 0);
  signal aSeOutput: std_logic_vector(31 downto 0);
  signal aSePfiDir: std_logic_vector(2 downto 0);
  signal aSePfiInput: std_logic_vector(2 downto 0);
  signal aSePfiOutput: std_logic_vector(2 downto 0);
  --vhook_sigend
  
  -- Added Signals for TapCnt Conversion
  -- Author: Kalyan
  -- Date: 10/21/2015
  signal iDelayTapFullCnt: std_logic_vector(127 downto 0);
  signal iDelayTapOut: natural range 0 to 127;

begin
     
  -- Unused TDC signals
  --vhook_nowarn TdcAssertClk
  --vhook_nowarn rTdcPulseWidth*
  --vhook_nowarn Clk100
  tTdcAssert      <= '0';
  c100TdcDeassert <= '0';
     
     -- SE connections
     aSeDir <= aSeDir31
            & aSeDir30
            & aSeDir29
            & aSeDir28
            & aSeDir27
            & aSeDir26
            & aSeDir25
            & aSeDir24
            & aSeDir23
            & aSeDir22
            & aSeDir21
            & aSeDir20
            & aSeDir19
            & aSeDir18
            & aSeDir17
            & aSeDir16
            & aSeDir15
            & aSeDir14
            & aSeDir13
            & aSeDir12
            & aSeDir11
            & aSeDir10
            & aSeDir9
            & aSeDir8
            & aSeDir7
            & aSeDir6
            & aSeDir5
            & aSeDir4
            & aSeDir3
            & aSeDir2
            & aSeDir1
            & aSeDir0;
     
    aSeInput0 <= aSeInput(0);
    aSeInput1 <= aSeInput(1);
    aSeInput2 <= aSeInput(2);
    aSeInput3 <= aSeInput(3);
    aSeInput4 <= aSeInput(4);
    aSeInput5 <= aSeInput(5);
    aSeInput6 <= aSeInput(6);
    aSeInput7 <= aSeInput(7);
    aSeInput8 <= aSeInput(8);
    aSeInput9 <= aSeInput(9);
    aSeInput10 <= aSeInput(10);
    aSeInput11 <= aSeInput(11);
    aSeInput12 <= aSeInput(12);
    aSeInput13 <= aSeInput(13);
    aSeInput14 <= aSeInput(14);
    aSeInput15 <= aSeInput(15);
    aSeInput16 <= aSeInput(16);
    aSeInput17 <= aSeInput(17);
    aSeInput18 <= aSeInput(18);
    aSeInput19 <= aSeInput(19);
    aSeInput20 <= aSeInput(20);
    aSeInput21 <= aSeInput(21);
    aSeInput22 <= aSeInput(22);
    aSeInput23 <= aSeInput(23);
    aSeInput24 <= aSeInput(24);
    aSeInput25 <= aSeInput(25);
    aSeInput26 <= aSeInput(26);
    aSeInput27 <= aSeInput(27);
    aSeInput28 <= aSeInput(28);
    aSeInput29 <= aSeInput(29);
    aSeInput30 <= aSeInput(30);
    aSeInput31 <= aSeInput(31);
     
    aSeOutput <= aSeOutput31
              & aSeOutput30
              & aSeOutput29
              & aSeOutput28
              & aSeOutput27
              & aSeOutput26
              & aSeOutput25
              & aSeOutput24
              & aSeOutput23
              & aSeOutput22
              & aSeOutput21
              & aSeOutput20
              & aSeOutput19
              & aSeOutput18
              & aSeOutput17
              & aSeOutput16
              & aSeOutput15
              & aSeOutput14
              & aSeOutput13
              & aSeOutput12
              & aSeOutput11
              & aSeOutput10
              & aSeOutput9
              & aSeOutput8
              & aSeOutput7
              & aSeOutput6
              & aSeOutput5
              & aSeOutput4
              & aSeOutput3
              & aSeOutput2
              & aSeOutput1
              & aSeOutput0;
              
     aLvdsDir <= aLvdsDir15
              & aLvdsDir14
              & aLvdsDir13
              & aLvdsDir12
              & aLvdsDir11
              & aLvdsDir10
              & aLvdsDir9
              & aLvdsDir8
              & aLvdsDir7
              & aLvdsDir6
              & aLvdsDir5
              & aLvdsDir4
              & aLvdsDir3
              & aLvdsDir2
              & aLvdsDir1
              & aLvdsDir0;
     
    aLvdsInput0 <= aLvdsInput(0);
    aLvdsInput1 <= aLvdsInput(1);
    aLvdsInput2 <= aLvdsInput(2);
    aLvdsInput3 <= aLvdsInput(3);
    aLvdsInput4 <= aLvdsInput(4);
    aLvdsInput5 <= aLvdsInput(5);
    aLvdsInput6 <= aLvdsInput(6);
    aLvdsInput7 <= aLvdsInput(7);
    aLvdsInput8 <= aLvdsInput(8);
    aLvdsInput9 <= aLvdsInput(9);
    aLvdsInput10 <= aLvdsInput(10);
    aLvdsInput11 <= aLvdsInput(11);
    aLvdsInput12 <= aLvdsInput(12);
    aLvdsInput13 <= aLvdsInput(13);
    aLvdsInput14 <= aLvdsInput(14);
    aLvdsInput15 <= aLvdsInput(15);
     
    aLvdsOutput <= aLvdsOutput15
                & aLvdsOutput14
                & aLvdsOutput13
                & aLvdsOutput12
                & aLvdsOutput11
                & aLvdsOutput10
                & aLvdsOutput9
                & aLvdsOutput8
                & aLvdsOutput7
                & aLvdsOutput6
                & aLvdsOutput5
                & aLvdsOutput4
                & aLvdsOutput3
                & aLvdsOutput2
                & aLvdsOutput1
                & aLvdsOutput0;
     
     -- PFI connections
     -- LVFPGA does not support 3-bit data types
     -- so the signals are provided to LVFPGA individually
    aSePfiDir(0) <= aSePfiDir1;
    aSePfiDir(1) <= aSePfiDir2;    
    aSePfiDir(2) <= aSePfiDir3;    
    aSePfiInput1 <= aSePfiInput(0);  
    aSePfiInput2 <= aSePfiInput(1);  
    aSePfiInput3 <= aSePfiInput(2);  
    aSePfiOutput(0) <= aSePfiOutput1;
    aSePfiOutput(1) <= aSePfiOutput2;
    aSePfiOutput(2) <= aSePfiOutput3;

    aLvdsPfiDir(0) <= aLvdsPfiDir1;
    aLvdsPfiDir(1) <= aLvdsPfiDir2;
    aLvdsPfiDir(2) <= aLvdsPfiDir3;
    aLvdsPfiInput1 <= aLvdsPfiInput(0);
    aLvdsPfiInput2 <= aLvdsPfiInput(1);
    aLvdsPfiInput3 <= aLvdsPfiInput(2);
    aLvdsPfiOutput(0) <= aLvdsPfiOutput1;
    aLvdsPfiOutput(1) <= aLvdsPfiOutput2;
    aLvdsPfiOutput(2) <= aLvdsPfiOutput3;
    
  -- VoltageCtrlClk should always be set to 40 MHz Onboard Clock in LVFPGA.  If
  -- not, user is responsible for safely crossing clock domains between
  -- voltage/DAC selection logic and I2C bus control.   
     
  --vhook_e Ni6583Core
  --vhook_a rClkToSocket VoltageCtrlClk
  Ni6583Corex: entity work.Ni6583Core_Delayed (rtl)
    port map (
      aUserGpio         => aUserGpio,          -- inout std_logic_vector(67 downto 0)
      aUserGpio_n       => aUserGpio_n,        -- inout std_logic_vector(67 downto 0)
      rIoModGpioEn      => rIoModGpioEn,       -- in  std_logic
      aResetSl          => aResetSl,           -- in  std_logic
      rClkToSocket      => VoltageCtrlClk,     -- in  std_logic
      rLvFpgaReqI2cBus  => rLvFpgaReqI2cBus,   -- out std_logic
      rLvFpgaAckI2cBus  => rLvFpgaAckI2cBus,   -- in  std_logic
      rLvFpgaI2cGo      => rLvFpgaI2cGo,       -- out std_logic
      rLvFpgaI2cStart   => rLvFpgaI2cStart,    -- out std_logic
      rLvFpgaI2cStop    => rLvFpgaI2cStop,     -- out std_logic
      rLvFpgaI2cRd      => rLvFpgaI2cRd,       -- out std_logic
      rLvFpgaI2cWtData  => rLvFpgaI2cWtData,   -- out std_logic_vector(7 downto 0)
      rLvFpgaI2cAck     => rLvFpgaI2cAck,      -- in  std_logic
      rLvFpgaI2cDone    => rLvFpgaI2cDone,     -- in  std_logic
      rLvFpgaI2cRdData  => rLvFpgaI2cRdData,   -- in  std_logic_vector(7 downto 0)
      aClkGateLv        => aClkGateLv,         -- in  std_logic
      StrobeA           => StrobeA,            -- out std_logic
      StrobeB           => StrobeB,            -- out std_logic
      aSeDir            => aSeDir,             -- in  std_logic_vector(31 downto 0)
      aSeInput          => aSeInput,           -- out std_logic_vector(31 downto 0)
      aSeOutput         => aSeOutput,          -- in  std_logic_vector(31 downto 0)
      SeClkOut          => SeClkOut,           -- in  std_logic
      aSeClkOutInvert   => aSeClkOutInvert,    -- in  std_logic
      aSeClkOutEn       => aSeClkOutEn,        -- in  std_logic
      aSePfiDir         => aSePfiDir,          -- in  std_logic_vector(2 downto 0)
      aSePfiInput       => aSePfiInput,        -- out std_logic_vector(2 downto 0)
      aSePfiOutput      => aSePfiOutput,       -- in  std_logic_vector(2 downto 0)
      aLvdsDir          => aLvdsDir,           -- in  std_logic_vector(15 downto 0)
      aLvdsInput        => aLvdsInput,         -- out std_logic_vector(15 downto 0)
      aLvdsOutput       => aLvdsOutput,        -- in  std_logic_vector(15 downto 0)
      aLvdsPfiDir       => aLvdsPfiDir,        -- in  std_logic_vector(2 downto 0)
      aLvdsPfiInput     => aLvdsPfiInput,      -- out std_logic_vector(2 downto 0)
      aLvdsPfiOutput    => aLvdsPfiOutput,     -- in  std_logic_vector(2 downto 0)
      LvdsClkOut        => LvdsClkOut,         -- in  std_logic
      aLvdsClkOutInvert => aLvdsClkOutInvert,  -- in  std_logic
      aLvdsClkOutEn     => aLvdsClkOutEn,      -- in  std_logic
      rVoltageFamily    => rVoltageFamily,     -- in  std_logic_vector(7 downto 0)
      rSetVoltageFamily => rSetVoltageFamily,  -- in  std_logic
      rSetVoltageDAC    => rSetVoltageDAC,     -- in  std_logic
      rVoltageDAC       => rVoltageDAC,        -- in  std_logic_vector(15 downto 0)
      rSetVoltageDone   => rSetVoltageDone,    -- out std_logic
      aDCMLocked        => aDCMLocked,        -- out std_logic
      
       	iIdelayClk      => 	iIdelayClk , 
   		iIdelayReset    =>	iIdelayReset,
   		iIdelayInc		=>	iIdelayInc,
   		iIdelayEn		=>	iIdelayEn,
   		Clk200			=>	Clk200,
   		idelayCtrlRst	=> 	idelayCtrlRst,
   		iDelayTapOut	=>	iDelayTapOut
   		);
        
        -- Split the 128-bit Tap Count into two 64-bit taps for porting into LabVIEW as U64
        -- Author: Kalyan
        -- Date: 10/20/2015
        iDelayTapFullCnt <= std_logic_vector(to_unsigned(iDelayTapOut, iDelayTapFullCnt'length));
        iDelayTapCnt1 	<= iDelayTapFullCnt(63 downto 0);	-- Store lower 64-bits of Tap Cnt
        iDelayTapCnt2 	<= iDelayTapFullCnt(127 downto 64); -- Store lower 640bits of Tap Cnt
        
end rtl;
