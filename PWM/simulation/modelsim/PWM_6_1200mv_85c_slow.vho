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

-- DATE "12/12/2012 18:04:09"

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
-- address[1]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address[0]	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- chipselect	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_n	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[0]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[1]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[2]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[3]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[4]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[5]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[6]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[7]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL \clkdiv1|count[0]~20_combout\ : std_logic;
SIGNAL \clkdiv1|count[5]~30_combout\ : std_logic;
SIGNAL \clkdiv1|count[13]~46_combout\ : std_logic;
SIGNAL \clkdiv1|count[16]~52_combout\ : std_logic;
SIGNAL \controller1|Equal1~1_combout\ : std_logic;
SIGNAL \controller1|output~q\ : std_logic;
SIGNAL \controller1|ocr[1]~1_combout\ : std_logic;
SIGNAL \controller1|ocr[2]~2_combout\ : std_logic;
SIGNAL \controller1|ocr[3]~3_combout\ : std_logic;
SIGNAL \controller1|ocr[5]~5_combout\ : std_logic;
SIGNAL \controller1|ocr[1]~8_combout\ : std_logic;
SIGNAL \controller1|output~0_combout\ : std_logic;
SIGNAL \address[0]~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \writedata[1]~input_o\ : std_logic;
SIGNAL \writedata[2]~input_o\ : std_logic;
SIGNAL \writedata[3]~input_o\ : std_logic;
SIGNAL \writedata[5]~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \coe_export_pwmOut~output_o\ : std_logic;
SIGNAL \clkdiv1|count[0]~21\ : std_logic;
SIGNAL \clkdiv1|count[1]~22_combout\ : std_logic;
SIGNAL \clkdiv1|count[15]~50_combout\ : std_logic;
SIGNAL \clkdiv1|count[18]~56_combout\ : std_logic;
SIGNAL \clkdiv1|LessThan1~3_combout\ : std_logic;
SIGNAL \clkdiv1|count[7]~34_combout\ : std_logic;
SIGNAL \clkdiv1|LessThan0~0_combout\ : std_logic;
SIGNAL \clkdiv1|count[12]~44_combout\ : std_logic;
SIGNAL \clkdiv1|LessThan1~1_combout\ : std_logic;
SIGNAL \clkdiv1|LessThan0~1_combout\ : std_logic;
SIGNAL \clkdiv1|LessThan0~2_combout\ : std_logic;
SIGNAL \clkdiv1|count[1]~23\ : std_logic;
SIGNAL \clkdiv1|count[2]~24_combout\ : std_logic;
SIGNAL \clkdiv1|count[2]~25\ : std_logic;
SIGNAL \clkdiv1|count[3]~26_combout\ : std_logic;
SIGNAL \clkdiv1|count[3]~27\ : std_logic;
SIGNAL \clkdiv1|count[4]~28_combout\ : std_logic;
SIGNAL \clkdiv1|count[4]~29\ : std_logic;
SIGNAL \clkdiv1|count[5]~31\ : std_logic;
SIGNAL \clkdiv1|count[6]~32_combout\ : std_logic;
SIGNAL \clkdiv1|count[6]~33\ : std_logic;
SIGNAL \clkdiv1|count[7]~35\ : std_logic;
SIGNAL \clkdiv1|count[8]~36_combout\ : std_logic;
SIGNAL \clkdiv1|count[8]~37\ : std_logic;
SIGNAL \clkdiv1|count[9]~39\ : std_logic;
SIGNAL \clkdiv1|count[10]~40_combout\ : std_logic;
SIGNAL \clkdiv1|count[10]~41\ : std_logic;
SIGNAL \clkdiv1|count[11]~42_combout\ : std_logic;
SIGNAL \clkdiv1|count[11]~43\ : std_logic;
SIGNAL \clkdiv1|count[12]~45\ : std_logic;
SIGNAL \clkdiv1|count[13]~47\ : std_logic;
SIGNAL \clkdiv1|count[14]~48_combout\ : std_logic;
SIGNAL \clkdiv1|count[14]~49\ : std_logic;
SIGNAL \clkdiv1|count[15]~51\ : std_logic;
SIGNAL \clkdiv1|count[16]~53\ : std_logic;
SIGNAL \clkdiv1|count[17]~54_combout\ : std_logic;
SIGNAL \clkdiv1|count[17]~55\ : std_logic;
SIGNAL \clkdiv1|count[18]~57\ : std_logic;
SIGNAL \clkdiv1|count[19]~58_combout\ : std_logic;
SIGNAL \clkdiv1|count[9]~38_combout\ : std_logic;
SIGNAL \clkdiv1|LessThan1~0_combout\ : std_logic;
SIGNAL \clkdiv1|LessThan1~2_combout\ : std_logic;
SIGNAL \clkdiv1|LessThan1~4_combout\ : std_logic;
SIGNAL \clkdiv1|LessThan1~5_combout\ : std_logic;
SIGNAL \clkdiv1|clk_out~q\ : std_logic;
SIGNAL \clkdiv1|clk_out~clkctrl_outclk\ : std_logic;
SIGNAL \reset_n~input_o\ : std_logic;
SIGNAL \counter1|Add0~2\ : std_logic;
SIGNAL \counter1|Add0~4\ : std_logic;
SIGNAL \counter1|Add0~6\ : std_logic;
SIGNAL \counter1|Add0~7_combout\ : std_logic;
SIGNAL \counter1|count~3_combout\ : std_logic;
SIGNAL \counter1|Add0~5_combout\ : std_logic;
SIGNAL \counter1|count~2_combout\ : std_logic;
SIGNAL \counter1|upDown~0_combout\ : std_logic;
SIGNAL \counter1|Add0~8\ : std_logic;
SIGNAL \counter1|Add0~9_combout\ : std_logic;
SIGNAL \counter1|count~4_combout\ : std_logic;
SIGNAL \counter1|Add0~10\ : std_logic;
SIGNAL \counter1|Add0~12\ : std_logic;
SIGNAL \counter1|Add0~14\ : std_logic;
SIGNAL \counter1|Add0~15_combout\ : std_logic;
SIGNAL \counter1|count~7_combout\ : std_logic;
SIGNAL \counter1|Add0~13_combout\ : std_logic;
SIGNAL \counter1|count~6_combout\ : std_logic;
SIGNAL \counter1|upDown~1_combout\ : std_logic;
SIGNAL \counter1|upDown~2_combout\ : std_logic;
SIGNAL \counter1|upDown~5_combout\ : std_logic;
SIGNAL \counter1|Add0~3_combout\ : std_logic;
SIGNAL \counter1|count~1_combout\ : std_logic;
SIGNAL \counter1|Add0~1_combout\ : std_logic;
SIGNAL \counter1|count~0_combout\ : std_logic;
SIGNAL \counter1|upDown~3_combout\ : std_logic;
SIGNAL \counter1|Add0~11_combout\ : std_logic;
SIGNAL \counter1|count~5_combout\ : std_logic;
SIGNAL \counter1|upDown~4_combout\ : std_logic;
SIGNAL \counter1|upDown~6_combout\ : std_logic;
SIGNAL \counter1|upDown~q\ : std_logic;
SIGNAL \write~input_o\ : std_logic;
SIGNAL \address[1]~input_o\ : std_logic;
SIGNAL \chipselect~input_o\ : std_logic;
SIGNAL \controller1|process_0~0_combout\ : std_logic;
SIGNAL \writedata[4]~input_o\ : std_logic;
SIGNAL \controller1|ocr[4]~4_combout\ : std_logic;
SIGNAL \controller1|Equal1~2_combout\ : std_logic;
SIGNAL \counter1|cnt[0]~feeder_combout\ : std_logic;
SIGNAL \writedata[0]~input_o\ : std_logic;
SIGNAL \controller1|ocr[0]~0_combout\ : std_logic;
SIGNAL \controller1|Equal1~0_combout\ : std_logic;
SIGNAL \writedata[7]~input_o\ : std_logic;
SIGNAL \controller1|ocr[7]~7_combout\ : std_logic;
SIGNAL \writedata[6]~input_o\ : std_logic;
SIGNAL \controller1|ocr[6]~6_combout\ : std_logic;
SIGNAL \controller1|Equal1~3_combout\ : std_logic;
SIGNAL \controller1|Equal1~4_combout\ : std_logic;
SIGNAL \controller1|coe_export_pwmOut~0_combout\ : std_logic;
SIGNAL \controller1|coe_export_pwmOut~1_combout\ : std_logic;
SIGNAL \controller1|coe_export_pwmOut~feeder_combout\ : std_logic;
SIGNAL \controller1|coe_export_pwmOut~q\ : std_logic;
SIGNAL \clkdiv1|count\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \counter1|count\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \counter1|cnt\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \controller1|ocr\ : std_logic_vector(7 DOWNTO 0);
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

-- Location: FF_X32_Y17_N23
\clkdiv1|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[5]~30_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(5));

-- Location: FF_X32_Y16_N13
\clkdiv1|count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[16]~52_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(16));

-- Location: FF_X32_Y16_N7
\clkdiv1|count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[13]~46_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(13));

-- Location: FF_X32_Y17_N13
\clkdiv1|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[0]~20_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(0));

-- Location: LCCOMB_X32_Y17_N12
\clkdiv1|count[0]~20\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[0]~20_combout\ = \clkdiv1|count\(0) $ (VCC)
-- \clkdiv1|count[0]~21\ = CARRY(\clkdiv1|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(0),
	datad => VCC,
	combout => \clkdiv1|count[0]~20_combout\,
	cout => \clkdiv1|count[0]~21\);

-- Location: LCCOMB_X32_Y17_N22
\clkdiv1|count[5]~30\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[5]~30_combout\ = (\clkdiv1|count\(5) & (!\clkdiv1|count[4]~29\)) # (!\clkdiv1|count\(5) & ((\clkdiv1|count[4]~29\) # (GND)))
-- \clkdiv1|count[5]~31\ = CARRY((!\clkdiv1|count[4]~29\) # (!\clkdiv1|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(5),
	datad => VCC,
	cin => \clkdiv1|count[4]~29\,
	combout => \clkdiv1|count[5]~30_combout\,
	cout => \clkdiv1|count[5]~31\);

-- Location: LCCOMB_X32_Y16_N6
\clkdiv1|count[13]~46\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[13]~46_combout\ = (\clkdiv1|count\(13) & (!\clkdiv1|count[12]~45\)) # (!\clkdiv1|count\(13) & ((\clkdiv1|count[12]~45\) # (GND)))
-- \clkdiv1|count[13]~47\ = CARRY((!\clkdiv1|count[12]~45\) # (!\clkdiv1|count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(13),
	datad => VCC,
	cin => \clkdiv1|count[12]~45\,
	combout => \clkdiv1|count[13]~46_combout\,
	cout => \clkdiv1|count[13]~47\);

-- Location: LCCOMB_X32_Y16_N12
\clkdiv1|count[16]~52\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[16]~52_combout\ = (\clkdiv1|count\(16) & (\clkdiv1|count[15]~51\ $ (GND))) # (!\clkdiv1|count\(16) & (!\clkdiv1|count[15]~51\ & VCC))
-- \clkdiv1|count[16]~53\ = CARRY((\clkdiv1|count\(16) & !\clkdiv1|count[15]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(16),
	datad => VCC,
	cin => \clkdiv1|count[15]~51\,
	combout => \clkdiv1|count[16]~52_combout\,
	cout => \clkdiv1|count[16]~53\);

-- Location: FF_X30_Y30_N11
\controller1|ocr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|ocr[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|ocr\(1));

-- Location: FF_X31_Y30_N13
\counter1|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|Add0~5_combout\,
	ena => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|cnt\(2));

-- Location: FF_X30_Y30_N23
\controller1|ocr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|ocr[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|ocr\(2));

-- Location: FF_X31_Y30_N15
\counter1|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|Add0~7_combout\,
	ena => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|cnt\(3));

-- Location: FF_X30_Y30_N25
\controller1|ocr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|ocr[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|ocr\(3));

-- Location: LCCOMB_X30_Y30_N26
\controller1|Equal1~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|Equal1~1_combout\ = (\controller1|ocr\(2) & (!\counter1|cnt\(2) & (\counter1|cnt\(3) $ (\controller1|ocr\(3))))) # (!\controller1|ocr\(2) & (\counter1|cnt\(2) & (\counter1|cnt\(3) $ (\controller1|ocr\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|ocr\(2),
	datab => \counter1|cnt\(3),
	datac => \counter1|cnt\(2),
	datad => \controller1|ocr\(3),
	combout => \controller1|Equal1~1_combout\);

-- Location: FF_X30_Y30_N7
\controller1|ocr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|ocr[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|ocr\(5));

-- Location: FF_X31_Y30_N25
\counter1|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	asdata => \counter1|Add0~13_combout\,
	sload => VCC,
	ena => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|cnt\(6));

-- Location: FF_X30_Y30_N13
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

-- Location: LCCOMB_X30_Y30_N10
\controller1|ocr[1]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr[1]~1_combout\ = (\reset_n~input_o\ & ((\controller1|process_0~0_combout\ & ((\controller1|ocr\(1)))) # (!\controller1|process_0~0_combout\ & (!\writedata[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|process_0~0_combout\,
	datab => \writedata[1]~input_o\,
	datac => \controller1|ocr\(1),
	datad => \reset_n~input_o\,
	combout => \controller1|ocr[1]~1_combout\);

-- Location: LCCOMB_X30_Y30_N22
\controller1|ocr[2]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr[2]~2_combout\ = (\reset_n~input_o\ & ((\controller1|process_0~0_combout\ & ((\controller1|ocr\(2)))) # (!\controller1|process_0~0_combout\ & (!\writedata[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|process_0~0_combout\,
	datab => \writedata[2]~input_o\,
	datac => \controller1|ocr\(2),
	datad => \reset_n~input_o\,
	combout => \controller1|ocr[2]~2_combout\);

-- Location: LCCOMB_X30_Y30_N24
\controller1|ocr[3]~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr[3]~3_combout\ = (\reset_n~input_o\ & ((\controller1|process_0~0_combout\ & ((\controller1|ocr\(3)))) # (!\controller1|process_0~0_combout\ & (!\writedata[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|process_0~0_combout\,
	datab => \writedata[3]~input_o\,
	datac => \controller1|ocr\(3),
	datad => \reset_n~input_o\,
	combout => \controller1|ocr[3]~3_combout\);

-- Location: LCCOMB_X30_Y30_N6
\controller1|ocr[5]~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr[5]~5_combout\ = (\reset_n~input_o\ & ((\controller1|process_0~0_combout\ & ((\controller1|ocr\(5)))) # (!\controller1|process_0~0_combout\ & (!\writedata[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|process_0~0_combout\,
	datab => \writedata[5]~input_o\,
	datac => \controller1|ocr\(5),
	datad => \reset_n~input_o\,
	combout => \controller1|ocr[5]~5_combout\);

-- Location: LCCOMB_X30_Y30_N2
\controller1|ocr[1]~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr[1]~8_combout\ = (\controller1|process_0~0_combout\ & \reset_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \controller1|process_0~0_combout\,
	datad => \reset_n~input_o\,
	combout => \controller1|ocr[1]~8_combout\);

-- Location: LCCOMB_X30_Y30_N12
\controller1|output~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|output~0_combout\ = (\controller1|ocr[1]~8_combout\ & ((\controller1|Equal1~4_combout\ & (!\counter1|upDown~q\)) # (!\controller1|Equal1~4_combout\ & ((\controller1|output~q\))))) # (!\controller1|ocr[1]~8_combout\ & 
-- (((\controller1|output~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|upDown~q\,
	datab => \controller1|ocr[1]~8_combout\,
	datac => \controller1|output~q\,
	datad => \controller1|Equal1~4_combout\,
	combout => \controller1|output~0_combout\);

-- Location: IOIBUF_X16_Y0_N1
\address[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(0),
	o => \address[0]~input_o\);

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

-- Location: IOIBUF_X31_Y31_N8
\writedata[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(1),
	o => \writedata[1]~input_o\);

-- Location: IOIBUF_X33_Y28_N8
\writedata[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(2),
	o => \writedata[2]~input_o\);

-- Location: IOIBUF_X26_Y31_N8
\writedata[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(3),
	o => \writedata[3]~input_o\);

-- Location: IOIBUF_X29_Y31_N8
\writedata[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(5),
	o => \writedata[5]~input_o\);

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

-- Location: LCCOMB_X32_Y17_N14
\clkdiv1|count[1]~22\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[1]~22_combout\ = (\clkdiv1|count\(1) & (!\clkdiv1|count[0]~21\)) # (!\clkdiv1|count\(1) & ((\clkdiv1|count[0]~21\) # (GND)))
-- \clkdiv1|count[1]~23\ = CARRY((!\clkdiv1|count[0]~21\) # (!\clkdiv1|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(1),
	datad => VCC,
	cin => \clkdiv1|count[0]~21\,
	combout => \clkdiv1|count[1]~22_combout\,
	cout => \clkdiv1|count[1]~23\);

-- Location: LCCOMB_X32_Y16_N10
\clkdiv1|count[15]~50\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[15]~50_combout\ = (\clkdiv1|count\(15) & (!\clkdiv1|count[14]~49\)) # (!\clkdiv1|count\(15) & ((\clkdiv1|count[14]~49\) # (GND)))
-- \clkdiv1|count[15]~51\ = CARRY((!\clkdiv1|count[14]~49\) # (!\clkdiv1|count\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(15),
	datad => VCC,
	cin => \clkdiv1|count[14]~49\,
	combout => \clkdiv1|count[15]~50_combout\,
	cout => \clkdiv1|count[15]~51\);

-- Location: FF_X32_Y16_N11
\clkdiv1|count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[15]~50_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(15));

-- Location: LCCOMB_X32_Y16_N16
\clkdiv1|count[18]~56\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[18]~56_combout\ = (\clkdiv1|count\(18) & (\clkdiv1|count[17]~55\ $ (GND))) # (!\clkdiv1|count\(18) & (!\clkdiv1|count[17]~55\ & VCC))
-- \clkdiv1|count[18]~57\ = CARRY((\clkdiv1|count\(18) & !\clkdiv1|count[17]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(18),
	datad => VCC,
	cin => \clkdiv1|count[17]~55\,
	combout => \clkdiv1|count[18]~56_combout\,
	cout => \clkdiv1|count[18]~57\);

-- Location: FF_X32_Y16_N17
\clkdiv1|count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[18]~56_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(18));

-- Location: LCCOMB_X32_Y16_N30
\clkdiv1|LessThan1~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|LessThan1~3_combout\ = (\clkdiv1|count\(16) & (\clkdiv1|count\(17) & \clkdiv1|count\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(16),
	datac => \clkdiv1|count\(17),
	datad => \clkdiv1|count\(18),
	combout => \clkdiv1|LessThan1~3_combout\);

-- Location: LCCOMB_X32_Y17_N26
\clkdiv1|count[7]~34\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[7]~34_combout\ = (\clkdiv1|count\(7) & (!\clkdiv1|count[6]~33\)) # (!\clkdiv1|count\(7) & ((\clkdiv1|count[6]~33\) # (GND)))
-- \clkdiv1|count[7]~35\ = CARRY((!\clkdiv1|count[6]~33\) # (!\clkdiv1|count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(7),
	datad => VCC,
	cin => \clkdiv1|count[6]~33\,
	combout => \clkdiv1|count[7]~34_combout\,
	cout => \clkdiv1|count[7]~35\);

-- Location: FF_X32_Y17_N27
\clkdiv1|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[7]~34_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(7));

-- Location: LCCOMB_X32_Y17_N2
\clkdiv1|LessThan0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|LessThan0~0_combout\ = ((!\clkdiv1|count\(6) & (!\clkdiv1|count\(7) & !\clkdiv1|count\(8)))) # (!\clkdiv1|count\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(9),
	datab => \clkdiv1|count\(6),
	datac => \clkdiv1|count\(7),
	datad => \clkdiv1|count\(8),
	combout => \clkdiv1|LessThan0~0_combout\);

-- Location: LCCOMB_X32_Y16_N4
\clkdiv1|count[12]~44\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[12]~44_combout\ = (\clkdiv1|count\(12) & (\clkdiv1|count[11]~43\ $ (GND))) # (!\clkdiv1|count\(12) & (!\clkdiv1|count[11]~43\ & VCC))
-- \clkdiv1|count[12]~45\ = CARRY((\clkdiv1|count\(12) & !\clkdiv1|count[11]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(12),
	datad => VCC,
	cin => \clkdiv1|count[11]~43\,
	combout => \clkdiv1|count[12]~44_combout\,
	cout => \clkdiv1|count[12]~45\);

-- Location: FF_X32_Y16_N5
\clkdiv1|count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[12]~44_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(12));

-- Location: LCCOMB_X32_Y16_N24
\clkdiv1|LessThan1~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|LessThan1~1_combout\ = (!\clkdiv1|count\(11) & (!\clkdiv1|count\(12) & !\clkdiv1|count\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(11),
	datac => \clkdiv1|count\(12),
	datad => \clkdiv1|count\(10),
	combout => \clkdiv1|LessThan1~1_combout\);

-- Location: LCCOMB_X32_Y17_N0
\clkdiv1|LessThan0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|LessThan0~1_combout\ = ((!\clkdiv1|count\(13) & (\clkdiv1|LessThan0~0_combout\ & \clkdiv1|LessThan1~1_combout\))) # (!\clkdiv1|count\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(13),
	datab => \clkdiv1|LessThan0~0_combout\,
	datac => \clkdiv1|count\(14),
	datad => \clkdiv1|LessThan1~1_combout\,
	combout => \clkdiv1|LessThan0~1_combout\);

-- Location: LCCOMB_X32_Y17_N6
\clkdiv1|LessThan0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|LessThan0~2_combout\ = (\clkdiv1|count\(19) & (\clkdiv1|LessThan1~3_combout\ & ((\clkdiv1|count\(15)) # (!\clkdiv1|LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(19),
	datab => \clkdiv1|count\(15),
	datac => \clkdiv1|LessThan1~3_combout\,
	datad => \clkdiv1|LessThan0~1_combout\,
	combout => \clkdiv1|LessThan0~2_combout\);

-- Location: FF_X32_Y17_N15
\clkdiv1|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[1]~22_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(1));

-- Location: LCCOMB_X32_Y17_N16
\clkdiv1|count[2]~24\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[2]~24_combout\ = (\clkdiv1|count\(2) & (\clkdiv1|count[1]~23\ $ (GND))) # (!\clkdiv1|count\(2) & (!\clkdiv1|count[1]~23\ & VCC))
-- \clkdiv1|count[2]~25\ = CARRY((\clkdiv1|count\(2) & !\clkdiv1|count[1]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(2),
	datad => VCC,
	cin => \clkdiv1|count[1]~23\,
	combout => \clkdiv1|count[2]~24_combout\,
	cout => \clkdiv1|count[2]~25\);

-- Location: FF_X32_Y17_N17
\clkdiv1|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[2]~24_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(2));

-- Location: LCCOMB_X32_Y17_N18
\clkdiv1|count[3]~26\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[3]~26_combout\ = (\clkdiv1|count\(3) & (!\clkdiv1|count[2]~25\)) # (!\clkdiv1|count\(3) & ((\clkdiv1|count[2]~25\) # (GND)))
-- \clkdiv1|count[3]~27\ = CARRY((!\clkdiv1|count[2]~25\) # (!\clkdiv1|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(3),
	datad => VCC,
	cin => \clkdiv1|count[2]~25\,
	combout => \clkdiv1|count[3]~26_combout\,
	cout => \clkdiv1|count[3]~27\);

-- Location: FF_X32_Y17_N19
\clkdiv1|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[3]~26_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(3));

-- Location: LCCOMB_X32_Y17_N20
\clkdiv1|count[4]~28\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[4]~28_combout\ = (\clkdiv1|count\(4) & (\clkdiv1|count[3]~27\ $ (GND))) # (!\clkdiv1|count\(4) & (!\clkdiv1|count[3]~27\ & VCC))
-- \clkdiv1|count[4]~29\ = CARRY((\clkdiv1|count\(4) & !\clkdiv1|count[3]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(4),
	datad => VCC,
	cin => \clkdiv1|count[3]~27\,
	combout => \clkdiv1|count[4]~28_combout\,
	cout => \clkdiv1|count[4]~29\);

-- Location: FF_X32_Y17_N21
\clkdiv1|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[4]~28_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(4));

-- Location: LCCOMB_X32_Y17_N24
\clkdiv1|count[6]~32\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[6]~32_combout\ = (\clkdiv1|count\(6) & (\clkdiv1|count[5]~31\ $ (GND))) # (!\clkdiv1|count\(6) & (!\clkdiv1|count[5]~31\ & VCC))
-- \clkdiv1|count[6]~33\ = CARRY((\clkdiv1|count\(6) & !\clkdiv1|count[5]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(6),
	datad => VCC,
	cin => \clkdiv1|count[5]~31\,
	combout => \clkdiv1|count[6]~32_combout\,
	cout => \clkdiv1|count[6]~33\);

-- Location: FF_X32_Y17_N25
\clkdiv1|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[6]~32_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(6));

-- Location: LCCOMB_X32_Y17_N28
\clkdiv1|count[8]~36\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[8]~36_combout\ = (\clkdiv1|count\(8) & (\clkdiv1|count[7]~35\ $ (GND))) # (!\clkdiv1|count\(8) & (!\clkdiv1|count[7]~35\ & VCC))
-- \clkdiv1|count[8]~37\ = CARRY((\clkdiv1|count\(8) & !\clkdiv1|count[7]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(8),
	datad => VCC,
	cin => \clkdiv1|count[7]~35\,
	combout => \clkdiv1|count[8]~36_combout\,
	cout => \clkdiv1|count[8]~37\);

-- Location: FF_X32_Y17_N29
\clkdiv1|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[8]~36_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(8));

-- Location: LCCOMB_X32_Y17_N30
\clkdiv1|count[9]~38\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[9]~38_combout\ = (\clkdiv1|count\(9) & (!\clkdiv1|count[8]~37\)) # (!\clkdiv1|count\(9) & ((\clkdiv1|count[8]~37\) # (GND)))
-- \clkdiv1|count[9]~39\ = CARRY((!\clkdiv1|count[8]~37\) # (!\clkdiv1|count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(9),
	datad => VCC,
	cin => \clkdiv1|count[8]~37\,
	combout => \clkdiv1|count[9]~38_combout\,
	cout => \clkdiv1|count[9]~39\);

-- Location: LCCOMB_X32_Y16_N0
\clkdiv1|count[10]~40\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[10]~40_combout\ = (\clkdiv1|count\(10) & (\clkdiv1|count[9]~39\ $ (GND))) # (!\clkdiv1|count\(10) & (!\clkdiv1|count[9]~39\ & VCC))
-- \clkdiv1|count[10]~41\ = CARRY((\clkdiv1|count\(10) & !\clkdiv1|count[9]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(10),
	datad => VCC,
	cin => \clkdiv1|count[9]~39\,
	combout => \clkdiv1|count[10]~40_combout\,
	cout => \clkdiv1|count[10]~41\);

-- Location: FF_X32_Y16_N1
\clkdiv1|count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[10]~40_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(10));

-- Location: LCCOMB_X32_Y16_N2
\clkdiv1|count[11]~42\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[11]~42_combout\ = (\clkdiv1|count\(11) & (!\clkdiv1|count[10]~41\)) # (!\clkdiv1|count\(11) & ((\clkdiv1|count[10]~41\) # (GND)))
-- \clkdiv1|count[11]~43\ = CARRY((!\clkdiv1|count[10]~41\) # (!\clkdiv1|count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(11),
	datad => VCC,
	cin => \clkdiv1|count[10]~41\,
	combout => \clkdiv1|count[11]~42_combout\,
	cout => \clkdiv1|count[11]~43\);

-- Location: FF_X32_Y16_N3
\clkdiv1|count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[11]~42_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(11));

-- Location: LCCOMB_X32_Y16_N8
\clkdiv1|count[14]~48\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[14]~48_combout\ = (\clkdiv1|count\(14) & (\clkdiv1|count[13]~47\ $ (GND))) # (!\clkdiv1|count\(14) & (!\clkdiv1|count[13]~47\ & VCC))
-- \clkdiv1|count[14]~49\ = CARRY((\clkdiv1|count\(14) & !\clkdiv1|count[13]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(14),
	datad => VCC,
	cin => \clkdiv1|count[13]~47\,
	combout => \clkdiv1|count[14]~48_combout\,
	cout => \clkdiv1|count[14]~49\);

-- Location: FF_X32_Y16_N9
\clkdiv1|count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[14]~48_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(14));

-- Location: LCCOMB_X32_Y16_N14
\clkdiv1|count[17]~54\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[17]~54_combout\ = (\clkdiv1|count\(17) & (!\clkdiv1|count[16]~53\)) # (!\clkdiv1|count\(17) & ((\clkdiv1|count[16]~53\) # (GND)))
-- \clkdiv1|count[17]~55\ = CARRY((!\clkdiv1|count[16]~53\) # (!\clkdiv1|count\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \clkdiv1|count\(17),
	datad => VCC,
	cin => \clkdiv1|count[16]~53\,
	combout => \clkdiv1|count[17]~54_combout\,
	cout => \clkdiv1|count[17]~55\);

-- Location: FF_X32_Y16_N15
\clkdiv1|count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[17]~54_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(17));

-- Location: LCCOMB_X32_Y16_N18
\clkdiv1|count[19]~58\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|count[19]~58_combout\ = \clkdiv1|count[18]~57\ $ (\clkdiv1|count\(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \clkdiv1|count\(19),
	cin => \clkdiv1|count[18]~57\,
	combout => \clkdiv1|count[19]~58_combout\);

-- Location: FF_X32_Y16_N19
\clkdiv1|count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[19]~58_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(19));

-- Location: FF_X32_Y17_N31
\clkdiv1|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|count[9]~38_combout\,
	sclr => \clkdiv1|LessThan0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|count\(9));

-- Location: LCCOMB_X32_Y17_N8
\clkdiv1|LessThan1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|LessThan1~0_combout\ = ((!\clkdiv1|count\(5) & (!\clkdiv1|count\(6) & !\clkdiv1|count\(7)))) # (!\clkdiv1|count\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(5),
	datab => \clkdiv1|count\(6),
	datac => \clkdiv1|count\(7),
	datad => \clkdiv1|count\(8),
	combout => \clkdiv1|LessThan1~0_combout\);

-- Location: LCCOMB_X32_Y16_N28
\clkdiv1|LessThan1~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|LessThan1~2_combout\ = (!\clkdiv1|count\(14) & (\clkdiv1|LessThan1~1_combout\ & (!\clkdiv1|count\(9) & \clkdiv1|LessThan1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(14),
	datab => \clkdiv1|LessThan1~1_combout\,
	datac => \clkdiv1|count\(9),
	datad => \clkdiv1|LessThan1~0_combout\,
	combout => \clkdiv1|LessThan1~2_combout\);

-- Location: LCCOMB_X32_Y16_N20
\clkdiv1|LessThan1~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|LessThan1~4_combout\ = ((\clkdiv1|LessThan1~2_combout\) # (!\clkdiv1|LessThan1~3_combout\)) # (!\clkdiv1|count\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(15),
	datac => \clkdiv1|LessThan1~3_combout\,
	datad => \clkdiv1|LessThan1~2_combout\,
	combout => \clkdiv1|LessThan1~4_combout\);

-- Location: LCCOMB_X32_Y16_N22
\clkdiv1|LessThan1~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clkdiv1|LessThan1~5_combout\ = (\clkdiv1|count\(19)) # ((!\clkdiv1|LessThan1~4_combout\ & ((\clkdiv1|count\(13)) # (\clkdiv1|count\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clkdiv1|count\(13),
	datab => \clkdiv1|count\(19),
	datac => \clkdiv1|count\(14),
	datad => \clkdiv1|LessThan1~4_combout\,
	combout => \clkdiv1|LessThan1~5_combout\);

-- Location: FF_X32_Y16_N23
\clkdiv1|clk_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clkdiv1|LessThan1~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkdiv1|clk_out~q\);

-- Location: CLKCTRL_G5
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

-- Location: IOIBUF_X33_Y28_N1
\reset_n~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_n,
	o => \reset_n~input_o\);

-- Location: LCCOMB_X31_Y30_N8
\counter1|Add0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~1_combout\ = \counter1|count\(0) $ (VCC)
-- \counter1|Add0~2\ = CARRY(\counter1|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|count\(0),
	datad => VCC,
	combout => \counter1|Add0~1_combout\,
	cout => \counter1|Add0~2\);

-- Location: LCCOMB_X31_Y30_N10
\counter1|Add0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~3_combout\ = (\counter1|count\(1) & ((\counter1|upDown~5_combout\ & (\counter1|Add0~2\ & VCC)) # (!\counter1|upDown~5_combout\ & (!\counter1|Add0~2\)))) # (!\counter1|count\(1) & ((\counter1|upDown~5_combout\ & (!\counter1|Add0~2\)) # 
-- (!\counter1|upDown~5_combout\ & ((\counter1|Add0~2\) # (GND)))))
-- \counter1|Add0~4\ = CARRY((\counter1|count\(1) & (!\counter1|upDown~5_combout\ & !\counter1|Add0~2\)) # (!\counter1|count\(1) & ((!\counter1|Add0~2\) # (!\counter1|upDown~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|count\(1),
	datab => \counter1|upDown~5_combout\,
	datad => VCC,
	cin => \counter1|Add0~2\,
	combout => \counter1|Add0~3_combout\,
	cout => \counter1|Add0~4\);

-- Location: LCCOMB_X31_Y30_N12
\counter1|Add0~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~5_combout\ = ((\counter1|count\(2) $ (\counter1|upDown~5_combout\ $ (!\counter1|Add0~4\)))) # (GND)
-- \counter1|Add0~6\ = CARRY((\counter1|count\(2) & ((\counter1|upDown~5_combout\) # (!\counter1|Add0~4\))) # (!\counter1|count\(2) & (\counter1|upDown~5_combout\ & !\counter1|Add0~4\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|count\(2),
	datab => \counter1|upDown~5_combout\,
	datad => VCC,
	cin => \counter1|Add0~4\,
	combout => \counter1|Add0~5_combout\,
	cout => \counter1|Add0~6\);

-- Location: LCCOMB_X31_Y30_N14
\counter1|Add0~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~7_combout\ = (\counter1|count\(3) & ((\counter1|upDown~5_combout\ & (\counter1|Add0~6\ & VCC)) # (!\counter1|upDown~5_combout\ & (!\counter1|Add0~6\)))) # (!\counter1|count\(3) & ((\counter1|upDown~5_combout\ & (!\counter1|Add0~6\)) # 
-- (!\counter1|upDown~5_combout\ & ((\counter1|Add0~6\) # (GND)))))
-- \counter1|Add0~8\ = CARRY((\counter1|count\(3) & (!\counter1|upDown~5_combout\ & !\counter1|Add0~6\)) # (!\counter1|count\(3) & ((!\counter1|Add0~6\) # (!\counter1|upDown~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|count\(3),
	datab => \counter1|upDown~5_combout\,
	datad => VCC,
	cin => \counter1|Add0~6\,
	combout => \counter1|Add0~7_combout\,
	cout => \counter1|Add0~8\);

-- Location: LCCOMB_X31_Y30_N2
\counter1|count~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count~3_combout\ = (\reset_n~input_o\ & \counter1|Add0~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset_n~input_o\,
	datac => \counter1|Add0~7_combout\,
	combout => \counter1|count~3_combout\);

-- Location: FF_X31_Y30_N3
\counter1|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|count~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|count\(3));

-- Location: LCCOMB_X31_Y30_N0
\counter1|count~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count~2_combout\ = (\reset_n~input_o\ & \counter1|Add0~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset_n~input_o\,
	datad => \counter1|Add0~5_combout\,
	combout => \counter1|count~2_combout\);

-- Location: FF_X31_Y30_N1
\counter1|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|count\(2));

-- Location: LCCOMB_X31_Y30_N28
\counter1|upDown~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|upDown~0_combout\ = (\counter1|count\(0)) # ((\counter1|count\(3)) # ((\counter1|count\(1)) # (\counter1|count\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|count\(0),
	datab => \counter1|count\(3),
	datac => \counter1|count\(1),
	datad => \counter1|count\(2),
	combout => \counter1|upDown~0_combout\);

-- Location: LCCOMB_X31_Y30_N16
\counter1|Add0~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~9_combout\ = ((\counter1|count\(4) $ (\counter1|upDown~5_combout\ $ (!\counter1|Add0~8\)))) # (GND)
-- \counter1|Add0~10\ = CARRY((\counter1|count\(4) & ((\counter1|upDown~5_combout\) # (!\counter1|Add0~8\))) # (!\counter1|count\(4) & (\counter1|upDown~5_combout\ & !\counter1|Add0~8\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|count\(4),
	datab => \counter1|upDown~5_combout\,
	datad => VCC,
	cin => \counter1|Add0~8\,
	combout => \counter1|Add0~9_combout\,
	cout => \counter1|Add0~10\);

-- Location: LCCOMB_X32_Y30_N8
\counter1|count~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count~4_combout\ = (\counter1|Add0~9_combout\ & \reset_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \counter1|Add0~9_combout\,
	datad => \reset_n~input_o\,
	combout => \counter1|count~4_combout\);

-- Location: FF_X32_Y30_N9
\counter1|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|count~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|count\(4));

-- Location: LCCOMB_X31_Y30_N18
\counter1|Add0~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~11_combout\ = (\counter1|count\(5) & ((\counter1|upDown~5_combout\ & (\counter1|Add0~10\ & VCC)) # (!\counter1|upDown~5_combout\ & (!\counter1|Add0~10\)))) # (!\counter1|count\(5) & ((\counter1|upDown~5_combout\ & (!\counter1|Add0~10\)) # 
-- (!\counter1|upDown~5_combout\ & ((\counter1|Add0~10\) # (GND)))))
-- \counter1|Add0~12\ = CARRY((\counter1|count\(5) & (!\counter1|upDown~5_combout\ & !\counter1|Add0~10\)) # (!\counter1|count\(5) & ((!\counter1|Add0~10\) # (!\counter1|upDown~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|count\(5),
	datab => \counter1|upDown~5_combout\,
	datad => VCC,
	cin => \counter1|Add0~10\,
	combout => \counter1|Add0~11_combout\,
	cout => \counter1|Add0~12\);

-- Location: LCCOMB_X31_Y30_N20
\counter1|Add0~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~13_combout\ = ((\counter1|count\(6) $ (\counter1|upDown~5_combout\ $ (!\counter1|Add0~12\)))) # (GND)
-- \counter1|Add0~14\ = CARRY((\counter1|count\(6) & ((\counter1|upDown~5_combout\) # (!\counter1|Add0~12\))) # (!\counter1|count\(6) & (\counter1|upDown~5_combout\ & !\counter1|Add0~12\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|count\(6),
	datab => \counter1|upDown~5_combout\,
	datad => VCC,
	cin => \counter1|Add0~12\,
	combout => \counter1|Add0~13_combout\,
	cout => \counter1|Add0~14\);

-- Location: LCCOMB_X31_Y30_N22
\counter1|Add0~15\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|Add0~15_combout\ = \counter1|count\(7) $ (\counter1|Add0~14\ $ (\counter1|upDown~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counter1|count\(7),
	datad => \counter1|upDown~5_combout\,
	cin => \counter1|Add0~14\,
	combout => \counter1|Add0~15_combout\);

-- Location: LCCOMB_X31_Y30_N4
\counter1|count~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count~7_combout\ = (\reset_n~input_o\ & \counter1|Add0~15_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset_n~input_o\,
	datac => \counter1|Add0~15_combout\,
	combout => \counter1|count~7_combout\);

-- Location: FF_X31_Y30_N5
\counter1|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|count~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|count\(7));

-- Location: LCCOMB_X31_Y30_N30
\counter1|count~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count~6_combout\ = (\reset_n~input_o\ & \counter1|Add0~13_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset_n~input_o\,
	datad => \counter1|Add0~13_combout\,
	combout => \counter1|count~6_combout\);

-- Location: FF_X31_Y30_N31
\counter1|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|count~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|count\(6));

-- Location: LCCOMB_X32_Y30_N28
\counter1|upDown~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|upDown~1_combout\ = (\counter1|count\(5)) # ((\counter1|count\(4)) # ((\counter1|count\(7)) # (\counter1|count\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|count\(5),
	datab => \counter1|count\(4),
	datac => \counter1|count\(7),
	datad => \counter1|count\(6),
	combout => \counter1|upDown~1_combout\);

-- Location: LCCOMB_X31_Y30_N6
\counter1|upDown~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|upDown~2_combout\ = (\counter1|upDown~q\ & ((\counter1|upDown~0_combout\) # (\counter1|upDown~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|upDown~q\,
	datab => \counter1|upDown~0_combout\,
	datad => \counter1|upDown~1_combout\,
	combout => \counter1|upDown~2_combout\);

-- Location: LCCOMB_X31_Y30_N24
\counter1|upDown~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|upDown~5_combout\ = (\counter1|upDown~2_combout\) # ((\counter1|upDown~4_combout\ & \counter1|upDown~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|upDown~4_combout\,
	datab => \counter1|upDown~3_combout\,
	datad => \counter1|upDown~2_combout\,
	combout => \counter1|upDown~5_combout\);

-- Location: LCCOMB_X32_Y30_N14
\counter1|count~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count~1_combout\ = (\reset_n~input_o\ & \counter1|Add0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset_n~input_o\,
	datad => \counter1|Add0~3_combout\,
	combout => \counter1|count~1_combout\);

-- Location: FF_X32_Y30_N15
\counter1|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|count\(1));

-- Location: LCCOMB_X32_Y30_N4
\counter1|count~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count~0_combout\ = (\reset_n~input_o\ & \counter1|Add0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset_n~input_o\,
	datad => \counter1|Add0~1_combout\,
	combout => \counter1|count~0_combout\);

-- Location: FF_X32_Y30_N5
\counter1|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|count\(0));

-- Location: LCCOMB_X32_Y30_N26
\counter1|upDown~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|upDown~3_combout\ = (\counter1|count\(2) & (\counter1|count\(1) & (\counter1|count\(0) & \counter1|count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|count\(2),
	datab => \counter1|count\(1),
	datac => \counter1|count\(0),
	datad => \counter1|count\(3),
	combout => \counter1|upDown~3_combout\);

-- Location: LCCOMB_X32_Y30_N22
\counter1|count~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|count~5_combout\ = (\reset_n~input_o\ & \counter1|Add0~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset_n~input_o\,
	datad => \counter1|Add0~11_combout\,
	combout => \counter1|count~5_combout\);

-- Location: FF_X32_Y30_N23
\counter1|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|count~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|count\(5));

-- Location: LCCOMB_X31_Y30_N26
\counter1|upDown~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|upDown~4_combout\ = (\counter1|count\(6) & (\counter1|count\(7) & (\counter1|count\(4) & \counter1|count\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|count\(6),
	datab => \counter1|count\(7),
	datac => \counter1|count\(4),
	datad => \counter1|count\(5),
	combout => \counter1|upDown~4_combout\);

-- Location: LCCOMB_X32_Y30_N30
\counter1|upDown~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|upDown~6_combout\ = (\reset_n~input_o\ & ((\counter1|upDown~2_combout\) # ((\counter1|upDown~3_combout\ & \counter1|upDown~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset_n~input_o\,
	datab => \counter1|upDown~3_combout\,
	datac => \counter1|upDown~2_combout\,
	datad => \counter1|upDown~4_combout\,
	combout => \counter1|upDown~6_combout\);

-- Location: FF_X32_Y30_N31
\counter1|upDown\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|upDown~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|upDown~q\);

-- Location: IOIBUF_X22_Y31_N1
\write~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write,
	o => \write~input_o\);

-- Location: IOIBUF_X16_Y0_N8
\address[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(1),
	o => \address[1]~input_o\);

-- Location: IOIBUF_X22_Y31_N8
\chipselect~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_chipselect,
	o => \chipselect~input_o\);

-- Location: LCCOMB_X22_Y30_N24
\controller1|process_0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|process_0~0_combout\ = (((\address[1]~input_o\) # (!\chipselect~input_o\)) # (!\write~input_o\)) # (!\address[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[0]~input_o\,
	datab => \write~input_o\,
	datac => \address[1]~input_o\,
	datad => \chipselect~input_o\,
	combout => \controller1|process_0~0_combout\);

-- Location: FF_X31_Y30_N17
\counter1|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|Add0~9_combout\,
	ena => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|cnt\(4));

-- Location: IOIBUF_X31_Y31_N1
\writedata[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(4),
	o => \writedata[4]~input_o\);

-- Location: LCCOMB_X30_Y30_N8
\controller1|ocr[4]~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr[4]~4_combout\ = (\reset_n~input_o\ & ((\controller1|process_0~0_combout\ & ((\controller1|ocr\(4)))) # (!\controller1|process_0~0_combout\ & (!\writedata[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|process_0~0_combout\,
	datab => \writedata[4]~input_o\,
	datac => \controller1|ocr\(4),
	datad => \reset_n~input_o\,
	combout => \controller1|ocr[4]~4_combout\);

-- Location: FF_X30_Y30_N9
\controller1|ocr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|ocr[4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|ocr\(4));

-- Location: FF_X31_Y30_N19
\counter1|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|Add0~11_combout\,
	ena => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|cnt\(5));

-- Location: LCCOMB_X30_Y30_N28
\controller1|Equal1~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|Equal1~2_combout\ = (\controller1|ocr\(5) & (!\counter1|cnt\(5) & (\counter1|cnt\(4) $ (\controller1|ocr\(4))))) # (!\controller1|ocr\(5) & (\counter1|cnt\(5) & (\counter1|cnt\(4) $ (\controller1|ocr\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|ocr\(5),
	datab => \counter1|cnt\(4),
	datac => \controller1|ocr\(4),
	datad => \counter1|cnt\(5),
	combout => \controller1|Equal1~2_combout\);

-- Location: LCCOMB_X30_Y30_N14
\counter1|cnt[0]~feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \counter1|cnt[0]~feeder_combout\ = \counter1|Add0~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \counter1|Add0~1_combout\,
	combout => \counter1|cnt[0]~feeder_combout\);

-- Location: FF_X30_Y30_N15
\counter1|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|cnt[0]~feeder_combout\,
	ena => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|cnt\(0));

-- Location: FF_X31_Y30_N11
\counter1|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \counter1|Add0~3_combout\,
	ena => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|cnt\(1));

-- Location: IOIBUF_X26_Y31_N1
\writedata[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(0),
	o => \writedata[0]~input_o\);

-- Location: LCCOMB_X30_Y30_N16
\controller1|ocr[0]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr[0]~0_combout\ = (\reset_n~input_o\ & ((\controller1|process_0~0_combout\ & ((\controller1|ocr\(0)))) # (!\controller1|process_0~0_combout\ & (!\writedata[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|process_0~0_combout\,
	datab => \writedata[0]~input_o\,
	datac => \controller1|ocr\(0),
	datad => \reset_n~input_o\,
	combout => \controller1|ocr[0]~0_combout\);

-- Location: FF_X30_Y30_N17
\controller1|ocr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|ocr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|ocr\(0));

-- Location: LCCOMB_X30_Y30_N4
\controller1|Equal1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|Equal1~0_combout\ = (\controller1|ocr\(1) & (!\counter1|cnt\(1) & (\counter1|cnt\(0) $ (\controller1|ocr\(0))))) # (!\controller1|ocr\(1) & (\counter1|cnt\(1) & (\counter1|cnt\(0) $ (\controller1|ocr\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|ocr\(1),
	datab => \counter1|cnt\(0),
	datac => \counter1|cnt\(1),
	datad => \controller1|ocr\(0),
	combout => \controller1|Equal1~0_combout\);

-- Location: FF_X31_Y30_N7
\counter1|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	asdata => \counter1|Add0~15_combout\,
	sload => VCC,
	ena => \reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter1|cnt\(7));

-- Location: IOIBUF_X33_Y27_N8
\writedata[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(7),
	o => \writedata[7]~input_o\);

-- Location: LCCOMB_X32_Y30_N2
\controller1|ocr[7]~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr[7]~7_combout\ = (\reset_n~input_o\ & ((\controller1|process_0~0_combout\ & ((\controller1|ocr\(7)))) # (!\controller1|process_0~0_combout\ & (!\writedata[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|process_0~0_combout\,
	datab => \writedata[7]~input_o\,
	datac => \controller1|ocr\(7),
	datad => \reset_n~input_o\,
	combout => \controller1|ocr[7]~7_combout\);

-- Location: FF_X32_Y30_N3
\controller1|ocr[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|ocr[7]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|ocr\(7));

-- Location: IOIBUF_X33_Y27_N1
\writedata[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(6),
	o => \writedata[6]~input_o\);

-- Location: LCCOMB_X32_Y30_N24
\controller1|ocr[6]~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|ocr[6]~6_combout\ = (\reset_n~input_o\ & ((\controller1|process_0~0_combout\ & ((\controller1|ocr\(6)))) # (!\controller1|process_0~0_combout\ & (!\writedata[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|process_0~0_combout\,
	datab => \writedata[6]~input_o\,
	datac => \controller1|ocr\(6),
	datad => \reset_n~input_o\,
	combout => \controller1|ocr[6]~6_combout\);

-- Location: FF_X32_Y30_N25
\controller1|ocr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|ocr[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|ocr\(6));

-- Location: LCCOMB_X32_Y30_N12
\controller1|Equal1~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|Equal1~3_combout\ = (\counter1|cnt\(6) & (!\controller1|ocr\(6) & (\counter1|cnt\(7) $ (\controller1|ocr\(7))))) # (!\counter1|cnt\(6) & (\controller1|ocr\(6) & (\counter1|cnt\(7) $ (\controller1|ocr\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter1|cnt\(6),
	datab => \counter1|cnt\(7),
	datac => \controller1|ocr\(7),
	datad => \controller1|ocr\(6),
	combout => \controller1|Equal1~3_combout\);

-- Location: LCCOMB_X30_Y30_N18
\controller1|Equal1~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|Equal1~4_combout\ = (\controller1|Equal1~1_combout\ & (\controller1|Equal1~2_combout\ & (\controller1|Equal1~0_combout\ & \controller1|Equal1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|Equal1~1_combout\,
	datab => \controller1|Equal1~2_combout\,
	datac => \controller1|Equal1~0_combout\,
	datad => \controller1|Equal1~3_combout\,
	combout => \controller1|Equal1~4_combout\);

-- Location: LCCOMB_X30_Y30_N30
\controller1|coe_export_pwmOut~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|coe_export_pwmOut~0_combout\ = (\controller1|process_0~0_combout\ & (!\controller1|output~q\ & ((!\controller1|Equal1~4_combout\)))) # (!\controller1|process_0~0_combout\ & (((\controller1|coe_export_pwmOut~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110001011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|output~q\,
	datab => \controller1|coe_export_pwmOut~q\,
	datac => \controller1|process_0~0_combout\,
	datad => \controller1|Equal1~4_combout\,
	combout => \controller1|coe_export_pwmOut~0_combout\);

-- Location: LCCOMB_X30_Y30_N20
\controller1|coe_export_pwmOut~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|coe_export_pwmOut~1_combout\ = (\controller1|coe_export_pwmOut~0_combout\) # ((\controller1|process_0~0_combout\ & (\counter1|upDown~q\ & \controller1|Equal1~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controller1|process_0~0_combout\,
	datab => \counter1|upDown~q\,
	datac => \controller1|coe_export_pwmOut~0_combout\,
	datad => \controller1|Equal1~4_combout\,
	combout => \controller1|coe_export_pwmOut~1_combout\);

-- Location: LCCOMB_X30_Y30_N0
\controller1|coe_export_pwmOut~feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controller1|coe_export_pwmOut~feeder_combout\ = \controller1|coe_export_pwmOut~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \controller1|coe_export_pwmOut~1_combout\,
	combout => \controller1|coe_export_pwmOut~feeder_combout\);

-- Location: FF_X30_Y30_N1
\controller1|coe_export_pwmOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkdiv1|clk_out~clkctrl_outclk\,
	d => \controller1|coe_export_pwmOut~feeder_combout\,
	asdata => VCC,
	sload => \ALT_INV_reset_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controller1|coe_export_pwmOut~q\);

ww_coe_export_pwmOut <= \coe_export_pwmOut~output_o\;
END structure;


