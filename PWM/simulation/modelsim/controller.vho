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

-- DATE "12/12/2012 11:01:34"

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

ENTITY 	controller IS
    PORT (
	address : IN std_logic_vector(1 DOWNTO 0);
	writedata : IN std_logic_vector(7 DOWNTO 0);
	write : IN std_logic;
	chipselect : IN std_logic;
	clk : IN std_logic;
	reset_n : IN std_logic;
	cnt : IN std_logic_vector(7 DOWNTO 0);
	upDown : IN std_logic;
	coe_export_pwmOut : OUT std_logic
	);
END controller;

-- Design Ports Information
-- coe_export_pwmOut	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- upDown	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_n	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[1]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[0]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[3]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[2]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[5]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[4]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[7]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cnt[6]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address[0]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- chipselect	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address[1]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[0]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[1]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[2]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[3]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[4]	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[5]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[6]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[7]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF controller IS
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
SIGNAL ww_cnt : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_upDown : std_logic;
SIGNAL ww_coe_export_pwmOut : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \coe_export_pwmOut~4_combout\ : std_logic;
SIGNAL \ocr~7_combout\ : std_logic;
SIGNAL \ocr~8_combout\ : std_logic;
SIGNAL \cnt[1]~input_o\ : std_logic;
SIGNAL \cnt[2]~input_o\ : std_logic;
SIGNAL \cnt[5]~input_o\ : std_logic;
SIGNAL \cnt[7]~input_o\ : std_logic;
SIGNAL \cnt[6]~input_o\ : std_logic;
SIGNAL \address[1]~input_o\ : std_logic;
SIGNAL \writedata[6]~input_o\ : std_logic;
SIGNAL \writedata[7]~input_o\ : std_logic;
SIGNAL \coe_export_pwmOut~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \reset_n~input_o\ : std_logic;
SIGNAL \upDown~input_o\ : std_logic;
SIGNAL \coe_export_pwmOut~0_combout\ : std_logic;
SIGNAL \cnt[3]~input_o\ : std_logic;
SIGNAL \chipselect~input_o\ : std_logic;
SIGNAL \write~input_o\ : std_logic;
SIGNAL \address[0]~input_o\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \writedata[2]~input_o\ : std_logic;
SIGNAL \ocr~3_combout\ : std_logic;
SIGNAL \ocr[7]~1_combout\ : std_logic;
SIGNAL \writedata[3]~input_o\ : std_logic;
SIGNAL \ocr~4_combout\ : std_logic;
SIGNAL \coe_export_pwmOut~2_combout\ : std_logic;
SIGNAL \cnt[0]~input_o\ : std_logic;
SIGNAL \writedata[0]~input_o\ : std_logic;
SIGNAL \ocr~0_combout\ : std_logic;
SIGNAL \writedata[1]~input_o\ : std_logic;
SIGNAL \ocr~2_combout\ : std_logic;
SIGNAL \coe_export_pwmOut~1_combout\ : std_logic;
SIGNAL \cnt[4]~input_o\ : std_logic;
SIGNAL \writedata[4]~input_o\ : std_logic;
SIGNAL \ocr~5_combout\ : std_logic;
SIGNAL \writedata[5]~input_o\ : std_logic;
SIGNAL \ocr~6_combout\ : std_logic;
SIGNAL \coe_export_pwmOut~3_combout\ : std_logic;
SIGNAL \coe_export_pwmOut~5_combout\ : std_logic;
SIGNAL \coe_export_pwmOut~6_combout\ : std_logic;
SIGNAL \coe_export_pwmOut~reg0_q\ : std_logic;
SIGNAL ocr : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_address <= address;
ww_writedata <= writedata;
ww_write <= write;
ww_chipselect <= chipselect;
ww_clk <= clk;
ww_reset_n <= reset_n;
ww_cnt <= cnt;
ww_upDown <= upDown;
coe_export_pwmOut <= ww_coe_export_pwmOut;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: FF_X32_Y24_N17
\ocr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ocr~7_combout\,
	ena => \ocr[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ocr(6));

-- Location: FF_X32_Y24_N23
\ocr[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ocr~8_combout\,
	sload => VCC,
	ena => \ocr[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ocr(7));

-- Location: LCCOMB_X32_Y24_N22
\coe_export_pwmOut~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \coe_export_pwmOut~4_combout\ = (\cnt[6]~input_o\ & ((ocr(6)) # (\cnt[7]~input_o\ $ (!ocr(7))))) # (!\cnt[6]~input_o\ & ((\cnt[7]~input_o\ $ (!ocr(7))) # (!ocr(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101111010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cnt[6]~input_o\,
	datab => \cnt[7]~input_o\,
	datac => ocr(7),
	datad => ocr(6),
	combout => \coe_export_pwmOut~4_combout\);

-- Location: LCCOMB_X32_Y24_N16
\ocr~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ocr~7_combout\ = (\process_0~0_combout\ & !\writedata[6]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datac => \writedata[6]~input_o\,
	combout => \ocr~7_combout\);

-- Location: LCCOMB_X32_Y24_N30
\ocr~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ocr~8_combout\ = (\process_0~0_combout\ & !\writedata[7]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datac => \writedata[7]~input_o\,
	combout => \ocr~8_combout\);

-- Location: IOIBUF_X33_Y24_N8
\cnt[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cnt(1),
	o => \cnt[1]~input_o\);

-- Location: IOIBUF_X33_Y25_N1
\cnt[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cnt(2),
	o => \cnt[2]~input_o\);

-- Location: IOIBUF_X33_Y27_N8
\cnt[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cnt(5),
	o => \cnt[5]~input_o\);

-- Location: IOIBUF_X31_Y31_N1
\cnt[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cnt(7),
	o => \cnt[7]~input_o\);

-- Location: IOIBUF_X33_Y16_N22
\cnt[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cnt(6),
	o => \cnt[6]~input_o\);

-- Location: IOIBUF_X33_Y16_N1
\address[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(1),
	o => \address[1]~input_o\);

-- Location: IOIBUF_X33_Y15_N8
\writedata[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(6),
	o => \writedata[6]~input_o\);

-- Location: IOIBUF_X33_Y24_N1
\writedata[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(7),
	o => \writedata[7]~input_o\);

-- Location: IOOBUF_X26_Y31_N9
\coe_export_pwmOut~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \coe_export_pwmOut~reg0_q\,
	devoe => ww_devoe,
	o => \coe_export_pwmOut~output_o\);

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

-- Location: IOIBUF_X29_Y31_N8
\reset_n~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_n,
	o => \reset_n~input_o\);

-- Location: IOIBUF_X33_Y28_N1
\upDown~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_upDown,
	o => \upDown~input_o\);

-- Location: LCCOMB_X32_Y24_N14
\coe_export_pwmOut~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \coe_export_pwmOut~0_combout\ = (\upDown~input_o\) # (!\reset_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset_n~input_o\,
	datad => \upDown~input_o\,
	combout => \coe_export_pwmOut~0_combout\);

-- Location: IOIBUF_X33_Y22_N1
\cnt[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cnt(3),
	o => \cnt[3]~input_o\);

-- Location: IOIBUF_X33_Y16_N8
\chipselect~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_chipselect,
	o => \chipselect~input_o\);

-- Location: IOIBUF_X33_Y14_N1
\write~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write,
	o => \write~input_o\);

-- Location: IOIBUF_X33_Y16_N15
\address[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(0),
	o => \address[0]~input_o\);

-- Location: LCCOMB_X32_Y16_N4
\process_0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = (!\address[1]~input_o\ & (\chipselect~input_o\ & (\write~input_o\ & \address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \chipselect~input_o\,
	datac => \write~input_o\,
	datad => \address[0]~input_o\,
	combout => \process_0~0_combout\);

-- Location: IOIBUF_X33_Y14_N8
\writedata[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(2),
	o => \writedata[2]~input_o\);

-- Location: LCCOMB_X32_Y16_N10
\ocr~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ocr~3_combout\ = (\process_0~0_combout\ & !\writedata[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \process_0~0_combout\,
	datad => \writedata[2]~input_o\,
	combout => \ocr~3_combout\);

-- Location: LCCOMB_X32_Y24_N12
\ocr[7]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ocr[7]~1_combout\ = (\process_0~0_combout\) # (!\reset_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset_n~input_o\,
	datad => \process_0~0_combout\,
	combout => \ocr[7]~1_combout\);

-- Location: FF_X32_Y24_N5
\ocr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ocr~3_combout\,
	sload => VCC,
	ena => \ocr[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ocr(2));

-- Location: IOIBUF_X29_Y31_N1
\writedata[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(3),
	o => \writedata[3]~input_o\);

-- Location: LCCOMB_X32_Y24_N2
\ocr~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ocr~4_combout\ = (!\writedata[3]~input_o\ & \process_0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \writedata[3]~input_o\,
	datad => \process_0~0_combout\,
	combout => \ocr~4_combout\);

-- Location: FF_X32_Y24_N3
\ocr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ocr~4_combout\,
	ena => \ocr[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ocr(3));

-- Location: LCCOMB_X32_Y24_N4
\coe_export_pwmOut~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \coe_export_pwmOut~2_combout\ = (\cnt[2]~input_o\ & ((ocr(2)) # (\cnt[3]~input_o\ $ (!ocr(3))))) # (!\cnt[2]~input_o\ & ((\cnt[3]~input_o\ $ (!ocr(3))) # (!ocr(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110110110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cnt[2]~input_o\,
	datab => \cnt[3]~input_o\,
	datac => ocr(2),
	datad => ocr(3),
	combout => \coe_export_pwmOut~2_combout\);

-- Location: IOIBUF_X33_Y28_N8
\cnt[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cnt(0),
	o => \cnt[0]~input_o\);

-- Location: IOIBUF_X33_Y25_N8
\writedata[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(0),
	o => \writedata[0]~input_o\);

-- Location: LCCOMB_X32_Y24_N26
\ocr~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ocr~0_combout\ = (\process_0~0_combout\ & !\writedata[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datac => \writedata[0]~input_o\,
	combout => \ocr~0_combout\);

-- Location: FF_X32_Y24_N9
\ocr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ocr~0_combout\,
	sload => VCC,
	ena => \ocr[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ocr(0));

-- Location: IOIBUF_X33_Y27_N1
\writedata[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(1),
	o => \writedata[1]~input_o\);

-- Location: LCCOMB_X32_Y24_N6
\ocr~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ocr~2_combout\ = (\process_0~0_combout\ & !\writedata[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datad => \writedata[1]~input_o\,
	combout => \ocr~2_combout\);

-- Location: FF_X32_Y24_N7
\ocr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ocr~2_combout\,
	ena => \ocr[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ocr(1));

-- Location: LCCOMB_X32_Y24_N8
\coe_export_pwmOut~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \coe_export_pwmOut~1_combout\ = (\cnt[1]~input_o\ & ((ocr(1)) # (\cnt[0]~input_o\ $ (!ocr(0))))) # (!\cnt[1]~input_o\ & ((\cnt[0]~input_o\ $ (!ocr(0))) # (!ocr(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101111010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cnt[1]~input_o\,
	datab => \cnt[0]~input_o\,
	datac => ocr(0),
	datad => ocr(1),
	combout => \coe_export_pwmOut~1_combout\);

-- Location: IOIBUF_X31_Y31_N8
\cnt[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cnt(4),
	o => \cnt[4]~input_o\);

-- Location: IOIBUF_X33_Y15_N1
\writedata[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(4),
	o => \writedata[4]~input_o\);

-- Location: LCCOMB_X32_Y16_N0
\ocr~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ocr~5_combout\ = (!\writedata[4]~input_o\ & \process_0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \writedata[4]~input_o\,
	datac => \process_0~0_combout\,
	combout => \ocr~5_combout\);

-- Location: FF_X32_Y24_N21
\ocr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \ocr~5_combout\,
	sload => VCC,
	ena => \ocr[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ocr(4));

-- Location: IOIBUF_X33_Y22_N8
\writedata[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(5),
	o => \writedata[5]~input_o\);

-- Location: LCCOMB_X32_Y24_N10
\ocr~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ocr~6_combout\ = (\process_0~0_combout\ & !\writedata[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datac => \writedata[5]~input_o\,
	combout => \ocr~6_combout\);

-- Location: FF_X32_Y24_N11
\ocr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ocr~6_combout\,
	ena => \ocr[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ocr(5));

-- Location: LCCOMB_X32_Y24_N20
\coe_export_pwmOut~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \coe_export_pwmOut~3_combout\ = (\cnt[5]~input_o\ & ((ocr(5)) # (\cnt[4]~input_o\ $ (!ocr(4))))) # (!\cnt[5]~input_o\ & ((\cnt[4]~input_o\ $ (!ocr(4))) # (!ocr(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101111010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cnt[5]~input_o\,
	datab => \cnt[4]~input_o\,
	datac => ocr(4),
	datad => ocr(5),
	combout => \coe_export_pwmOut~3_combout\);

-- Location: LCCOMB_X32_Y24_N0
\coe_export_pwmOut~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \coe_export_pwmOut~5_combout\ = (\coe_export_pwmOut~4_combout\) # ((\coe_export_pwmOut~2_combout\) # ((\coe_export_pwmOut~1_combout\) # (\coe_export_pwmOut~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \coe_export_pwmOut~4_combout\,
	datab => \coe_export_pwmOut~2_combout\,
	datac => \coe_export_pwmOut~1_combout\,
	datad => \coe_export_pwmOut~3_combout\,
	combout => \coe_export_pwmOut~5_combout\);

-- Location: LCCOMB_X32_Y24_N24
\coe_export_pwmOut~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \coe_export_pwmOut~6_combout\ = (\process_0~0_combout\ & (((\coe_export_pwmOut~reg0_q\)))) # (!\process_0~0_combout\ & ((\coe_export_pwmOut~0_combout\) # ((\coe_export_pwmOut~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~0_combout\,
	datab => \coe_export_pwmOut~0_combout\,
	datac => \coe_export_pwmOut~reg0_q\,
	datad => \coe_export_pwmOut~5_combout\,
	combout => \coe_export_pwmOut~6_combout\);

-- Location: FF_X32_Y24_N25
\coe_export_pwmOut~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \coe_export_pwmOut~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \coe_export_pwmOut~reg0_q\);

ww_coe_export_pwmOut <= \coe_export_pwmOut~output_o\;
END structure;


