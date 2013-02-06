-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 12.1 Build 177 11/07/2012 SJ Web Edition"

-- DATE "01/30/2013 20:38:27"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	pwm IS
    PORT (
	address : IN std_logic_vector(1 DOWNTO 0);
	writedata : IN std_logic_vector(7 DOWNTO 0);
	write : IN std_logic;
	chipselect : IN std_logic;
	clk : IN std_logic;
	reset_n : IN std_logic;
	coe_export_pwmOut : OUT std_logic
	);
END pwm;

-- Design Ports Information
-- coe_export_pwmOut	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- chipselect	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address[1]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_n	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[7]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address[0]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[0]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[1]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[2]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[3]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[4]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[5]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[6]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF pwm IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_address : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_writedata : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_write : std_logic;
SIGNAL ww_chipselect : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset_n : std_logic;
SIGNAL ww_coe_export_pwmOut : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clkdiv1|clk_out~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \counter1|upDown~q\ : std_logic;
SIGNAL \counter1|Add0~6_combout\ : std_logic;
SIGNAL \clkdiv1|count[1]~13_combout\ : std_logic;
SIGNAL \clkdiv1|count[9]~29_combout\ : std_logic;
SIGNAL \controller1|Equal2~0_combout\ : std_logic;
SIGNAL \counter1|process_0~0_combout\ : std_logic;
SIGNAL \counter1|process_0~1_combout\ : std_logic;
SIGNAL \counter1|process_0~2_combout\ : std_logic;
SIGNAL \counter1|Add0~1_combout\ : std_logic;
SIGNAL \counter1|Add0~2_combout\ : std_logic;
SIGNAL \counter1|Add0~3_combout\ : std_logic;
SIGNAL \counter1|Add0~4_combout\ : std_logic;
SIGNAL \counter1|Add0~5_combout\ : std_logic;
SIGNAL \counter1|upDown~0_combout\ : std_logic;
SIGNAL \counter1|upDown~1_combout\ : std_logic;
SIGNAL \controller1|ocr~0_combout\ : std_logic;
SIGNAL \counter1|Add0~8_combout\ : std_logic;
SIGNAL \controller1|ocr~2_combout\ : std_logic;
SIGNAL \controller1|ocr~4_combout\ : std_logic;
SIGNAL \counter1|count~0_combout\ : std_logic;
SIGNAL \counter1|max[0]~0_combout\ : std_logic;
SIGNAL \counter1|max[0]~1_combout\ : std_logic;
SIGNAL \counter1|max[1]~2_combout\ : std_logic;
SIGNAL \counter1|max[3]~3_combout\ : std_logic;
SIGNAL \counter1|max[2]~4_combout\ : std_logic;
SIGNAL \counter1|max[5]~5_combout\ : std_logic;
SIGNAL \counter1|max[4]~6_combout\ : std_logic;
SIGNAL \counter1|max[7]~7_combout\ : std_logic;
SIGNAL \counter1|max[6]~8_combout\ : std_logic;
SIGNAL \write~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \writedata[0]~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \coe_export_pwmOut~output_o\ : std_logic;
SIGNAL \clkdiv1|count[0]~11_combout\ : std_logic;
SIGNAL \clkdiv1|count[7]~25_combout\ : std_logic;
SIGNAL \clkdiv1|LessThan0~0_combout\ : std_logic;
SIGNAL \clkdiv1|count[2]~15_combout\ : std_logic;
SIGNAL \clkdiv1|LessThan0~1_combout\ : std_logic;
SIGNAL \clkdiv1|LessThan0~2_combout\ : std_logic;
SIGNAL \clkdiv1|LessThan0~3_combout\ : std_logic;
SIGNAL \clkdiv1|count[0]~12\ : std_logic;
SIGNAL \clkdiv1|count[1]~14\ : std_logic;
SIGNAL \clkdiv1|count[2]~16\ : std_logic;
SIGNAL \clkdiv1|count[3]~17_combout\ : std_logic;
SIGNAL \clkdiv1|count[3]~18\ : std_logic;
SIGNAL \clkdiv1|count[4]~19_combout\ : std_logic;
SIGNAL \clkdiv1|count[4]~20\ : std_logic;
SIGNAL \clkdiv1|count[5]~21_combout\ : std_logic;
SIGNAL \clkdiv1|count[5]~22\ : std_logic;
SIGNAL \clkdiv1|count[6]~23_combout\ : std_logic;
SIGNAL \clkdiv1|count[6]~24\ : std_logic;
SIGNAL \clkdiv1|count[7]~26\ : std_logic;
SIGNAL \clkdiv1|count[8]~27_combout\ : std_logic;
SIGNAL \clkdiv1|count[8]~28\ : std_logic;
SIGNAL \clkdiv1|count[9]~30\ : std_logic;
SIGNAL \clkdiv1|count[10]~31_combout\ : std_logic;
SIGNAL \clkdiv1|LessThan1~0_combout\ : std_logic;
SIGNAL \clkdiv1|LessThan1~1_combout\ : std_logic;
SIGNAL \clkdiv1|clk_out~q\ : std_logic;
SIGNAL \clkdiv1|clk_out~clkctrl_outclk\ : std_logic;
SIGNAL \chipselect~input_o\ : std_logic;
SIGNAL \address[1]~input_o\ : std_logic;
SIGNAL \controller1|process_0~0_combout\ : std_logic;
SIGNAL \address[0]~input_o\ : std_logic;
SIGNAL \controller1|control~0_combout\ : std_logic;
SIGNAL \reset_n~input_o\ : std_logic;
SIGNAL \controller1|process_0~1_combout\ : std_logic;
SIGNAL \controller1|ocr[7]~1_combout\ : std_logic;
SIGNAL \controller1|output~0_combout\ : std_logic;
SIGNAL \controller1|output~q\ : std_logic;
SIGNAL \controller1|ocr~5_combout\ : std_logic;
SIGNAL \writedata[5]~input_o\ : std_logic;
SIGNAL \controller1|ocr~6_combout\ : std_logic;
SIGNAL \counter1|Equal0~0_combout\ : std_logic;
SIGNAL \counter1|count~4_combout\ : std_logic;
SIGNAL \controller1|enable~feeder_combout\ : std_logic;
SIGNAL \controller1|enable~q\ : std_logic;
SIGNAL \counter1|count[7]~1_combout\ : std_logic;
SIGNAL \writedata[4]~input_o\ : std_logic;
SIGNAL \writedata[3]~input_o\ : std_logic;
SIGNAL \writedata[2]~input_o\ : std_logic;
SIGNAL \writedata[1]~input_o\ : std_logic;
SIGNAL \counter1|Add0~7\ : std_logic;
SIGNAL \counter1|Add0~9_combout\ : std_logic;
SIGNAL \counter1|count~8_combout\ : std_logic;
SIGNAL \counter1|Add0~10\ : std_logic;
SIGNAL \counter1|Add0~11_combout\ : std_logic;
SIGNAL \counter1|count~7_combout\ : std_logic;
SIGNAL \counter1|Add0~12\ : std_logic;
SIGNAL \counter1|Add0~13_combout\ : std_logic;
SIGNAL \counter1|count~6_combout\ : std_logic;
SIGNAL \counter1|Add0~14\ : std_logic;
SIGNAL \counter1|Add0~15_combout\ : std_logic;
SIGNAL \counter1|count~5_combout\ : std_logic;
SIGNAL \counter1|Add0~16\ : std_logic;
SIGNAL \counter1|Add0~17_combout\ : std_logic;
SIGNAL \counter1|cnt[7]~0_combout\ : std_logic;
SIGNAL \controller1|Equal2~2_combout\ : std_logic;
SIGNAL \controller1|ocr~3_combout\ : std_logic;
SIGNAL \controller1|Equal2~1_combout\ : std_logic;
SIGNAL \controller1|ocr~7_combout\ : std_logic;
SIGNAL \writedata[7]~input_o\ : std_logic;
SIGNAL \controller1|ocr~8_combout\ : std_logic;
SIGNAL \counter1|count~2_combout\ : std_logic;
SIGNAL \writedata[6]~input_o\ : std_logic;
SIGNAL \counter1|Add0~18\ : std_logic;
SIGNAL \counter1|Add0~19_combout\ : std_logic;
SIGNAL \counter1|count~3_combout\ : std_logic;
SIGNAL \counter1|Add0~20\ : std_logic;
SIGNAL \counter1|Add0~21_combout\ : std_logic;
SIGNAL \controller1|Equal2~3_combout\ : std_logic;
SIGNAL \controller1|Equal2~4_combout\ : std_logic;
SIGNAL \controller1|coe_export_pwmOut~0_combout\ : std_logic;
SIGNAL \controller1|coe_export_pwmOut~1_combout\ : std_logic;
SIGNAL \controller1|coe_export_pwmOut~q\ : std_logic;
SIGNAL \clkdiv1|count\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \counter1|max\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \counter1|count\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \counter1|cnt\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \controller1|ocr\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \controller1|control\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_reset_n~input_o\ : std_logic;

BEGIN

ww_address <= address;
ww_writedata <= writedata;
ww_write <= write;
ww_chipselect <= chipselect;
ww_clk <= clk;
ww_reset_n <= reset_n;
coe_export_pwmOut <= ww_coe_export_pwmOut;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\clkdiv1|clk_out~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clkdiv1|clk_out~q\);
\ALT_INV_reset_n~input_o\ <= NOT \reset_n~input_o\;

-- Location: FF_X29_Y25_N11
\counter1|upDown\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|upDown~1_combout\,
	sclr => \ALT_INV_reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|upDown~q\);

-- Location: FF_X16_Y2_N27
\clkdiv1|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[9]~29_combout\,
	sclr => \clkdiv1|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(9));

-- Location: FF_X29_Y25_N9
\counter1|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|count~0_combout\,
	sclr => \ALT_INV_reset_n~input_o\,
	ena => \counter1|count[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|count\(0));

-- Location: LCCOMB_X31_Y25_N8
\counter1|Add0~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~6_combout\ = \counter1|count\(0) $ (VCC)
-- \counter1|Add0~7\ = CARRY(\counter1|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|count\(0),
	datad => VCC,
	combout => \counter1|Add0~6_combout\,
	cout => \counter1|Add0~7\);

-- Location: FF_X16_Y2_N11
\clkdiv1|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[1]~13_combout\,
	sclr => \clkdiv1|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(1));

-- Location: LCCOMB_X16_Y2_N10
\clkdiv1|count[1]~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[1]~13_combout\ = (\clkdiv1|count\(1) & (!\clkdiv1|count[0]~12\)) # (!\clkdiv1|count\(1) & ((\clkdiv1|count[0]~12\) # (GND)))
-- \clkdiv1|count[1]~14\ = CARRY((!\clkdiv1|count[0]~12\) # (!\clkdiv1|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(1),
	datad => VCC,
	cin => \clkdiv1|count[0]~12\,
	combout => \clkdiv1|count[1]~13_combout\,
	cout => \clkdiv1|count[1]~14\);

-- Location: LCCOMB_X16_Y2_N26
\clkdiv1|count[9]~29\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[9]~29_combout\ = (\clkdiv1|count\(9) & (!\clkdiv1|count[8]~28\)) # (!\clkdiv1|count\(9) & ((\clkdiv1|count[8]~28\) # (GND)))
-- \clkdiv1|count[9]~30\ = CARRY((!\clkdiv1|count[8]~28\) # (!\clkdiv1|count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(9),
	datad => VCC,
	cin => \clkdiv1|count[8]~28\,
	combout => \clkdiv1|count[9]~29_combout\,
	cout => \clkdiv1|count[9]~30\);

-- Location: FF_X31_Y25_N9
\counter1|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|Add0~6_combout\,
	ena => \counter1|cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|cnt\(0));

-- Location: FF_X30_Y25_N21
\controller1|ocr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	asdata => \controller1|ocr~0_combout\,
	sload => VCC,
	ena => \controller1|ocr[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|ocr\(0));

-- Location: FF_X31_Y25_N11
\counter1|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|Add0~9_combout\,
	ena => \counter1|cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|cnt\(1));

-- Location: FF_X30_Y25_N11
\controller1|ocr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|ocr~2_combout\,
	ena => \controller1|ocr[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|ocr\(1));

-- Location: LCCOMB_X30_Y25_N20
\controller1|Equal2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|Equal2~0_combout\ = (\controller1|ocr\(1) & (!\counter1|cnt\(1) & (\counter1|cnt\(0) $ (\controller1|ocr\(0))))) # (!\controller1|ocr\(1) & (\counter1|cnt\(1) & (\counter1|cnt\(0) $ (\controller1|ocr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|ocr\(1),
	datab => \counter1|cnt\(0),
	datac => \controller1|ocr\(0),
	datad => \counter1|cnt\(1),
	combout => \controller1|Equal2~0_combout\);

-- Location: FF_X30_Y25_N7
\controller1|ocr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|ocr~4_combout\,
	ena => \controller1|ocr[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|ocr\(3));

-- Location: FF_X31_Y25_N17
\counter1|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|Add0~15_combout\,
	ena => \counter1|cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|cnt\(4));

-- Location: FF_X31_Y25_N21
\counter1|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|Add0~19_combout\,
	ena => \counter1|cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|cnt\(6));

-- Location: LCCOMB_X29_Y25_N30
\counter1|process_0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|process_0~0_combout\ = (\counter1|count\(6)) # (((\counter1|count\(5)) # (\counter1|count\(7))) # (!\counter1|upDown~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|count\(6),
	datab => \counter1|upDown~q\,
	datac => \counter1|count\(5),
	datad => \counter1|count\(7),
	combout => \counter1|process_0~0_combout\);

-- Location: LCCOMB_X29_Y25_N0
\counter1|process_0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|process_0~1_combout\ = (\counter1|count\(1)) # ((\counter1|count\(3)) # ((\counter1|count\(4)) # (\counter1|count\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|count\(1),
	datab => \counter1|count\(3),
	datac => \counter1|count\(4),
	datad => \counter1|count\(2),
	combout => \counter1|process_0~1_combout\);

-- Location: LCCOMB_X29_Y25_N18
\counter1|process_0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|process_0~2_combout\ = (\counter1|count\(0)) # ((\counter1|process_0~0_combout\) # (\counter1|process_0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \counter1|count\(0),
	datac => \counter1|process_0~0_combout\,
	datad => \counter1|process_0~1_combout\,
	combout => \counter1|process_0~2_combout\);

-- Location: FF_X30_Y25_N5
\counter1|max[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	asdata => \counter1|max[0]~1_combout\,
	sload => VCC,
	ena => \counter1|max[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|max\(0));

-- Location: FF_X30_Y25_N15
\counter1|max[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|max[1]~2_combout\,
	ena => \counter1|max[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|max\(1));

-- Location: LCCOMB_X30_Y25_N4
\counter1|Add0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~1_combout\ = (\counter1|count\(0) & (!\counter1|max\(0) & (\counter1|max\(1) $ (\counter1|count\(1))))) # (!\counter1|count\(0) & (\counter1|max\(0) & (\counter1|max\(1) $ (\counter1|count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|count\(0),
	datab => \counter1|max\(1),
	datac => \counter1|max\(0),
	datad => \counter1|count\(1),
	combout => \counter1|Add0~1_combout\);

-- Location: FF_X30_Y25_N13
\counter1|max[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	asdata => \counter1|max[3]~3_combout\,
	sload => VCC,
	ena => \counter1|max[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|max\(3));

-- Location: FF_X30_Y25_N23
\counter1|max[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|max[2]~4_combout\,
	ena => \counter1|max[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|max\(2));

-- Location: LCCOMB_X30_Y25_N12
\counter1|Add0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~2_combout\ = (\counter1|max\(2) & (!\counter1|count\(2) & (\counter1|count\(3) $ (\counter1|max\(3))))) # (!\counter1|max\(2) & (\counter1|count\(2) & (\counter1|count\(3) $ (\counter1|max\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|max\(2),
	datab => \counter1|count\(3),
	datac => \counter1|max\(3),
	datad => \counter1|count\(2),
	combout => \counter1|Add0~2_combout\);

-- Location: FF_X32_Y25_N31
\counter1|max[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	asdata => \counter1|max[5]~5_combout\,
	sload => VCC,
	ena => \counter1|max[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|max\(5));

-- Location: FF_X32_Y25_N5
\counter1|max[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|max[4]~6_combout\,
	ena => \counter1|max[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|max\(4));

-- Location: LCCOMB_X32_Y25_N30
\counter1|Add0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~3_combout\ = (\counter1|count\(4) & (!\counter1|max\(4) & (\counter1|count\(5) $ (\counter1|max\(5))))) # (!\counter1|count\(4) & (\counter1|max\(4) & (\counter1|count\(5) $ (\counter1|max\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|count\(4),
	datab => \counter1|count\(5),
	datac => \counter1|max\(5),
	datad => \counter1|max\(4),
	combout => \counter1|Add0~3_combout\);

-- Location: FF_X30_Y25_N17
\counter1|max[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	asdata => \counter1|max[7]~7_combout\,
	sload => VCC,
	ena => \counter1|max[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|max\(7));

-- Location: FF_X30_Y25_N31
\counter1|max[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|max[6]~8_combout\,
	ena => \counter1|max[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|max\(6));

-- Location: LCCOMB_X30_Y25_N16
\counter1|Add0~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~4_combout\ = (\counter1|max\(6) & (!\counter1|count\(6) & (\counter1|count\(7) $ (\counter1|max\(7))))) # (!\counter1|max\(6) & (\counter1|count\(6) & (\counter1|count\(7) $ (\counter1|max\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|max\(6),
	datab => \counter1|count\(7),
	datac => \counter1|max\(7),
	datad => \counter1|count\(6),
	combout => \counter1|Add0~4_combout\);

-- Location: LCCOMB_X31_Y25_N24
\counter1|Add0~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~5_combout\ = (\counter1|Add0~4_combout\ & (\counter1|Add0~1_combout\ & (\counter1|Add0~3_combout\ & \counter1|Add0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|Add0~4_combout\,
	datab => \counter1|Add0~1_combout\,
	datac => \counter1|Add0~3_combout\,
	datad => \counter1|Add0~2_combout\,
	combout => \counter1|Add0~5_combout\);

-- Location: LCCOMB_X32_Y25_N2
\counter1|upDown~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|upDown~0_combout\ = (\controller1|enable~q\ & (((!\address[1]~input_o\) # (!\chipselect~input_o\)) # (!\write~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write~input_o\,
	datab => \chipselect~input_o\,
	datac => \controller1|enable~q\,
	datad => \address[1]~input_o\,
	combout => \counter1|upDown~0_combout\);

-- Location: LCCOMB_X29_Y25_N10
\counter1|upDown~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|upDown~1_combout\ = (\counter1|upDown~0_combout\ & ((\counter1|upDown~q\ & ((\counter1|process_0~2_combout\))) # (!\counter1|upDown~q\ & (\counter1|Add0~5_combout\)))) # (!\counter1|upDown~0_combout\ & (((\counter1|upDown~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|Add0~5_combout\,
	datab => \counter1|upDown~0_combout\,
	datac => \counter1|upDown~q\,
	datad => \counter1|process_0~2_combout\,
	combout => \counter1|upDown~1_combout\);

-- Location: LCCOMB_X29_Y25_N6
\controller1|ocr~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr~0_combout\ = (!\writedata[0]~input_o\ & \reset_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \writedata[0]~input_o\,
	datad => \reset_n~input_o\,
	combout => \controller1|ocr~0_combout\);

-- Location: LCCOMB_X31_Y25_N30
\counter1|Add0~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~8_combout\ = (\counter1|upDown~q\ & ((\counter1|process_0~2_combout\))) # (!\counter1|upDown~q\ & (\counter1|Add0~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|upDown~q\,
	datac => \counter1|Add0~5_combout\,
	datad => \counter1|process_0~2_combout\,
	combout => \counter1|Add0~8_combout\);

-- Location: LCCOMB_X30_Y25_N10
\controller1|ocr~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr~2_combout\ = (!\writedata[1]~input_o\ & \reset_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \writedata[1]~input_o\,
	datad => \reset_n~input_o\,
	combout => \controller1|ocr~2_combout\);

-- Location: LCCOMB_X30_Y25_N6
\controller1|ocr~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr~4_combout\ = (!\writedata[3]~input_o\ & \reset_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \writedata[3]~input_o\,
	datad => \reset_n~input_o\,
	combout => \controller1|ocr~4_combout\);

-- Location: LCCOMB_X29_Y25_N8
\counter1|count~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count~0_combout\ = (\counter1|Equal0~0_combout\ & ((\address[0]~input_o\ & (\writedata[0]~input_o\)) # (!\address[0]~input_o\ & ((\counter1|Add0~6_combout\))))) # (!\counter1|Equal0~0_combout\ & (((\counter1|Add0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \writedata[0]~input_o\,
	datab => \counter1|Add0~6_combout\,
	datac => \counter1|Equal0~0_combout\,
	datad => \address[0]~input_o\,
	combout => \counter1|count~0_combout\);

-- Location: LCCOMB_X32_Y25_N12
\counter1|max[0]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|max[0]~0_combout\ = (\counter1|Equal0~0_combout\ & (!\address[0]~input_o\ & \reset_n~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \counter1|Equal0~0_combout\,
	datac => \address[0]~input_o\,
	datad => \reset_n~input_o\,
	combout => \counter1|max[0]~0_combout\);

-- Location: LCCOMB_X29_Y25_N2
\counter1|max[0]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|max[0]~1_combout\ = !\writedata[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \writedata[0]~input_o\,
	combout => \counter1|max[0]~1_combout\);

-- Location: LCCOMB_X30_Y25_N14
\counter1|max[1]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|max[1]~2_combout\ = !\writedata[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \writedata[1]~input_o\,
	combout => \counter1|max[1]~2_combout\);

-- Location: LCCOMB_X30_Y25_N26
\counter1|max[3]~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|max[3]~3_combout\ = !\writedata[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \writedata[3]~input_o\,
	combout => \counter1|max[3]~3_combout\);

-- Location: LCCOMB_X30_Y25_N22
\counter1|max[2]~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|max[2]~4_combout\ = !\writedata[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \writedata[2]~input_o\,
	combout => \counter1|max[2]~4_combout\);

-- Location: LCCOMB_X32_Y25_N22
\counter1|max[5]~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|max[5]~5_combout\ = !\writedata[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \writedata[5]~input_o\,
	combout => \counter1|max[5]~5_combout\);

-- Location: LCCOMB_X32_Y25_N4
\counter1|max[4]~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|max[4]~6_combout\ = !\writedata[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \writedata[4]~input_o\,
	combout => \counter1|max[4]~6_combout\);

-- Location: LCCOMB_X30_Y25_N8
\counter1|max[7]~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|max[7]~7_combout\ = !\writedata[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \writedata[7]~input_o\,
	combout => \counter1|max[7]~7_combout\);

-- Location: LCCOMB_X30_Y25_N30
\counter1|max[6]~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|max[6]~8_combout\ = !\writedata[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \writedata[6]~input_o\,
	combout => \counter1|max[6]~8_combout\);

-- Location: IOIBUF_X16_Y0_N8
\write~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write,
	o => \write~input_o\);

-- Location: IOIBUF_X16_Y0_N15
\clk~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOIBUF_X33_Y22_N1
\writedata[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(0),
	o => \writedata[0]~input_o\);

-- Location: CLKCTRL_G17
\clk~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOOBUF_X29_Y31_N2
\coe_export_pwmOut~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \controller1|coe_export_pwmOut~q\,
	devoe => ww_devoe,
	o => \coe_export_pwmOut~output_o\);

-- Location: LCCOMB_X16_Y2_N8
\clkdiv1|count[0]~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[0]~11_combout\ = \clkdiv1|count\(0) $ (VCC)
-- \clkdiv1|count[0]~12\ = CARRY(\clkdiv1|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(0),
	datad => VCC,
	combout => \clkdiv1|count[0]~11_combout\,
	cout => \clkdiv1|count[0]~12\);

-- Location: LCCOMB_X16_Y2_N22
\clkdiv1|count[7]~25\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[7]~25_combout\ = (\clkdiv1|count\(7) & (!\clkdiv1|count[6]~24\)) # (!\clkdiv1|count\(7) & ((\clkdiv1|count[6]~24\) # (GND)))
-- \clkdiv1|count[7]~26\ = CARRY((!\clkdiv1|count[6]~24\) # (!\clkdiv1|count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(7),
	datad => VCC,
	cin => \clkdiv1|count[6]~24\,
	combout => \clkdiv1|count[7]~25_combout\,
	cout => \clkdiv1|count[7]~26\);

-- Location: FF_X16_Y2_N23
\clkdiv1|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[7]~25_combout\,
	sclr => \clkdiv1|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(7));

-- Location: LCCOMB_X16_Y2_N30
\clkdiv1|LessThan0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|LessThan0~0_combout\ = (\clkdiv1|count\(9) & (\clkdiv1|count\(7) & \clkdiv1|count\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(9),
	datac => \clkdiv1|count\(7),
	datad => \clkdiv1|count\(8),
	combout => \clkdiv1|LessThan0~0_combout\);

-- Location: LCCOMB_X16_Y2_N12
\clkdiv1|count[2]~15\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[2]~15_combout\ = (\clkdiv1|count\(2) & (\clkdiv1|count[1]~14\ $ (GND))) # (!\clkdiv1|count\(2) & (!\clkdiv1|count[1]~14\ & VCC))
-- \clkdiv1|count[2]~16\ = CARRY((\clkdiv1|count\(2) & !\clkdiv1|count[1]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(2),
	datad => VCC,
	cin => \clkdiv1|count[1]~14\,
	combout => \clkdiv1|count[2]~15_combout\,
	cout => \clkdiv1|count[2]~16\);

-- Location: FF_X16_Y2_N13
\clkdiv1|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[2]~15_combout\,
	sclr => \clkdiv1|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(2));

-- Location: LCCOMB_X16_Y2_N0
\clkdiv1|LessThan0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|LessThan0~1_combout\ = (!\clkdiv1|count\(1) & (!\clkdiv1|count\(4) & (!\clkdiv1|count\(0) & !\clkdiv1|count\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(1),
	datab => \clkdiv1|count\(4),
	datac => \clkdiv1|count\(0),
	datad => \clkdiv1|count\(2),
	combout => \clkdiv1|LessThan0~1_combout\);

-- Location: LCCOMB_X16_Y2_N6
\clkdiv1|LessThan0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|LessThan0~2_combout\ = (!\clkdiv1|count\(6) & (((!\clkdiv1|count\(3) & \clkdiv1|LessThan0~1_combout\)) # (!\clkdiv1|count\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(5),
	datab => \clkdiv1|count\(6),
	datac => \clkdiv1|count\(3),
	datad => \clkdiv1|LessThan0~1_combout\,
	combout => \clkdiv1|LessThan0~2_combout\);

-- Location: LCCOMB_X16_Y2_N2
\clkdiv1|LessThan0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|LessThan0~3_combout\ = (\clkdiv1|count\(10) & (\clkdiv1|LessThan0~0_combout\ & !\clkdiv1|LessThan0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(10),
	datac => \clkdiv1|LessThan0~0_combout\,
	datad => \clkdiv1|LessThan0~2_combout\,
	combout => \clkdiv1|LessThan0~3_combout\);

-- Location: FF_X16_Y2_N9
\clkdiv1|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[0]~11_combout\,
	sclr => \clkdiv1|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(0));

-- Location: LCCOMB_X16_Y2_N14
\clkdiv1|count[3]~17\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[3]~17_combout\ = (\clkdiv1|count\(3) & (!\clkdiv1|count[2]~16\)) # (!\clkdiv1|count\(3) & ((\clkdiv1|count[2]~16\) # (GND)))
-- \clkdiv1|count[3]~18\ = CARRY((!\clkdiv1|count[2]~16\) # (!\clkdiv1|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(3),
	datad => VCC,
	cin => \clkdiv1|count[2]~16\,
	combout => \clkdiv1|count[3]~17_combout\,
	cout => \clkdiv1|count[3]~18\);

-- Location: FF_X16_Y2_N15
\clkdiv1|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[3]~17_combout\,
	sclr => \clkdiv1|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(3));

-- Location: LCCOMB_X16_Y2_N16
\clkdiv1|count[4]~19\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[4]~19_combout\ = (\clkdiv1|count\(4) & (\clkdiv1|count[3]~18\ $ (GND))) # (!\clkdiv1|count\(4) & (!\clkdiv1|count[3]~18\ & VCC))
-- \clkdiv1|count[4]~20\ = CARRY((\clkdiv1|count\(4) & !\clkdiv1|count[3]~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(4),
	datad => VCC,
	cin => \clkdiv1|count[3]~18\,
	combout => \clkdiv1|count[4]~19_combout\,
	cout => \clkdiv1|count[4]~20\);

-- Location: FF_X16_Y2_N17
\clkdiv1|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[4]~19_combout\,
	sclr => \clkdiv1|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(4));

-- Location: LCCOMB_X16_Y2_N18
\clkdiv1|count[5]~21\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[5]~21_combout\ = (\clkdiv1|count\(5) & (!\clkdiv1|count[4]~20\)) # (!\clkdiv1|count\(5) & ((\clkdiv1|count[4]~20\) # (GND)))
-- \clkdiv1|count[5]~22\ = CARRY((!\clkdiv1|count[4]~20\) # (!\clkdiv1|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(5),
	datad => VCC,
	cin => \clkdiv1|count[4]~20\,
	combout => \clkdiv1|count[5]~21_combout\,
	cout => \clkdiv1|count[5]~22\);

-- Location: FF_X16_Y2_N19
\clkdiv1|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[5]~21_combout\,
	sclr => \clkdiv1|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(5));

-- Location: LCCOMB_X16_Y2_N20
\clkdiv1|count[6]~23\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[6]~23_combout\ = (\clkdiv1|count\(6) & (\clkdiv1|count[5]~22\ $ (GND))) # (!\clkdiv1|count\(6) & (!\clkdiv1|count[5]~22\ & VCC))
-- \clkdiv1|count[6]~24\ = CARRY((\clkdiv1|count\(6) & !\clkdiv1|count[5]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(6),
	datad => VCC,
	cin => \clkdiv1|count[5]~22\,
	combout => \clkdiv1|count[6]~23_combout\,
	cout => \clkdiv1|count[6]~24\);

-- Location: FF_X16_Y2_N21
\clkdiv1|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[6]~23_combout\,
	sclr => \clkdiv1|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(6));

-- Location: LCCOMB_X16_Y2_N24
\clkdiv1|count[8]~27\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[8]~27_combout\ = (\clkdiv1|count\(8) & (\clkdiv1|count[7]~26\ $ (GND))) # (!\clkdiv1|count\(8) & (!\clkdiv1|count[7]~26\ & VCC))
-- \clkdiv1|count[8]~28\ = CARRY((\clkdiv1|count\(8) & !\clkdiv1|count[7]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(8),
	datad => VCC,
	cin => \clkdiv1|count[7]~26\,
	combout => \clkdiv1|count[8]~27_combout\,
	cout => \clkdiv1|count[8]~28\);

-- Location: FF_X16_Y2_N25
\clkdiv1|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[8]~27_combout\,
	sclr => \clkdiv1|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(8));

-- Location: LCCOMB_X16_Y2_N28
\clkdiv1|count[10]~31\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[10]~31_combout\ = \clkdiv1|count[9]~30\ $ (!\clkdiv1|count\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \clkdiv1|count\(10),
	cin => \clkdiv1|count[9]~30\,
	combout => \clkdiv1|count[10]~31_combout\);

-- Location: FF_X16_Y2_N29
\clkdiv1|count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[10]~31_combout\,
	sclr => \clkdiv1|LessThan0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(10));

-- Location: LCCOMB_X16_Y2_N4
\clkdiv1|LessThan1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|LessThan1~0_combout\ = (!\clkdiv1|count\(4) & !\clkdiv1|count\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(4),
	datad => \clkdiv1|count\(5),
	combout => \clkdiv1|LessThan1~0_combout\);

-- Location: LCCOMB_X15_Y2_N0
\clkdiv1|LessThan1~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|LessThan1~1_combout\ = (\clkdiv1|count\(10)) # ((\clkdiv1|count\(6) & (\clkdiv1|LessThan0~0_combout\ & !\clkdiv1|LessThan1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(6),
	datab => \clkdiv1|count\(10),
	datac => \clkdiv1|LessThan0~0_combout\,
	datad => \clkdiv1|LessThan1~0_combout\,
	combout => \clkdiv1|LessThan1~1_combout\);

-- Location: FF_X15_Y2_N1
\clkdiv1|clk_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|LessThan1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|clk_out~q\);

-- Location: CLKCTRL_G16
\clkdiv1|clk_out~clkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clkdiv1|clk_out~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clkdiv1|clk_out~clkctrl_outclk\);

-- Location: IOIBUF_X16_Y0_N1
\chipselect~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_chipselect,
	o => \chipselect~input_o\);

-- Location: IOIBUF_X33_Y28_N1
\address[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(1),
	o => \address[1]~input_o\);

-- Location: LCCOMB_X32_Y25_N24
\controller1|process_0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|process_0~0_combout\ = (\write~input_o\ & (\chipselect~input_o\ & !\address[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write~input_o\,
	datac => \chipselect~input_o\,
	datad => \address[1]~input_o\,
	combout => \controller1|process_0~0_combout\);

-- Location: IOIBUF_X33_Y27_N1
\address[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(0),
	o => \address[0]~input_o\);

-- Location: LCCOMB_X29_Y25_N20
\controller1|control~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|control~0_combout\ = (\controller1|process_0~0_combout\ & ((\address[0]~input_o\ & ((\controller1|control\(7)))) # (!\address[0]~input_o\ & (\writedata[7]~input_o\)))) # (!\controller1|process_0~0_combout\ & (((\controller1|control\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \writedata[7]~input_o\,
	datab => \controller1|process_0~0_combout\,
	datac => \controller1|control\(7),
	datad => \address[0]~input_o\,
	combout => \controller1|control~0_combout\);

-- Location: IOIBUF_X33_Y27_N8
\reset_n~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_n,
	o => \reset_n~input_o\);

-- Location: FF_X29_Y25_N21
\controller1|control[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|control~0_combout\,
	sclr => \ALT_INV_reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|control\(7));

-- Location: LCCOMB_X32_Y25_N10
\controller1|process_0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|process_0~1_combout\ = (\write~input_o\ & (!\address[0]~input_o\ & (\chipselect~input_o\ & !\address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write~input_o\,
	datab => \address[0]~input_o\,
	datac => \chipselect~input_o\,
	datad => \address[1]~input_o\,
	combout => \controller1|process_0~1_combout\);

-- Location: LCCOMB_X29_Y25_N16
\controller1|ocr[7]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr[7]~1_combout\ = ((\address[0]~input_o\ & \controller1|process_0~0_combout\)) # (!\reset_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datac => \controller1|process_0~0_combout\,
	datad => \reset_n~input_o\,
	combout => \controller1|ocr[7]~1_combout\);

-- Location: LCCOMB_X29_Y25_N14
\controller1|output~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|output~0_combout\ = (\controller1|process_0~1_combout\ & (((\controller1|output~q\)))) # (!\controller1|process_0~1_combout\ & ((\controller1|ocr[7]~1_combout\ & ((\controller1|output~q\))) # (!\controller1|ocr[7]~1_combout\ & 
-- (!\controller1|coe_export_pwmOut~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|coe_export_pwmOut~0_combout\,
	datab => \controller1|process_0~1_combout\,
	datac => \controller1|output~q\,
	datad => \controller1|ocr[7]~1_combout\,
	combout => \controller1|output~0_combout\);

-- Location: FF_X29_Y25_N15
\controller1|output\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|output~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|output~q\);

-- Location: LCCOMB_X32_Y25_N28
\controller1|ocr~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr~5_combout\ = (!\writedata[4]~input_o\ & \reset_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \writedata[4]~input_o\,
	datad => \reset_n~input_o\,
	combout => \controller1|ocr~5_combout\);

-- Location: FF_X32_Y25_N29
\controller1|ocr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|ocr~5_combout\,
	ena => \controller1|ocr[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|ocr\(4));

-- Location: IOIBUF_X33_Y28_N8
\writedata[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(5),
	o => \writedata[5]~input_o\);

-- Location: LCCOMB_X32_Y25_N8
\controller1|ocr~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr~6_combout\ = (\reset_n~input_o\ & !\writedata[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset_n~input_o\,
	datad => \writedata[5]~input_o\,
	combout => \controller1|ocr~6_combout\);

-- Location: FF_X32_Y25_N27
\controller1|ocr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	asdata => \controller1|ocr~6_combout\,
	sload => VCC,
	ena => \controller1|ocr[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|ocr\(5));

-- Location: LCCOMB_X32_Y25_N20
\counter1|Equal0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Equal0~0_combout\ = (\write~input_o\ & (\chipselect~input_o\ & \address[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write~input_o\,
	datac => \chipselect~input_o\,
	datad => \address[1]~input_o\,
	combout => \counter1|Equal0~0_combout\);

-- Location: LCCOMB_X31_Y25_N4
\counter1|count~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count~4_combout\ = (\address[0]~input_o\ & ((\counter1|Equal0~0_combout\ & (\writedata[5]~input_o\)) # (!\counter1|Equal0~0_combout\ & ((\counter1|Add0~17_combout\))))) # (!\address[0]~input_o\ & (((\counter1|Add0~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \writedata[5]~input_o\,
	datac => \counter1|Equal0~0_combout\,
	datad => \counter1|Add0~17_combout\,
	combout => \counter1|count~4_combout\);

-- Location: LCCOMB_X29_Y25_N24
\controller1|enable~feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|enable~feeder_combout\ = \controller1|control\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \controller1|control\(7),
	combout => \controller1|enable~feeder_combout\);

-- Location: FF_X29_Y25_N25
\controller1|enable\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|enable~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|enable~q\);

-- Location: LCCOMB_X29_Y25_N28
\counter1|count[7]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count[7]~1_combout\ = ((\counter1|Equal0~0_combout\ & (\address[0]~input_o\)) # (!\counter1|Equal0~0_combout\ & ((\controller1|enable~q\)))) # (!\reset_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \controller1|enable~q\,
	datac => \counter1|Equal0~0_combout\,
	datad => \reset_n~input_o\,
	combout => \counter1|count[7]~1_combout\);

-- Location: FF_X31_Y25_N5
\counter1|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|count~4_combout\,
	sclr => \ALT_INV_reset_n~input_o\,
	ena => \counter1|count[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|count\(5));

-- Location: IOIBUF_X33_Y25_N8
\writedata[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(4),
	o => \writedata[4]~input_o\);

-- Location: IOIBUF_X33_Y24_N1
\writedata[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(3),
	o => \writedata[3]~input_o\);

-- Location: IOIBUF_X31_Y31_N1
\writedata[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(2),
	o => \writedata[2]~input_o\);

-- Location: IOIBUF_X33_Y24_N8
\writedata[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(1),
	o => \writedata[1]~input_o\);

-- Location: LCCOMB_X31_Y25_N10
\counter1|Add0~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~9_combout\ = (\counter1|Add0~8_combout\ & ((\counter1|count\(1) & (\counter1|Add0~7\ & VCC)) # (!\counter1|count\(1) & (!\counter1|Add0~7\)))) # (!\counter1|Add0~8_combout\ & ((\counter1|count\(1) & (!\counter1|Add0~7\)) # 
-- (!\counter1|count\(1) & ((\counter1|Add0~7\) # (GND)))))
-- \counter1|Add0~10\ = CARRY((\counter1|Add0~8_combout\ & (!\counter1|count\(1) & !\counter1|Add0~7\)) # (!\counter1|Add0~8_combout\ & ((!\counter1|Add0~7\) # (!\counter1|count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|Add0~8_combout\,
	datab => \counter1|count\(1),
	datad => VCC,
	cin => \counter1|Add0~7\,
	combout => \counter1|Add0~9_combout\,
	cout => \counter1|Add0~10\);

-- Location: LCCOMB_X29_Y25_N22
\counter1|count~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count~8_combout\ = (\address[0]~input_o\ & ((\counter1|Equal0~0_combout\ & (\writedata[1]~input_o\)) # (!\counter1|Equal0~0_combout\ & ((\counter1|Add0~9_combout\))))) # (!\address[0]~input_o\ & (((\counter1|Add0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \writedata[1]~input_o\,
	datac => \counter1|Equal0~0_combout\,
	datad => \counter1|Add0~9_combout\,
	combout => \counter1|count~8_combout\);

-- Location: FF_X29_Y25_N23
\counter1|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|count~8_combout\,
	sclr => \ALT_INV_reset_n~input_o\,
	ena => \counter1|count[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|count\(1));

-- Location: LCCOMB_X31_Y25_N12
\counter1|Add0~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~11_combout\ = ((\counter1|Add0~8_combout\ $ (\counter1|count\(2) $ (!\counter1|Add0~10\)))) # (GND)
-- \counter1|Add0~12\ = CARRY((\counter1|Add0~8_combout\ & ((\counter1|count\(2)) # (!\counter1|Add0~10\))) # (!\counter1|Add0~8_combout\ & (\counter1|count\(2) & !\counter1|Add0~10\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|Add0~8_combout\,
	datab => \counter1|count\(2),
	datad => VCC,
	cin => \counter1|Add0~10\,
	combout => \counter1|Add0~11_combout\,
	cout => \counter1|Add0~12\);

-- Location: LCCOMB_X31_Y25_N6
\counter1|count~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count~7_combout\ = (\address[0]~input_o\ & ((\counter1|Equal0~0_combout\ & (\writedata[2]~input_o\)) # (!\counter1|Equal0~0_combout\ & ((\counter1|Add0~11_combout\))))) # (!\address[0]~input_o\ & (((\counter1|Add0~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \writedata[2]~input_o\,
	datac => \counter1|Equal0~0_combout\,
	datad => \counter1|Add0~11_combout\,
	combout => \counter1|count~7_combout\);

-- Location: FF_X31_Y25_N7
\counter1|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|count~7_combout\,
	sclr => \ALT_INV_reset_n~input_o\,
	ena => \counter1|count[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|count\(2));

-- Location: LCCOMB_X31_Y25_N14
\counter1|Add0~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~13_combout\ = (\counter1|Add0~8_combout\ & ((\counter1|count\(3) & (\counter1|Add0~12\ & VCC)) # (!\counter1|count\(3) & (!\counter1|Add0~12\)))) # (!\counter1|Add0~8_combout\ & ((\counter1|count\(3) & (!\counter1|Add0~12\)) # 
-- (!\counter1|count\(3) & ((\counter1|Add0~12\) # (GND)))))
-- \counter1|Add0~14\ = CARRY((\counter1|Add0~8_combout\ & (!\counter1|count\(3) & !\counter1|Add0~12\)) # (!\counter1|Add0~8_combout\ & ((!\counter1|Add0~12\) # (!\counter1|count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|Add0~8_combout\,
	datab => \counter1|count\(3),
	datad => VCC,
	cin => \counter1|Add0~12\,
	combout => \counter1|Add0~13_combout\,
	cout => \counter1|Add0~14\);

-- Location: LCCOMB_X31_Y25_N0
\counter1|count~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count~6_combout\ = (\counter1|Equal0~0_combout\ & ((\address[0]~input_o\ & (\writedata[3]~input_o\)) # (!\address[0]~input_o\ & ((\counter1|Add0~13_combout\))))) # (!\counter1|Equal0~0_combout\ & (((\counter1|Add0~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|Equal0~0_combout\,
	datab => \writedata[3]~input_o\,
	datac => \counter1|Add0~13_combout\,
	datad => \address[0]~input_o\,
	combout => \counter1|count~6_combout\);

-- Location: FF_X31_Y25_N1
\counter1|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|count~6_combout\,
	sclr => \ALT_INV_reset_n~input_o\,
	ena => \counter1|count[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|count\(3));

-- Location: LCCOMB_X31_Y25_N16
\counter1|Add0~15\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~15_combout\ = ((\counter1|Add0~8_combout\ $ (\counter1|count\(4) $ (!\counter1|Add0~14\)))) # (GND)
-- \counter1|Add0~16\ = CARRY((\counter1|Add0~8_combout\ & ((\counter1|count\(4)) # (!\counter1|Add0~14\))) # (!\counter1|Add0~8_combout\ & (\counter1|count\(4) & !\counter1|Add0~14\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|Add0~8_combout\,
	datab => \counter1|count\(4),
	datad => VCC,
	cin => \counter1|Add0~14\,
	combout => \counter1|Add0~15_combout\,
	cout => \counter1|Add0~16\);

-- Location: LCCOMB_X31_Y25_N2
\counter1|count~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count~5_combout\ = (\address[0]~input_o\ & ((\counter1|Equal0~0_combout\ & (\writedata[4]~input_o\)) # (!\counter1|Equal0~0_combout\ & ((\counter1|Add0~15_combout\))))) # (!\address[0]~input_o\ & (((\counter1|Add0~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \writedata[4]~input_o\,
	datac => \counter1|Equal0~0_combout\,
	datad => \counter1|Add0~15_combout\,
	combout => \counter1|count~5_combout\);

-- Location: FF_X31_Y25_N3
\counter1|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|count~5_combout\,
	sclr => \ALT_INV_reset_n~input_o\,
	ena => \counter1|count[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|count\(4));

-- Location: LCCOMB_X31_Y25_N18
\counter1|Add0~17\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~17_combout\ = (\counter1|Add0~8_combout\ & ((\counter1|count\(5) & (\counter1|Add0~16\ & VCC)) # (!\counter1|count\(5) & (!\counter1|Add0~16\)))) # (!\counter1|Add0~8_combout\ & ((\counter1|count\(5) & (!\counter1|Add0~16\)) # 
-- (!\counter1|count\(5) & ((\counter1|Add0~16\) # (GND)))))
-- \counter1|Add0~18\ = CARRY((\counter1|Add0~8_combout\ & (!\counter1|count\(5) & !\counter1|Add0~16\)) # (!\counter1|Add0~8_combout\ & ((!\counter1|Add0~16\) # (!\counter1|count\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|Add0~8_combout\,
	datab => \counter1|count\(5),
	datad => VCC,
	cin => \counter1|Add0~16\,
	combout => \counter1|Add0~17_combout\,
	cout => \counter1|Add0~18\);

-- Location: LCCOMB_X32_Y25_N18
\counter1|cnt[7]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|cnt[7]~0_combout\ = (!\counter1|Equal0~0_combout\ & (\controller1|enable~q\ & \reset_n~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \counter1|Equal0~0_combout\,
	datac => \controller1|enable~q\,
	datad => \reset_n~input_o\,
	combout => \counter1|cnt[7]~0_combout\);

-- Location: FF_X31_Y25_N19
\counter1|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|Add0~17_combout\,
	ena => \counter1|cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|cnt\(5));

-- Location: LCCOMB_X32_Y25_N26
\controller1|Equal2~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|Equal2~2_combout\ = (\counter1|cnt\(4) & (!\controller1|ocr\(4) & (\controller1|ocr\(5) $ (\counter1|cnt\(5))))) # (!\counter1|cnt\(4) & (\controller1|ocr\(4) & (\controller1|ocr\(5) $ (\counter1|cnt\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|cnt\(4),
	datab => \controller1|ocr\(4),
	datac => \controller1|ocr\(5),
	datad => \counter1|cnt\(5),
	combout => \controller1|Equal2~2_combout\);

-- Location: FF_X31_Y25_N13
\counter1|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|Add0~11_combout\,
	ena => \counter1|cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|cnt\(2));

-- Location: LCCOMB_X30_Y25_N28
\controller1|ocr~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr~3_combout\ = (!\writedata[2]~input_o\ & \reset_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \writedata[2]~input_o\,
	datad => \reset_n~input_o\,
	combout => \controller1|ocr~3_combout\);

-- Location: FF_X30_Y25_N1
\controller1|ocr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	asdata => \controller1|ocr~3_combout\,
	sload => VCC,
	ena => \controller1|ocr[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|ocr\(2));

-- Location: FF_X31_Y25_N15
\counter1|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|Add0~13_combout\,
	ena => \counter1|cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|cnt\(3));

-- Location: LCCOMB_X30_Y25_N0
\controller1|Equal2~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|Equal2~1_combout\ = (\controller1|ocr\(3) & (!\counter1|cnt\(3) & (\counter1|cnt\(2) $ (\controller1|ocr\(2))))) # (!\controller1|ocr\(3) & (\counter1|cnt\(3) & (\counter1|cnt\(2) $ (\controller1|ocr\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|ocr\(3),
	datab => \counter1|cnt\(2),
	datac => \controller1|ocr\(2),
	datad => \counter1|cnt\(3),
	combout => \controller1|Equal2~1_combout\);

-- Location: LCCOMB_X30_Y25_N24
\controller1|ocr~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr~7_combout\ = (!\writedata[6]~input_o\ & \reset_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \writedata[6]~input_o\,
	datad => \reset_n~input_o\,
	combout => \controller1|ocr~7_combout\);

-- Location: FF_X30_Y25_N25
\controller1|ocr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|ocr~7_combout\,
	ena => \controller1|ocr[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|ocr\(6));

-- Location: IOIBUF_X33_Y25_N1
\writedata[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(7),
	o => \writedata[7]~input_o\);

-- Location: LCCOMB_X29_Y25_N26
\controller1|ocr~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr~8_combout\ = (!\writedata[7]~input_o\ & \reset_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \writedata[7]~input_o\,
	datad => \reset_n~input_o\,
	combout => \controller1|ocr~8_combout\);

-- Location: FF_X30_Y25_N19
\controller1|ocr[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	asdata => \controller1|ocr~8_combout\,
	sload => VCC,
	ena => \controller1|ocr[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|ocr\(7));

-- Location: LCCOMB_X31_Y25_N28
\counter1|count~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count~2_combout\ = (\counter1|Equal0~0_combout\ & ((\address[0]~input_o\ & (\writedata[7]~input_o\)) # (!\address[0]~input_o\ & ((\counter1|Add0~21_combout\))))) # (!\counter1|Equal0~0_combout\ & (((\counter1|Add0~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|Equal0~0_combout\,
	datab => \writedata[7]~input_o\,
	datac => \counter1|Add0~21_combout\,
	datad => \address[0]~input_o\,
	combout => \counter1|count~2_combout\);

-- Location: FF_X31_Y25_N29
\counter1|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|count~2_combout\,
	sclr => \ALT_INV_reset_n~input_o\,
	ena => \counter1|count[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|count\(7));

-- Location: IOIBUF_X31_Y31_N8
\writedata[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(6),
	o => \writedata[6]~input_o\);

-- Location: LCCOMB_X31_Y25_N20
\counter1|Add0~19\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~19_combout\ = ((\counter1|Add0~8_combout\ $ (\counter1|count\(6) $ (!\counter1|Add0~18\)))) # (GND)
-- \counter1|Add0~20\ = CARRY((\counter1|Add0~8_combout\ & ((\counter1|count\(6)) # (!\counter1|Add0~18\))) # (!\counter1|Add0~8_combout\ & (\counter1|count\(6) & !\counter1|Add0~18\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|Add0~8_combout\,
	datab => \counter1|count\(6),
	datad => VCC,
	cin => \counter1|Add0~18\,
	combout => \counter1|Add0~19_combout\,
	cout => \counter1|Add0~20\);

-- Location: LCCOMB_X31_Y25_N26
\counter1|count~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count~3_combout\ = (\address[0]~input_o\ & ((\counter1|Equal0~0_combout\ & (\writedata[6]~input_o\)) # (!\counter1|Equal0~0_combout\ & ((\counter1|Add0~19_combout\))))) # (!\address[0]~input_o\ & (((\counter1|Add0~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \writedata[6]~input_o\,
	datac => \counter1|Equal0~0_combout\,
	datad => \counter1|Add0~19_combout\,
	combout => \counter1|count~3_combout\);

-- Location: FF_X31_Y25_N27
\counter1|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|count~3_combout\,
	sclr => \ALT_INV_reset_n~input_o\,
	ena => \counter1|count[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|count\(6));

-- Location: LCCOMB_X31_Y25_N22
\counter1|Add0~21\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~21_combout\ = \counter1|Add0~8_combout\ $ (\counter1|count\(7) $ (\counter1|Add0~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|Add0~8_combout\,
	datab => \counter1|count\(7),
	cin => \counter1|Add0~20\,
	combout => \counter1|Add0~21_combout\);

-- Location: FF_X31_Y25_N23
\counter1|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|Add0~21_combout\,
	ena => \counter1|cnt[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|cnt\(7));

-- Location: LCCOMB_X30_Y25_N18
\controller1|Equal2~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|Equal2~3_combout\ = (\counter1|cnt\(6) & (!\controller1|ocr\(6) & (\controller1|ocr\(7) $ (\counter1|cnt\(7))))) # (!\counter1|cnt\(6) & (\controller1|ocr\(6) & (\controller1|ocr\(7) $ (\counter1|cnt\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|cnt\(6),
	datab => \controller1|ocr\(6),
	datac => \controller1|ocr\(7),
	datad => \counter1|cnt\(7),
	combout => \controller1|Equal2~3_combout\);

-- Location: LCCOMB_X29_Y25_N12
\controller1|Equal2~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|Equal2~4_combout\ = (\controller1|Equal2~0_combout\ & (\controller1|Equal2~2_combout\ & (\controller1|Equal2~1_combout\ & \controller1|Equal2~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|Equal2~0_combout\,
	datab => \controller1|Equal2~2_combout\,
	datac => \controller1|Equal2~1_combout\,
	datad => \controller1|Equal2~3_combout\,
	combout => \controller1|Equal2~4_combout\);

-- Location: LCCOMB_X29_Y25_N4
\controller1|coe_export_pwmOut~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|coe_export_pwmOut~0_combout\ = (\controller1|control\(7) & ((\controller1|Equal2~4_combout\ & (\counter1|upDown~q\)) # (!\controller1|Equal2~4_combout\ & ((!\controller1|output~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|upDown~q\,
	datab => \controller1|control\(7),
	datac => \controller1|output~q\,
	datad => \controller1|Equal2~4_combout\,
	combout => \controller1|coe_export_pwmOut~0_combout\);

-- Location: LCCOMB_X30_Y27_N16
\controller1|coe_export_pwmOut~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|coe_export_pwmOut~1_combout\ = (\controller1|process_0~0_combout\ & (\controller1|coe_export_pwmOut~q\)) # (!\controller1|process_0~0_combout\ & ((\controller1|coe_export_pwmOut~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|process_0~0_combout\,
	datac => \controller1|coe_export_pwmOut~q\,
	datad => \controller1|coe_export_pwmOut~0_combout\,
	combout => \controller1|coe_export_pwmOut~1_combout\);

-- Location: FF_X30_Y27_N17
\controller1|coe_export_pwmOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|coe_export_pwmOut~1_combout\,
	asdata => VCC,
	sload => \ALT_INV_reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|coe_export_pwmOut~q\);

ww_coe_export_pwmOut <= \coe_export_pwmOut~output_o\;
END structure;


