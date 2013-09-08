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

-- DATE "12/12/2012 12:50:01"

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

ENTITY 	clkdiv IS
    PORT (
	clk : IN std_logic;
	clk_out : OUT std_logic
	);
END clkdiv;

-- Design Ports Information
-- clk_out	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF clkdiv IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_clk_out : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \count[4]~27_combout\ : std_logic;
SIGNAL \count[8]~35_combout\ : std_logic;
SIGNAL \count[14]~47_combout\ : std_logic;
SIGNAL \clk_out~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \count[0]~19_combout\ : std_logic;
SIGNAL \count[6]~31_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \count[15]~49_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \count[11]~41_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \count[0]~20\ : std_logic;
SIGNAL \count[1]~21_combout\ : std_logic;
SIGNAL \count[1]~22\ : std_logic;
SIGNAL \count[2]~23_combout\ : std_logic;
SIGNAL \count[2]~24\ : std_logic;
SIGNAL \count[3]~25_combout\ : std_logic;
SIGNAL \count[3]~26\ : std_logic;
SIGNAL \count[4]~28\ : std_logic;
SIGNAL \count[5]~29_combout\ : std_logic;
SIGNAL \count[5]~30\ : std_logic;
SIGNAL \count[6]~32\ : std_logic;
SIGNAL \count[7]~33_combout\ : std_logic;
SIGNAL \count[7]~34\ : std_logic;
SIGNAL \count[8]~36\ : std_logic;
SIGNAL \count[9]~37_combout\ : std_logic;
SIGNAL \count[9]~38\ : std_logic;
SIGNAL \count[10]~39_combout\ : std_logic;
SIGNAL \count[10]~40\ : std_logic;
SIGNAL \count[11]~42\ : std_logic;
SIGNAL \count[12]~43_combout\ : std_logic;
SIGNAL \count[12]~44\ : std_logic;
SIGNAL \count[13]~45_combout\ : std_logic;
SIGNAL \count[13]~46\ : std_logic;
SIGNAL \count[14]~48\ : std_logic;
SIGNAL \count[15]~50\ : std_logic;
SIGNAL \count[16]~51_combout\ : std_logic;
SIGNAL \count[16]~52\ : std_logic;
SIGNAL \count[17]~53_combout\ : std_logic;
SIGNAL \count[17]~54\ : std_logic;
SIGNAL \count[18]~55_combout\ : std_logic;
SIGNAL \temp~0_combout\ : std_logic;
SIGNAL \temp~q\ : std_logic;
SIGNAL \clk_out~0_combout\ : std_logic;
SIGNAL \clk_out~reg0_q\ : std_logic;
SIGNAL count : std_logic_vector(18 DOWNTO 0);

BEGIN

ww_clk <= clk;
clk_out <= ww_clk_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: FF_X9_Y1_N11
\count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[14]~47_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(14));

-- Location: FF_X9_Y2_N31
\count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[8]~35_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(8));

-- Location: FF_X9_Y2_N23
\count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[4]~27_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(4));

-- Location: LCCOMB_X9_Y2_N22
\count[4]~27\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[4]~27_combout\ = (count(4) & (\count[3]~26\ $ (GND))) # (!count(4) & (!\count[3]~26\ & VCC))
-- \count[4]~28\ = CARRY((count(4) & !\count[3]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(4),
	datad => VCC,
	cin => \count[3]~26\,
	combout => \count[4]~27_combout\,
	cout => \count[4]~28\);

-- Location: LCCOMB_X9_Y2_N30
\count[8]~35\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[8]~35_combout\ = (count(8) & (\count[7]~34\ $ (GND))) # (!count(8) & (!\count[7]~34\ & VCC))
-- \count[8]~36\ = CARRY((count(8) & !\count[7]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(8),
	datad => VCC,
	cin => \count[7]~34\,
	combout => \count[8]~35_combout\,
	cout => \count[8]~36\);

-- Location: LCCOMB_X9_Y1_N10
\count[14]~47\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[14]~47_combout\ = (count(14) & (\count[13]~46\ $ (GND))) # (!count(14) & (!\count[13]~46\ & VCC))
-- \count[14]~48\ = CARRY((count(14) & !\count[13]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(14),
	datad => VCC,
	cin => \count[13]~46\,
	combout => \count[14]~47_combout\,
	cout => \count[14]~48\);

-- Location: IOOBUF_X8_Y0_N2
\clk_out~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk_out~reg0_q\,
	devoe => ww_devoe,
	o => \clk_out~output_o\);

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

-- Location: LCCOMB_X9_Y2_N14
\count[0]~19\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[0]~19_combout\ = count(0) $ (VCC)
-- \count[0]~20\ = CARRY(count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(0),
	datad => VCC,
	combout => \count[0]~19_combout\,
	cout => \count[0]~20\);

-- Location: LCCOMB_X9_Y2_N26
\count[6]~31\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[6]~31_combout\ = (count(6) & (\count[5]~30\ $ (GND))) # (!count(6) & (!\count[5]~30\ & VCC))
-- \count[6]~32\ = CARRY((count(6) & !\count[5]~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(6),
	datad => VCC,
	cin => \count[5]~30\,
	combout => \count[6]~31_combout\,
	cout => \count[6]~32\);

-- Location: FF_X9_Y2_N27
\count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[6]~31_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(6));

-- Location: LCCOMB_X9_Y2_N4
\LessThan0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = ((!count(7) & (!count(6) & !count(5)))) # (!count(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(8),
	datab => count(7),
	datac => count(6),
	datad => count(5),
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X9_Y1_N12
\count[15]~49\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[15]~49_combout\ = (count(15) & (!\count[14]~48\)) # (!count(15) & ((\count[14]~48\) # (GND)))
-- \count[15]~50\ = CARRY((!\count[14]~48\) # (!count(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(15),
	datad => VCC,
	cin => \count[14]~48\,
	combout => \count[15]~49_combout\,
	cout => \count[15]~50\);

-- Location: FF_X9_Y1_N13
\count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[15]~49_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(15));

-- Location: LCCOMB_X9_Y1_N24
\LessThan0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (((!count(14) & !count(13))) # (!count(15))) # (!count(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(14),
	datab => count(13),
	datac => count(16),
	datad => count(15),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X9_Y1_N4
\count[11]~41\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[11]~41_combout\ = (count(11) & (!\count[10]~40\)) # (!count(11) & ((\count[10]~40\) # (GND)))
-- \count[11]~42\ = CARRY((!\count[10]~40\) # (!count(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(11),
	datad => VCC,
	cin => \count[10]~40\,
	combout => \count[11]~41_combout\,
	cout => \count[11]~42\);

-- Location: FF_X9_Y1_N5
\count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[11]~41_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(11));

-- Location: LCCOMB_X9_Y1_N22
\LessThan0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (!count(12) & (!count(10) & (!count(11) & !count(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(12),
	datab => count(10),
	datac => count(11),
	datad => count(9),
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X9_Y2_N6
\LessThan0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (\LessThan0~0_combout\) # ((!count(14) & (\LessThan0~1_combout\ & \LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(14),
	datab => \LessThan0~1_combout\,
	datac => \LessThan0~0_combout\,
	datad => \LessThan0~2_combout\,
	combout => \LessThan0~3_combout\);

-- Location: LCCOMB_X9_Y2_N12
\LessThan0~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = (count(18) & (count(17) & !\LessThan0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(18),
	datac => count(17),
	datad => \LessThan0~3_combout\,
	combout => \LessThan0~4_combout\);

-- Location: FF_X9_Y2_N15
\count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[0]~19_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(0));

-- Location: LCCOMB_X9_Y2_N16
\count[1]~21\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[1]~21_combout\ = (count(1) & (!\count[0]~20\)) # (!count(1) & ((\count[0]~20\) # (GND)))
-- \count[1]~22\ = CARRY((!\count[0]~20\) # (!count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(1),
	datad => VCC,
	cin => \count[0]~20\,
	combout => \count[1]~21_combout\,
	cout => \count[1]~22\);

-- Location: FF_X9_Y2_N17
\count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[1]~21_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(1));

-- Location: LCCOMB_X9_Y2_N18
\count[2]~23\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[2]~23_combout\ = (count(2) & (\count[1]~22\ $ (GND))) # (!count(2) & (!\count[1]~22\ & VCC))
-- \count[2]~24\ = CARRY((count(2) & !\count[1]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(2),
	datad => VCC,
	cin => \count[1]~22\,
	combout => \count[2]~23_combout\,
	cout => \count[2]~24\);

-- Location: FF_X9_Y2_N19
\count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[2]~23_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(2));

-- Location: LCCOMB_X9_Y2_N20
\count[3]~25\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[3]~25_combout\ = (count(3) & (!\count[2]~24\)) # (!count(3) & ((\count[2]~24\) # (GND)))
-- \count[3]~26\ = CARRY((!\count[2]~24\) # (!count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(3),
	datad => VCC,
	cin => \count[2]~24\,
	combout => \count[3]~25_combout\,
	cout => \count[3]~26\);

-- Location: FF_X9_Y2_N21
\count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[3]~25_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(3));

-- Location: LCCOMB_X9_Y2_N24
\count[5]~29\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[5]~29_combout\ = (count(5) & (!\count[4]~28\)) # (!count(5) & ((\count[4]~28\) # (GND)))
-- \count[5]~30\ = CARRY((!\count[4]~28\) # (!count(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(5),
	datad => VCC,
	cin => \count[4]~28\,
	combout => \count[5]~29_combout\,
	cout => \count[5]~30\);

-- Location: FF_X9_Y2_N25
\count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[5]~29_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(5));

-- Location: LCCOMB_X9_Y2_N28
\count[7]~33\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[7]~33_combout\ = (count(7) & (!\count[6]~32\)) # (!count(7) & ((\count[6]~32\) # (GND)))
-- \count[7]~34\ = CARRY((!\count[6]~32\) # (!count(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(7),
	datad => VCC,
	cin => \count[6]~32\,
	combout => \count[7]~33_combout\,
	cout => \count[7]~34\);

-- Location: FF_X9_Y2_N29
\count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[7]~33_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(7));

-- Location: LCCOMB_X9_Y1_N0
\count[9]~37\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[9]~37_combout\ = (count(9) & (!\count[8]~36\)) # (!count(9) & ((\count[8]~36\) # (GND)))
-- \count[9]~38\ = CARRY((!\count[8]~36\) # (!count(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(9),
	datad => VCC,
	cin => \count[8]~36\,
	combout => \count[9]~37_combout\,
	cout => \count[9]~38\);

-- Location: FF_X9_Y1_N1
\count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[9]~37_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(9));

-- Location: LCCOMB_X9_Y1_N2
\count[10]~39\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[10]~39_combout\ = (count(10) & (\count[9]~38\ $ (GND))) # (!count(10) & (!\count[9]~38\ & VCC))
-- \count[10]~40\ = CARRY((count(10) & !\count[9]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(10),
	datad => VCC,
	cin => \count[9]~38\,
	combout => \count[10]~39_combout\,
	cout => \count[10]~40\);

-- Location: FF_X9_Y1_N3
\count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[10]~39_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(10));

-- Location: LCCOMB_X9_Y1_N6
\count[12]~43\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[12]~43_combout\ = (count(12) & (\count[11]~42\ $ (GND))) # (!count(12) & (!\count[11]~42\ & VCC))
-- \count[12]~44\ = CARRY((count(12) & !\count[11]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(12),
	datad => VCC,
	cin => \count[11]~42\,
	combout => \count[12]~43_combout\,
	cout => \count[12]~44\);

-- Location: FF_X9_Y1_N7
\count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[12]~43_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(12));

-- Location: LCCOMB_X9_Y1_N8
\count[13]~45\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[13]~45_combout\ = (count(13) & (!\count[12]~44\)) # (!count(13) & ((\count[12]~44\) # (GND)))
-- \count[13]~46\ = CARRY((!\count[12]~44\) # (!count(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(13),
	datad => VCC,
	cin => \count[12]~44\,
	combout => \count[13]~45_combout\,
	cout => \count[13]~46\);

-- Location: FF_X9_Y1_N9
\count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[13]~45_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(13));

-- Location: LCCOMB_X9_Y1_N14
\count[16]~51\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[16]~51_combout\ = (count(16) & (\count[15]~50\ $ (GND))) # (!count(16) & (!\count[15]~50\ & VCC))
-- \count[16]~52\ = CARRY((count(16) & !\count[15]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(16),
	datad => VCC,
	cin => \count[15]~50\,
	combout => \count[16]~51_combout\,
	cout => \count[16]~52\);

-- Location: FF_X9_Y1_N15
\count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[16]~51_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(16));

-- Location: LCCOMB_X9_Y1_N16
\count[17]~53\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[17]~53_combout\ = (count(17) & (!\count[16]~52\)) # (!count(17) & ((\count[16]~52\) # (GND)))
-- \count[17]~54\ = CARRY((!\count[16]~52\) # (!count(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(17),
	datad => VCC,
	cin => \count[16]~52\,
	combout => \count[17]~53_combout\,
	cout => \count[17]~54\);

-- Location: FF_X9_Y1_N17
\count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[17]~53_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(17));

-- Location: LCCOMB_X9_Y1_N18
\count[18]~55\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[18]~55_combout\ = \count[17]~54\ $ (!count(18))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => count(18),
	cin => \count[17]~54\,
	combout => \count[18]~55_combout\);

-- Location: FF_X9_Y1_N19
\count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[18]~55_combout\,
	sclr => \LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(18));

-- Location: LCCOMB_X9_Y2_N2
\temp~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \temp~0_combout\ = \temp~q\ $ (((count(17) & (count(18) & !\LessThan0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(17),
	datab => count(18),
	datac => \temp~q\,
	datad => \LessThan0~3_combout\,
	combout => \temp~0_combout\);

-- Location: FF_X9_Y2_N3
temp : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \temp~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \temp~q\);

-- Location: LCCOMB_X9_Y2_N8
\clk_out~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \clk_out~0_combout\ = !\temp~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \temp~q\,
	combout => \clk_out~0_combout\);

-- Location: FF_X9_Y2_N9
\clk_out~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clk_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_out~reg0_q\);

ww_clk_out <= \clk_out~output_o\;
END structure;


