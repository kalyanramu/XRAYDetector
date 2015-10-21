-------------------------------------------------------------------------------
--
-- File: Ni6583BaseS7.vhd
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
-- Purpose: This file controls the mapping of GPIO to logical signal names.
--
-- vreview_reviewers kygreen rortega dhearn dcabrera
-- vreview_group 6583Core
-- vreview_closed http://review-board.natinst.com/r/75820/
-------------------------------------------------------------------------------

library ieee;
use ieee.Std_Logic_1164.all;
use ieee.numeric_std.all;


entity Ni6583BaseS7_Delayed is
  port(

    -- Adapter Module I/O
    aUserGpio           : inout std_logic_vector(67 downto 0);
    aUserGpio_n         : inout std_logic_vector(67 downto 0);
    rIoModGpioEn        : in    std_logic;
       
    -- Logical signal names 
    aSeDir                : in std_logic_vector(31 downto 0);
    aSeInput              : out std_logic_vector(31 downto 0);
    aSeOutput             : in std_logic_vector(31 downto 0);
    aSeOutputEn           : in std_logic_vector(31 downto 0);
    aSeClkOutGen          : in std_logic; -- Se generation clock
    aSeClkOutEn           : in std_logic;
    aSePfiDir             : in std_logic_vector(2 downto 0);
    aSePfiInput           : out std_logic_vector(2 downto 0);
    aSePfiOutput          : in std_logic_vector(2 downto 0);
    aSePfiOutputEn        : in std_logic_vector(2 downto 0);
    aLvdsDir              : in std_logic_vector(15 downto 0);
    aLvdsInput            : out std_logic_vector(15 downto 0);
    aLvdsOutput           : in std_logic_vector(15 downto 0);
    aLvdsPfiDir           : in std_logic_vector(2 downto 0);
    aLvdsPfiInput         : out std_logic_vector(2 downto 0);
    aLvdsPfiOutput        : in std_logic_vector(2 downto 0);
    aLvdsClkOutGen        : in std_logic; -- Lvds generation clock
    aLvdsClkOutEn         : in std_logic;
    SeUserGClk            : out std_logic;
    LvdsUserGClk          : out std_logic;
    
    ---- Additional Lines
    ---- Author: Kalyan
    ---  Date: 10/20/2015
   iIdelayClk       : in  std_logic; 
   iIdelayReset    	: in  std_logic;
   iIdelayInc		: in  std_logic_vector(31 downto 0);
   iIdelayEn		: in  std_logic_vector(31 downto 0);
   Clk200			: in  std_logic;
   iDelayTapOut		: out natural range 0 to 127; -- Store 128 bits (32 channelsx4 bits)
   idelayCtrlRst	: in  std_logic	
  );

end Ni6583BaseS7_Delayed;

architecture rtl of Ni6583BaseS7_Delayed is





--- IDELAYCTRL Component
  component idelayctrl
    port (
      RDY : out std_logic;
      REFCLK : in std_logic;
      RST : in std_logic);
  end component;
  
--- IDELAYE2 Component
  component IDELAYE2
    generic (
      CINVCTRL_SEL : string := "FALSE";
      DELAY_SRC : string := "IDATAIN";
      HIGH_PERFORMANCE_MODE : string := "FALSE";
      IDELAY_TYPE : string := "FIXED";
      IDELAY_VALUE : integer := 0;
      PIPE_SEL : string := "FALSE";
      REFCLK_FREQUENCY : REAL := 200.0;
      SIGNAL_PATTERN : string := "DATA");
    port (
      C : in STD_LOGIC;
      CE : in STD_LOGIC;
      CINVCTRL : in STD_LOGIC;
      CNTVALUEIN : in STD_LOGIC_VECTOR(4 downto 0);
      CNTVALUEOUT : out STD_LOGIC_VECTOR(4 downto 0);
      DATAIN : in STD_LOGIC;
      DATAOUT : out STD_LOGIC;
      IDATAIN : in STD_LOGIC;
      INC : in STD_LOGIC;
      LD : in STD_LOGIC;
      LDPIPEEN : in STD_LOGIC;
      REGRST : in STD_LOGIC);
  end component;

-- Signals
type TapCountArray_t is array (0 to aSeInput'high) of std_logic_vector(4 downto 0);
signal iDelayTapOutVec   : TapCountArray_t;
signal aSeInput_nodelay		: std_logic_vector(31 downto 0);

-- IdelayCtrl Attribute
-- Author:Kalyan
-- Date: 10/21/2015
 attribute IODELAY_GROUP : string;
 attribute IODELAY_GROUP of iIdelayController : label is "Ni6583SEIdelayGroup";

begin
  
  	-- Additional Code
 	-- Author: Kalyan
 	-- Date: 10/20/2015
  	--keep track of the current delay tap value.
  	--this is useful in debugging and seeing how
  	--the delays are being changed over time.
  	-- There are 32 channels and each count value is 4bits => Total of 128 bits
 	 iDelayTapOut <= to_integer(unsigned(iDelayTapOutVec(0)));
  
    -- ------------------------------------------------------------------------
    -- Data/clock signals pinout to GPIO
    -- ------------------------------------------------------------------------
   
    -- SE IO Lines
    -- -----------
   
    -- Direction signals for each of 32 single ended IO lines
    aUserGpio_n(2)   <= aSeDir(1) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(3)   <= aSeDir(7) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(4)   <= aSeDir(5) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(5)   <= aSeDir(3) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(6)   <= aSeDir(9) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(7)   <= aSeDir(6) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(8)   <= aSeDir(17) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(9)   <= aSeDir(15) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(10)  <= aSeDir(13) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(11)  <= aSeDir(20) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(12)  <= aSeDir(16) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(13)  <= aSeDir(27) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(15)  <= aSeDir(25) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(16)  <= aSeDir(23) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(24)  <= aSeDir(0) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(27)  <= aSeDir(2) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(28)  <= aSeDir(4) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(29)  <= aSeDir(11) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(30)  <= aSeDir(10) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(31)  <= aSeDir(8) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(32)  <= aSeDir(14) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(33)  <= aSeDir(12) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(34)  <= aSeDir(21) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(35)  <= aSeDir(18) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(36)  <= aSeDir(19) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(37)  <= aSeDir(24) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(39)  <= aSeDir(22) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(40)  <= aSeDir(29) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(41)  <= aSeDir(28) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(42)  <= aSeDir(31) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(17)  <= aSeDir(30) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(18)  <= aSeDir(26) when rIoModGpioEn='1' else 'Z';
   
    -- Output to SE IO lines
    -- aSeOutputEn used instead of SeDir to disable SeOutputs because of double 
    -- driving issue due to 6ns buffer turnaround time in response to SeDir 
    -- changing state.If a SeDir is changed to Output mode then the respective
    -- SeOutputEn can be End at least 6ns afterwards.
    aUserGpio(2)  <= aSeOutput(1) when aSeOutputEn(1)='1' else 'Z';
    aUserGpio(3)  <= aSeOutput(7) when aSeOutputEn(7)='1' else 'Z';
    aUserGpio(4)  <= aSeOutput(5) when aSeOutputEn(5)='1' else 'Z';
    aUserGpio(5)  <= aSeOutput(3) when aSeOutputEn(3)='1' else 'Z';
    aUserGpio(6)  <= aSeOutput(9) when aSeOutputEn(9)='1' else 'Z';
    aUserGpio(7)  <= aSeOutput(6) when aSeOutputEn(6)='1' else 'Z';
    aUserGpio(8)  <= aSeOutput(17) when aSeOutputEn(17)='1' else 'Z';
    aUserGpio(9)  <= aSeOutput(15) when aSeOutputEn(15)='1' else 'Z';
    aUserGpio(10) <= aSeOutput(13) when aSeOutputEn(13)='1' else 'Z';
    aUserGpio(11) <= aSeOutput(20) when aSeOutputEn(20)='1' else 'Z';
    aUserGpio(12) <= aSeOutput(16) when aSeOutputEn(16)='1' else 'Z';
    aUserGpio(13) <= aSeOutput(27) when aSeOutputEn(27)='1' else 'Z';
    aUserGpio(15) <= aSeOutput(25) when aSeOutputEn(25)='1' else 'Z';
    aUserGpio(16) <= aSeOutput(23) when aSeOutputEn(23)='1' else 'Z';
    aUserGpio(24) <= aSeOutput(0) when aSeOutputEn(0)='1' else 'Z';
    aUserGpio(27) <= aSeOutput(2) when aSeOutputEn(2)='1' else 'Z';
    aUserGpio(28) <= aSeOutput(4) when aSeOutputEn(4)='1' else 'Z';
    aUserGpio(29) <= aSeOutput(11) when aSeOutputEn(11)='1' else 'Z';
    aUserGpio(30) <= aSeOutput(10) when aSeOutputEn(10)='1' else 'Z';
    aUserGpio(31) <= aSeOutput(8) when aSeOutputEn(8)='1' else 'Z';
    aUserGpio(32) <= aSeOutput(14) when aSeOutputEn(14)='1' else 'Z';
    aUserGpio(33) <= aSeOutput(12) when aSeOutputEn(12)='1' else 'Z';
    aUserGpio(34) <= aSeOutput(21) when aSeOutputEn(21)='1' else 'Z';
    aUserGpio(35) <= aSeOutput(18) when aSeOutputEn(18)='1' else 'Z';
    aUserGpio(36) <= aSeOutput(19) when aSeOutputEn(19)='1' else 'Z';
    aUserGpio(37) <= aSeOutput(24) when aSeOutputEn(24)='1' else 'Z';
    aUserGpio(39) <= aSeOutput(22) when aSeOutputEn(22)='1' else 'Z';
    aUserGpio(40) <= aSeOutput(29) when aSeOutputEn(29)='1' else 'Z';
    aUserGpio(41) <= aSeOutput(28) when aSeOutputEn(28)='1' else 'Z';
    aUserGpio(42) <= aSeOutput(31) when aSeOutputEn(31)='1' else 'Z';
    aUserGpio(17) <= aSeOutput(30) when aSeOutputEn(30)='1' else 'Z';
    aUserGpio(18) <= aSeOutput(26) when aSeOutputEn(26)='1' else 'Z';
   
    -- Input from SE IO lines
    aSeInput_nodelay(1)  <= aUserGpio(2);
    aSeInput_nodelay(7)  <= aUserGpio(3);
    aSeInput_nodelay(5)  <= aUserGpio(4);
    aSeInput_nodelay(3)  <= aUserGpio(5);
    aSeInput_nodelay(9)  <= aUserGpio(6);
    aSeInput_nodelay(6)  <= aUserGpio(7);
    aSeInput_nodelay(17) <= aUserGpio(8);
    aSeInput_nodelay(15) <= aUserGpio(9);
    aSeInput_nodelay(13) <= aUserGpio(10);
    aSeInput_nodelay(20) <= aUserGpio(11);
    aSeInput_nodelay(16) <= aUserGpio(12);
    aSeInput_nodelay(27) <= aUserGpio(13);
    aSeInput_nodelay(25) <= aUserGpio(15);
    aSeInput_nodelay(23) <= aUserGpio(16);
    aSeInput_nodelay(0)  <= aUserGpio(24);
    aSeInput_nodelay(2)  <= aUserGpio(27);
    aSeInput_nodelay(4)  <= aUserGpio(28);
    aSeInput_nodelay(11) <= aUserGpio(29);
    aSeInput_nodelay(10) <= aUserGpio(30);
    aSeInput_nodelay(8)  <= aUserGpio(31);
    aSeInput_nodelay(14) <= aUserGpio(32);
    aSeInput_nodelay(12) <= aUserGpio(33);
    aSeInput_nodelay(21) <= aUserGpio(34);
    aSeInput_nodelay(18) <= aUserGpio(35);
    aSeInput_nodelay(19) <= aUserGpio(36);
    aSeInput_nodelay(24) <= aUserGpio(37);
    aSeInput_nodelay(22) <= aUserGpio(39);
    aSeInput_nodelay(29) <= aUserGpio(40);
    aSeInput_nodelay(28) <= aUserGpio(41);
    aSeInput_nodelay(31) <= aUserGpio(42);
    aSeInput_nodelay(30) <= aUserGpio(17);
    aSeInput_nodelay(26) <= aUserGpio(18);
      
    aUserGpio(25) <= aSeClkOutGen when rIoModGpioEn='1' and aSeClkOutEn='1' else 'Z';
	
----------------------------------------------------------------------------
-- IDELAY: Added Code
-- Author: Kalyan
-- Date: 10/20/2015
----------------------------------------------------------------------------   
	
InputDelay : for i in aSeInput'range generate
    -- These attributes propagate through to each instance of the Idelays
    -- in the generate loop.  This was verified in the timing editor's NGC
    -- viewer.
    attribute IODELAY_GROUP : string;
    attribute IODELAY_GROUP of iIdelaySE : label is "Ni6583SEIdelayGroup";
  begin
  
    iIdelaySE: IDELAYE2
      generic map (
        CINVCTRL_SEL          => "FALSE",     -- in  string := "FALSE"
        DELAY_SRC             => "IDATAIN",   -- in  string := "IDATAIN"
        HIGH_PERFORMANCE_MODE => "TRUE",      -- in  string := "FALSE"
        IDELAY_TYPE           => "VARIABLE",  -- in  string := "FIXED"
        IDELAY_VALUE          => 15,          -- in  integer := 0
        PIPE_SEL              => "FALSE",     -- in  string := "FALSE"
        REFCLK_FREQUENCY      => 200.0,       -- in  REAL := 200.0
        SIGNAL_PATTERN        => "DATA")      -- in  string := "DATA"
      port map (
        C           => iIdelayClk,              -- in  STD_LOGIC
        CE          => iIdelayEn(i),            -- in  STD_LOGIC
        CINVCTRL    => '0',                    	-- in  STD_LOGIC
        CNTVALUEIN  => (others => '0'),        	-- in  STD_LOGIC_VECTOR(4 downto 0)
        CNTVALUEOUT => iDelayTapOutVec(i),  	-- out STD_LOGIC_VECTOR(4 downto 0)
        DATAIN      => '0',                    	-- in  STD_LOGIC
        DATAOUT     => aseInput(i),      		-- out STD_LOGIC
        IDATAIN     => aSeInput_nodelay(i),     -- in  STD_LOGIC
        INC         => iIdelayInc(i),           -- in  STD_LOGIC
        LD          => iIdelayReset,           	-- in  STD_LOGIC
        LDPIPEEN    => '0',                    	-- in  STD_LOGIC
        REGRST      => '0');                   	-- in  STD_LOGIC
        
  end generate InputDelay;
  
  ----------------------------------------------------------------------------
  -- IDELAY calibration (Added Code)
  -- Author: Kalyan
  -- Date: 10/20/2015
  
  ----------------------------------------------------------------------------       
  iIdelayController: idelayctrl
    port map (
      RDY    => open,      -- out std_logic
      REFCLK => Clk200,    -- in  std_logic
      RST    => idelayCtrlRst); -- in  std_logic
      
  ---------------------------------------------------------------------------
    -- SE Clock Output En
    aUserGpio_n(25) <= aSeClkOutEn when rIoModGpioEn='1' else 'Z';
   
    -- Direction signals for each of the 3 PFI
    aUserGpio_n(0)  <= aSePfiDir(0) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(1)  <= aSePfiDir(2) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(26) <= aSePfiDir(1) when rIoModGpioEn='1' else 'Z';
   
    -- Output to SE PFI lines
    aUserGpio(0)  <= aSePfiOutput(0) when aSePfiOutputEn(0)='1' else 'Z';
    aUserGpio(1)  <= aSePfiOutput(2) when aSePfiOutputEn(2)='1' else 'Z';
    aUserGpio(26) <= aSePfiOutput(1) when aSePfiOutputEn(1)='1' else 'Z';
   
    -- Input from SE PFI lines
    aSePfiInput(0)  <= aUserGpio(0);
    aSePfiInput(2)  <= aUserGpio(1);
    aSePfiInput(1)  <= aUserGpio(26);
   
    
    -- LVDS IO Lines
    -- -------------
   
    -- Direction signals for each of the 16 LVDS IO
    aUserGpio_n(44) <= aLvdsDir(13) when rIoModGpioEn='1' else 'Z';
    aUserGpio(46)   <= aLvdsDir(15) when rIoModGpioEn='1' else 'Z';
    aUserGpio(47)   <= aLvdsDir(9) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(49) <= aLvdsDir(2) when rIoModGpioEn='1' else 'Z';
    aUserGpio(50)   <= aLvdsDir(6) when rIoModGpioEn='1' else 'Z';
    aUserGpio(54)   <= aLvdsDir(1) when rIoModGpioEn='1' else 'Z';
    aUserGpio(57)   <= aLvdsDir(0) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(20) <= aLvdsDir(12) when rIoModGpioEn='1' else 'Z';
    aUserGpio(20)   <= aLvdsDir(14) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(23) <= aLvdsDir(8) when rIoModGpioEn='1' else 'Z';
    aUserGpio(58)   <= aLvdsDir(7) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(59) <= aLvdsDir(10) when rIoModGpioEn='1' else 'Z';
    aUserGpio(61)   <= aLvdsDir(11) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(62) <= aLvdsDir(3) when rIoModGpioEn='1' else 'Z';
    aUserGpio(64)   <= aLvdsDir(4) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(65) <= aLvdsDir(5) when rIoModGpioEn='1' else 'Z';
   
    -- Direction signals for each of the 3 LVDS PFI
    aUserGpio_n(53) <= aLvdsPfiDir(0) when rIoModGpioEn='1' else 'Z';
    aUserGpio_n(55) <= aLvdsPfiDir(1) when rIoModGpioEn='1' else 'Z';
    aUserGpio(66) <= aLvdsPfiDir(2) when rIoModGpioEn='1' else 'Z';
   
    -- Output to LVDS IO lines
    aUserGpio(44)   <= aLvdsOutput(13) when rIoModGpioEn='1' and aLvdsDir(13)='1' else 'Z';
    aUserGpio(45)   <= aLvdsOutput(15) when rIoModGpioEn='1' and aLvdsDir(15)='1' else 'Z';
    aUserGpio_n(48) <= aLvdsOutput(9) when rIoModGpioEn='1' and aLvdsDir(9)='1' else 'Z';
    aUserGpio(49)   <= aLvdsOutput(2) when rIoModGpioEn='1' and aLvdsDir(2)='1' else 'Z';
    aUserGpio(51)   <= aLvdsOutput(6) when rIoModGpioEn='1' and aLvdsDir(6)='1' else 'Z';
    aUserGpio_n(54) <= aLvdsOutput(1) when rIoModGpioEn='1' and aLvdsDir(1)='1' else 'Z';
    aUserGpio(56)   <= aLvdsOutput(0) when rIoModGpioEn='1' and aLvdsDir(0)='1' else 'Z';    
    aUserGpio_n(19) <= aLvdsOutput(12) when rIoModGpioEn='1' and aLvdsDir(12)='1' else 'Z';
    aUserGpio_n(21) <= aLvdsOutput(14) when rIoModGpioEn='1' and aLvdsDir(14)='1' else 'Z';
    aUserGpio_n(22) <= aLvdsOutput(8) when rIoModGpioEn='1' and aLvdsDir(8)='1' else 'Z';
    aUserGpio(23)   <= aLvdsOutput(7) when rIoModGpioEn='1' and aLvdsDir(7)='1' else 'Z';
    aUserGpio(59)   <= aLvdsOutput(10) when rIoModGpioEn='1' and aLvdsDir(10)='1' else 'Z';
    aUserGpio(60)   <= aLvdsOutput(11) when rIoModGpioEn='1' and aLvdsDir(11)='1' else 'Z';
    aUserGpio(62)   <= aLvdsOutput(3) when rIoModGpioEn='1' and aLvdsDir(3)='1' else 'Z';
    aUserGpio(63)   <= aLvdsOutput(4) when rIoModGpioEn='1' and aLvdsDir(4)='1' else 'Z';
    aUserGpio(65)   <= aLvdsOutput(5) when rIoModGpioEn='1' and aLvdsDir(5)='1' else 'Z';
   
    -- Output to LVDS PFI lines
    aUserGpio_n(52) <= aLvdsPfiOutput(0) when rIoModGpioEn='1' and aLvdsPfiDir(0)='1' else 'Z';
    aUserGpio(55)   <= aLvdsPfiOutput(1) when rIoModGpioEn='1' and aLvdsPfiDir(1)='1' else 'Z';
    aUserGpio_n(67) <= aLvdsPfiOutput(2) when rIoModGpioEn='1' and aLvdsPfiDir(2)='1' else 'Z';
   
    -- Input from LVDS IO lines
    aLvdsInput(13) <= aUserGpio_n(45);
    aLvdsInput(15) <= aUserGpio_n(46);
    aLvdsInput(9) <= aUserGpio(48);
    aLvdsInput(2) <= aUserGpio_n(50);
    aLvdsInput(6) <= aUserGpio_n(51);
    aLvdsInput(1) <= aUserGpio(53);
    aLvdsInput(0) <= aUserGpio_n(57);
    aLvdsInput(12) <= aUserGpio(19);
    aLvdsInput(14) <= aUserGpio(21);
    aLvdsInput(8) <= aUserGpio(22);
    aLvdsInput(7) <= aUserGpio_n(58);
    aLvdsInput(10) <= aUserGpio_n(60);
    aLvdsInput(11) <= aUserGpio_n(61);
    aLvdsInput(3) <= aUserGpio_n(63);
    aLvdsInput(4) <= aUserGpio_n(64);
    aLvdsInput(5) <= aUserGpio_n(66);
   
    -- Input from LVDS PFI lines
    aLvdsPfiInput(0) <= aUserGpio(52);
    aLvdsPfiInput(1) <= aUserGpio_n(56);
    aLvdsPfiInput(2) <= aUserGpio(67);
   
    -- LVDS Clock Output
    aUserGpio(43) <= aLvdsClkOutGen when rIoModGpioEn='1' and aLvdsClkOutEn='1' else 'Z';
    
    -- LVDS Clock Output En
    aUserGpio_n(43) <= aLvdsClkOutEn when rIoModGpioEn='1' else 'Z';
   
    -- Power supply test for NI manufacturing use only. DO NOT USE!!!
    aUserGpio_n(47) <= 'Z';

    -- Clock mapping
    -- -------------
    SeUserGClk <= aUserGpio(14);
    LvdsUserGClk <= aUserGpio(38);
  
end rtl;
