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
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 12.1 Build 177 11/07/2012 SJ Web Edition"

-- DATE "12/14/2012 17:52:47"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	seg7 IS
    PORT (
	num_in : IN std_logic_vector(4 DOWNTO 0);
	clk : IN std_logic;
	rst_n : IN std_logic;
	num_out : OUT std_logic_vector(0 TO 6);
	dp_out : OUT std_logic
	);
END seg7;

-- Design Ports Information
-- num_out[6]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- num_out[5]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- num_out[4]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- num_out[3]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- num_out[2]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- num_out[1]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- num_out[0]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dp_out	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst_n	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- num_in[1]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- num_in[2]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- num_in[3]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- num_in[4]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- num_in[0]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF seg7 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_num_in : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst_n : std_logic;
SIGNAL ww_num_out : std_logic_vector(0 TO 6);
SIGNAL ww_dp_out : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \num_in[3]~input_o\ : std_logic;
SIGNAL \num_out[6]~output_o\ : std_logic;
SIGNAL \num_out[5]~output_o\ : std_logic;
SIGNAL \num_out[4]~output_o\ : std_logic;
SIGNAL \num_out[3]~output_o\ : std_logic;
SIGNAL \num_out[2]~output_o\ : std_logic;
SIGNAL \num_out[1]~output_o\ : std_logic;
SIGNAL \num_out[0]~output_o\ : std_logic;
SIGNAL \dp_out~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \rst_n~input_o\ : std_logic;
SIGNAL \num_in[1]~input_o\ : std_logic;
SIGNAL \num_in[2]~input_o\ : std_logic;
SIGNAL \num_in[4]~input_o\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \num_out~0_combout\ : std_logic;
SIGNAL \num_out[6]~reg0_q\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \num_out~1_combout\ : std_logic;
SIGNAL \num_out[5]~reg0_q\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \num_out~2_combout\ : std_logic;
SIGNAL \num_out[4]~reg0_q\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \num_out~3_combout\ : std_logic;
SIGNAL \num_out[3]~reg0_q\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \num_out~4_combout\ : std_logic;
SIGNAL \num_out[2]~reg0_q\ : std_logic;
SIGNAL \num_out~5_combout\ : std_logic;
SIGNAL \num_out[1]~reg0_q\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \num_out~6_combout\ : std_logic;
SIGNAL \num_out[0]~reg0_q\ : std_logic;
SIGNAL \num_in[0]~input_o\ : std_logic;
SIGNAL \dp_out~0_combout\ : std_logic;
SIGNAL \dp_out~reg0_q\ : std_logic;

BEGIN

ww_num_in <= num_in;
ww_clk <= clk;
ww_rst_n <= rst_n;
num_out <= ww_num_out;
dp_out <= ww_dp_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: LCCOMB_X23_Y27_N26
\Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\num_in[2]~input_o\ & ((\num_in[1]~input_o\ & ((\num_in[4]~input_o\))) # (!\num_in[1]~input_o\ & (\num_in[3]~input_o\)))) # (!\num_in[2]~input_o\ & (\num_in[3]~input_o\ & (\num_in[1]~input_o\ $ (\num_in[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \num_in[3]~input_o\,
	datab => \num_in[1]~input_o\,
	datac => \num_in[2]~input_o\,
	datad => \num_in[4]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: IOIBUF_X0_Y23_N8
\num_in[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_num_in(3),
	o => \num_in[3]~input_o\);

-- Location: IOOBUF_X26_Y29_N16
\num_out[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \num_out[6]~reg0_q\,
	devoe => ww_devoe,
	o => \num_out[6]~output_o\);

-- Location: IOOBUF_X28_Y29_N23
\num_out[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \num_out[5]~reg0_q\,
	devoe => ww_devoe,
	o => \num_out[5]~output_o\);

-- Location: IOOBUF_X26_Y29_N9
\num_out[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \num_out[4]~reg0_q\,
	devoe => ww_devoe,
	o => \num_out[4]~output_o\);

-- Location: IOOBUF_X28_Y29_N30
\num_out[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \num_out[3]~reg0_q\,
	devoe => ww_devoe,
	o => \num_out[3]~output_o\);

-- Location: IOOBUF_X26_Y29_N2
\num_out[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \num_out[2]~reg0_q\,
	devoe => ww_devoe,
	o => \num_out[2]~output_o\);

-- Location: IOOBUF_X21_Y29_N30
\num_out[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \num_out[1]~reg0_q\,
	devoe => ww_devoe,
	o => \num_out[1]~output_o\);

-- Location: IOOBUF_X21_Y29_N23
\num_out[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \num_out[0]~reg0_q\,
	devoe => ww_devoe,
	o => \num_out[0]~output_o\);

-- Location: IOOBUF_X23_Y29_N9
\dp_out~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dp_out~reg0_q\,
	devoe => ww_devoe,
	o => \dp_out~output_o\);

-- Location: IOIBUF_X41_Y15_N1
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G9
\clk~inputclkctrl\ : cycloneiii_clkctrl
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

-- Location: IOIBUF_X0_Y21_N8
\rst_n~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst_n,
	o => \rst_n~input_o\);

-- Location: IOIBUF_X0_Y27_N1
\num_in[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_num_in(1),
	o => \num_in[1]~input_o\);

-- Location: IOIBUF_X0_Y25_N22
\num_in[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_num_in(2),
	o => \num_in[2]~input_o\);

-- Location: IOIBUF_X0_Y27_N22
\num_in[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_num_in(4),
	o => \num_in[4]~input_o\);

-- Location: LCCOMB_X23_Y27_N16
\Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\num_in[1]~input_o\ & ((\num_in[4]~input_o\) # (\num_in[3]~input_o\ $ (\num_in[2]~input_o\)))) # (!\num_in[1]~input_o\ & ((\num_in[2]~input_o\) # (\num_in[3]~input_o\ $ (\num_in[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110101111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \num_in[3]~input_o\,
	datab => \num_in[1]~input_o\,
	datac => \num_in[2]~input_o\,
	datad => \num_in[4]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X23_Y27_N24
\num_out~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \num_out~0_combout\ = (\rst_n~input_o\ & !\Mux6~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_n~input_o\,
	datad => \Mux6~0_combout\,
	combout => \num_out~0_combout\);

-- Location: FF_X23_Y27_N25
\num_out[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \num_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \num_out[6]~reg0_q\);

-- Location: LCCOMB_X23_Y27_N18
\Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\num_in[3]~input_o\ & (\num_in[1]~input_o\ & (\num_in[2]~input_o\ $ (\num_in[4]~input_o\)))) # (!\num_in[3]~input_o\ & (!\num_in[4]~input_o\ & ((\num_in[1]~input_o\) # (\num_in[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100011010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \num_in[3]~input_o\,
	datab => \num_in[1]~input_o\,
	datac => \num_in[2]~input_o\,
	datad => \num_in[4]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X23_Y27_N10
\num_out~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \num_out~1_combout\ = (\rst_n~input_o\ & \Mux5~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_n~input_o\,
	datad => \Mux5~0_combout\,
	combout => \num_out~1_combout\);

-- Location: FF_X23_Y27_N11
\num_out[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \num_out~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \num_out[5]~reg0_q\);

-- Location: LCCOMB_X23_Y27_N28
\Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\num_in[2]~input_o\ & (((\num_in[1]~input_o\ & !\num_in[4]~input_o\)))) # (!\num_in[2]~input_o\ & ((\num_in[3]~input_o\ & ((!\num_in[4]~input_o\))) # (!\num_in[3]~input_o\ & (\num_in[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \num_in[3]~input_o\,
	datab => \num_in[1]~input_o\,
	datac => \num_in[2]~input_o\,
	datad => \num_in[4]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X23_Y27_N4
\num_out~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \num_out~2_combout\ = (\rst_n~input_o\ & \Mux4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_n~input_o\,
	datad => \Mux4~0_combout\,
	combout => \num_out~2_combout\);

-- Location: FF_X23_Y27_N5
\num_out[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \num_out~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \num_out[4]~reg0_q\);

-- Location: LCCOMB_X23_Y27_N6
\Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\num_in[1]~input_o\ & (\num_in[3]~input_o\ $ ((!\num_in[2]~input_o\)))) # (!\num_in[1]~input_o\ & ((\num_in[3]~input_o\ & (!\num_in[2]~input_o\ & !\num_in[4]~input_o\)) # (!\num_in[3]~input_o\ & (\num_in[2]~input_o\ & 
-- \num_in[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010010000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \num_in[3]~input_o\,
	datab => \num_in[1]~input_o\,
	datac => \num_in[2]~input_o\,
	datad => \num_in[4]~input_o\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X23_Y27_N14
\num_out~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \num_out~3_combout\ = (\rst_n~input_o\ & \Mux3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_n~input_o\,
	datad => \Mux3~0_combout\,
	combout => \num_out~3_combout\);

-- Location: FF_X23_Y27_N15
\num_out[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \num_out~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \num_out[3]~reg0_q\);

-- Location: LCCOMB_X23_Y27_N8
\Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\num_in[3]~input_o\ & (\num_in[4]~input_o\ & ((\num_in[2]~input_o\) # (!\num_in[1]~input_o\)))) # (!\num_in[3]~input_o\ & (!\num_in[1]~input_o\ & (\num_in[2]~input_o\ & !\num_in[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \num_in[3]~input_o\,
	datab => \num_in[1]~input_o\,
	datac => \num_in[2]~input_o\,
	datad => \num_in[4]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X23_Y27_N0
\num_out~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \num_out~4_combout\ = (\Mux2~0_combout\ & \rst_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux2~0_combout\,
	datac => \rst_n~input_o\,
	combout => \num_out~4_combout\);

-- Location: FF_X23_Y27_N1
\num_out[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \num_out~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \num_out[2]~reg0_q\);

-- Location: LCCOMB_X23_Y27_N2
\num_out~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \num_out~5_combout\ = (\Mux1~0_combout\ & \rst_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1~0_combout\,
	datac => \rst_n~input_o\,
	combout => \num_out~5_combout\);

-- Location: FF_X23_Y27_N3
\num_out[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \num_out~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \num_out[1]~reg0_q\);

-- Location: LCCOMB_X23_Y27_N12
\Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\num_in[3]~input_o\ & (!\num_in[2]~input_o\ & (\num_in[1]~input_o\ $ (!\num_in[4]~input_o\)))) # (!\num_in[3]~input_o\ & (\num_in[1]~input_o\ & (\num_in[2]~input_o\ $ (!\num_in[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \num_in[3]~input_o\,
	datab => \num_in[1]~input_o\,
	datac => \num_in[2]~input_o\,
	datad => \num_in[4]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X23_Y27_N20
\num_out~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \num_out~6_combout\ = (\rst_n~input_o\ & \Mux0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_n~input_o\,
	datad => \Mux0~0_combout\,
	combout => \num_out~6_combout\);

-- Location: FF_X23_Y27_N21
\num_out[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \num_out~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \num_out[0]~reg0_q\);

-- Location: IOIBUF_X0_Y24_N1
\num_in[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_num_in(0),
	o => \num_in[0]~input_o\);

-- Location: LCCOMB_X23_Y27_N22
\dp_out~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \dp_out~0_combout\ = (\rst_n~input_o\ & !\num_in[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_n~input_o\,
	datad => \num_in[0]~input_o\,
	combout => \dp_out~0_combout\);

-- Location: FF_X23_Y27_N23
\dp_out~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \dp_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dp_out~reg0_q\);

ww_num_out(6) <= \num_out[6]~output_o\;

ww_num_out(5) <= \num_out[5]~output_o\;

ww_num_out(4) <= \num_out[4]~output_o\;

ww_num_out(3) <= \num_out[3]~output_o\;

ww_num_out(2) <= \num_out[2]~output_o\;

ww_num_out(1) <= \num_out[1]~output_o\;

ww_num_out(0) <= \num_out[0]~output_o\;

ww_dp_out <= \dp_out~output_o\;
END structure;


