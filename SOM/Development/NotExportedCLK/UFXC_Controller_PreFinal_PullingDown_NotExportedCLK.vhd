library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library work;
  use work.PkgNiUtilities.all;
  use work.PkgRegPortAxiFlat.all;
  use work.PkgRegPort.all;

library UNISIM;
  use UNISIM.vcomponents.all;

entity UFXC_Controller_PreFinal_PullingDown_NotExportedCLK is
  port(
    ---------------------------------------------------------------
    --LabVIEW Port: DIO_16_P_FVAL_DEFGHI
    ---------------------------------------------------------------
    DIO_16_P_FVAL_DEFGHI_lv_in : out std_logic_vector(0 downto 0);
    DIO_16_P_FVAL_DEFGHI_lv_out : in std_logic_vector(0 downto 0);
    DIO_16_P_FVAL_DEFGHI_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_16_N_PortH_4
    ---------------------------------------------------------------
    DIO_16_N_PortH_4_lv_in : out std_logic_vector(0 downto 0);
    DIO_16_N_PortH_4_lv_out : in std_logic_vector(0 downto 0);
    DIO_16_N_PortH_4_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_17_P_PortH_6
    ---------------------------------------------------------------
    DIO_17_P_PortH_6_lv_in : out std_logic_vector(0 downto 0);
    DIO_17_P_PortH_6_lv_out : in std_logic_vector(0 downto 0);
    DIO_17_P_PortH_6_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_17_N_PortH_0
    ---------------------------------------------------------------
    DIO_17_N_PortH_0_lv_in : out std_logic_vector(0 downto 0);
    DIO_17_N_PortH_0_lv_out : in std_logic_vector(0 downto 0);
    DIO_17_N_PortH_0_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_18_P_DVAL_DEF
    ---------------------------------------------------------------
    DIO_18_P_DVAL_DEF_lv_in : out std_logic_vector(0 downto 0);
    DIO_18_P_DVAL_DEF_lv_out : in std_logic_vector(0 downto 0);
    DIO_18_P_DVAL_DEF_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_18_N_STROBE_DEF
    ---------------------------------------------------------------
    DIO_18_N_STROBE_DEF_lv_in : out std_logic_vector(0 downto 0);
    DIO_18_N_STROBE_DEF_lv_out : in std_logic_vector(0 downto 0);
    DIO_18_N_STROBE_DEF_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_19_P_STROBE_GH
    ---------------------------------------------------------------
    DIO_19_P_STROBE_GH_lv_in : out std_logic_vector(0 downto 0);
    DIO_19_P_STROBE_GH_lv_out : in std_logic_vector(0 downto 0);
    DIO_19_P_STROBE_GH_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_19_N_DVAL_GH
    ---------------------------------------------------------------
    DIO_19_N_DVAL_GH_lv_in : out std_logic_vector(0 downto 0);
    DIO_19_N_DVAL_GH_lv_out : in std_logic_vector(0 downto 0);
    DIO_19_N_DVAL_GH_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_20_P_PortH_7
    ---------------------------------------------------------------
    DIO_20_P_PortH_7_lv_in : out std_logic_vector(0 downto 0);
    DIO_20_P_PortH_7_lv_out : in std_logic_vector(0 downto 0);
    DIO_20_P_PortH_7_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_20_N_PortH_3
    ---------------------------------------------------------------
    DIO_20_N_PortH_3_lv_in : out std_logic_vector(0 downto 0);
    DIO_20_N_PortH_3_lv_out : in std_logic_vector(0 downto 0);
    DIO_20_N_PortH_3_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_21_P_PortG_7
    ---------------------------------------------------------------
    DIO_21_P_PortG_7_lv_in : out std_logic_vector(0 downto 0);
    DIO_21_P_PortG_7_lv_out : in std_logic_vector(0 downto 0);
    DIO_21_P_PortG_7_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_21_N_PortG_5
    ---------------------------------------------------------------
    DIO_21_N_PortG_5_lv_in : out std_logic_vector(0 downto 0);
    DIO_21_N_PortG_5_lv_out : in std_logic_vector(0 downto 0);
    DIO_21_N_PortG_5_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_22_P_LVAL_GH
    ---------------------------------------------------------------
    DIO_22_P_LVAL_GH_lv_in : out std_logic_vector(0 downto 0);
    DIO_22_P_LVAL_GH_lv_out : in std_logic_vector(0 downto 0);
    DIO_22_P_LVAL_GH_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_22_N_PortH_5
    ---------------------------------------------------------------
    DIO_22_N_PortH_5_lv_in : out std_logic_vector(0 downto 0);
    DIO_22_N_PortH_5_lv_out : in std_logic_vector(0 downto 0);
    DIO_22_N_PortH_5_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_23_P_PortH_2
    ---------------------------------------------------------------
    DIO_23_P_PortH_2_lv_in : out std_logic_vector(0 downto 0);
    DIO_23_P_PortH_2_lv_out : in std_logic_vector(0 downto 0);
    DIO_23_P_PortH_2_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_23_N_PortH_1
    ---------------------------------------------------------------
    DIO_23_N_PortH_1_lv_in : out std_logic_vector(0 downto 0);
    DIO_23_N_PortH_1_lv_out : in std_logic_vector(0 downto 0);
    DIO_23_N_PortH_1_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_24_P_PortG_3
    ---------------------------------------------------------------
    DIO_24_P_PortG_3_lv_in : out std_logic_vector(0 downto 0);
    DIO_24_P_PortG_3_lv_out : in std_logic_vector(0 downto 0);
    DIO_24_P_PortG_3_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_24_N_PortG_4
    ---------------------------------------------------------------
    DIO_24_N_PortG_4_lv_in : out std_logic_vector(0 downto 0);
    DIO_24_N_PortG_4_lv_out : in std_logic_vector(0 downto 0);
    DIO_24_N_PortG_4_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_25_clk_A
    ---------------------------------------------------------------
    DIO_25_clk_A_lv_in : out std_logic_vector(0 downto 0);
    DIO_25_clk_A_lv_out : in std_logic_vector(0 downto 0);
    DIO_25_clk_A_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_26_strobe_A
    ---------------------------------------------------------------
    DIO_26_strobe_A_lv_in : out std_logic_vector(0 downto 0);
    DIO_26_strobe_A_lv_out : in std_logic_vector(0 downto 0);
    DIO_26_strobe_A_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_27_P_PortG_0
    ---------------------------------------------------------------
    DIO_27_P_PortG_0_lv_in : out std_logic_vector(0 downto 0);
    DIO_27_P_PortG_0_lv_out : in std_logic_vector(0 downto 0);
    DIO_27_P_PortG_0_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_27_N_PortG_6
    ---------------------------------------------------------------
    DIO_27_N_PortG_6_lv_in : out std_logic_vector(0 downto 0);
    DIO_27_N_PortG_6_lv_out : in std_logic_vector(0 downto 0);
    DIO_27_N_PortG_6_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_28_P_PortG_2
    ---------------------------------------------------------------
    DIO_28_P_PortG_2_lv_in : out std_logic_vector(0 downto 0);
    DIO_28_P_PortG_2_lv_out : in std_logic_vector(0 downto 0);
    DIO_28_P_PortG_2_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_28_N_PortG_1
    ---------------------------------------------------------------
    DIO_28_N_PortG_1_lv_in : out std_logic_vector(0 downto 0);
    DIO_28_N_PortG_1_lv_out : in std_logic_vector(0 downto 0);
    DIO_28_N_PortG_1_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_29_sin_A
    ---------------------------------------------------------------
    DIO_29_sin_A_lv_in : out std_logic_vector(0 downto 0);
    DIO_29_sin_A_lv_out : in std_logic_vector(0 downto 0);
    DIO_29_sin_A_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_30_sout_A_0
    ---------------------------------------------------------------
    DIO_30_sout_A_0_lv_in : out std_logic_vector(0 downto 0);
    DIO_30_sout_A_0_lv_out : in std_logic_vector(0 downto 0);
    DIO_30_sout_A_0_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_31_sout_A_2
    ---------------------------------------------------------------
    DIO_31_sout_A_2_lv_in : out std_logic_vector(0 downto 0);
    DIO_31_sout_A_2_lv_out : in std_logic_vector(0 downto 0);
    DIO_31_sout_A_2_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_32_P_LED_1
    ---------------------------------------------------------------
    DIO_32_P_LED_1_lv_in : out std_logic_vector(0 downto 0);
    DIO_32_P_LED_1_lv_out : in std_logic_vector(0 downto 0);
    DIO_32_P_LED_1_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_32_N_LED_2
    ---------------------------------------------------------------
    DIO_32_N_LED_2_lv_in : out std_logic_vector(0 downto 0);
    DIO_32_N_LED_2_lv_out : in std_logic_vector(0 downto 0);
    DIO_32_N_LED_2_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_34_shift_A
    ---------------------------------------------------------------
    DIO_34_shift_A_lv_in : out std_logic_vector(0 downto 0);
    DIO_34_shift_A_lv_out : in std_logic_vector(0 downto 0);
    DIO_34_shift_A_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_35_sout_A_4
    ---------------------------------------------------------------
    DIO_35_sout_A_4_lv_in : out std_logic_vector(0 downto 0);
    DIO_35_sout_A_4_lv_out : in std_logic_vector(0 downto 0);
    DIO_35_sout_A_4_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_36_P_PUSH_BUTTON_2
    ---------------------------------------------------------------
    DIO_36_P_PUSH_BUTTON_2_lv_in : out std_logic_vector(0 downto 0);
    DIO_36_P_PUSH_BUTTON_2_lv_out : in std_logic_vector(0 downto 0);
    DIO_36_P_PUSH_BUTTON_2_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_36_N_PUSH_BUTTON_1
    ---------------------------------------------------------------
    DIO_36_N_PUSH_BUTTON_1_lv_in : out std_logic_vector(0 downto 0);
    DIO_36_N_PUSH_BUTTON_1_lv_out : in std_logic_vector(0 downto 0);
    DIO_36_N_PUSH_BUTTON_1_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_38_write_ctr_A
    ---------------------------------------------------------------
    DIO_38_write_ctr_A_lv_in : out std_logic_vector(0 downto 0);
    DIO_38_write_ctr_A_lv_out : in std_logic_vector(0 downto 0);
    DIO_38_write_ctr_A_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_39_pclk_A
    ---------------------------------------------------------------
    DIO_39_pclk_A_lv_in : out std_logic_vector(0 downto 0);
    DIO_39_pclk_A_lv_out : in std_logic_vector(0 downto 0);
    DIO_39_pclk_A_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_40_P_PortF_4
    ---------------------------------------------------------------
    DIO_40_P_PortF_4_lv_in : out std_logic_vector(0 downto 0);
    DIO_40_P_PortF_4_lv_out : in std_logic_vector(0 downto 0);
    DIO_40_P_PortF_4_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_40_N_PortF_1
    ---------------------------------------------------------------
    DIO_40_N_PortF_1_lv_in : out std_logic_vector(0 downto 0);
    DIO_40_N_PortF_1_lv_out : in std_logic_vector(0 downto 0);
    DIO_40_N_PortF_1_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_41_P_PortE_5
    ---------------------------------------------------------------
    DIO_41_P_PortE_5_lv_in : out std_logic_vector(0 downto 0);
    DIO_41_P_PortE_5_lv_out : in std_logic_vector(0 downto 0);
    DIO_41_P_PortE_5_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_41_N_PortE_7
    ---------------------------------------------------------------
    DIO_41_N_PortE_7_lv_in : out std_logic_vector(0 downto 0);
    DIO_41_N_PortE_7_lv_out : in std_logic_vector(0 downto 0);
    DIO_41_N_PortE_7_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_42_P_PortE_1
    ---------------------------------------------------------------
    DIO_42_P_PortE_1_lv_in : out std_logic_vector(0 downto 0);
    DIO_42_P_PortE_1_lv_out : in std_logic_vector(0 downto 0);
    DIO_42_P_PortE_1_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_42_N_PortE_0
    ---------------------------------------------------------------
    DIO_42_N_PortE_0_lv_in : out std_logic_vector(0 downto 0);
    DIO_42_N_PortE_0_lv_out : in std_logic_vector(0 downto 0);
    DIO_42_N_PortE_0_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_43_P_PortF_5
    ---------------------------------------------------------------
    DIO_43_P_PortF_5_lv_in : out std_logic_vector(0 downto 0);
    DIO_43_P_PortF_5_lv_out : in std_logic_vector(0 downto 0);
    DIO_43_P_PortF_5_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_43_N_LVAL_DEF
    ---------------------------------------------------------------
    DIO_43_N_LVAL_DEF_lv_in : out std_logic_vector(0 downto 0);
    DIO_43_N_LVAL_DEF_lv_out : in std_logic_vector(0 downto 0);
    DIO_43_N_LVAL_DEF_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_44_P_PortF_0
    ---------------------------------------------------------------
    DIO_44_P_PortF_0_lv_in : out std_logic_vector(0 downto 0);
    DIO_44_P_PortF_0_lv_out : in std_logic_vector(0 downto 0);
    DIO_44_P_PortF_0_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_44_N_PortF_7
    ---------------------------------------------------------------
    DIO_44_N_PortF_7_lv_in : out std_logic_vector(0 downto 0);
    DIO_44_N_PortF_7_lv_out : in std_logic_vector(0 downto 0);
    DIO_44_N_PortF_7_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_45_P_PortE_2
    ---------------------------------------------------------------
    DIO_45_P_PortE_2_lv_in : out std_logic_vector(0 downto 0);
    DIO_45_P_PortE_2_lv_out : in std_logic_vector(0 downto 0);
    DIO_45_P_PortE_2_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_45_N_PortE_6
    ---------------------------------------------------------------
    DIO_45_N_PortE_6_lv_in : out std_logic_vector(0 downto 0);
    DIO_45_N_PortE_6_lv_out : in std_logic_vector(0 downto 0);
    DIO_45_N_PortE_6_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_46_P_PortD_7
    ---------------------------------------------------------------
    DIO_46_P_PortD_7_lv_in : out std_logic_vector(0 downto 0);
    DIO_46_P_PortD_7_lv_out : in std_logic_vector(0 downto 0);
    DIO_46_P_PortD_7_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_46_N_PortD_5
    ---------------------------------------------------------------
    DIO_46_N_PortD_5_lv_in : out std_logic_vector(0 downto 0);
    DIO_46_N_PortD_5_lv_out : in std_logic_vector(0 downto 0);
    DIO_46_N_PortD_5_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_47_P_PortF_3
    ---------------------------------------------------------------
    DIO_47_P_PortF_3_lv_in : out std_logic_vector(0 downto 0);
    DIO_47_P_PortF_3_lv_out : in std_logic_vector(0 downto 0);
    DIO_47_P_PortF_3_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_47_N_PortF_6
    ---------------------------------------------------------------
    DIO_47_N_PortF_6_lv_in : out std_logic_vector(0 downto 0);
    DIO_47_N_PortF_6_lv_out : in std_logic_vector(0 downto 0);
    DIO_47_N_PortF_6_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_48_P_PortE_4
    ---------------------------------------------------------------
    DIO_48_P_PortE_4_lv_in : out std_logic_vector(0 downto 0);
    DIO_48_P_PortE_4_lv_out : in std_logic_vector(0 downto 0);
    DIO_48_P_PortE_4_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_48_N_PortE_3
    ---------------------------------------------------------------
    DIO_48_N_PortE_3_lv_in : out std_logic_vector(0 downto 0);
    DIO_48_N_PortE_3_lv_out : in std_logic_vector(0 downto 0);
    DIO_48_N_PortE_3_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_49_P_PortD_2
    ---------------------------------------------------------------
    DIO_49_P_PortD_2_lv_in : out std_logic_vector(0 downto 0);
    DIO_49_P_PortD_2_lv_out : in std_logic_vector(0 downto 0);
    DIO_49_P_PortD_2_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_49_N_PortD_3
    ---------------------------------------------------------------
    DIO_49_N_PortD_3_lv_in : out std_logic_vector(0 downto 0);
    DIO_49_N_PortD_3_lv_out : in std_logic_vector(0 downto 0);
    DIO_49_N_PortD_3_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_50_P_PortD_6
    ---------------------------------------------------------------
    DIO_50_P_PortD_6_lv_in : out std_logic_vector(0 downto 0);
    DIO_50_P_PortD_6_lv_out : in std_logic_vector(0 downto 0);
    DIO_50_P_PortD_6_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_50_N_PortF_2
    ---------------------------------------------------------------
    DIO_50_N_PortF_2_lv_in : out std_logic_vector(0 downto 0);
    DIO_50_N_PortF_2_lv_out : in std_logic_vector(0 downto 0);
    DIO_50_N_PortF_2_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_51_P_PortD_1
    ---------------------------------------------------------------
    DIO_51_P_PortD_1_lv_in : out std_logic_vector(0 downto 0);
    DIO_51_P_PortD_1_lv_out : in std_logic_vector(0 downto 0);
    DIO_51_P_PortD_1_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_51_N_PortD_0
    ---------------------------------------------------------------
    DIO_51_N_PortD_0_lv_in : out std_logic_vector(0 downto 0);
    DIO_51_N_PortD_0_lv_out : in std_logic_vector(0 downto 0);
    DIO_51_N_PortD_0_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_52_N_PortD_4
    ---------------------------------------------------------------
    DIO_52_N_PortD_4_lv_in : out std_logic_vector(0 downto 0);
    DIO_52_N_PortD_4_lv_out : in std_logic_vector(0 downto 0);
    DIO_52_N_PortD_4_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_53_sout_A_6
    ---------------------------------------------------------------
    DIO_53_sout_A_6_lv_in : out std_logic_vector(0 downto 0);
    DIO_53_sout_A_6_lv_out : in std_logic_vector(0 downto 0);
    DIO_53_sout_A_6_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_54_sin_B
    ---------------------------------------------------------------
    DIO_54_sin_B_lv_in : out std_logic_vector(0 downto 0);
    DIO_54_sin_B_lv_out : in std_logic_vector(0 downto 0);
    DIO_54_sin_B_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_55_sout_B_0
    ---------------------------------------------------------------
    DIO_55_sout_B_0_lv_in : out std_logic_vector(0 downto 0);
    DIO_55_sout_B_0_lv_out : in std_logic_vector(0 downto 0);
    DIO_55_sout_B_0_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_56_clk_B
    ---------------------------------------------------------------
    DIO_56_clk_B_lv_in : out std_logic_vector(0 downto 0);
    DIO_56_clk_B_lv_out : in std_logic_vector(0 downto 0);
    DIO_56_clk_B_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_57_strobe_B
    ---------------------------------------------------------------
    DIO_57_strobe_B_lv_in : out std_logic_vector(0 downto 0);
    DIO_57_strobe_B_lv_out : in std_logic_vector(0 downto 0);
    DIO_57_strobe_B_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_58_shift_B
    ---------------------------------------------------------------
    DIO_58_shift_B_lv_in : out std_logic_vector(0 downto 0);
    DIO_58_shift_B_lv_out : in std_logic_vector(0 downto 0);
    DIO_58_shift_B_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_59_sout_A_1
    ---------------------------------------------------------------
    DIO_59_sout_A_1_lv_in : out std_logic_vector(0 downto 0);
    DIO_59_sout_A_1_lv_out : in std_logic_vector(0 downto 0);
    DIO_59_sout_A_1_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_60_sout_A_5
    ---------------------------------------------------------------
    DIO_60_sout_A_5_lv_in : out std_logic_vector(0 downto 0);
    DIO_60_sout_A_5_lv_out : in std_logic_vector(0 downto 0);
    DIO_60_sout_A_5_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_61_pclk_B
    ---------------------------------------------------------------
    DIO_61_pclk_B_lv_in : out std_logic_vector(0 downto 0);
    DIO_61_pclk_B_lv_out : in std_logic_vector(0 downto 0);
    DIO_61_pclk_B_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_62_sout_A_3
    ---------------------------------------------------------------
    DIO_62_sout_A_3_lv_in : out std_logic_vector(0 downto 0);
    DIO_62_sout_A_3_lv_out : in std_logic_vector(0 downto 0);
    DIO_62_sout_A_3_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_63_sout_A_7
    ---------------------------------------------------------------
    DIO_63_sout_A_7_lv_in : out std_logic_vector(0 downto 0);
    DIO_63_sout_A_7_lv_out : in std_logic_vector(0 downto 0);
    DIO_63_sout_A_7_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_64_N_FVAL_ABC
    ---------------------------------------------------------------
    DIO_64_N_FVAL_ABC_lv_in : out std_logic_vector(0 downto 0);
    DIO_64_N_FVAL_ABC_lv_out : in std_logic_vector(0 downto 0);
    DIO_64_N_FVAL_ABC_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_65_P_PortC_2
    ---------------------------------------------------------------
    DIO_65_P_PortC_2_lv_in : out std_logic_vector(0 downto 0);
    DIO_65_P_PortC_2_lv_out : in std_logic_vector(0 downto 0);
    DIO_65_P_PortC_2_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_65_N_PortC_7
    ---------------------------------------------------------------
    DIO_65_N_PortC_7_lv_in : out std_logic_vector(0 downto 0);
    DIO_65_N_PortC_7_lv_out : in std_logic_vector(0 downto 0);
    DIO_65_N_PortC_7_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_66_P_PortB_3
    ---------------------------------------------------------------
    DIO_66_P_PortB_3_lv_in : out std_logic_vector(0 downto 0);
    DIO_66_P_PortB_3_lv_out : in std_logic_vector(0 downto 0);
    DIO_66_P_PortB_3_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_66_N_PortB_6
    ---------------------------------------------------------------
    DIO_66_N_PortB_6_lv_in : out std_logic_vector(0 downto 0);
    DIO_66_N_PortB_6_lv_out : in std_logic_vector(0 downto 0);
    DIO_66_N_PortB_6_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_67_P_PortC_5
    ---------------------------------------------------------------
    DIO_67_P_PortC_5_lv_in : out std_logic_vector(0 downto 0);
    DIO_67_P_PortC_5_lv_out : in std_logic_vector(0 downto 0);
    DIO_67_P_PortC_5_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_67_N_LVAL_ABC
    ---------------------------------------------------------------
    DIO_67_N_LVAL_ABC_lv_in : out std_logic_vector(0 downto 0);
    DIO_67_N_LVAL_ABC_lv_out : in std_logic_vector(0 downto 0);
    DIO_67_N_LVAL_ABC_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_68_P_PortC_0
    ---------------------------------------------------------------
    DIO_68_P_PortC_0_lv_in : out std_logic_vector(0 downto 0);
    DIO_68_P_PortC_0_lv_out : in std_logic_vector(0 downto 0);
    DIO_68_P_PortC_0_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_68_N_PortC_6
    ---------------------------------------------------------------
    DIO_68_N_PortC_6_lv_in : out std_logic_vector(0 downto 0);
    DIO_68_N_PortC_6_lv_out : in std_logic_vector(0 downto 0);
    DIO_68_N_PortC_6_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_69_P_PortA_0
    ---------------------------------------------------------------
    DIO_69_P_PortA_0_lv_in : out std_logic_vector(0 downto 0);
    DIO_69_P_PortA_0_lv_out : in std_logic_vector(0 downto 0);
    DIO_69_P_PortA_0_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_69_N_PortA_6
    ---------------------------------------------------------------
    DIO_69_N_PortA_6_lv_in : out std_logic_vector(0 downto 0);
    DIO_69_N_PortA_6_lv_out : in std_logic_vector(0 downto 0);
    DIO_69_N_PortA_6_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_71_N_PortC_1
    ---------------------------------------------------------------
    DIO_71_N_PortC_1_lv_in : out std_logic_vector(0 downto 0);
    DIO_71_N_PortC_1_lv_out : in std_logic_vector(0 downto 0);
    DIO_71_N_PortC_1_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_72_P_PortB_7
    ---------------------------------------------------------------
    DIO_72_P_PortB_7_lv_in : out std_logic_vector(0 downto 0);
    DIO_72_P_PortB_7_lv_out : in std_logic_vector(0 downto 0);
    DIO_72_P_PortB_7_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_72_N_STROBE_ABC
    ---------------------------------------------------------------
    DIO_72_N_STROBE_ABC_lv_in : out std_logic_vector(0 downto 0);
    DIO_72_N_STROBE_ABC_lv_out : in std_logic_vector(0 downto 0);
    DIO_72_N_STROBE_ABC_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_73_P_PortC_3
    ---------------------------------------------------------------
    DIO_73_P_PortC_3_lv_in : out std_logic_vector(0 downto 0);
    DIO_73_P_PortC_3_lv_out : in std_logic_vector(0 downto 0);
    DIO_73_P_PortC_3_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_73_N_PortC_4
    ---------------------------------------------------------------
    DIO_73_N_PortC_4_lv_in : out std_logic_vector(0 downto 0);
    DIO_73_N_PortC_4_lv_out : in std_logic_vector(0 downto 0);
    DIO_73_N_PortC_4_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_74_P_PortB_4
    ---------------------------------------------------------------
    DIO_74_P_PortB_4_lv_in : out std_logic_vector(0 downto 0);
    DIO_74_P_PortB_4_lv_out : in std_logic_vector(0 downto 0);
    DIO_74_P_PortB_4_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_74_N_PortB_5
    ---------------------------------------------------------------
    DIO_74_N_PortB_5_lv_in : out std_logic_vector(0 downto 0);
    DIO_74_N_PortB_5_lv_out : in std_logic_vector(0 downto 0);
    DIO_74_N_PortB_5_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_75_P_PortA_2
    ---------------------------------------------------------------
    DIO_75_P_PortA_2_lv_in : out std_logic_vector(0 downto 0);
    DIO_75_P_PortA_2_lv_out : in std_logic_vector(0 downto 0);
    DIO_75_P_PortA_2_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_75_N_PortA_1
    ---------------------------------------------------------------
    DIO_75_N_PortA_1_lv_in : out std_logic_vector(0 downto 0);
    DIO_75_N_PortA_1_lv_out : in std_logic_vector(0 downto 0);
    DIO_75_N_PortA_1_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_76_sout_B_2
    ---------------------------------------------------------------
    DIO_76_sout_B_2_lv_in : out std_logic_vector(0 downto 0);
    DIO_76_sout_B_2_lv_out : in std_logic_vector(0 downto 0);
    DIO_76_sout_B_2_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_77_sout_B_4
    ---------------------------------------------------------------
    DIO_77_sout_B_4_lv_in : out std_logic_vector(0 downto 0);
    DIO_77_sout_B_4_lv_out : in std_logic_vector(0 downto 0);
    DIO_77_sout_B_4_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_78_P_PortA_3
    ---------------------------------------------------------------
    DIO_78_P_PortA_3_lv_in : out std_logic_vector(0 downto 0);
    DIO_78_P_PortA_3_lv_out : in std_logic_vector(0 downto 0);
    DIO_78_P_PortA_3_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_78_N_PortA_4
    ---------------------------------------------------------------
    DIO_78_N_PortA_4_lv_in : out std_logic_vector(0 downto 0);
    DIO_78_N_PortA_4_lv_out : in std_logic_vector(0 downto 0);
    DIO_78_N_PortA_4_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_79_sout_B_3
    ---------------------------------------------------------------
    DIO_79_sout_B_3_lv_in : out std_logic_vector(0 downto 0);
    DIO_79_sout_B_3_lv_out : in std_logic_vector(0 downto 0);
    DIO_79_sout_B_3_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_80_sout_B_6
    ---------------------------------------------------------------
    DIO_80_sout_B_6_lv_in : out std_logic_vector(0 downto 0);
    DIO_80_sout_B_6_lv_out : in std_logic_vector(0 downto 0);
    DIO_80_sout_B_6_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_81_P_PortB_2
    ---------------------------------------------------------------
    DIO_81_P_PortB_2_lv_in : out std_logic_vector(0 downto 0);
    DIO_81_P_PortB_2_lv_out : in std_logic_vector(0 downto 0);
    DIO_81_P_PortB_2_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_81_N_DVAL_ABC
    ---------------------------------------------------------------
    DIO_81_N_DVAL_ABC_lv_in : out std_logic_vector(0 downto 0);
    DIO_81_N_DVAL_ABC_lv_out : in std_logic_vector(0 downto 0);
    DIO_81_N_DVAL_ABC_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_82_write_ctr_B
    ---------------------------------------------------------------
    DIO_82_write_ctr_B_lv_in : out std_logic_vector(0 downto 0);
    DIO_82_write_ctr_B_lv_out : in std_logic_vector(0 downto 0);
    DIO_82_write_ctr_B_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_83_sout_B_5
    ---------------------------------------------------------------
    DIO_83_sout_B_5_lv_in : out std_logic_vector(0 downto 0);
    DIO_83_sout_B_5_lv_out : in std_logic_vector(0 downto 0);
    DIO_83_sout_B_5_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_84_P_PortB_1
    ---------------------------------------------------------------
    DIO_84_P_PortB_1_lv_in : out std_logic_vector(0 downto 0);
    DIO_84_P_PortB_1_lv_out : in std_logic_vector(0 downto 0);
    DIO_84_P_PortB_1_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_84_N_PortB_0
    ---------------------------------------------------------------
    DIO_84_N_PortB_0_lv_in : out std_logic_vector(0 downto 0);
    DIO_84_N_PortB_0_lv_out : in std_logic_vector(0 downto 0);
    DIO_84_N_PortB_0_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_85_sout_B_1
    ---------------------------------------------------------------
    DIO_85_sout_B_1_lv_in : out std_logic_vector(0 downto 0);
    DIO_85_sout_B_1_lv_out : in std_logic_vector(0 downto 0);
    DIO_85_sout_B_1_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_86_sout_B_7
    ---------------------------------------------------------------
    DIO_86_sout_B_7_lv_in : out std_logic_vector(0 downto 0);
    DIO_86_sout_B_7_lv_out : in std_logic_vector(0 downto 0);
    DIO_86_sout_B_7_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_87_P_PortA_7
    ---------------------------------------------------------------
    DIO_87_P_PortA_7_lv_in : out std_logic_vector(0 downto 0);
    DIO_87_P_PortA_7_lv_out : in std_logic_vector(0 downto 0);
    DIO_87_P_PortA_7_lv_enable : in std_logic_vector(0 downto 0);


    ---------------------------------------------------------------
    --LabVIEW Port: DIO_87_N_PortA_5
    ---------------------------------------------------------------
    DIO_87_N_PortA_5_lv_in : out std_logic_vector(0 downto 0);
    DIO_87_N_PortA_5_lv_out : in std_logic_vector(0 downto 0);
    DIO_87_N_PortA_5_lv_enable : in std_logic_vector(0 downto 0);


    aReset : in std_logic;
    aDio : inout std_logic_vector(87 downto 0);
    aDio_n : inout std_logic_vector(87 downto 16);

    --connect these to pins for CAN ports
    CAN0_rx : out std_logic;
    CAN0_tx : in std_logic;
    CAN0_rs : in std_logic;
    CAN1_rx : out std_logic;
    CAN1_tx : in std_logic;
    CAN1_rs : in std_logic;

    --common clocks
    EnetClk125 : in std_logic;
    SerialClk : in std_logic;

    --zynq's ethernet1 MAC
    GBE1_GMII_COL : out std_logic;
    GBE1_GMII_CRS : out std_logic;
    GBE1_GMII_RX_CLK : out std_logic;
    GBE1_GMII_RX_DV : out std_logic;
    GBE1_GMII_RX_ER : out std_logic;
    GBE1_GMII_RX_D : out std_logic_vector(7 downto 0);
    GBE1_GMII_TX_CLK : out std_logic;
    GBE1_GMII_TX_EN : in std_logic;
    GBE1_GMII_TX_ER : in std_logic;
    GBE1_GMII_TX_D : in std_logic_vector(7 downto 0);
    GBE1_MDC : in std_logic;
    GBE1_MDIO_In : out std_logic;
    GBE1_MDIO_Out : in std_logic;
    GBE1_MDIO_Enable : in std_logic;
    aEth1AtGigabit_n : in std_logic;
    aEth1At10Mb_n : in std_logic;
    GBE1_IRQ : out std_logic;

    --connect this to soft serial components
    sSerialRegPortIn : in std_logic_vector(100 downto 0);
    sSerialRegPortOut : out std_logic_vector(64 downto 0);

    --the modem lines from Serial1, connect to pins if desired
    aSerial1Dtr_n : in std_logic;
    aSerial1Rts_n : in std_logic;
    aSerial1Cts_n : out std_logic;
    aSerial1Dsr_n : out std_logic;
    aSerial1Ri_n : out std_logic;
    aSerial1Dcd_n : out std_logic;
    aSerial2Irq : out std_logic;
    aSerial3Irq : out std_logic;
    aSerial4Irq : out std_logic;
    aSerial5Irq : out std_logic;
    aSerial6Irq : out std_logic

  );

end UFXC_Controller_PreFinal_PullingDown_NotExportedCLK;

architecture RTL of UFXC_Controller_PreFinal_PullingDown_NotExportedCLK is

  signal sSerial2RegPortOut, sSerial3RegPortOut, sSerial4RegPortOut, sSerial5RegPortOut, sSerial6RegPortOut : RegPortOut_t;

  ---------------------------------------------------------------
  -- Eth2 Signals
  ---------------------------------------------------------------
  signal eEth1AtMegabit, eEth1AtGigabit, eEth1At10Megabit : std_logic;
  signal aDiffData, aDiffDataTristate, aDiffData_p, aDiffData_n : std_logic_vector(9 downto 0);
  signal EnetClk125TxFb,EnetClkRxFb : std_logic;
  signal Eth2GmiiTxClkDly : std_logic;
  signal Eth2GmiiRxClk, Eth2GmiiRxClk_bufg, Eth2GmiiRxClk_bufio : std_logic;
  signal Eth2GmiiRxd, Eth2GmiiRxdDly : std_logic_vector(7 downto 0);
  signal Eth2GmiiRxEr, Eth2GmiiRxErDly : std_logic;
  signal Eth2GmiiRxDv, Eth2GmiiRxDvDly : std_logic;
   -- Using dont_touch to prevent Vivado from inserting a BUFG after the PLL that
  -- used to delay TxClk. Vivado doesn't reliable insert the BUFG (based on
  -- resource usage) and can lead to timing violations. Another option is to
  -- explicitly instantiate a BUFG and compensate the PLL phase.
  attribute dont_touch : string;
  attribute dont_touch of Eth2GmiiTxClkDly : signal is "true";

  ---------------------------------------------------------------
  -- I/O Signals
  ---------------------------------------------------------------
  signal aDio_in : std_logic_vector(87 downto 0);
  signal aDio_out : std_logic_vector(87 downto 0);
  signal aDio_enable : std_logic_vector(87 downto 0);
  signal aDio_n_in : std_logic_vector(87 downto 16);
  signal aDio_n_out : std_logic_vector(87 downto 16);
  signal aDio_n_enable : std_logic_vector(87 downto 16);


  -- Negated signals of aDio_enable and aDio_n_enable for VSIM compliance  
  signal aDio_enable_n : std_logic_vector(87 downto 0);
  signal aDio_n_enable_n : std_logic_vector(87 downto 16);

  -- Forcing input buffers on PUDC configuration pin to prevent glitching
  signal aFpgaPudcInternal : std_logic;
  attribute dont_touch of aFpgaPudcInternal : signal is "true";

begin

  aFpgaPudcInternal <= aDio_in(35);

  aDio_enable_n <= not aDio_enable;
  aDio_n_enable_n <= not aDio_n_enable;

  sSerialRegPortOut <= AxiRegPortToSlv(sSerial2RegPortOut or sSerial3RegPortOut or sSerial4RegPortOut or sSerial5RegPortOut or sSerial6RegPortOut);

  ---------------------------------------------------------------
  --LabVIEW Port: DIO_16_P_FVAL_DEFGHI
  ---------------------------------------------------------------
  aDio_out(16) <= DIO_16_P_FVAL_DEFGHI_lv_out(0);
  aDio_enable(16) <= DIO_16_P_FVAL_DEFGHI_lv_enable(0);
  DIO_16_P_FVAL_DEFGHI_lv_in(0) <= aDio_in(16);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_16_N_PortH_4
  ---------------------------------------------------------------
  aDio_n_out(16) <= DIO_16_N_PortH_4_lv_out(0);
  aDio_n_enable(16) <= DIO_16_N_PortH_4_lv_enable(0);
  DIO_16_N_PortH_4_lv_in(0) <= aDio_n_in(16);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_17_P_PortH_6
  ---------------------------------------------------------------
  aDio_out(17) <= DIO_17_P_PortH_6_lv_out(0);
  aDio_enable(17) <= DIO_17_P_PortH_6_lv_enable(0);
  DIO_17_P_PortH_6_lv_in(0) <= aDio_in(17);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_17_N_PortH_0
  ---------------------------------------------------------------
  aDio_n_out(17) <= DIO_17_N_PortH_0_lv_out(0);
  aDio_n_enable(17) <= DIO_17_N_PortH_0_lv_enable(0);
  DIO_17_N_PortH_0_lv_in(0) <= aDio_n_in(17);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_18_P_DVAL_DEF
  ---------------------------------------------------------------
  aDio_out(18) <= DIO_18_P_DVAL_DEF_lv_out(0);
  aDio_enable(18) <= DIO_18_P_DVAL_DEF_lv_enable(0);
  DIO_18_P_DVAL_DEF_lv_in(0) <= aDio_in(18);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_18_N_STROBE_DEF
  ---------------------------------------------------------------
  aDio_n_out(18) <= DIO_18_N_STROBE_DEF_lv_out(0);
  aDio_n_enable(18) <= DIO_18_N_STROBE_DEF_lv_enable(0);
  DIO_18_N_STROBE_DEF_lv_in(0) <= aDio_n_in(18);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_19_P_STROBE_GH
  ---------------------------------------------------------------
  aDio_out(19) <= DIO_19_P_STROBE_GH_lv_out(0);
  aDio_enable(19) <= DIO_19_P_STROBE_GH_lv_enable(0);
  DIO_19_P_STROBE_GH_lv_in(0) <= aDio_in(19);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_19_N_DVAL_GH
  ---------------------------------------------------------------
  aDio_n_out(19) <= DIO_19_N_DVAL_GH_lv_out(0);
  aDio_n_enable(19) <= DIO_19_N_DVAL_GH_lv_enable(0);
  DIO_19_N_DVAL_GH_lv_in(0) <= aDio_n_in(19);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_20_P_PortH_7
  ---------------------------------------------------------------
  aDio_out(20) <= DIO_20_P_PortH_7_lv_out(0);
  aDio_enable(20) <= DIO_20_P_PortH_7_lv_enable(0);
  DIO_20_P_PortH_7_lv_in(0) <= aDio_in(20);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_20_N_PortH_3
  ---------------------------------------------------------------
  aDio_n_out(20) <= DIO_20_N_PortH_3_lv_out(0);
  aDio_n_enable(20) <= DIO_20_N_PortH_3_lv_enable(0);
  DIO_20_N_PortH_3_lv_in(0) <= aDio_n_in(20);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_21_P_PortG_7
  ---------------------------------------------------------------
  aDio_out(21) <= DIO_21_P_PortG_7_lv_out(0);
  aDio_enable(21) <= DIO_21_P_PortG_7_lv_enable(0);
  DIO_21_P_PortG_7_lv_in(0) <= aDio_in(21);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_21_N_PortG_5
  ---------------------------------------------------------------
  aDio_n_out(21) <= DIO_21_N_PortG_5_lv_out(0);
  aDio_n_enable(21) <= DIO_21_N_PortG_5_lv_enable(0);
  DIO_21_N_PortG_5_lv_in(0) <= aDio_n_in(21);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_22_P_LVAL_GH
  ---------------------------------------------------------------
  aDio_out(22) <= DIO_22_P_LVAL_GH_lv_out(0);
  aDio_enable(22) <= DIO_22_P_LVAL_GH_lv_enable(0);
  DIO_22_P_LVAL_GH_lv_in(0) <= aDio_in(22);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_22_N_PortH_5
  ---------------------------------------------------------------
  aDio_n_out(22) <= DIO_22_N_PortH_5_lv_out(0);
  aDio_n_enable(22) <= DIO_22_N_PortH_5_lv_enable(0);
  DIO_22_N_PortH_5_lv_in(0) <= aDio_n_in(22);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_23_P_PortH_2
  ---------------------------------------------------------------
  aDio_out(23) <= DIO_23_P_PortH_2_lv_out(0);
  aDio_enable(23) <= DIO_23_P_PortH_2_lv_enable(0);
  DIO_23_P_PortH_2_lv_in(0) <= aDio_in(23);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_23_N_PortH_1
  ---------------------------------------------------------------
  aDio_n_out(23) <= DIO_23_N_PortH_1_lv_out(0);
  aDio_n_enable(23) <= DIO_23_N_PortH_1_lv_enable(0);
  DIO_23_N_PortH_1_lv_in(0) <= aDio_n_in(23);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_24_P_PortG_3
  ---------------------------------------------------------------
  aDio_out(24) <= DIO_24_P_PortG_3_lv_out(0);
  aDio_enable(24) <= DIO_24_P_PortG_3_lv_enable(0);
  DIO_24_P_PortG_3_lv_in(0) <= aDio_in(24);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_24_N_PortG_4
  ---------------------------------------------------------------
  aDio_n_out(24) <= DIO_24_N_PortG_4_lv_out(0);
  aDio_n_enable(24) <= DIO_24_N_PortG_4_lv_enable(0);
  DIO_24_N_PortG_4_lv_in(0) <= aDio_n_in(24);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_25_clk_A
  ---------------------------------------------------------------
  aDio_out(25) <= DIO_25_clk_A_lv_out(0);
  aDio_enable(25) <= DIO_25_clk_A_lv_enable(0);
  DIO_25_clk_A_lv_in(0) <= aDio_in(25);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_26_strobe_A
  ---------------------------------------------------------------
  aDio_out(26) <= DIO_26_strobe_A_lv_out(0);
  aDio_enable(26) <= DIO_26_strobe_A_lv_enable(0);
  DIO_26_strobe_A_lv_in(0) <= aDio_in(26);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_27_P_PortG_0
  ---------------------------------------------------------------
  aDio_out(27) <= DIO_27_P_PortG_0_lv_out(0);
  aDio_enable(27) <= DIO_27_P_PortG_0_lv_enable(0);
  DIO_27_P_PortG_0_lv_in(0) <= aDio_in(27);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_27_N_PortG_6
  ---------------------------------------------------------------
  aDio_n_out(27) <= DIO_27_N_PortG_6_lv_out(0);
  aDio_n_enable(27) <= DIO_27_N_PortG_6_lv_enable(0);
  DIO_27_N_PortG_6_lv_in(0) <= aDio_n_in(27);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_28_P_PortG_2
  ---------------------------------------------------------------
  aDio_out(28) <= DIO_28_P_PortG_2_lv_out(0);
  aDio_enable(28) <= DIO_28_P_PortG_2_lv_enable(0);
  DIO_28_P_PortG_2_lv_in(0) <= aDio_in(28);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_28_N_PortG_1
  ---------------------------------------------------------------
  aDio_n_out(28) <= DIO_28_N_PortG_1_lv_out(0);
  aDio_n_enable(28) <= DIO_28_N_PortG_1_lv_enable(0);
  DIO_28_N_PortG_1_lv_in(0) <= aDio_n_in(28);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_29_sin_A
  ---------------------------------------------------------------
  aDio_out(29) <= DIO_29_sin_A_lv_out(0);
  aDio_enable(29) <= DIO_29_sin_A_lv_enable(0);
  DIO_29_sin_A_lv_in(0) <= aDio_in(29);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_30_sout_A_0
  ---------------------------------------------------------------
  aDio_out(30) <= DIO_30_sout_A_0_lv_out(0);
  aDio_enable(30) <= DIO_30_sout_A_0_lv_enable(0);
  DIO_30_sout_A_0_lv_in(0) <= aDio_in(30);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_31_sout_A_2
  ---------------------------------------------------------------
  aDio_out(31) <= DIO_31_sout_A_2_lv_out(0);
  aDio_enable(31) <= DIO_31_sout_A_2_lv_enable(0);
  DIO_31_sout_A_2_lv_in(0) <= aDio_in(31);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_32_P_LED_1
  ---------------------------------------------------------------
  aDio_out(32) <= DIO_32_P_LED_1_lv_out(0);
  aDio_enable(32) <= DIO_32_P_LED_1_lv_enable(0);
  DIO_32_P_LED_1_lv_in(0) <= aDio_in(32);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_32_N_LED_2
  ---------------------------------------------------------------
  aDio_n_out(32) <= DIO_32_N_LED_2_lv_out(0);
  aDio_n_enable(32) <= DIO_32_N_LED_2_lv_enable(0);
  DIO_32_N_LED_2_lv_in(0) <= aDio_n_in(32);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_34_shift_A
  ---------------------------------------------------------------
  aDio_out(34) <= DIO_34_shift_A_lv_out(0);
  aDio_enable(34) <= DIO_34_shift_A_lv_enable(0);
  DIO_34_shift_A_lv_in(0) <= aDio_in(34);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_35_sout_A_4
  ---------------------------------------------------------------
  aDio_out(35) <= DIO_35_sout_A_4_lv_out(0);
  aDio_enable(35) <= DIO_35_sout_A_4_lv_enable(0);
  DIO_35_sout_A_4_lv_in(0) <= aDio_in(35);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_36_P_PUSH_BUTTON_2
  ---------------------------------------------------------------
  aDio_out(36) <= DIO_36_P_PUSH_BUTTON_2_lv_out(0);
  aDio_enable(36) <= DIO_36_P_PUSH_BUTTON_2_lv_enable(0);
  DIO_36_P_PUSH_BUTTON_2_lv_in(0) <= aDio_in(36);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_36_N_PUSH_BUTTON_1
  ---------------------------------------------------------------
  aDio_n_out(36) <= DIO_36_N_PUSH_BUTTON_1_lv_out(0);
  aDio_n_enable(36) <= DIO_36_N_PUSH_BUTTON_1_lv_enable(0);
  DIO_36_N_PUSH_BUTTON_1_lv_in(0) <= aDio_n_in(36);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_38_write_ctr_A
  ---------------------------------------------------------------
  aDio_out(38) <= DIO_38_write_ctr_A_lv_out(0);
  aDio_enable(38) <= DIO_38_write_ctr_A_lv_enable(0);
  DIO_38_write_ctr_A_lv_in(0) <= aDio_in(38);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_39_pclk_A
  ---------------------------------------------------------------
  aDio_out(39) <= DIO_39_pclk_A_lv_out(0);
  aDio_enable(39) <= DIO_39_pclk_A_lv_enable(0);
  DIO_39_pclk_A_lv_in(0) <= aDio_in(39);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_40_P_PortF_4
  ---------------------------------------------------------------
  aDio_out(40) <= DIO_40_P_PortF_4_lv_out(0);
  aDio_enable(40) <= DIO_40_P_PortF_4_lv_enable(0);
  DIO_40_P_PortF_4_lv_in(0) <= aDio_in(40);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_40_N_PortF_1
  ---------------------------------------------------------------
  aDio_n_out(40) <= DIO_40_N_PortF_1_lv_out(0);
  aDio_n_enable(40) <= DIO_40_N_PortF_1_lv_enable(0);
  DIO_40_N_PortF_1_lv_in(0) <= aDio_n_in(40);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_41_P_PortE_5
  ---------------------------------------------------------------
  aDio_out(41) <= DIO_41_P_PortE_5_lv_out(0);
  aDio_enable(41) <= DIO_41_P_PortE_5_lv_enable(0);
  DIO_41_P_PortE_5_lv_in(0) <= aDio_in(41);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_41_N_PortE_7
  ---------------------------------------------------------------
  aDio_n_out(41) <= DIO_41_N_PortE_7_lv_out(0);
  aDio_n_enable(41) <= DIO_41_N_PortE_7_lv_enable(0);
  DIO_41_N_PortE_7_lv_in(0) <= aDio_n_in(41);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_42_P_PortE_1
  ---------------------------------------------------------------
  aDio_out(42) <= DIO_42_P_PortE_1_lv_out(0);
  aDio_enable(42) <= DIO_42_P_PortE_1_lv_enable(0);
  DIO_42_P_PortE_1_lv_in(0) <= aDio_in(42);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_42_N_PortE_0
  ---------------------------------------------------------------
  aDio_n_out(42) <= DIO_42_N_PortE_0_lv_out(0);
  aDio_n_enable(42) <= DIO_42_N_PortE_0_lv_enable(0);
  DIO_42_N_PortE_0_lv_in(0) <= aDio_n_in(42);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_43_P_PortF_5
  ---------------------------------------------------------------
  aDio_out(43) <= DIO_43_P_PortF_5_lv_out(0);
  aDio_enable(43) <= DIO_43_P_PortF_5_lv_enable(0);
  DIO_43_P_PortF_5_lv_in(0) <= aDio_in(43);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_43_N_LVAL_DEF
  ---------------------------------------------------------------
  aDio_n_out(43) <= DIO_43_N_LVAL_DEF_lv_out(0);
  aDio_n_enable(43) <= DIO_43_N_LVAL_DEF_lv_enable(0);
  DIO_43_N_LVAL_DEF_lv_in(0) <= aDio_n_in(43);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_44_P_PortF_0
  ---------------------------------------------------------------
  aDio_out(44) <= DIO_44_P_PortF_0_lv_out(0);
  aDio_enable(44) <= DIO_44_P_PortF_0_lv_enable(0);
  DIO_44_P_PortF_0_lv_in(0) <= aDio_in(44);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_44_N_PortF_7
  ---------------------------------------------------------------
  aDio_n_out(44) <= DIO_44_N_PortF_7_lv_out(0);
  aDio_n_enable(44) <= DIO_44_N_PortF_7_lv_enable(0);
  DIO_44_N_PortF_7_lv_in(0) <= aDio_n_in(44);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_45_P_PortE_2
  ---------------------------------------------------------------
  aDio_out(45) <= DIO_45_P_PortE_2_lv_out(0);
  aDio_enable(45) <= DIO_45_P_PortE_2_lv_enable(0);
  DIO_45_P_PortE_2_lv_in(0) <= aDio_in(45);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_45_N_PortE_6
  ---------------------------------------------------------------
  aDio_n_out(45) <= DIO_45_N_PortE_6_lv_out(0);
  aDio_n_enable(45) <= DIO_45_N_PortE_6_lv_enable(0);
  DIO_45_N_PortE_6_lv_in(0) <= aDio_n_in(45);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_46_P_PortD_7
  ---------------------------------------------------------------
  aDio_out(46) <= DIO_46_P_PortD_7_lv_out(0);
  aDio_enable(46) <= DIO_46_P_PortD_7_lv_enable(0);
  DIO_46_P_PortD_7_lv_in(0) <= aDio_in(46);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_46_N_PortD_5
  ---------------------------------------------------------------
  aDio_n_out(46) <= DIO_46_N_PortD_5_lv_out(0);
  aDio_n_enable(46) <= DIO_46_N_PortD_5_lv_enable(0);
  DIO_46_N_PortD_5_lv_in(0) <= aDio_n_in(46);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_47_P_PortF_3
  ---------------------------------------------------------------
  aDio_out(47) <= DIO_47_P_PortF_3_lv_out(0);
  aDio_enable(47) <= DIO_47_P_PortF_3_lv_enable(0);
  DIO_47_P_PortF_3_lv_in(0) <= aDio_in(47);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_47_N_PortF_6
  ---------------------------------------------------------------
  aDio_n_out(47) <= DIO_47_N_PortF_6_lv_out(0);
  aDio_n_enable(47) <= DIO_47_N_PortF_6_lv_enable(0);
  DIO_47_N_PortF_6_lv_in(0) <= aDio_n_in(47);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_48_P_PortE_4
  ---------------------------------------------------------------
  aDio_out(48) <= DIO_48_P_PortE_4_lv_out(0);
  aDio_enable(48) <= DIO_48_P_PortE_4_lv_enable(0);
  DIO_48_P_PortE_4_lv_in(0) <= aDio_in(48);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_48_N_PortE_3
  ---------------------------------------------------------------
  aDio_n_out(48) <= DIO_48_N_PortE_3_lv_out(0);
  aDio_n_enable(48) <= DIO_48_N_PortE_3_lv_enable(0);
  DIO_48_N_PortE_3_lv_in(0) <= aDio_n_in(48);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_49_P_PortD_2
  ---------------------------------------------------------------
  aDio_out(49) <= DIO_49_P_PortD_2_lv_out(0);
  aDio_enable(49) <= DIO_49_P_PortD_2_lv_enable(0);
  DIO_49_P_PortD_2_lv_in(0) <= aDio_in(49);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_49_N_PortD_3
  ---------------------------------------------------------------
  aDio_n_out(49) <= DIO_49_N_PortD_3_lv_out(0);
  aDio_n_enable(49) <= DIO_49_N_PortD_3_lv_enable(0);
  DIO_49_N_PortD_3_lv_in(0) <= aDio_n_in(49);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_50_P_PortD_6
  ---------------------------------------------------------------
  aDio_out(50) <= DIO_50_P_PortD_6_lv_out(0);
  aDio_enable(50) <= DIO_50_P_PortD_6_lv_enable(0);
  DIO_50_P_PortD_6_lv_in(0) <= aDio_in(50);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_50_N_PortF_2
  ---------------------------------------------------------------
  aDio_n_out(50) <= DIO_50_N_PortF_2_lv_out(0);
  aDio_n_enable(50) <= DIO_50_N_PortF_2_lv_enable(0);
  DIO_50_N_PortF_2_lv_in(0) <= aDio_n_in(50);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_51_P_PortD_1
  ---------------------------------------------------------------
  aDio_out(51) <= DIO_51_P_PortD_1_lv_out(0);
  aDio_enable(51) <= DIO_51_P_PortD_1_lv_enable(0);
  DIO_51_P_PortD_1_lv_in(0) <= aDio_in(51);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_51_N_PortD_0
  ---------------------------------------------------------------
  aDio_n_out(51) <= DIO_51_N_PortD_0_lv_out(0);
  aDio_n_enable(51) <= DIO_51_N_PortD_0_lv_enable(0);
  DIO_51_N_PortD_0_lv_in(0) <= aDio_n_in(51);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_52_N_PortD_4
  ---------------------------------------------------------------
  aDio_n_out(52) <= DIO_52_N_PortD_4_lv_out(0);
  aDio_n_enable(52) <= DIO_52_N_PortD_4_lv_enable(0);
  DIO_52_N_PortD_4_lv_in(0) <= aDio_n_in(52);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_53_sout_A_6
  ---------------------------------------------------------------
  aDio_out(53) <= DIO_53_sout_A_6_lv_out(0);
  aDio_enable(53) <= DIO_53_sout_A_6_lv_enable(0);
  DIO_53_sout_A_6_lv_in(0) <= aDio_in(53);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_54_sin_B
  ---------------------------------------------------------------
  aDio_out(54) <= DIO_54_sin_B_lv_out(0);
  aDio_enable(54) <= DIO_54_sin_B_lv_enable(0);
  DIO_54_sin_B_lv_in(0) <= aDio_in(54);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_55_sout_B_0
  ---------------------------------------------------------------
  aDio_out(55) <= DIO_55_sout_B_0_lv_out(0);
  aDio_enable(55) <= DIO_55_sout_B_0_lv_enable(0);
  DIO_55_sout_B_0_lv_in(0) <= aDio_in(55);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_56_clk_B
  ---------------------------------------------------------------
  aDio_out(56) <= DIO_56_clk_B_lv_out(0);
  aDio_enable(56) <= DIO_56_clk_B_lv_enable(0);
  DIO_56_clk_B_lv_in(0) <= aDio_in(56);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_57_strobe_B
  ---------------------------------------------------------------
  aDio_out(57) <= DIO_57_strobe_B_lv_out(0);
  aDio_enable(57) <= DIO_57_strobe_B_lv_enable(0);
  DIO_57_strobe_B_lv_in(0) <= aDio_in(57);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_58_shift_B
  ---------------------------------------------------------------
  aDio_out(58) <= DIO_58_shift_B_lv_out(0);
  aDio_enable(58) <= DIO_58_shift_B_lv_enable(0);
  DIO_58_shift_B_lv_in(0) <= aDio_in(58);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_59_sout_A_1
  ---------------------------------------------------------------
  aDio_out(59) <= DIO_59_sout_A_1_lv_out(0);
  aDio_enable(59) <= DIO_59_sout_A_1_lv_enable(0);
  DIO_59_sout_A_1_lv_in(0) <= aDio_in(59);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_60_sout_A_5
  ---------------------------------------------------------------
  aDio_out(60) <= DIO_60_sout_A_5_lv_out(0);
  aDio_enable(60) <= DIO_60_sout_A_5_lv_enable(0);
  DIO_60_sout_A_5_lv_in(0) <= aDio_in(60);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_61_pclk_B
  ---------------------------------------------------------------
  aDio_out(61) <= DIO_61_pclk_B_lv_out(0);
  aDio_enable(61) <= DIO_61_pclk_B_lv_enable(0);
  DIO_61_pclk_B_lv_in(0) <= aDio_in(61);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_62_sout_A_3
  ---------------------------------------------------------------
  aDio_out(62) <= DIO_62_sout_A_3_lv_out(0);
  aDio_enable(62) <= DIO_62_sout_A_3_lv_enable(0);
  DIO_62_sout_A_3_lv_in(0) <= aDio_in(62);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_63_sout_A_7
  ---------------------------------------------------------------
  aDio_out(63) <= DIO_63_sout_A_7_lv_out(0);
  aDio_enable(63) <= DIO_63_sout_A_7_lv_enable(0);
  DIO_63_sout_A_7_lv_in(0) <= aDio_in(63);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_64_N_FVAL_ABC
  ---------------------------------------------------------------
  aDio_n_out(64) <= DIO_64_N_FVAL_ABC_lv_out(0);
  aDio_n_enable(64) <= DIO_64_N_FVAL_ABC_lv_enable(0);
  DIO_64_N_FVAL_ABC_lv_in(0) <= aDio_n_in(64);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_65_P_PortC_2
  ---------------------------------------------------------------
  aDio_out(65) <= DIO_65_P_PortC_2_lv_out(0);
  aDio_enable(65) <= DIO_65_P_PortC_2_lv_enable(0);
  DIO_65_P_PortC_2_lv_in(0) <= aDio_in(65);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_65_N_PortC_7
  ---------------------------------------------------------------
  aDio_n_out(65) <= DIO_65_N_PortC_7_lv_out(0);
  aDio_n_enable(65) <= DIO_65_N_PortC_7_lv_enable(0);
  DIO_65_N_PortC_7_lv_in(0) <= aDio_n_in(65);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_66_P_PortB_3
  ---------------------------------------------------------------
  aDio_out(66) <= DIO_66_P_PortB_3_lv_out(0);
  aDio_enable(66) <= DIO_66_P_PortB_3_lv_enable(0);
  DIO_66_P_PortB_3_lv_in(0) <= aDio_in(66);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_66_N_PortB_6
  ---------------------------------------------------------------
  aDio_n_out(66) <= DIO_66_N_PortB_6_lv_out(0);
  aDio_n_enable(66) <= DIO_66_N_PortB_6_lv_enable(0);
  DIO_66_N_PortB_6_lv_in(0) <= aDio_n_in(66);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_67_P_PortC_5
  ---------------------------------------------------------------
  aDio_out(67) <= DIO_67_P_PortC_5_lv_out(0);
  aDio_enable(67) <= DIO_67_P_PortC_5_lv_enable(0);
  DIO_67_P_PortC_5_lv_in(0) <= aDio_in(67);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_67_N_LVAL_ABC
  ---------------------------------------------------------------
  aDio_n_out(67) <= DIO_67_N_LVAL_ABC_lv_out(0);
  aDio_n_enable(67) <= DIO_67_N_LVAL_ABC_lv_enable(0);
  DIO_67_N_LVAL_ABC_lv_in(0) <= aDio_n_in(67);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_68_P_PortC_0
  ---------------------------------------------------------------
  aDio_out(68) <= DIO_68_P_PortC_0_lv_out(0);
  aDio_enable(68) <= DIO_68_P_PortC_0_lv_enable(0);
  DIO_68_P_PortC_0_lv_in(0) <= aDio_in(68);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_68_N_PortC_6
  ---------------------------------------------------------------
  aDio_n_out(68) <= DIO_68_N_PortC_6_lv_out(0);
  aDio_n_enable(68) <= DIO_68_N_PortC_6_lv_enable(0);
  DIO_68_N_PortC_6_lv_in(0) <= aDio_n_in(68);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_69_P_PortA_0
  ---------------------------------------------------------------
  aDio_out(69) <= DIO_69_P_PortA_0_lv_out(0);
  aDio_enable(69) <= DIO_69_P_PortA_0_lv_enable(0);
  DIO_69_P_PortA_0_lv_in(0) <= aDio_in(69);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_69_N_PortA_6
  ---------------------------------------------------------------
  aDio_n_out(69) <= DIO_69_N_PortA_6_lv_out(0);
  aDio_n_enable(69) <= DIO_69_N_PortA_6_lv_enable(0);
  DIO_69_N_PortA_6_lv_in(0) <= aDio_n_in(69);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_71_N_PortC_1
  ---------------------------------------------------------------
  aDio_n_out(71) <= DIO_71_N_PortC_1_lv_out(0);
  aDio_n_enable(71) <= DIO_71_N_PortC_1_lv_enable(0);
  DIO_71_N_PortC_1_lv_in(0) <= aDio_n_in(71);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_72_P_PortB_7
  ---------------------------------------------------------------
  aDio_out(72) <= DIO_72_P_PortB_7_lv_out(0);
  aDio_enable(72) <= DIO_72_P_PortB_7_lv_enable(0);
  DIO_72_P_PortB_7_lv_in(0) <= aDio_in(72);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_72_N_STROBE_ABC
  ---------------------------------------------------------------
  aDio_n_out(72) <= DIO_72_N_STROBE_ABC_lv_out(0);
  aDio_n_enable(72) <= DIO_72_N_STROBE_ABC_lv_enable(0);
  DIO_72_N_STROBE_ABC_lv_in(0) <= aDio_n_in(72);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_73_P_PortC_3
  ---------------------------------------------------------------
  aDio_out(73) <= DIO_73_P_PortC_3_lv_out(0);
  aDio_enable(73) <= DIO_73_P_PortC_3_lv_enable(0);
  DIO_73_P_PortC_3_lv_in(0) <= aDio_in(73);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_73_N_PortC_4
  ---------------------------------------------------------------
  aDio_n_out(73) <= DIO_73_N_PortC_4_lv_out(0);
  aDio_n_enable(73) <= DIO_73_N_PortC_4_lv_enable(0);
  DIO_73_N_PortC_4_lv_in(0) <= aDio_n_in(73);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_74_P_PortB_4
  ---------------------------------------------------------------
  aDio_out(74) <= DIO_74_P_PortB_4_lv_out(0);
  aDio_enable(74) <= DIO_74_P_PortB_4_lv_enable(0);
  DIO_74_P_PortB_4_lv_in(0) <= aDio_in(74);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_74_N_PortB_5
  ---------------------------------------------------------------
  aDio_n_out(74) <= DIO_74_N_PortB_5_lv_out(0);
  aDio_n_enable(74) <= DIO_74_N_PortB_5_lv_enable(0);
  DIO_74_N_PortB_5_lv_in(0) <= aDio_n_in(74);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_75_P_PortA_2
  ---------------------------------------------------------------
  aDio_out(75) <= DIO_75_P_PortA_2_lv_out(0);
  aDio_enable(75) <= DIO_75_P_PortA_2_lv_enable(0);
  DIO_75_P_PortA_2_lv_in(0) <= aDio_in(75);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_75_N_PortA_1
  ---------------------------------------------------------------
  aDio_n_out(75) <= DIO_75_N_PortA_1_lv_out(0);
  aDio_n_enable(75) <= DIO_75_N_PortA_1_lv_enable(0);
  DIO_75_N_PortA_1_lv_in(0) <= aDio_n_in(75);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_76_sout_B_2
  ---------------------------------------------------------------
  aDio_out(76) <= DIO_76_sout_B_2_lv_out(0);
  aDio_enable(76) <= DIO_76_sout_B_2_lv_enable(0);
  DIO_76_sout_B_2_lv_in(0) <= aDio_in(76);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_77_sout_B_4
  ---------------------------------------------------------------
  aDio_out(77) <= DIO_77_sout_B_4_lv_out(0);
  aDio_enable(77) <= DIO_77_sout_B_4_lv_enable(0);
  DIO_77_sout_B_4_lv_in(0) <= aDio_in(77);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_78_P_PortA_3
  ---------------------------------------------------------------
  aDio_out(78) <= DIO_78_P_PortA_3_lv_out(0);
  aDio_enable(78) <= DIO_78_P_PortA_3_lv_enable(0);
  DIO_78_P_PortA_3_lv_in(0) <= aDio_in(78);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_78_N_PortA_4
  ---------------------------------------------------------------
  aDio_n_out(78) <= DIO_78_N_PortA_4_lv_out(0);
  aDio_n_enable(78) <= DIO_78_N_PortA_4_lv_enable(0);
  DIO_78_N_PortA_4_lv_in(0) <= aDio_n_in(78);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_79_sout_B_3
  ---------------------------------------------------------------
  aDio_out(79) <= DIO_79_sout_B_3_lv_out(0);
  aDio_enable(79) <= DIO_79_sout_B_3_lv_enable(0);
  DIO_79_sout_B_3_lv_in(0) <= aDio_in(79);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_80_sout_B_6
  ---------------------------------------------------------------
  aDio_out(80) <= DIO_80_sout_B_6_lv_out(0);
  aDio_enable(80) <= DIO_80_sout_B_6_lv_enable(0);
  DIO_80_sout_B_6_lv_in(0) <= aDio_in(80);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_81_P_PortB_2
  ---------------------------------------------------------------
  aDio_out(81) <= DIO_81_P_PortB_2_lv_out(0);
  aDio_enable(81) <= DIO_81_P_PortB_2_lv_enable(0);
  DIO_81_P_PortB_2_lv_in(0) <= aDio_in(81);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_81_N_DVAL_ABC
  ---------------------------------------------------------------
  aDio_n_out(81) <= DIO_81_N_DVAL_ABC_lv_out(0);
  aDio_n_enable(81) <= DIO_81_N_DVAL_ABC_lv_enable(0);
  DIO_81_N_DVAL_ABC_lv_in(0) <= aDio_n_in(81);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_82_write_ctr_B
  ---------------------------------------------------------------
  aDio_out(82) <= DIO_82_write_ctr_B_lv_out(0);
  aDio_enable(82) <= DIO_82_write_ctr_B_lv_enable(0);
  DIO_82_write_ctr_B_lv_in(0) <= aDio_in(82);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_83_sout_B_5
  ---------------------------------------------------------------
  aDio_out(83) <= DIO_83_sout_B_5_lv_out(0);
  aDio_enable(83) <= DIO_83_sout_B_5_lv_enable(0);
  DIO_83_sout_B_5_lv_in(0) <= aDio_in(83);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_84_P_PortB_1
  ---------------------------------------------------------------
  aDio_out(84) <= DIO_84_P_PortB_1_lv_out(0);
  aDio_enable(84) <= DIO_84_P_PortB_1_lv_enable(0);
  DIO_84_P_PortB_1_lv_in(0) <= aDio_in(84);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_84_N_PortB_0
  ---------------------------------------------------------------
  aDio_n_out(84) <= DIO_84_N_PortB_0_lv_out(0);
  aDio_n_enable(84) <= DIO_84_N_PortB_0_lv_enable(0);
  DIO_84_N_PortB_0_lv_in(0) <= aDio_n_in(84);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_85_sout_B_1
  ---------------------------------------------------------------
  aDio_out(85) <= DIO_85_sout_B_1_lv_out(0);
  aDio_enable(85) <= DIO_85_sout_B_1_lv_enable(0);
  DIO_85_sout_B_1_lv_in(0) <= aDio_in(85);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_86_sout_B_7
  ---------------------------------------------------------------
  aDio_out(86) <= DIO_86_sout_B_7_lv_out(0);
  aDio_enable(86) <= DIO_86_sout_B_7_lv_enable(0);
  DIO_86_sout_B_7_lv_in(0) <= aDio_in(86);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_87_P_PortA_7
  ---------------------------------------------------------------
  aDio_out(87) <= DIO_87_P_PortA_7_lv_out(0);
  aDio_enable(87) <= DIO_87_P_PortA_7_lv_enable(0);
  DIO_87_P_PortA_7_lv_in(0) <= aDio_in(87);


  ---------------------------------------------------------------
  --LabVIEW Port: DIO_87_N_PortA_5
  ---------------------------------------------------------------
  aDio_n_out(87) <= DIO_87_N_PortA_5_lv_out(0);
  aDio_n_enable(87) <= DIO_87_N_PortA_5_lv_enable(0);
  DIO_87_N_PortA_5_lv_in(0) <= aDio_n_in(87);


  ---------------------------------------------------------------
  --Peripheral : CAN0
  ---------------------------------------------------------------
  CAN0_rx <= '0';



  ---------------------------------------------------------------
  --Peripheral : CAN1
  ---------------------------------------------------------------
  CAN1_rx <= '0';



  ---------------------------------------------------------------
  --Peripheral : Serial1
  ---------------------------------------------------------------
  aSerial1Cts_n <= '0';
  aSerial1Dsr_n <= '0';
  aSerial1Ri_n <= '1';
  aSerial1Dcd_n <= '0';



  ---------------------------------------------------------------
  --Peripheral : Eth2
  ---------------------------------------------------------------
  GBE1_IRQ <= '1';
  -- End Eth 1



  ---------------------------------------------------------------
  --Peripheral : Serial2
  ---------------------------------------------------------------
  sSerial2RegPortOut <= kRegPortOutZero;
  aSerial2Irq <= '0';



  ---------------------------------------------------------------
  --Peripheral : Serial3
  ---------------------------------------------------------------
  sSerial3RegPortOut <= kRegPortOutZero;
  aSerial3Irq <= '0';



  ---------------------------------------------------------------
  --Peripheral : Serial4
  ---------------------------------------------------------------
  sSerial4RegPortOut <= kRegPortOutZero;
  aSerial4Irq <= '0';



  ---------------------------------------------------------------
  --Peripheral : Serial5
  ---------------------------------------------------------------
  sSerial5RegPortOut <= kRegPortOutZero;
  aSerial5Irq <= '0';



  ---------------------------------------------------------------
  --Peripheral : Serial6
  ---------------------------------------------------------------
  sSerial6RegPortOut <= kRegPortOutZero;
  aSerial6Irq <= '0';



  ---------------------------------------------------------------
  --I/O Buffer: DIO_00
  ---------------------------------------------------------------
  IOBUF_0 : IOBUF
  port map (
    O  => aDio_in(0),
    IO => aDio(0),
    I  => aDio_out(0),
    T  => aDio_enable_n(0));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_01
  ---------------------------------------------------------------
  IOBUF_1 : IOBUF
  port map (
    O  => aDio_in(1),
    IO => aDio(1),
    I  => aDio_out(1),
    T  => aDio_enable_n(1));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_02
  ---------------------------------------------------------------
  IOBUF_2 : IOBUF
  port map (
    O  => aDio_in(2),
    IO => aDio(2),
    I  => aDio_out(2),
    T  => aDio_enable_n(2));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_03
  ---------------------------------------------------------------
  IOBUF_3 : IOBUF
  port map (
    O  => aDio_in(3),
    IO => aDio(3),
    I  => aDio_out(3),
    T  => aDio_enable_n(3));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_04
  ---------------------------------------------------------------
  IOBUF_4 : IOBUF
  port map (
    O  => aDio_in(4),
    IO => aDio(4),
    I  => aDio_out(4),
    T  => aDio_enable_n(4));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_05
  ---------------------------------------------------------------
  IOBUF_5 : IOBUF
  port map (
    O  => aDio_in(5),
    IO => aDio(5),
    I  => aDio_out(5),
    T  => aDio_enable_n(5));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_06
  ---------------------------------------------------------------
  IOBUF_6 : IOBUF
  port map (
    O  => aDio_in(6),
    IO => aDio(6),
    I  => aDio_out(6),
    T  => aDio_enable_n(6));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_07
  ---------------------------------------------------------------
  IOBUF_7 : IOBUF
  port map (
    O  => aDio_in(7),
    IO => aDio(7),
    I  => aDio_out(7),
    T  => aDio_enable_n(7));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_08
  ---------------------------------------------------------------
  IOBUF_8 : IOBUF
  port map (
    O  => aDio_in(8),
    IO => aDio(8),
    I  => aDio_out(8),
    T  => aDio_enable_n(8));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_09
  ---------------------------------------------------------------
  IOBUF_9 : IOBUF
  port map (
    O  => aDio_in(9),
    IO => aDio(9),
    I  => aDio_out(9),
    T  => aDio_enable_n(9));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_10
  ---------------------------------------------------------------
  IOBUF_10 : IOBUF
  port map (
    O  => aDio_in(10),
    IO => aDio(10),
    I  => aDio_out(10),
    T  => aDio_enable_n(10));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_11
  ---------------------------------------------------------------
  IOBUF_11 : IOBUF
  port map (
    O  => aDio_in(11),
    IO => aDio(11),
    I  => aDio_out(11),
    T  => aDio_enable_n(11));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_12
  ---------------------------------------------------------------
  IOBUF_12 : IOBUF
  port map (
    O  => aDio_in(12),
    IO => aDio(12),
    I  => aDio_out(12),
    T  => aDio_enable_n(12));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_13
  ---------------------------------------------------------------
  IOBUF_13 : IOBUF
  port map (
    O  => aDio_in(13),
    IO => aDio(13),
    I  => aDio_out(13),
    T  => aDio_enable_n(13));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_14
  ---------------------------------------------------------------
  IOBUF_14 : IOBUF
  port map (
    O  => aDio_in(14),
    IO => aDio(14),
    I  => aDio_out(14),
    T  => aDio_enable_n(14));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_15
  ---------------------------------------------------------------
  IOBUF_15 : IOBUF
  port map (
    O  => aDio_in(15),
    IO => aDio(15),
    I  => aDio_out(15),
    T  => aDio_enable_n(15));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_16
  ---------------------------------------------------------------
  IOBUF_16 : OBUFT
  port map (
    O  => aDio(16),
    I  => aDio_out(16),
    T  => aDio_enable_n(16));

  aDio_in(16) <= aDio_out(16);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_16_N
  ---------------------------------------------------------------
  IOBUF_16_N : OBUFT
  port map (
    O  => aDio_n(16),
    I  => aDio_n_out(16),
    T  => aDio_n_enable_n(16));

  aDio_n_in(16) <= aDio_n_out(16);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_17
  ---------------------------------------------------------------
  IOBUF_17 : OBUFT
  port map (
    O  => aDio(17),
    I  => aDio_out(17),
    T  => aDio_enable_n(17));

  aDio_in(17) <= aDio_out(17);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_17_N
  ---------------------------------------------------------------
  IOBUF_17_N : OBUFT
  port map (
    O  => aDio_n(17),
    I  => aDio_n_out(17),
    T  => aDio_n_enable_n(17));

  aDio_n_in(17) <= aDio_n_out(17);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_18
  ---------------------------------------------------------------
  IOBUF_18 : OBUFT
  port map (
    O  => aDio(18),
    I  => aDio_out(18),
    T  => aDio_enable_n(18));

  aDio_in(18) <= aDio_out(18);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_18_N
  ---------------------------------------------------------------
  IOBUF_18_N : OBUFT
  port map (
    O  => aDio_n(18),
    I  => aDio_n_out(18),
    T  => aDio_n_enable_n(18));

  aDio_n_in(18) <= aDio_n_out(18);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_19
  ---------------------------------------------------------------
  IOBUF_19 : OBUFT
  port map (
    O  => aDio(19),
    I  => aDio_out(19),
    T  => aDio_enable_n(19));

  aDio_in(19) <= aDio_out(19);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_19_N
  ---------------------------------------------------------------
  IOBUF_19_N : OBUFT
  port map (
    O  => aDio_n(19),
    I  => aDio_n_out(19),
    T  => aDio_n_enable_n(19));

  aDio_n_in(19) <= aDio_n_out(19);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_20
  ---------------------------------------------------------------
  IOBUF_20 : OBUFT
  port map (
    O  => aDio(20),
    I  => aDio_out(20),
    T  => aDio_enable_n(20));

  aDio_in(20) <= aDio_out(20);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_20_N
  ---------------------------------------------------------------
  IOBUF_20_N : OBUFT
  port map (
    O  => aDio_n(20),
    I  => aDio_n_out(20),
    T  => aDio_n_enable_n(20));

  aDio_n_in(20) <= aDio_n_out(20);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_21
  ---------------------------------------------------------------
  IOBUF_21 : OBUFT
  port map (
    O  => aDio(21),
    I  => aDio_out(21),
    T  => aDio_enable_n(21));

  aDio_in(21) <= aDio_out(21);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_21_N
  ---------------------------------------------------------------
  IOBUF_21_N : OBUFT
  port map (
    O  => aDio_n(21),
    I  => aDio_n_out(21),
    T  => aDio_n_enable_n(21));

  aDio_n_in(21) <= aDio_n_out(21);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_22
  ---------------------------------------------------------------
  IOBUF_22 : OBUFT
  port map (
    O  => aDio(22),
    I  => aDio_out(22),
    T  => aDio_enable_n(22));

  aDio_in(22) <= aDio_out(22);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_22_N
  ---------------------------------------------------------------
  IOBUF_22_N : OBUFT
  port map (
    O  => aDio_n(22),
    I  => aDio_n_out(22),
    T  => aDio_n_enable_n(22));

  aDio_n_in(22) <= aDio_n_out(22);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_23
  ---------------------------------------------------------------
  IOBUF_23 : OBUFT
  port map (
    O  => aDio(23),
    I  => aDio_out(23),
    T  => aDio_enable_n(23));

  aDio_in(23) <= aDio_out(23);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_23_N
  ---------------------------------------------------------------
  IOBUF_23_N : OBUFT
  port map (
    O  => aDio_n(23),
    I  => aDio_n_out(23),
    T  => aDio_n_enable_n(23));

  aDio_n_in(23) <= aDio_n_out(23);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_24
  ---------------------------------------------------------------
  IOBUF_24 : OBUFT
  port map (
    O  => aDio(24),
    I  => aDio_out(24),
    T  => aDio_enable_n(24));

  aDio_in(24) <= aDio_out(24);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_24_N
  ---------------------------------------------------------------
  IOBUF_24_N : OBUFT
  port map (
    O  => aDio_n(24),
    I  => aDio_n_out(24),
    T  => aDio_n_enable_n(24));

  aDio_n_in(24) <= aDio_n_out(24);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_25
  ---------------------------------------------------------------
  IOBUF_25 : OBUFTDS
  port map (
    O   => aDio(25),
    OB  => aDio_n(25),
    I   => aDio_out(25),
    T   => aDio_enable_n(25));

  aDio_in(25) <= aDio_out(25);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_26
  ---------------------------------------------------------------
  IOBUF_26 : OBUFTDS
  port map (
    O   => aDio(26),
    OB  => aDio_n(26),
    I   => aDio_out(26),
    T   => aDio_enable_n(26));

  aDio_in(26) <= aDio_out(26);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_27
  ---------------------------------------------------------------
  IOBUF_27 : OBUFT
  port map (
    O  => aDio(27),
    I  => aDio_out(27),
    T  => aDio_enable_n(27));

  aDio_in(27) <= aDio_out(27);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_27_N
  ---------------------------------------------------------------
  IOBUF_27_N : OBUFT
  port map (
    O  => aDio_n(27),
    I  => aDio_n_out(27),
    T  => aDio_n_enable_n(27));

  aDio_n_in(27) <= aDio_n_out(27);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_28
  ---------------------------------------------------------------
  IOBUF_28 : OBUFT
  port map (
    O  => aDio(28),
    I  => aDio_out(28),
    T  => aDio_enable_n(28));

  aDio_in(28) <= aDio_out(28);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_28_N
  ---------------------------------------------------------------
  IOBUF_28_N : OBUFT
  port map (
    O  => aDio_n(28),
    I  => aDio_n_out(28),
    T  => aDio_n_enable_n(28));

  aDio_n_in(28) <= aDio_n_out(28);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_29
  ---------------------------------------------------------------
  IOBUF_29 : OBUFTDS
  port map (
    O   => aDio(29),
    OB  => aDio_n(29),
    I   => aDio_out(29),
    T   => aDio_enable_n(29));

  aDio_in(29) <= aDio_out(29);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_30
  ---------------------------------------------------------------
  IOBUF_30 : IBUFDS
  port map (
    O   => aDio_in(30),
    I   => aDio(30),
    IB  => aDio_n(30));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_31
  ---------------------------------------------------------------
  IOBUF_31 : IBUFDS
  port map (
    O   => aDio_in(31),
    I   => aDio(31),
    IB  => aDio_n(31));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_32
  ---------------------------------------------------------------
  IOBUF_32 : OBUFT
  port map (
    O  => aDio(32),
    I  => aDio_out(32),
    T  => aDio_enable_n(32));

  aDio_in(32) <= aDio_out(32);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_32_N
  ---------------------------------------------------------------
  IOBUF_32_N : OBUFT
  port map (
    O  => aDio_n(32),
    I  => aDio_n_out(32),
    T  => aDio_n_enable_n(32));

  aDio_n_in(32) <= aDio_n_out(32);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_33
  ---------------------------------------------------------------
  IOBUF_33 : IOBUF
  port map (
    O  => aDio_in(33),
    IO => aDio(33),
    I  => aDio_out(33),
    T  => aDio_enable_n(33));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_33_N
  ---------------------------------------------------------------
  IOBUF_33_N : IOBUF
  port map (
    O  => aDio_n_in(33),
    IO => aDio_n(33),
    I  => aDio_n_out(33),
    T  => aDio_n_enable_n(33));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_34
  ---------------------------------------------------------------
  IOBUF_34 : OBUFTDS
  port map (
    O   => aDio(34),
    OB  => aDio_n(34),
    I   => aDio_out(34),
    T   => aDio_enable_n(34));

  aDio_in(34) <= aDio_out(34);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_35
  ---------------------------------------------------------------
  IOBUF_35 : IBUFDS
  port map (
    O   => aDio_in(35),
    I   => aDio(35),
    IB  => aDio_n(35));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_36
  ---------------------------------------------------------------
  IOBUF_36 : IBUF
  port map (
    O  => aDio_in(36),
    I  => aDio(36));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_36_N
  ---------------------------------------------------------------
  IOBUF_36_N : IBUF
  port map (
    O  => aDio_n_in(36),
    I  => aDio_n(36));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_37
  ---------------------------------------------------------------
  IOBUF_37 : IOBUF
  port map (
    O  => aDio_in(37),
    IO => aDio(37),
    I  => aDio_out(37),
    T  => aDio_enable_n(37));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_37_N
  ---------------------------------------------------------------
  IOBUF_37_N : IOBUF
  port map (
    O  => aDio_n_in(37),
    IO => aDio_n(37),
    I  => aDio_n_out(37),
    T  => aDio_n_enable_n(37));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_38
  ---------------------------------------------------------------
  IOBUF_38 : OBUFTDS
  port map (
    O   => aDio(38),
    OB  => aDio_n(38),
    I   => aDio_out(38),
    T   => aDio_enable_n(38));

  aDio_in(38) <= aDio_out(38);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_39
  ---------------------------------------------------------------
  IOBUF_39 : OBUFTDS
  port map (
    O   => aDio(39),
    OB  => aDio_n(39),
    I   => aDio_out(39),
    T   => aDio_enable_n(39));

  aDio_in(39) <= aDio_out(39);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_40
  ---------------------------------------------------------------
  IOBUF_40 : OBUFT
  port map (
    O  => aDio(40),
    I  => aDio_out(40),
    T  => aDio_enable_n(40));

  aDio_in(40) <= aDio_out(40);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_40_N
  ---------------------------------------------------------------
  IOBUF_40_N : OBUFT
  port map (
    O  => aDio_n(40),
    I  => aDio_n_out(40),
    T  => aDio_n_enable_n(40));

  aDio_n_in(40) <= aDio_n_out(40);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_41
  ---------------------------------------------------------------
  IOBUF_41 : OBUFT
  port map (
    O  => aDio(41),
    I  => aDio_out(41),
    T  => aDio_enable_n(41));

  aDio_in(41) <= aDio_out(41);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_41_N
  ---------------------------------------------------------------
  IOBUF_41_N : OBUFT
  port map (
    O  => aDio_n(41),
    I  => aDio_n_out(41),
    T  => aDio_n_enable_n(41));

  aDio_n_in(41) <= aDio_n_out(41);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_42
  ---------------------------------------------------------------
  IOBUF_42 : OBUFT
  port map (
    O  => aDio(42),
    I  => aDio_out(42),
    T  => aDio_enable_n(42));

  aDio_in(42) <= aDio_out(42);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_42_N
  ---------------------------------------------------------------
  IOBUF_42_N : OBUFT
  port map (
    O  => aDio_n(42),
    I  => aDio_n_out(42),
    T  => aDio_n_enable_n(42));

  aDio_n_in(42) <= aDio_n_out(42);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_43
  ---------------------------------------------------------------
  IOBUF_43 : OBUFT
  port map (
    O  => aDio(43),
    I  => aDio_out(43),
    T  => aDio_enable_n(43));

  aDio_in(43) <= aDio_out(43);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_43_N
  ---------------------------------------------------------------
  IOBUF_43_N : OBUFT
  port map (
    O  => aDio_n(43),
    I  => aDio_n_out(43),
    T  => aDio_n_enable_n(43));

  aDio_n_in(43) <= aDio_n_out(43);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_44
  ---------------------------------------------------------------
  IOBUF_44 : OBUFT
  port map (
    O  => aDio(44),
    I  => aDio_out(44),
    T  => aDio_enable_n(44));

  aDio_in(44) <= aDio_out(44);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_44_N
  ---------------------------------------------------------------
  IOBUF_44_N : OBUFT
  port map (
    O  => aDio_n(44),
    I  => aDio_n_out(44),
    T  => aDio_n_enable_n(44));

  aDio_n_in(44) <= aDio_n_out(44);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_45
  ---------------------------------------------------------------
  IOBUF_45 : OBUFT
  port map (
    O  => aDio(45),
    I  => aDio_out(45),
    T  => aDio_enable_n(45));

  aDio_in(45) <= aDio_out(45);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_45_N
  ---------------------------------------------------------------
  IOBUF_45_N : OBUFT
  port map (
    O  => aDio_n(45),
    I  => aDio_n_out(45),
    T  => aDio_n_enable_n(45));

  aDio_n_in(45) <= aDio_n_out(45);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_46
  ---------------------------------------------------------------
  IOBUF_46 : OBUFT
  port map (
    O  => aDio(46),
    I  => aDio_out(46),
    T  => aDio_enable_n(46));

  aDio_in(46) <= aDio_out(46);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_46_N
  ---------------------------------------------------------------
  IOBUF_46_N : OBUFT
  port map (
    O  => aDio_n(46),
    I  => aDio_n_out(46),
    T  => aDio_n_enable_n(46));

  aDio_n_in(46) <= aDio_n_out(46);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_47
  ---------------------------------------------------------------
  IOBUF_47 : OBUFT
  port map (
    O  => aDio(47),
    I  => aDio_out(47),
    T  => aDio_enable_n(47));

  aDio_in(47) <= aDio_out(47);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_47_N
  ---------------------------------------------------------------
  IOBUF_47_N : OBUFT
  port map (
    O  => aDio_n(47),
    I  => aDio_n_out(47),
    T  => aDio_n_enable_n(47));

  aDio_n_in(47) <= aDio_n_out(47);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_48
  ---------------------------------------------------------------
  IOBUF_48 : OBUFT
  port map (
    O  => aDio(48),
    I  => aDio_out(48),
    T  => aDio_enable_n(48));

  aDio_in(48) <= aDio_out(48);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_48_N
  ---------------------------------------------------------------
  IOBUF_48_N : OBUFT
  port map (
    O  => aDio_n(48),
    I  => aDio_n_out(48),
    T  => aDio_n_enable_n(48));

  aDio_n_in(48) <= aDio_n_out(48);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_49
  ---------------------------------------------------------------
  IOBUF_49 : OBUFT
  port map (
    O  => aDio(49),
    I  => aDio_out(49),
    T  => aDio_enable_n(49));

  aDio_in(49) <= aDio_out(49);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_49_N
  ---------------------------------------------------------------
  IOBUF_49_N : OBUFT
  port map (
    O  => aDio_n(49),
    I  => aDio_n_out(49),
    T  => aDio_n_enable_n(49));

  aDio_n_in(49) <= aDio_n_out(49);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_50
  ---------------------------------------------------------------
  IOBUF_50 : OBUFT
  port map (
    O  => aDio(50),
    I  => aDio_out(50),
    T  => aDio_enable_n(50));

  aDio_in(50) <= aDio_out(50);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_50_N
  ---------------------------------------------------------------
  IOBUF_50_N : OBUFT
  port map (
    O  => aDio_n(50),
    I  => aDio_n_out(50),
    T  => aDio_n_enable_n(50));

  aDio_n_in(50) <= aDio_n_out(50);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_51
  ---------------------------------------------------------------
  IOBUF_51 : OBUFT
  port map (
    O  => aDio(51),
    I  => aDio_out(51),
    T  => aDio_enable_n(51));

  aDio_in(51) <= aDio_out(51);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_51_N
  ---------------------------------------------------------------
  IOBUF_51_N : OBUFT
  port map (
    O  => aDio_n(51),
    I  => aDio_n_out(51),
    T  => aDio_n_enable_n(51));

  aDio_n_in(51) <= aDio_n_out(51);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_52
  ---------------------------------------------------------------
  IOBUF_52 : IOBUF
  port map (
    O  => aDio_in(52),
    IO => aDio(52),
    I  => aDio_out(52),
    T  => aDio_enable_n(52));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_52_N
  ---------------------------------------------------------------
  IOBUF_52_N : OBUFT
  port map (
    O  => aDio_n(52),
    I  => aDio_n_out(52),
    T  => aDio_n_enable_n(52));

  aDio_n_in(52) <= aDio_n_out(52);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_53
  ---------------------------------------------------------------
  IOBUF_53 : IBUFDS
  port map (
    O   => aDio_in(53),
    I   => aDio(53),
    IB  => aDio_n(53));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_54
  ---------------------------------------------------------------
  IOBUF_54 : OBUFTDS
  port map (
    O   => aDio(54),
    OB  => aDio_n(54),
    I   => aDio_out(54),
    T   => aDio_enable_n(54));

  aDio_in(54) <= aDio_out(54);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_55
  ---------------------------------------------------------------
  IOBUF_55 : IBUFDS
  port map (
    O   => aDio_in(55),
    I   => aDio(55),
    IB  => aDio_n(55));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_56
  ---------------------------------------------------------------
  IOBUF_56 : OBUFTDS
  port map (
    O   => aDio(56),
    OB  => aDio_n(56),
    I   => aDio_out(56),
    T   => aDio_enable_n(56));

  aDio_in(56) <= aDio_out(56);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_57
  ---------------------------------------------------------------
  IOBUF_57 : OBUFTDS
  port map (
    O   => aDio(57),
    OB  => aDio_n(57),
    I   => aDio_out(57),
    T   => aDio_enable_n(57));

  aDio_in(57) <= aDio_out(57);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_58
  ---------------------------------------------------------------
  IOBUF_58 : OBUFTDS
  port map (
    O   => aDio(58),
    OB  => aDio_n(58),
    I   => aDio_out(58),
    T   => aDio_enable_n(58));

  aDio_in(58) <= aDio_out(58);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_59
  ---------------------------------------------------------------
  IOBUF_59 : IBUFDS
  port map (
    O   => aDio_in(59),
    I   => aDio(59),
    IB  => aDio_n(59));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_60
  ---------------------------------------------------------------
  IOBUF_60 : IBUFDS
  port map (
    O   => aDio_in(60),
    I   => aDio(60),
    IB  => aDio_n(60));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_61
  ---------------------------------------------------------------
  IOBUF_61 : OBUFTDS
  port map (
    O   => aDio(61),
    OB  => aDio_n(61),
    I   => aDio_out(61),
    T   => aDio_enable_n(61));

  aDio_in(61) <= aDio_out(61);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_62
  ---------------------------------------------------------------
  IOBUF_62 : IBUFDS
  port map (
    O   => aDio_in(62),
    I   => aDio(62),
    IB  => aDio_n(62));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_63
  ---------------------------------------------------------------
  IOBUF_63 : IBUFDS
  port map (
    O   => aDio_in(63),
    I   => aDio(63),
    IB  => aDio_n(63));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_64
  ---------------------------------------------------------------
  IOBUF_64 : IOBUF
  port map (
    O  => aDio_in(64),
    IO => aDio(64),
    I  => aDio_out(64),
    T  => aDio_enable_n(64));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_64_N
  ---------------------------------------------------------------
  IOBUF_64_N : OBUFT
  port map (
    O  => aDio_n(64),
    I  => aDio_n_out(64),
    T  => aDio_n_enable_n(64));

  aDio_n_in(64) <= aDio_n_out(64);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_65
  ---------------------------------------------------------------
  IOBUF_65 : OBUFT
  port map (
    O  => aDio(65),
    I  => aDio_out(65),
    T  => aDio_enable_n(65));

  aDio_in(65) <= aDio_out(65);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_65_N
  ---------------------------------------------------------------
  IOBUF_65_N : OBUFT
  port map (
    O  => aDio_n(65),
    I  => aDio_n_out(65),
    T  => aDio_n_enable_n(65));

  aDio_n_in(65) <= aDio_n_out(65);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_66
  ---------------------------------------------------------------
  IOBUF_66 : OBUFT
  port map (
    O  => aDio(66),
    I  => aDio_out(66),
    T  => aDio_enable_n(66));

  aDio_in(66) <= aDio_out(66);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_66_N
  ---------------------------------------------------------------
  IOBUF_66_N : OBUFT
  port map (
    O  => aDio_n(66),
    I  => aDio_n_out(66),
    T  => aDio_n_enable_n(66));

  aDio_n_in(66) <= aDio_n_out(66);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_67
  ---------------------------------------------------------------
  IOBUF_67 : OBUFT
  port map (
    O  => aDio(67),
    I  => aDio_out(67),
    T  => aDio_enable_n(67));

  aDio_in(67) <= aDio_out(67);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_67_N
  ---------------------------------------------------------------
  IOBUF_67_N : OBUFT
  port map (
    O  => aDio_n(67),
    I  => aDio_n_out(67),
    T  => aDio_n_enable_n(67));

  aDio_n_in(67) <= aDio_n_out(67);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_68
  ---------------------------------------------------------------
  IOBUF_68 : OBUFT
  port map (
    O  => aDio(68),
    I  => aDio_out(68),
    T  => aDio_enable_n(68));

  aDio_in(68) <= aDio_out(68);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_68_N
  ---------------------------------------------------------------
  IOBUF_68_N : OBUFT
  port map (
    O  => aDio_n(68),
    I  => aDio_n_out(68),
    T  => aDio_n_enable_n(68));

  aDio_n_in(68) <= aDio_n_out(68);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_69
  ---------------------------------------------------------------
  IOBUF_69 : OBUFT
  port map (
    O  => aDio(69),
    I  => aDio_out(69),
    T  => aDio_enable_n(69));

  aDio_in(69) <= aDio_out(69);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_69_N
  ---------------------------------------------------------------
  IOBUF_69_N : OBUFT
  port map (
    O  => aDio_n(69),
    I  => aDio_n_out(69),
    T  => aDio_n_enable_n(69));

  aDio_n_in(69) <= aDio_n_out(69);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_70
  ---------------------------------------------------------------
  IOBUF_70 : IOBUF
  port map (
    O  => aDio_in(70),
    IO => aDio(70),
    I  => aDio_out(70),
    T  => aDio_enable_n(70));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_70_N
  ---------------------------------------------------------------
  IOBUF_70_N : IOBUF
  port map (
    O  => aDio_n_in(70),
    IO => aDio_n(70),
    I  => aDio_n_out(70),
    T  => aDio_n_enable_n(70));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_71
  ---------------------------------------------------------------
  IOBUF_71 : IOBUF
  port map (
    O  => aDio_in(71),
    IO => aDio(71),
    I  => aDio_out(71),
    T  => aDio_enable_n(71));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_71_N
  ---------------------------------------------------------------
  IOBUF_71_N : OBUFT
  port map (
    O  => aDio_n(71),
    I  => aDio_n_out(71),
    T  => aDio_n_enable_n(71));

  aDio_n_in(71) <= aDio_n_out(71);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_72
  ---------------------------------------------------------------
  IOBUF_72 : OBUFT
  port map (
    O  => aDio(72),
    I  => aDio_out(72),
    T  => aDio_enable_n(72));

  aDio_in(72) <= aDio_out(72);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_72_N
  ---------------------------------------------------------------
  IOBUF_72_N : OBUFT
  port map (
    O  => aDio_n(72),
    I  => aDio_n_out(72),
    T  => aDio_n_enable_n(72));

  aDio_n_in(72) <= aDio_n_out(72);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_73
  ---------------------------------------------------------------
  IOBUF_73 : OBUFT
  port map (
    O  => aDio(73),
    I  => aDio_out(73),
    T  => aDio_enable_n(73));

  aDio_in(73) <= aDio_out(73);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_73_N
  ---------------------------------------------------------------
  IOBUF_73_N : OBUFT
  port map (
    O  => aDio_n(73),
    I  => aDio_n_out(73),
    T  => aDio_n_enable_n(73));

  aDio_n_in(73) <= aDio_n_out(73);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_74
  ---------------------------------------------------------------
  IOBUF_74 : OBUFT
  port map (
    O  => aDio(74),
    I  => aDio_out(74),
    T  => aDio_enable_n(74));

  aDio_in(74) <= aDio_out(74);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_74_N
  ---------------------------------------------------------------
  IOBUF_74_N : OBUFT
  port map (
    O  => aDio_n(74),
    I  => aDio_n_out(74),
    T  => aDio_n_enable_n(74));

  aDio_n_in(74) <= aDio_n_out(74);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_75
  ---------------------------------------------------------------
  IOBUF_75 : OBUFT
  port map (
    O  => aDio(75),
    I  => aDio_out(75),
    T  => aDio_enable_n(75));

  aDio_in(75) <= aDio_out(75);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_75_N
  ---------------------------------------------------------------
  IOBUF_75_N : OBUFT
  port map (
    O  => aDio_n(75),
    I  => aDio_n_out(75),
    T  => aDio_n_enable_n(75));

  aDio_n_in(75) <= aDio_n_out(75);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_76
  ---------------------------------------------------------------
  IOBUF_76 : IBUFDS
  port map (
    O   => aDio_in(76),
    I   => aDio(76),
    IB  => aDio_n(76));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_77
  ---------------------------------------------------------------
  IOBUF_77 : IBUFDS
  port map (
    O   => aDio_in(77),
    I   => aDio(77),
    IB  => aDio_n(77));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_78
  ---------------------------------------------------------------
  IOBUF_78 : OBUFT
  port map (
    O  => aDio(78),
    I  => aDio_out(78),
    T  => aDio_enable_n(78));

  aDio_in(78) <= aDio_out(78);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_78_N
  ---------------------------------------------------------------
  IOBUF_78_N : OBUFT
  port map (
    O  => aDio_n(78),
    I  => aDio_n_out(78),
    T  => aDio_n_enable_n(78));

  aDio_n_in(78) <= aDio_n_out(78);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_79
  ---------------------------------------------------------------
  IOBUF_79 : IBUFDS
  port map (
    O   => aDio_in(79),
    I   => aDio(79),
    IB  => aDio_n(79));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_80
  ---------------------------------------------------------------
  IOBUF_80 : IBUFDS
  port map (
    O   => aDio_in(80),
    I   => aDio(80),
    IB  => aDio_n(80));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_81
  ---------------------------------------------------------------
  IOBUF_81 : OBUFT
  port map (
    O  => aDio(81),
    I  => aDio_out(81),
    T  => aDio_enable_n(81));

  aDio_in(81) <= aDio_out(81);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_81_N
  ---------------------------------------------------------------
  IOBUF_81_N : OBUFT
  port map (
    O  => aDio_n(81),
    I  => aDio_n_out(81),
    T  => aDio_n_enable_n(81));

  aDio_n_in(81) <= aDio_n_out(81);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_82
  ---------------------------------------------------------------
  IOBUF_82 : OBUFTDS
  port map (
    O   => aDio(82),
    OB  => aDio_n(82),
    I   => aDio_out(82),
    T   => aDio_enable_n(82));

  aDio_in(82) <= aDio_out(82);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_83
  ---------------------------------------------------------------
  IOBUF_83 : IBUFDS
  port map (
    O   => aDio_in(83),
    I   => aDio(83),
    IB  => aDio_n(83));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_84
  ---------------------------------------------------------------
  IOBUF_84 : OBUFT
  port map (
    O  => aDio(84),
    I  => aDio_out(84),
    T  => aDio_enable_n(84));

  aDio_in(84) <= aDio_out(84);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_84_N
  ---------------------------------------------------------------
  IOBUF_84_N : OBUFT
  port map (
    O  => aDio_n(84),
    I  => aDio_n_out(84),
    T  => aDio_n_enable_n(84));

  aDio_n_in(84) <= aDio_n_out(84);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_85
  ---------------------------------------------------------------
  IOBUF_85 : IBUFDS
  port map (
    O   => aDio_in(85),
    I   => aDio(85),
    IB  => aDio_n(85));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_86
  ---------------------------------------------------------------
  IOBUF_86 : IBUFDS
  port map (
    O   => aDio_in(86),
    I   => aDio(86),
    IB  => aDio_n(86));

  ---------------------------------------------------------------
  --I/O Buffer: DIO_87
  ---------------------------------------------------------------
  IOBUF_87 : OBUFT
  port map (
    O  => aDio(87),
    I  => aDio_out(87),
    T  => aDio_enable_n(87));

  aDio_in(87) <= aDio_out(87);

  ---------------------------------------------------------------
  --I/O Buffer: DIO_87_N
  ---------------------------------------------------------------
  IOBUF_87_N : OBUFT
  port map (
    O  => aDio_n(87),
    I  => aDio_n_out(87),
    T  => aDio_n_enable_n(87));

  aDio_n_in(87) <= aDio_n_out(87);




end RTL;
