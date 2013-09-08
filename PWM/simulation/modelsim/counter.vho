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

-- DATE "12/12/2012 10:59:17"

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

ENTITY 	counter IS
    PORT (
	enable : IN std_logic;
	reset_n : IN std_logic;
	clock : IN std_logic;
	cnt : OUT std_logic_vector(7 DOWNTO 0);
	upDown_out : OUT std_logic
	);
END counter;

-- Design Ports Information
-- cnt[0]	=>  Location: PIN_M13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[1]	=>  Location: PIN_L11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[2]	=>  Location: PIN_N13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[3]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[4]	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[5]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[6]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[7]	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- upDown_out	=>  Location: PIN_L12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- enable	=>  Location: PIN_K11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_n	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF counter IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL ww_reset_n : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_cnt : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_upDown_out : std_logic;
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \cnt[0]~output_o\ : std_logic;
SIGNAL \cnt[1]~output_o\ : std_logic;
SIGNAL \cnt[2]~output_o\ : std_logic;
SIGNAL \cnt[3]~output_o\ : std_logic;
SIGNAL \cnt[4]~output_o\ : std_logic;
SIGNAL \cnt[5]~output_o\ : std_logic;
SIGNAL \cnt[6]~output_o\ : std_logic;
SIGNAL \cnt[7]~output_o\ : std_logic;
SIGNAL \upDown_out~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \Add0~1_combout\ : std_logic;
SIGNAL \enable~input_o\ : std_logic;
SIGNAL \reset_n~input_o\ : std_logic;
SIGNAL \cnt[0]~0_combout\ : std_logic;
SIGNAL \cnt[0]~reg0_q\ : std_logic;
SIGNAL \count~1_combout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~9_combout\ : std_logic;
SIGNAL \cnt[1]~reg0_q\ : std_logic;
SIGNAL \count~2_combout\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~11_combout\ : std_logic;
SIGNAL \cnt[2]~reg0_q\ : std_logic;
SIGNAL \count~3_combout\ : std_logic;
SIGNAL \Add0~12\ : std_logic;
SIGNAL \Add0~13_combout\ : std_logic;
SIGNAL \cnt[3]~reg0_q\ : std_logic;
SIGNAL \count~4_combout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~15_combout\ : std_logic;
SIGNAL \cnt[4]~reg0_q\ : std_logic;
SIGNAL \Add0~16\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~19_combout\ : std_logic;
SIGNAL \count~6_combout\ : std_logic;
SIGNAL \Add0~20\ : std_logic;
SIGNAL \Add0~21_combout\ : std_logic;
SIGNAL \count~7_combout\ : std_logic;
SIGNAL \Add0~7_combout\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \count~5_combout\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \upDown~0_combout\ : std_logic;
SIGNAL \upDown~q\ : std_logic;
SIGNAL \count~0_combout\ : std_logic;
SIGNAL \Add0~3_combout\ : std_logic;
SIGNAL \Add0~5_combout\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Add0~17_combout\ : std_logic;
SIGNAL \cnt[5]~reg0_q\ : std_logic;
SIGNAL \cnt[6]~reg0_q\ : std_logic;
SIGNAL \cnt[7]~reg0_q\ : std_logic;
SIGNAL count : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_enable <= enable;
ww_reset_n <= reset_n;
ww_clock <= clock;
cnt <= ww_cnt;
upDown_out <= ww_upDown_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);

-- Location: IOOBUF_X33_Y10_N2
\cnt[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cnt[0]~reg0_q\,
	devoe => ww_devoe,
	o => \cnt[0]~output_o\);

-- Location: IOOBUF_X31_Y0_N2
\cnt[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cnt[1]~reg0_q\,
	devoe => ww_devoe,
	o => \cnt[1]~output_o\);

-- Location: IOOBUF_X33_Y10_N9
\cnt[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cnt[2]~reg0_q\,
	devoe => ww_devoe,
	o => \cnt[2]~output_o\);

-- Location: IOOBUF_X33_Y15_N9
\cnt[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cnt[3]~reg0_q\,
	devoe => ww_devoe,
	o => \cnt[3]~output_o\);

-- Location: IOOBUF_X33_Y11_N9
\cnt[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cnt[4]~reg0_q\,
	devoe => ww_devoe,
	o => \cnt[4]~output_o\);

-- Location: IOOBUF_X33_Y14_N9
\cnt[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cnt[5]~reg0_q\,
	devoe => ww_devoe,
	o => \cnt[5]~output_o\);

-- Location: IOOBUF_X33_Y14_N2
\cnt[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cnt[6]~reg0_q\,
	devoe => ww_devoe,
	o => \cnt[6]~output_o\);

-- Location: IOOBUF_X33_Y15_N2
\cnt[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cnt[7]~reg0_q\,
	devoe => ww_devoe,
	o => \cnt[7]~output_o\);

-- Location: IOOBUF_X33_Y12_N2
\upDown_out~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \upDown~q\,
	devoe => ww_devoe,
	o => \upDown_out~output_o\);

-- Location: IOIBUF_X16_Y0_N15
\clock~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G17
\clock~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~inputclkctrl_outclk\);

-- Location: LCCOMB_X32_Y12_N4
\Add0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~1_combout\ = count(0) $ (VCC)
-- \Add0~2\ = CARRY(count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(0),
	datad => VCC,
	combout => \Add0~1_combout\,
	cout => \Add0~2\);

-- Location: IOIBUF_X33_Y11_N1
\enable~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enable,
	o => \enable~input_o\);

-- Location: IOIBUF_X33_Y12_N8
\reset_n~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_n,
	o => \reset_n~input_o\);

-- Location: LCCOMB_X31_Y12_N24
\cnt[0]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \cnt[0]~0_combout\ = (\enable~input_o\ & \reset_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \enable~input_o\,
	datad => \reset_n~input_o\,
	combout => \cnt[0]~0_combout\);

-- Location: FF_X32_Y12_N5
\cnt[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Add0~1_combout\,
	ena => \cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt[0]~reg0_q\);

-- Location: LCCOMB_X31_Y12_N22
\count~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count~1_combout\ = (\reset_n~input_o\ & \Add0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset_n~input_o\,
	datad => \Add0~9_combout\,
	combout => \count~1_combout\);

-- Location: FF_X31_Y12_N23
\count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \count~1_combout\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(1));

-- Location: LCCOMB_X32_Y12_N6
\Add0~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~9_combout\ = (\Add0~8_combout\ & ((count(1) & (\Add0~2\ & VCC)) # (!count(1) & (!\Add0~2\)))) # (!\Add0~8_combout\ & ((count(1) & (!\Add0~2\)) # (!count(1) & ((\Add0~2\) # (GND)))))
-- \Add0~10\ = CARRY((\Add0~8_combout\ & (!count(1) & !\Add0~2\)) # (!\Add0~8_combout\ & ((!\Add0~2\) # (!count(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~8_combout\,
	datab => count(1),
	datad => VCC,
	cin => \Add0~2\,
	combout => \Add0~9_combout\,
	cout => \Add0~10\);

-- Location: FF_X32_Y12_N7
\cnt[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Add0~9_combout\,
	ena => \cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt[1]~reg0_q\);

-- Location: LCCOMB_X31_Y12_N0
\count~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count~2_combout\ = (\Add0~11_combout\ & \reset_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~11_combout\,
	datad => \reset_n~input_o\,
	combout => \count~2_combout\);

-- Location: FF_X31_Y12_N1
\count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \count~2_combout\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(2));

-- Location: LCCOMB_X32_Y12_N8
\Add0~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~11_combout\ = ((\Add0~8_combout\ $ (count(2) $ (!\Add0~10\)))) # (GND)
-- \Add0~12\ = CARRY((\Add0~8_combout\ & ((count(2)) # (!\Add0~10\))) # (!\Add0~8_combout\ & (count(2) & !\Add0~10\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~8_combout\,
	datab => count(2),
	datad => VCC,
	cin => \Add0~10\,
	combout => \Add0~11_combout\,
	cout => \Add0~12\);

-- Location: FF_X32_Y12_N9
\cnt[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Add0~11_combout\,
	ena => \cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt[2]~reg0_q\);

-- Location: LCCOMB_X31_Y12_N2
\count~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count~3_combout\ = (\Add0~13_combout\ & \reset_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~13_combout\,
	datad => \reset_n~input_o\,
	combout => \count~3_combout\);

-- Location: FF_X31_Y12_N3
\count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \count~3_combout\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(3));

-- Location: LCCOMB_X32_Y12_N10
\Add0~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~13_combout\ = (\Add0~8_combout\ & ((count(3) & (\Add0~12\ & VCC)) # (!count(3) & (!\Add0~12\)))) # (!\Add0~8_combout\ & ((count(3) & (!\Add0~12\)) # (!count(3) & ((\Add0~12\) # (GND)))))
-- \Add0~14\ = CARRY((\Add0~8_combout\ & (!count(3) & !\Add0~12\)) # (!\Add0~8_combout\ & ((!\Add0~12\) # (!count(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~8_combout\,
	datab => count(3),
	datad => VCC,
	cin => \Add0~12\,
	combout => \Add0~13_combout\,
	cout => \Add0~14\);

-- Location: FF_X32_Y12_N11
\cnt[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Add0~13_combout\,
	ena => \cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt[3]~reg0_q\);

-- Location: LCCOMB_X32_Y12_N24
\count~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count~4_combout\ = (\reset_n~input_o\ & \Add0~15_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset_n~input_o\,
	datad => \Add0~15_combout\,
	combout => \count~4_combout\);

-- Location: FF_X32_Y12_N25
\count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \count~4_combout\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(4));

-- Location: LCCOMB_X32_Y12_N12
\Add0~15\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~15_combout\ = ((\Add0~8_combout\ $ (count(4) $ (!\Add0~14\)))) # (GND)
-- \Add0~16\ = CARRY((\Add0~8_combout\ & ((count(4)) # (!\Add0~14\))) # (!\Add0~8_combout\ & (count(4) & !\Add0~14\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~8_combout\,
	datab => count(4),
	datad => VCC,
	cin => \Add0~14\,
	combout => \Add0~15_combout\,
	cout => \Add0~16\);

-- Location: FF_X32_Y12_N13
\cnt[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Add0~15_combout\,
	ena => \cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt[4]~reg0_q\);

-- Location: LCCOMB_X32_Y12_N14
\Add0~17\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~17_combout\ = (count(5) & ((\Add0~8_combout\ & (\Add0~16\ & VCC)) # (!\Add0~8_combout\ & (!\Add0~16\)))) # (!count(5) & ((\Add0~8_combout\ & (!\Add0~16\)) # (!\Add0~8_combout\ & ((\Add0~16\) # (GND)))))
-- \Add0~18\ = CARRY((count(5) & (!\Add0~8_combout\ & !\Add0~16\)) # (!count(5) & ((!\Add0~16\) # (!\Add0~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(5),
	datab => \Add0~8_combout\,
	datad => VCC,
	cin => \Add0~16\,
	combout => \Add0~17_combout\,
	cout => \Add0~18\);

-- Location: LCCOMB_X32_Y12_N16
\Add0~19\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~19_combout\ = ((\Add0~8_combout\ $ (count(6) $ (!\Add0~18\)))) # (GND)
-- \Add0~20\ = CARRY((\Add0~8_combout\ & ((count(6)) # (!\Add0~18\))) # (!\Add0~8_combout\ & (count(6) & !\Add0~18\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~8_combout\,
	datab => count(6),
	datad => VCC,
	cin => \Add0~18\,
	combout => \Add0~19_combout\,
	cout => \Add0~20\);

-- Location: LCCOMB_X32_Y12_N20
\count~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count~6_combout\ = (\reset_n~input_o\ & \Add0~19_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset_n~input_o\,
	datad => \Add0~19_combout\,
	combout => \count~6_combout\);

-- Location: FF_X32_Y12_N21
\count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \count~6_combout\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(6));

-- Location: LCCOMB_X32_Y12_N18
\Add0~21\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~21_combout\ = count(7) $ (\Add0~20\ $ (\Add0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(7),
	datad => \Add0~8_combout\,
	cin => \Add0~20\,
	combout => \Add0~21_combout\);

-- Location: LCCOMB_X32_Y12_N26
\count~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count~7_combout\ = (\reset_n~input_o\ & \Add0~21_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset_n~input_o\,
	datad => \Add0~21_combout\,
	combout => \count~7_combout\);

-- Location: FF_X32_Y12_N27
\count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \count~7_combout\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(7));

-- Location: LCCOMB_X32_Y12_N0
\Add0~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~7_combout\ = (count(5) & (count(4) & (count(7) & count(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(5),
	datab => count(4),
	datac => count(7),
	datad => count(6),
	combout => \Add0~7_combout\);

-- Location: LCCOMB_X31_Y12_N6
\Add0~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (count(0) & (count(2) & (count(1) & count(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(0),
	datab => count(2),
	datac => count(1),
	datad => count(3),
	combout => \Add0~6_combout\);

-- Location: LCCOMB_X32_Y12_N22
\count~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count~5_combout\ = (\reset_n~input_o\ & \Add0~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset_n~input_o\,
	datac => \Add0~17_combout\,
	combout => \count~5_combout\);

-- Location: FF_X32_Y12_N23
\count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \count~5_combout\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(5));

-- Location: LCCOMB_X32_Y12_N28
\Add0~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (count(7)) # ((count(4)) # ((count(5)) # (count(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(7),
	datab => count(4),
	datac => count(5),
	datad => count(6),
	combout => \Add0~4_combout\);

-- Location: LCCOMB_X31_Y12_N16
\upDown~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \upDown~0_combout\ = (\reset_n~input_o\ & ((\Add0~5_combout\) # ((\Add0~6_combout\ & \Add0~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset_n~input_o\,
	datab => \Add0~6_combout\,
	datac => \Add0~7_combout\,
	datad => \Add0~5_combout\,
	combout => \upDown~0_combout\);

-- Location: FF_X31_Y12_N17
upDown : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \upDown~0_combout\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \upDown~q\);

-- Location: LCCOMB_X31_Y12_N30
\count~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count~0_combout\ = (\reset_n~input_o\ & \Add0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset_n~input_o\,
	datad => \Add0~1_combout\,
	combout => \count~0_combout\);

-- Location: FF_X31_Y12_N31
\count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \count~0_combout\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(0));

-- Location: LCCOMB_X31_Y12_N12
\Add0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~3_combout\ = (count(1)) # ((count(3)) # ((count(0)) # (count(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(1),
	datab => count(3),
	datac => count(0),
	datad => count(2),
	combout => \Add0~3_combout\);

-- Location: LCCOMB_X32_Y12_N2
\Add0~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~5_combout\ = (\upDown~q\ & ((\Add0~4_combout\) # (\Add0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~4_combout\,
	datac => \upDown~q\,
	datad => \Add0~3_combout\,
	combout => \Add0~5_combout\);

-- Location: LCCOMB_X32_Y12_N30
\Add0~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (\Add0~5_combout\) # ((\Add0~7_combout\ & \Add0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~7_combout\,
	datac => \Add0~6_combout\,
	datad => \Add0~5_combout\,
	combout => \Add0~8_combout\);

-- Location: FF_X32_Y12_N15
\cnt[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Add0~17_combout\,
	ena => \cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt[5]~reg0_q\);

-- Location: FF_X32_Y12_N17
\cnt[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Add0~19_combout\,
	ena => \cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt[6]~reg0_q\);

-- Location: FF_X32_Y12_N19
\cnt[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Add0~21_combout\,
	ena => \cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cnt[7]~reg0_q\);

ww_cnt(0) <= \cnt[0]~output_o\;

ww_cnt(1) <= \cnt[1]~output_o\;

ww_cnt(2) <= \cnt[2]~output_o\;

ww_cnt(3) <= \cnt[3]~output_o\;

ww_cnt(4) <= \cnt[4]~output_o\;

ww_cnt(5) <= \cnt[5]~output_o\;

ww_cnt(6) <= \cnt[6]~output_o\;

ww_cnt(7) <= \cnt[7]~output_o\;

ww_upDown_out <= \upDown_out~output_o\;
END structure;


