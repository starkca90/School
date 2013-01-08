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

-- DATE "01/07/2013 20:08:54"

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

ENTITY 	SpriteLogic IS
    PORT (
	scan_code : IN std_logic_vector(7 DOWNTO 0);
	scan_finished : IN std_logic;
	h_corner : OUT std_logic_vector(9 DOWNTO 0);
	v_corner : OUT std_logic_vector(9 DOWNTO 0)
	);
END SpriteLogic;

-- Design Ports Information
-- h_corner[0]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- h_corner[1]	=>  Location: PIN_L21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- h_corner[2]	=>  Location: PIN_K19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- h_corner[3]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- h_corner[4]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- h_corner[5]	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- h_corner[6]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- h_corner[7]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- h_corner[8]	=>  Location: PIN_J21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- h_corner[9]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- v_corner[0]	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- v_corner[1]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- v_corner[2]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- v_corner[3]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- v_corner[4]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- v_corner[5]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- v_corner[6]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- v_corner[7]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- v_corner[8]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- v_corner[9]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- scan_finished	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- scan_code[5]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- scan_code[1]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- scan_code[0]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- scan_code[3]	=>  Location: PIN_B20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- scan_code[4]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- scan_code[6]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- scan_code[7]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- scan_code[2]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF SpriteLogic IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_scan_code : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_scan_finished : std_logic;
SIGNAL ww_h_corner : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_v_corner : std_logic_vector(9 DOWNTO 0);
SIGNAL \scan_finished~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \h_corner_sig[0]~1_combout\ : std_logic;
SIGNAL \h_corner_sig[0]~9_combout\ : std_logic;
SIGNAL \v_corner_sig[0]~0_combout\ : std_logic;
SIGNAL \v_corner_sig[0]~3_combout\ : std_logic;
SIGNAL \v_corner_sig[0]~7_combout\ : std_logic;
SIGNAL \scan_code[0]~input_o\ : std_logic;
SIGNAL \h_corner[0]~output_o\ : std_logic;
SIGNAL \h_corner[1]~output_o\ : std_logic;
SIGNAL \h_corner[2]~output_o\ : std_logic;
SIGNAL \h_corner[3]~output_o\ : std_logic;
SIGNAL \h_corner[4]~output_o\ : std_logic;
SIGNAL \h_corner[5]~output_o\ : std_logic;
SIGNAL \h_corner[6]~output_o\ : std_logic;
SIGNAL \h_corner[7]~output_o\ : std_logic;
SIGNAL \h_corner[8]~output_o\ : std_logic;
SIGNAL \h_corner[9]~output_o\ : std_logic;
SIGNAL \v_corner[0]~output_o\ : std_logic;
SIGNAL \v_corner[1]~output_o\ : std_logic;
SIGNAL \v_corner[2]~output_o\ : std_logic;
SIGNAL \v_corner[3]~output_o\ : std_logic;
SIGNAL \v_corner[4]~output_o\ : std_logic;
SIGNAL \v_corner[5]~output_o\ : std_logic;
SIGNAL \v_corner[6]~output_o\ : std_logic;
SIGNAL \v_corner[7]~output_o\ : std_logic;
SIGNAL \v_corner[8]~output_o\ : std_logic;
SIGNAL \v_corner[9]~output_o\ : std_logic;
SIGNAL \scan_finished~input_o\ : std_logic;
SIGNAL \scan_finished~inputclkctrl_outclk\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \h_corner_sig[0]~feeder_combout\ : std_logic;
SIGNAL \scan_code[1]~input_o\ : std_logic;
SIGNAL \scan_code[7]~input_o\ : std_logic;
SIGNAL \scan_code[2]~input_o\ : std_logic;
SIGNAL \h_corner_sig[0]~8_combout\ : std_logic;
SIGNAL \scan_code[4]~input_o\ : std_logic;
SIGNAL \scan_code[3]~input_o\ : std_logic;
SIGNAL \h_corner_sig[0]~10_combout\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \h_corner_sig[1]~12_combout\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \h_corner_sig[2]~feeder_combout\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \h_corner_sig[5]~13_combout\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \h_corner_sig[6]~14_combout\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~16_combout\ : std_logic;
SIGNAL \Add1~17\ : std_logic;
SIGNAL \Add1~18_combout\ : std_logic;
SIGNAL \Add1~19\ : std_logic;
SIGNAL \Add1~20_combout\ : std_logic;
SIGNAL \h_corner_sig[9]~15_combout\ : std_logic;
SIGNAL \h_corner_sig[0]~3_combout\ : std_logic;
SIGNAL \scan_code[5]~input_o\ : std_logic;
SIGNAL \scan_code[6]~input_o\ : std_logic;
SIGNAL \h_corner_sig[0]~0_combout\ : std_logic;
SIGNAL \h_corner_sig[0]~2_combout\ : std_logic;
SIGNAL \h_corner_sig[0]~4_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \h_corner_sig[0]~5_combout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \h_corner_sig[0]~6_combout\ : std_logic;
SIGNAL \h_corner_sig[0]~7_combout\ : std_logic;
SIGNAL \h_corner_sig[0]~11_combout\ : std_logic;
SIGNAL \h_corner[0]~reg0_q\ : std_logic;
SIGNAL \h_corner[1]~0_combout\ : std_logic;
SIGNAL \h_corner[1]~reg0_q\ : std_logic;
SIGNAL \h_corner[2]~reg0_q\ : std_logic;
SIGNAL \h_corner[3]~reg0feeder_combout\ : std_logic;
SIGNAL \h_corner[3]~reg0_q\ : std_logic;
SIGNAL \h_corner[4]~reg0feeder_combout\ : std_logic;
SIGNAL \h_corner[4]~reg0_q\ : std_logic;
SIGNAL \h_corner[5]~1_combout\ : std_logic;
SIGNAL \h_corner[5]~reg0_q\ : std_logic;
SIGNAL \h_corner[6]~2_combout\ : std_logic;
SIGNAL \h_corner[6]~reg0_q\ : std_logic;
SIGNAL \h_corner[7]~reg0feeder_combout\ : std_logic;
SIGNAL \h_corner[7]~reg0_q\ : std_logic;
SIGNAL \h_corner[8]~reg0feeder_combout\ : std_logic;
SIGNAL \h_corner[8]~reg0_q\ : std_logic;
SIGNAL \h_corner[9]~3_combout\ : std_logic;
SIGNAL \h_corner[9]~reg0_q\ : std_logic;
SIGNAL \Add4~2_combout\ : std_logic;
SIGNAL \Equal7~0_combout\ : std_logic;
SIGNAL \v_corner_sig[0]~1_combout\ : std_logic;
SIGNAL \Add4~3\ : std_logic;
SIGNAL \Add4~5\ : std_logic;
SIGNAL \Add4~7\ : std_logic;
SIGNAL \Add4~9\ : std_logic;
SIGNAL \Add4~11\ : std_logic;
SIGNAL \Add4~12_combout\ : std_logic;
SIGNAL \v_corner_sig[5]~11_combout\ : std_logic;
SIGNAL \Add4~13\ : std_logic;
SIGNAL \Add4~15\ : std_logic;
SIGNAL \Add4~16_combout\ : std_logic;
SIGNAL \v_corner_sig[7]~13_combout\ : std_logic;
SIGNAL \Add4~17\ : std_logic;
SIGNAL \Add4~18_combout\ : std_logic;
SIGNAL \Add4~8_combout\ : std_logic;
SIGNAL \Add4~4_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \Add4~10_combout\ : std_logic;
SIGNAL \v_corner_sig[4]~10_combout\ : std_logic;
SIGNAL \LessThan3~1_combout\ : std_logic;
SIGNAL \LessThan3~2_combout\ : std_logic;
SIGNAL \v_corner_sig[0]~2_combout\ : std_logic;
SIGNAL \Add4~14_combout\ : std_logic;
SIGNAL \v_corner_sig[6]~12_combout\ : std_logic;
SIGNAL \Add3~1\ : std_logic;
SIGNAL \Add3~3\ : std_logic;
SIGNAL \Add3~5\ : std_logic;
SIGNAL \Add3~7\ : std_logic;
SIGNAL \Add3~8_combout\ : std_logic;
SIGNAL \v_corner_sig[0]~8_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \Add4~6_combout\ : std_logic;
SIGNAL \v_corner_sig[0]~5_combout\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \Add3~4_combout\ : std_logic;
SIGNAL \Add3~6_combout\ : std_logic;
SIGNAL \v_corner_sig[0]~4_combout\ : std_logic;
SIGNAL \v_corner_sig[0]~6_combout\ : std_logic;
SIGNAL \v_corner_sig[0]~9_combout\ : std_logic;
SIGNAL \v_corner[0]~reg0feeder_combout\ : std_logic;
SIGNAL \v_corner[0]~reg0_q\ : std_logic;
SIGNAL \v_corner[1]~reg0feeder_combout\ : std_logic;
SIGNAL \v_corner[1]~reg0_q\ : std_logic;
SIGNAL \v_corner[2]~reg0feeder_combout\ : std_logic;
SIGNAL \v_corner[2]~reg0_q\ : std_logic;
SIGNAL \v_corner[3]~reg0feeder_combout\ : std_logic;
SIGNAL \v_corner[3]~reg0_q\ : std_logic;
SIGNAL \v_corner[4]~0_combout\ : std_logic;
SIGNAL \v_corner[4]~reg0_q\ : std_logic;
SIGNAL \v_corner[5]~1_combout\ : std_logic;
SIGNAL \v_corner[5]~reg0_q\ : std_logic;
SIGNAL \v_corner[6]~2_combout\ : std_logic;
SIGNAL \v_corner[6]~reg0_q\ : std_logic;
SIGNAL \v_corner[7]~3_combout\ : std_logic;
SIGNAL \v_corner[7]~reg0_q\ : std_logic;
SIGNAL \v_corner[8]~reg0feeder_combout\ : std_logic;
SIGNAL \v_corner[8]~reg0_q\ : std_logic;
SIGNAL \Add4~19\ : std_logic;
SIGNAL \Add4~20_combout\ : std_logic;
SIGNAL \v_corner[9]~reg0feeder_combout\ : std_logic;
SIGNAL \v_corner[9]~reg0_q\ : std_logic;
SIGNAL v_corner_sig : std_logic_vector(9 DOWNTO 0);
SIGNAL h_corner_sig : std_logic_vector(9 DOWNTO 0);

BEGIN

ww_scan_code <= scan_code;
ww_scan_finished <= scan_finished;
h_corner <= ww_h_corner;
v_corner <= ww_v_corner;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\scan_finished~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \scan_finished~input_o\);

-- Location: LCCOMB_X38_Y19_N20
\Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (h_corner_sig(7) & (\Add0~3\ $ (GND))) # (!h_corner_sig(7) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((h_corner_sig(7) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => h_corner_sig(7),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X38_Y19_N10
\h_corner_sig[0]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[0]~1_combout\ = (\h_corner_sig[0]~0_combout\) # ((!h_corner_sig(2) & ((h_corner_sig(1)) # (!h_corner_sig(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => h_corner_sig(0),
	datab => \h_corner_sig[0]~0_combout\,
	datac => h_corner_sig(2),
	datad => h_corner_sig(1),
	combout => \h_corner_sig[0]~1_combout\);

-- Location: LCCOMB_X32_Y27_N10
\h_corner_sig[0]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[0]~9_combout\ = (\scan_code[7]~input_o\ & (!\scan_code[5]~input_o\ & (!\scan_code[4]~input_o\ & !\scan_code[6]~input_o\))) # (!\scan_code[7]~input_o\ & (\scan_code[5]~input_o\ & (\scan_code[4]~input_o\ & \scan_code[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \scan_code[7]~input_o\,
	datab => \scan_code[5]~input_o\,
	datac => \scan_code[4]~input_o\,
	datad => \scan_code[6]~input_o\,
	combout => \h_corner_sig[0]~9_combout\);

-- Location: LCCOMB_X32_Y27_N22
\v_corner_sig[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner_sig[0]~0_combout\ = (\scan_code[0]~input_o\ & (!\scan_code[1]~input_o\ & (\scan_code[4]~input_o\ & !\scan_code[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \scan_code[0]~input_o\,
	datab => \scan_code[1]~input_o\,
	datac => \scan_code[4]~input_o\,
	datad => \scan_code[3]~input_o\,
	combout => \v_corner_sig[0]~0_combout\);

-- Location: LCCOMB_X32_Y27_N2
\v_corner_sig[0]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner_sig[0]~3_combout\ = (\scan_code[0]~input_o\ & (((!\scan_code[3]~input_o\)) # (!\scan_code[2]~input_o\))) # (!\scan_code[0]~input_o\ & (((!\scan_code[2]~input_o\ & \scan_code[3]~input_o\)) # (!\scan_code[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \scan_code[0]~input_o\,
	datab => \scan_code[2]~input_o\,
	datac => \scan_code[4]~input_o\,
	datad => \scan_code[3]~input_o\,
	combout => \v_corner_sig[0]~3_combout\);

-- Location: LCCOMB_X32_Y27_N0
\v_corner_sig[0]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner_sig[0]~7_combout\ = (\scan_code[7]~input_o\) # (((!\scan_code[5]~input_o\ & \scan_code[4]~input_o\)) # (!\scan_code[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \scan_code[7]~input_o\,
	datab => \scan_code[5]~input_o\,
	datac => \scan_code[4]~input_o\,
	datad => \scan_code[6]~input_o\,
	combout => \v_corner_sig[0]~7_combout\);

-- Location: IOIBUF_X32_Y29_N22
\scan_code[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_scan_code(0),
	o => \scan_code[0]~input_o\);

-- Location: IOOBUF_X41_Y18_N23
\h_corner[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \h_corner[0]~reg0_q\,
	devoe => ww_devoe,
	o => \h_corner[0]~output_o\);

-- Location: IOOBUF_X41_Y18_N16
\h_corner[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \h_corner[1]~reg0_q\,
	devoe => ww_devoe,
	o => \h_corner[1]~output_o\);

-- Location: IOOBUF_X41_Y18_N2
\h_corner[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \h_corner[2]~reg0_q\,
	devoe => ww_devoe,
	o => \h_corner[2]~output_o\);

-- Location: IOOBUF_X41_Y20_N9
\h_corner[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \h_corner[3]~reg0_q\,
	devoe => ww_devoe,
	o => \h_corner[3]~output_o\);

-- Location: IOOBUF_X41_Y20_N2
\h_corner[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \h_corner[4]~reg0_q\,
	devoe => ww_devoe,
	o => \h_corner[4]~output_o\);

-- Location: IOOBUF_X41_Y18_N9
\h_corner[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \h_corner[5]~reg0_q\,
	devoe => ww_devoe,
	o => \h_corner[5]~output_o\);

-- Location: IOOBUF_X41_Y19_N2
\h_corner[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \h_corner[6]~reg0_q\,
	devoe => ww_devoe,
	o => \h_corner[6]~output_o\);

-- Location: IOOBUF_X41_Y19_N9
\h_corner[7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \h_corner[7]~reg0_q\,
	devoe => ww_devoe,
	o => \h_corner[7]~output_o\);

-- Location: IOOBUF_X41_Y20_N23
\h_corner[8]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \h_corner[8]~reg0_q\,
	devoe => ww_devoe,
	o => \h_corner[8]~output_o\);

-- Location: IOOBUF_X41_Y19_N23
\h_corner[9]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \h_corner[9]~reg0_q\,
	devoe => ww_devoe,
	o => \h_corner[9]~output_o\);

-- Location: IOOBUF_X30_Y29_N30
\v_corner[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \v_corner[0]~reg0_q\,
	devoe => ww_devoe,
	o => \v_corner[0]~output_o\);

-- Location: IOOBUF_X30_Y29_N23
\v_corner[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \v_corner[1]~reg0_q\,
	devoe => ww_devoe,
	o => \v_corner[1]~output_o\);

-- Location: IOOBUF_X28_Y29_N16
\v_corner[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \v_corner[2]~reg0_q\,
	devoe => ww_devoe,
	o => \v_corner[2]~output_o\);

-- Location: IOOBUF_X28_Y29_N23
\v_corner[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \v_corner[3]~reg0_q\,
	devoe => ww_devoe,
	o => \v_corner[3]~output_o\);

-- Location: IOOBUF_X30_Y29_N16
\v_corner[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \v_corner[4]~reg0_q\,
	devoe => ww_devoe,
	o => \v_corner[4]~output_o\);

-- Location: IOOBUF_X30_Y29_N9
\v_corner[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \v_corner[5]~reg0_q\,
	devoe => ww_devoe,
	o => \v_corner[5]~output_o\);

-- Location: IOOBUF_X28_Y29_N30
\v_corner[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \v_corner[6]~reg0_q\,
	devoe => ww_devoe,
	o => \v_corner[6]~output_o\);

-- Location: IOOBUF_X30_Y29_N2
\v_corner[7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \v_corner[7]~reg0_q\,
	devoe => ww_devoe,
	o => \v_corner[7]~output_o\);

-- Location: IOOBUF_X28_Y29_N2
\v_corner[8]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \v_corner[8]~reg0_q\,
	devoe => ww_devoe,
	o => \v_corner[8]~output_o\);

-- Location: IOOBUF_X28_Y29_N9
\v_corner[9]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \v_corner[9]~reg0_q\,
	devoe => ww_devoe,
	o => \v_corner[9]~output_o\);

-- Location: IOIBUF_X0_Y14_N1
\scan_finished~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_scan_finished,
	o => \scan_finished~input_o\);

-- Location: CLKCTRL_G4
\scan_finished~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \scan_finished~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \scan_finished~inputclkctrl_outclk\);

-- Location: LCCOMB_X39_Y19_N4
\Add1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = h_corner_sig(0) $ (VCC)
-- \Add1~3\ = CARRY(h_corner_sig(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => h_corner_sig(0),
	datad => VCC,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X38_Y19_N12
\h_corner_sig[0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[0]~feeder_combout\ = \Add1~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add1~2_combout\,
	combout => \h_corner_sig[0]~feeder_combout\);

-- Location: IOIBUF_X21_Y0_N1
\scan_code[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_scan_code(1),
	o => \scan_code[1]~input_o\);

-- Location: IOIBUF_X32_Y29_N1
\scan_code[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_scan_code(7),
	o => \scan_code[7]~input_o\);

-- Location: IOIBUF_X32_Y29_N29
\scan_code[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_scan_code(2),
	o => \scan_code[2]~input_o\);

-- Location: LCCOMB_X32_Y27_N20
\h_corner_sig[0]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[0]~8_combout\ = (\scan_code[2]~input_o\ & ((\scan_code[0]~input_o\ & (\scan_code[1]~input_o\ & \scan_code[7]~input_o\)) # (!\scan_code[0]~input_o\ & (!\scan_code[1]~input_o\ & !\scan_code[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \scan_code[0]~input_o\,
	datab => \scan_code[1]~input_o\,
	datac => \scan_code[7]~input_o\,
	datad => \scan_code[2]~input_o\,
	combout => \h_corner_sig[0]~8_combout\);

-- Location: IOIBUF_X32_Y29_N15
\scan_code[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_scan_code(4),
	o => \scan_code[4]~input_o\);

-- Location: IOIBUF_X35_Y29_N8
\scan_code[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_scan_code(3),
	o => \scan_code[3]~input_o\);

-- Location: LCCOMB_X32_Y27_N4
\h_corner_sig[0]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[0]~10_combout\ = ((\scan_code[4]~input_o\ $ (!\scan_code[3]~input_o\)) # (!\h_corner_sig[0]~8_combout\)) # (!\h_corner_sig[0]~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \h_corner_sig[0]~9_combout\,
	datab => \h_corner_sig[0]~8_combout\,
	datac => \scan_code[4]~input_o\,
	datad => \scan_code[3]~input_o\,
	combout => \h_corner_sig[0]~10_combout\);

-- Location: LCCOMB_X39_Y19_N6
\Add1~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = (\h_corner_sig[0]~4_combout\ & ((h_corner_sig(1) & ((\Add1~3\) # (GND))) # (!h_corner_sig(1) & (!\Add1~3\)))) # (!\h_corner_sig[0]~4_combout\ & ((h_corner_sig(1) & (!\Add1~3\)) # (!h_corner_sig(1) & (\Add1~3\ & VCC))))
-- \Add1~5\ = CARRY((\h_corner_sig[0]~4_combout\ & ((h_corner_sig(1)) # (!\Add1~3\))) # (!\h_corner_sig[0]~4_combout\ & (h_corner_sig(1) & !\Add1~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \h_corner_sig[0]~4_combout\,
	datab => h_corner_sig(1),
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X38_Y19_N28
\h_corner_sig[1]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[1]~12_combout\ = !\Add1~4_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add1~4_combout\,
	combout => \h_corner_sig[1]~12_combout\);

-- Location: FF_X38_Y19_N29
\h_corner_sig[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \h_corner_sig[1]~12_combout\,
	ena => \h_corner_sig[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_corner_sig(1));

-- Location: LCCOMB_X39_Y19_N8
\Add1~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = ((\h_corner_sig[0]~4_combout\ $ (h_corner_sig(2) $ (\Add1~5\)))) # (GND)
-- \Add1~7\ = CARRY((\h_corner_sig[0]~4_combout\ & (h_corner_sig(2) & !\Add1~5\)) # (!\h_corner_sig[0]~4_combout\ & ((h_corner_sig(2)) # (!\Add1~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \h_corner_sig[0]~4_combout\,
	datab => h_corner_sig(2),
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X38_Y19_N4
\h_corner_sig[2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[2]~feeder_combout\ = \Add1~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~6_combout\,
	combout => \h_corner_sig[2]~feeder_combout\);

-- Location: FF_X38_Y19_N5
\h_corner_sig[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \h_corner_sig[2]~feeder_combout\,
	ena => \h_corner_sig[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_corner_sig(2));

-- Location: LCCOMB_X39_Y19_N10
\Add1~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (\h_corner_sig[0]~4_combout\ & ((h_corner_sig(3) & (!\Add1~7\)) # (!h_corner_sig(3) & ((\Add1~7\) # (GND))))) # (!\h_corner_sig[0]~4_combout\ & ((h_corner_sig(3) & (\Add1~7\ & VCC)) # (!h_corner_sig(3) & (!\Add1~7\))))
-- \Add1~9\ = CARRY((\h_corner_sig[0]~4_combout\ & ((!\Add1~7\) # (!h_corner_sig(3)))) # (!\h_corner_sig[0]~4_combout\ & (!h_corner_sig(3) & !\Add1~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \h_corner_sig[0]~4_combout\,
	datab => h_corner_sig(3),
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: FF_X39_Y19_N11
\h_corner_sig[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \Add1~8_combout\,
	ena => \h_corner_sig[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_corner_sig(3));

-- Location: LCCOMB_X39_Y19_N12
\Add1~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = ((\h_corner_sig[0]~4_combout\ $ (h_corner_sig(4) $ (\Add1~9\)))) # (GND)
-- \Add1~11\ = CARRY((\h_corner_sig[0]~4_combout\ & (h_corner_sig(4) & !\Add1~9\)) # (!\h_corner_sig[0]~4_combout\ & ((h_corner_sig(4)) # (!\Add1~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \h_corner_sig[0]~4_combout\,
	datab => h_corner_sig(4),
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: FF_X39_Y19_N13
\h_corner_sig[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \Add1~10_combout\,
	ena => \h_corner_sig[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_corner_sig(4));

-- Location: LCCOMB_X39_Y19_N14
\Add1~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = (\h_corner_sig[0]~4_combout\ & ((h_corner_sig(5) & ((\Add1~11\) # (GND))) # (!h_corner_sig(5) & (!\Add1~11\)))) # (!\h_corner_sig[0]~4_combout\ & ((h_corner_sig(5) & (!\Add1~11\)) # (!h_corner_sig(5) & (\Add1~11\ & VCC))))
-- \Add1~13\ = CARRY((\h_corner_sig[0]~4_combout\ & ((h_corner_sig(5)) # (!\Add1~11\))) # (!\h_corner_sig[0]~4_combout\ & (h_corner_sig(5) & !\Add1~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \h_corner_sig[0]~4_combout\,
	datab => h_corner_sig(5),
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

-- Location: LCCOMB_X39_Y19_N2
\h_corner_sig[5]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[5]~13_combout\ = !\Add1~12_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~12_combout\,
	combout => \h_corner_sig[5]~13_combout\);

-- Location: FF_X39_Y19_N3
\h_corner_sig[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \h_corner_sig[5]~13_combout\,
	ena => \h_corner_sig[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_corner_sig(5));

-- Location: LCCOMB_X39_Y19_N16
\Add1~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = ((\h_corner_sig[0]~4_combout\ $ (h_corner_sig(6) $ (!\Add1~13\)))) # (GND)
-- \Add1~15\ = CARRY((\h_corner_sig[0]~4_combout\ & (!h_corner_sig(6) & !\Add1~13\)) # (!\h_corner_sig[0]~4_combout\ & ((!\Add1~13\) # (!h_corner_sig(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \h_corner_sig[0]~4_combout\,
	datab => h_corner_sig(6),
	datad => VCC,
	cin => \Add1~13\,
	combout => \Add1~14_combout\,
	cout => \Add1~15\);

-- Location: LCCOMB_X39_Y19_N24
\h_corner_sig[6]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[6]~14_combout\ = !\Add1~14_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add1~14_combout\,
	combout => \h_corner_sig[6]~14_combout\);

-- Location: FF_X39_Y19_N25
\h_corner_sig[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \h_corner_sig[6]~14_combout\,
	ena => \h_corner_sig[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_corner_sig(6));

-- Location: LCCOMB_X39_Y19_N18
\Add1~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~16_combout\ = (\h_corner_sig[0]~4_combout\ & ((h_corner_sig(7) & (!\Add1~15\)) # (!h_corner_sig(7) & ((\Add1~15\) # (GND))))) # (!\h_corner_sig[0]~4_combout\ & ((h_corner_sig(7) & (\Add1~15\ & VCC)) # (!h_corner_sig(7) & (!\Add1~15\))))
-- \Add1~17\ = CARRY((\h_corner_sig[0]~4_combout\ & ((!\Add1~15\) # (!h_corner_sig(7)))) # (!\h_corner_sig[0]~4_combout\ & (!h_corner_sig(7) & !\Add1~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \h_corner_sig[0]~4_combout\,
	datab => h_corner_sig(7),
	datad => VCC,
	cin => \Add1~15\,
	combout => \Add1~16_combout\,
	cout => \Add1~17\);

-- Location: FF_X39_Y19_N19
\h_corner_sig[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \Add1~16_combout\,
	ena => \h_corner_sig[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_corner_sig(7));

-- Location: LCCOMB_X39_Y19_N20
\Add1~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~18_combout\ = ((\h_corner_sig[0]~4_combout\ $ (h_corner_sig(8) $ (\Add1~17\)))) # (GND)
-- \Add1~19\ = CARRY((\h_corner_sig[0]~4_combout\ & (h_corner_sig(8) & !\Add1~17\)) # (!\h_corner_sig[0]~4_combout\ & ((h_corner_sig(8)) # (!\Add1~17\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \h_corner_sig[0]~4_combout\,
	datab => h_corner_sig(8),
	datad => VCC,
	cin => \Add1~17\,
	combout => \Add1~18_combout\,
	cout => \Add1~19\);

-- Location: FF_X39_Y19_N21
\h_corner_sig[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \Add1~18_combout\,
	ena => \h_corner_sig[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_corner_sig(8));

-- Location: LCCOMB_X39_Y19_N22
\Add1~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~20_combout\ = h_corner_sig(9) $ (\Add1~19\ $ (\h_corner_sig[0]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => h_corner_sig(9),
	datad => \h_corner_sig[0]~4_combout\,
	cin => \Add1~19\,
	combout => \Add1~20_combout\);

-- Location: LCCOMB_X39_Y19_N26
\h_corner_sig[9]~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[9]~15_combout\ = !\Add1~20_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~20_combout\,
	combout => \h_corner_sig[9]~15_combout\);

-- Location: FF_X39_Y19_N27
\h_corner_sig[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \h_corner_sig[9]~15_combout\,
	ena => \h_corner_sig[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_corner_sig(9));

-- Location: LCCOMB_X39_Y19_N30
\h_corner_sig[0]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[0]~3_combout\ = (\h_corner_sig[0]~0_combout\) # ((!h_corner_sig(7) & (h_corner_sig(9) & !h_corner_sig(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \h_corner_sig[0]~0_combout\,
	datab => h_corner_sig(7),
	datac => h_corner_sig(9),
	datad => h_corner_sig(8),
	combout => \h_corner_sig[0]~3_combout\);

-- Location: IOIBUF_X21_Y0_N8
\scan_code[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_scan_code(5),
	o => \scan_code[5]~input_o\);

-- Location: IOIBUF_X32_Y29_N8
\scan_code[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_scan_code(6),
	o => \scan_code[6]~input_o\);

-- Location: LCCOMB_X32_Y27_N14
\h_corner_sig[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[0]~0_combout\ = (((\scan_code[7]~input_o\) # (!\scan_code[6]~input_o\)) # (!\scan_code[5]~input_o\)) # (!\Equal7~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal7~0_combout\,
	datab => \scan_code[5]~input_o\,
	datac => \scan_code[7]~input_o\,
	datad => \scan_code[6]~input_o\,
	combout => \h_corner_sig[0]~0_combout\);

-- Location: LCCOMB_X39_Y19_N28
\h_corner_sig[0]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[0]~2_combout\ = (\h_corner_sig[0]~0_combout\) # ((!h_corner_sig(4) & (h_corner_sig(5) & h_corner_sig(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => h_corner_sig(4),
	datab => h_corner_sig(5),
	datac => \h_corner_sig[0]~0_combout\,
	datad => h_corner_sig(6),
	combout => \h_corner_sig[0]~2_combout\);

-- Location: LCCOMB_X38_Y19_N14
\h_corner_sig[0]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[0]~4_combout\ = (\h_corner_sig[0]~3_combout\ & (\h_corner_sig[0]~2_combout\ & ((\h_corner_sig[0]~1_combout\) # (!h_corner_sig(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \h_corner_sig[0]~1_combout\,
	datab => h_corner_sig(3),
	datac => \h_corner_sig[0]~3_combout\,
	datad => \h_corner_sig[0]~2_combout\,
	combout => \h_corner_sig[0]~4_combout\);

-- Location: LCCOMB_X38_Y19_N16
\Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (h_corner_sig(5) & (h_corner_sig(4) & VCC)) # (!h_corner_sig(5) & (h_corner_sig(4) $ (VCC)))
-- \Add0~1\ = CARRY((!h_corner_sig(5) & h_corner_sig(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => h_corner_sig(5),
	datab => h_corner_sig(4),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X38_Y19_N18
\Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (h_corner_sig(6) & ((\Add0~1\) # (GND))) # (!h_corner_sig(6) & (!\Add0~1\))
-- \Add0~3\ = CARRY((h_corner_sig(6)) # (!\Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => h_corner_sig(6),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X38_Y19_N22
\Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (h_corner_sig(8) & (!\Add0~5\)) # (!h_corner_sig(8) & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!h_corner_sig(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => h_corner_sig(8),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X38_Y19_N24
\Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = \Add0~7\ $ (h_corner_sig(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => h_corner_sig(9),
	cin => \Add0~7\,
	combout => \Add0~8_combout\);

-- Location: LCCOMB_X38_Y19_N26
\h_corner_sig[0]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[0]~5_combout\ = (!h_corner_sig(4) & ((h_corner_sig(3)) # ((h_corner_sig(2) & !h_corner_sig(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => h_corner_sig(4),
	datab => h_corner_sig(2),
	datac => h_corner_sig(3),
	datad => h_corner_sig(1),
	combout => \h_corner_sig[0]~5_combout\);

-- Location: LCCOMB_X38_Y19_N0
\h_corner_sig[0]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[0]~6_combout\ = (\Add0~0_combout\ & (\h_corner_sig[0]~5_combout\ & \Add0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~0_combout\,
	datac => \h_corner_sig[0]~5_combout\,
	datad => \Add0~2_combout\,
	combout => \h_corner_sig[0]~6_combout\);

-- Location: LCCOMB_X38_Y19_N2
\h_corner_sig[0]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[0]~7_combout\ = (\Add0~8_combout\ & ((\Add0~4_combout\) # ((\Add0~6_combout\) # (\h_corner_sig[0]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \Add0~8_combout\,
	datac => \Add0~6_combout\,
	datad => \h_corner_sig[0]~6_combout\,
	combout => \h_corner_sig[0]~7_combout\);

-- Location: LCCOMB_X38_Y19_N6
\h_corner_sig[0]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner_sig[0]~11_combout\ = ((!\h_corner_sig[0]~10_combout\ & !\h_corner_sig[0]~7_combout\)) # (!\h_corner_sig[0]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \h_corner_sig[0]~10_combout\,
	datac => \h_corner_sig[0]~4_combout\,
	datad => \h_corner_sig[0]~7_combout\,
	combout => \h_corner_sig[0]~11_combout\);

-- Location: FF_X38_Y19_N13
\h_corner_sig[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \h_corner_sig[0]~feeder_combout\,
	ena => \h_corner_sig[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => h_corner_sig(0));

-- Location: FF_X38_Y19_N19
\h_corner[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	asdata => h_corner_sig(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \h_corner[0]~reg0_q\);

-- Location: LCCOMB_X38_Y19_N30
\h_corner[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner[1]~0_combout\ = !h_corner_sig(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => h_corner_sig(1),
	combout => \h_corner[1]~0_combout\);

-- Location: FF_X38_Y19_N31
\h_corner[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \h_corner[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \h_corner[1]~reg0_q\);

-- Location: FF_X38_Y19_N25
\h_corner[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	asdata => h_corner_sig(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \h_corner[2]~reg0_q\);

-- Location: LCCOMB_X39_Y19_N0
\h_corner[3]~reg0feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner[3]~reg0feeder_combout\ = h_corner_sig(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => h_corner_sig(3),
	combout => \h_corner[3]~reg0feeder_combout\);

-- Location: FF_X39_Y19_N1
\h_corner[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \h_corner[3]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \h_corner[3]~reg0_q\);

-- Location: LCCOMB_X40_Y19_N0
\h_corner[4]~reg0feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner[4]~reg0feeder_combout\ = h_corner_sig(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => h_corner_sig(4),
	combout => \h_corner[4]~reg0feeder_combout\);

-- Location: FF_X40_Y19_N1
\h_corner[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \h_corner[4]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \h_corner[4]~reg0_q\);

-- Location: LCCOMB_X38_Y19_N8
\h_corner[5]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner[5]~1_combout\ = !h_corner_sig(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => h_corner_sig(5),
	combout => \h_corner[5]~1_combout\);

-- Location: FF_X38_Y19_N9
\h_corner[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \h_corner[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \h_corner[5]~reg0_q\);

-- Location: LCCOMB_X40_Y19_N22
\h_corner[6]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner[6]~2_combout\ = !h_corner_sig(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => h_corner_sig(6),
	combout => \h_corner[6]~2_combout\);

-- Location: FF_X40_Y19_N23
\h_corner[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \h_corner[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \h_corner[6]~reg0_q\);

-- Location: LCCOMB_X40_Y19_N20
\h_corner[7]~reg0feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner[7]~reg0feeder_combout\ = h_corner_sig(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => h_corner_sig(7),
	combout => \h_corner[7]~reg0feeder_combout\);

-- Location: FF_X40_Y19_N21
\h_corner[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \h_corner[7]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \h_corner[7]~reg0_q\);

-- Location: LCCOMB_X40_Y19_N18
\h_corner[8]~reg0feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner[8]~reg0feeder_combout\ = h_corner_sig(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => h_corner_sig(8),
	combout => \h_corner[8]~reg0feeder_combout\);

-- Location: FF_X40_Y19_N19
\h_corner[8]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \h_corner[8]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \h_corner[8]~reg0_q\);

-- Location: LCCOMB_X40_Y19_N24
\h_corner[9]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \h_corner[9]~3_combout\ = !h_corner_sig(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => h_corner_sig(9),
	combout => \h_corner[9]~3_combout\);

-- Location: FF_X40_Y19_N25
\h_corner[9]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \h_corner[9]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \h_corner[9]~reg0_q\);

-- Location: LCCOMB_X31_Y28_N8
\Add4~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~2_combout\ = v_corner_sig(0) $ (VCC)
-- \Add4~3\ = CARRY(v_corner_sig(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => v_corner_sig(0),
	datad => VCC,
	combout => \Add4~2_combout\,
	cout => \Add4~3\);

-- Location: LCCOMB_X32_Y27_N12
\Equal7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal7~0_combout\ = (\scan_code[0]~input_o\ & (\scan_code[1]~input_o\ & (!\scan_code[4]~input_o\ & \scan_code[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \scan_code[0]~input_o\,
	datab => \scan_code[1]~input_o\,
	datac => \scan_code[4]~input_o\,
	datad => \scan_code[3]~input_o\,
	combout => \Equal7~0_combout\);

-- Location: LCCOMB_X32_Y27_N8
\v_corner_sig[0]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner_sig[0]~1_combout\ = (\scan_code[6]~input_o\ & (\v_corner_sig[0]~0_combout\ & (!\scan_code[7]~input_o\))) # (!\scan_code[6]~input_o\ & (((\scan_code[7]~input_o\ & \Equal7~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \v_corner_sig[0]~0_combout\,
	datab => \scan_code[6]~input_o\,
	datac => \scan_code[7]~input_o\,
	datad => \Equal7~0_combout\,
	combout => \v_corner_sig[0]~1_combout\);

-- Location: LCCOMB_X31_Y28_N10
\Add4~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~4_combout\ = (v_corner_sig(1) & ((\v_corner_sig[0]~2_combout\ & (!\Add4~3\)) # (!\v_corner_sig[0]~2_combout\ & (\Add4~3\ & VCC)))) # (!v_corner_sig(1) & ((\v_corner_sig[0]~2_combout\ & ((\Add4~3\) # (GND))) # (!\v_corner_sig[0]~2_combout\ & 
-- (!\Add4~3\))))
-- \Add4~5\ = CARRY((v_corner_sig(1) & (\v_corner_sig[0]~2_combout\ & !\Add4~3\)) # (!v_corner_sig(1) & ((\v_corner_sig[0]~2_combout\) # (!\Add4~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => v_corner_sig(1),
	datab => \v_corner_sig[0]~2_combout\,
	datad => VCC,
	cin => \Add4~3\,
	combout => \Add4~4_combout\,
	cout => \Add4~5\);

-- Location: LCCOMB_X31_Y28_N12
\Add4~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~6_combout\ = ((v_corner_sig(2) $ (\v_corner_sig[0]~2_combout\ $ (\Add4~5\)))) # (GND)
-- \Add4~7\ = CARRY((v_corner_sig(2) & ((!\Add4~5\) # (!\v_corner_sig[0]~2_combout\))) # (!v_corner_sig(2) & (!\v_corner_sig[0]~2_combout\ & !\Add4~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => v_corner_sig(2),
	datab => \v_corner_sig[0]~2_combout\,
	datad => VCC,
	cin => \Add4~5\,
	combout => \Add4~6_combout\,
	cout => \Add4~7\);

-- Location: LCCOMB_X31_Y28_N14
\Add4~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~8_combout\ = (v_corner_sig(3) & ((\v_corner_sig[0]~2_combout\ & (!\Add4~7\)) # (!\v_corner_sig[0]~2_combout\ & (\Add4~7\ & VCC)))) # (!v_corner_sig(3) & ((\v_corner_sig[0]~2_combout\ & ((\Add4~7\) # (GND))) # (!\v_corner_sig[0]~2_combout\ & 
-- (!\Add4~7\))))
-- \Add4~9\ = CARRY((v_corner_sig(3) & (\v_corner_sig[0]~2_combout\ & !\Add4~7\)) # (!v_corner_sig(3) & ((\v_corner_sig[0]~2_combout\) # (!\Add4~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => v_corner_sig(3),
	datab => \v_corner_sig[0]~2_combout\,
	datad => VCC,
	cin => \Add4~7\,
	combout => \Add4~8_combout\,
	cout => \Add4~9\);

-- Location: LCCOMB_X31_Y28_N16
\Add4~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~10_combout\ = ((v_corner_sig(4) $ (\v_corner_sig[0]~2_combout\ $ (!\Add4~9\)))) # (GND)
-- \Add4~11\ = CARRY((v_corner_sig(4) & (!\v_corner_sig[0]~2_combout\ & !\Add4~9\)) # (!v_corner_sig(4) & ((!\Add4~9\) # (!\v_corner_sig[0]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => v_corner_sig(4),
	datab => \v_corner_sig[0]~2_combout\,
	datad => VCC,
	cin => \Add4~9\,
	combout => \Add4~10_combout\,
	cout => \Add4~11\);

-- Location: LCCOMB_X31_Y28_N18
\Add4~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~12_combout\ = (\v_corner_sig[0]~2_combout\ & ((v_corner_sig(5) & ((\Add4~11\) # (GND))) # (!v_corner_sig(5) & (!\Add4~11\)))) # (!\v_corner_sig[0]~2_combout\ & ((v_corner_sig(5) & (!\Add4~11\)) # (!v_corner_sig(5) & (\Add4~11\ & VCC))))
-- \Add4~13\ = CARRY((\v_corner_sig[0]~2_combout\ & ((v_corner_sig(5)) # (!\Add4~11\))) # (!\v_corner_sig[0]~2_combout\ & (v_corner_sig(5) & !\Add4~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \v_corner_sig[0]~2_combout\,
	datab => v_corner_sig(5),
	datad => VCC,
	cin => \Add4~11\,
	combout => \Add4~12_combout\,
	cout => \Add4~13\);

-- Location: LCCOMB_X32_Y28_N8
\v_corner_sig[5]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner_sig[5]~11_combout\ = !\Add4~12_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add4~12_combout\,
	combout => \v_corner_sig[5]~11_combout\);

-- Location: FF_X32_Y28_N9
\v_corner_sig[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \v_corner_sig[5]~11_combout\,
	ena => \v_corner_sig[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_corner_sig(5));

-- Location: LCCOMB_X31_Y28_N20
\Add4~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~14_combout\ = ((v_corner_sig(6) $ (\v_corner_sig[0]~2_combout\ $ (!\Add4~13\)))) # (GND)
-- \Add4~15\ = CARRY((v_corner_sig(6) & (!\v_corner_sig[0]~2_combout\ & !\Add4~13\)) # (!v_corner_sig(6) & ((!\Add4~13\) # (!\v_corner_sig[0]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => v_corner_sig(6),
	datab => \v_corner_sig[0]~2_combout\,
	datad => VCC,
	cin => \Add4~13\,
	combout => \Add4~14_combout\,
	cout => \Add4~15\);

-- Location: LCCOMB_X31_Y28_N22
\Add4~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~16_combout\ = (\v_corner_sig[0]~2_combout\ & ((v_corner_sig(7) & ((\Add4~15\) # (GND))) # (!v_corner_sig(7) & (!\Add4~15\)))) # (!\v_corner_sig[0]~2_combout\ & ((v_corner_sig(7) & (!\Add4~15\)) # (!v_corner_sig(7) & (\Add4~15\ & VCC))))
-- \Add4~17\ = CARRY((\v_corner_sig[0]~2_combout\ & ((v_corner_sig(7)) # (!\Add4~15\))) # (!\v_corner_sig[0]~2_combout\ & (v_corner_sig(7) & !\Add4~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \v_corner_sig[0]~2_combout\,
	datab => v_corner_sig(7),
	datad => VCC,
	cin => \Add4~15\,
	combout => \Add4~16_combout\,
	cout => \Add4~17\);

-- Location: LCCOMB_X32_Y28_N28
\v_corner_sig[7]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner_sig[7]~13_combout\ = !\Add4~16_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add4~16_combout\,
	combout => \v_corner_sig[7]~13_combout\);

-- Location: FF_X32_Y28_N29
\v_corner_sig[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \v_corner_sig[7]~13_combout\,
	ena => \v_corner_sig[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_corner_sig(7));

-- Location: LCCOMB_X31_Y28_N24
\Add4~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~18_combout\ = ((\v_corner_sig[0]~2_combout\ $ (v_corner_sig(8) $ (\Add4~17\)))) # (GND)
-- \Add4~19\ = CARRY((\v_corner_sig[0]~2_combout\ & (v_corner_sig(8) & !\Add4~17\)) # (!\v_corner_sig[0]~2_combout\ & ((v_corner_sig(8)) # (!\Add4~17\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \v_corner_sig[0]~2_combout\,
	datab => v_corner_sig(8),
	datad => VCC,
	cin => \Add4~17\,
	combout => \Add4~18_combout\,
	cout => \Add4~19\);

-- Location: FF_X31_Y28_N25
\v_corner_sig[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \Add4~18_combout\,
	ena => \v_corner_sig[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_corner_sig(8));

-- Location: FF_X31_Y28_N15
\v_corner_sig[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \Add4~8_combout\,
	ena => \v_corner_sig[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_corner_sig(3));

-- Location: FF_X31_Y28_N11
\v_corner_sig[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \Add4~4_combout\,
	ena => \v_corner_sig[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_corner_sig(1));

-- Location: LCCOMB_X31_Y28_N30
\LessThan3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = (v_corner_sig(3) & ((v_corner_sig(2)) # ((v_corner_sig(0) & v_corner_sig(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_corner_sig(2),
	datab => v_corner_sig(3),
	datac => v_corner_sig(0),
	datad => v_corner_sig(1),
	combout => \LessThan3~0_combout\);

-- Location: LCCOMB_X31_Y28_N4
\v_corner_sig[4]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner_sig[4]~10_combout\ = !\Add4~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add4~10_combout\,
	combout => \v_corner_sig[4]~10_combout\);

-- Location: FF_X31_Y28_N5
\v_corner_sig[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \v_corner_sig[4]~10_combout\,
	ena => \v_corner_sig[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_corner_sig(4));

-- Location: LCCOMB_X31_Y28_N0
\LessThan3~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan3~1_combout\ = (((!v_corner_sig(7)) # (!v_corner_sig(5))) # (!v_corner_sig(4))) # (!v_corner_sig(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_corner_sig(6),
	datab => v_corner_sig(4),
	datac => v_corner_sig(5),
	datad => v_corner_sig(7),
	combout => \LessThan3~1_combout\);

-- Location: LCCOMB_X31_Y28_N2
\LessThan3~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan3~2_combout\ = (v_corner_sig(9)) # ((v_corner_sig(8)) # ((\LessThan3~0_combout\) # (\LessThan3~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_corner_sig(9),
	datab => v_corner_sig(8),
	datac => \LessThan3~0_combout\,
	datad => \LessThan3~1_combout\,
	combout => \LessThan3~2_combout\);

-- Location: LCCOMB_X31_Y28_N28
\v_corner_sig[0]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner_sig[0]~2_combout\ = (((!\LessThan3~2_combout\) # (!\v_corner_sig[0]~1_combout\)) # (!\scan_code[5]~input_o\)) # (!\scan_code[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \scan_code[2]~input_o\,
	datab => \scan_code[5]~input_o\,
	datac => \v_corner_sig[0]~1_combout\,
	datad => \LessThan3~2_combout\,
	combout => \v_corner_sig[0]~2_combout\);

-- Location: LCCOMB_X32_Y28_N2
\v_corner_sig[6]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner_sig[6]~12_combout\ = !\Add4~14_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add4~14_combout\,
	combout => \v_corner_sig[6]~12_combout\);

-- Location: FF_X32_Y28_N3
\v_corner_sig[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \v_corner_sig[6]~12_combout\,
	ena => \v_corner_sig[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_corner_sig(6));

-- Location: LCCOMB_X32_Y28_N18
\Add3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = (v_corner_sig(5) & (!v_corner_sig(4) & VCC)) # (!v_corner_sig(5) & (v_corner_sig(4) $ (GND)))
-- \Add3~1\ = CARRY((!v_corner_sig(5) & !v_corner_sig(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_corner_sig(5),
	datab => v_corner_sig(4),
	datad => VCC,
	combout => \Add3~0_combout\,
	cout => \Add3~1\);

-- Location: LCCOMB_X32_Y28_N20
\Add3~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (v_corner_sig(6) & ((\Add3~1\) # (GND))) # (!v_corner_sig(6) & (!\Add3~1\))
-- \Add3~3\ = CARRY((v_corner_sig(6)) # (!\Add3~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => v_corner_sig(6),
	datad => VCC,
	cin => \Add3~1\,
	combout => \Add3~2_combout\,
	cout => \Add3~3\);

-- Location: LCCOMB_X32_Y28_N22
\Add3~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~4_combout\ = (v_corner_sig(7) & (!\Add3~3\ & VCC)) # (!v_corner_sig(7) & (\Add3~3\ $ (GND)))
-- \Add3~5\ = CARRY((!v_corner_sig(7) & !\Add3~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => v_corner_sig(7),
	datad => VCC,
	cin => \Add3~3\,
	combout => \Add3~4_combout\,
	cout => \Add3~5\);

-- Location: LCCOMB_X32_Y28_N24
\Add3~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~6_combout\ = (v_corner_sig(8) & (!\Add3~5\)) # (!v_corner_sig(8) & ((\Add3~5\) # (GND)))
-- \Add3~7\ = CARRY((!\Add3~5\) # (!v_corner_sig(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => v_corner_sig(8),
	datad => VCC,
	cin => \Add3~5\,
	combout => \Add3~6_combout\,
	cout => \Add3~7\);

-- Location: LCCOMB_X32_Y28_N26
\Add3~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~8_combout\ = v_corner_sig(9) $ (!\Add3~7\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => v_corner_sig(9),
	cin => \Add3~7\,
	combout => \Add3~8_combout\);

-- Location: LCCOMB_X32_Y28_N4
\v_corner_sig[0]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner_sig[0]~8_combout\ = ((\Add3~8_combout\) # ((\scan_code[5]~input_o\ & \scan_code[2]~input_o\))) # (!\scan_code[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \scan_code[1]~input_o\,
	datab => \scan_code[5]~input_o\,
	datac => \Add3~8_combout\,
	datad => \scan_code[2]~input_o\,
	combout => \v_corner_sig[0]~8_combout\);

-- Location: FF_X31_Y28_N13
\v_corner_sig[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \Add4~6_combout\,
	ena => \v_corner_sig[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_corner_sig(2));

-- Location: LCCOMB_X31_Y28_N6
\v_corner_sig[0]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner_sig[0]~5_combout\ = (v_corner_sig(4) & ((v_corner_sig(3)) # ((v_corner_sig(1) & v_corner_sig(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => v_corner_sig(1),
	datab => v_corner_sig(4),
	datac => v_corner_sig(3),
	datad => v_corner_sig(2),
	combout => \v_corner_sig[0]~5_combout\);

-- Location: LCCOMB_X32_Y28_N6
\v_corner_sig[0]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner_sig[0]~4_combout\ = (\Add3~2_combout\ & (\Add3~4_combout\ & \Add3~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add3~2_combout\,
	datac => \Add3~4_combout\,
	datad => \Add3~6_combout\,
	combout => \v_corner_sig[0]~4_combout\);

-- Location: LCCOMB_X32_Y28_N12
\v_corner_sig[0]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner_sig[0]~6_combout\ = (\v_corner_sig[0]~3_combout\) # ((\v_corner_sig[0]~4_combout\ & ((\Add3~0_combout\) # (\v_corner_sig[0]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \v_corner_sig[0]~3_combout\,
	datab => \Add3~0_combout\,
	datac => \v_corner_sig[0]~5_combout\,
	datad => \v_corner_sig[0]~4_combout\,
	combout => \v_corner_sig[0]~6_combout\);

-- Location: LCCOMB_X32_Y28_N10
\v_corner_sig[0]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner_sig[0]~9_combout\ = ((!\v_corner_sig[0]~7_combout\ & (!\v_corner_sig[0]~8_combout\ & !\v_corner_sig[0]~6_combout\))) # (!\v_corner_sig[0]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \v_corner_sig[0]~7_combout\,
	datab => \v_corner_sig[0]~2_combout\,
	datac => \v_corner_sig[0]~8_combout\,
	datad => \v_corner_sig[0]~6_combout\,
	combout => \v_corner_sig[0]~9_combout\);

-- Location: FF_X31_Y28_N9
\v_corner_sig[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \Add4~2_combout\,
	ena => \v_corner_sig[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_corner_sig(0));

-- Location: LCCOMB_X30_Y28_N0
\v_corner[0]~reg0feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner[0]~reg0feeder_combout\ = v_corner_sig(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => v_corner_sig(0),
	combout => \v_corner[0]~reg0feeder_combout\);

-- Location: FF_X30_Y28_N1
\v_corner[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \v_corner[0]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \v_corner[0]~reg0_q\);

-- Location: LCCOMB_X30_Y28_N10
\v_corner[1]~reg0feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner[1]~reg0feeder_combout\ = v_corner_sig(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => v_corner_sig(1),
	combout => \v_corner[1]~reg0feeder_combout\);

-- Location: FF_X30_Y28_N11
\v_corner[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \v_corner[1]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \v_corner[1]~reg0_q\);

-- Location: LCCOMB_X30_Y28_N8
\v_corner[2]~reg0feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner[2]~reg0feeder_combout\ = v_corner_sig(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => v_corner_sig(2),
	combout => \v_corner[2]~reg0feeder_combout\);

-- Location: FF_X30_Y28_N9
\v_corner[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \v_corner[2]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \v_corner[2]~reg0_q\);

-- Location: LCCOMB_X30_Y28_N22
\v_corner[3]~reg0feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner[3]~reg0feeder_combout\ = v_corner_sig(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => v_corner_sig(3),
	combout => \v_corner[3]~reg0feeder_combout\);

-- Location: FF_X30_Y28_N23
\v_corner[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \v_corner[3]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \v_corner[3]~reg0_q\);

-- Location: LCCOMB_X32_Y28_N0
\v_corner[4]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner[4]~0_combout\ = !v_corner_sig(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => v_corner_sig(4),
	combout => \v_corner[4]~0_combout\);

-- Location: FF_X32_Y28_N1
\v_corner[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \v_corner[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \v_corner[4]~reg0_q\);

-- Location: LCCOMB_X32_Y28_N30
\v_corner[5]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner[5]~1_combout\ = !v_corner_sig(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => v_corner_sig(5),
	combout => \v_corner[5]~1_combout\);

-- Location: FF_X32_Y28_N31
\v_corner[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \v_corner[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \v_corner[5]~reg0_q\);

-- Location: LCCOMB_X32_Y28_N16
\v_corner[6]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner[6]~2_combout\ = !v_corner_sig(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => v_corner_sig(6),
	combout => \v_corner[6]~2_combout\);

-- Location: FF_X32_Y28_N17
\v_corner[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \v_corner[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \v_corner[6]~reg0_q\);

-- Location: LCCOMB_X32_Y28_N14
\v_corner[7]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner[7]~3_combout\ = !v_corner_sig(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => v_corner_sig(7),
	combout => \v_corner[7]~3_combout\);

-- Location: FF_X32_Y28_N15
\v_corner[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \v_corner[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \v_corner[7]~reg0_q\);

-- Location: LCCOMB_X30_Y28_N12
\v_corner[8]~reg0feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner[8]~reg0feeder_combout\ = v_corner_sig(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => v_corner_sig(8),
	combout => \v_corner[8]~reg0feeder_combout\);

-- Location: FF_X30_Y28_N13
\v_corner[8]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \v_corner[8]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \v_corner[8]~reg0_q\);

-- Location: LCCOMB_X31_Y28_N26
\Add4~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~20_combout\ = v_corner_sig(9) $ (\Add4~19\ $ (!\v_corner_sig[0]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => v_corner_sig(9),
	datad => \v_corner_sig[0]~2_combout\,
	cin => \Add4~19\,
	combout => \Add4~20_combout\);

-- Location: FF_X31_Y28_N27
\v_corner_sig[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \Add4~20_combout\,
	ena => \v_corner_sig[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => v_corner_sig(9));

-- Location: LCCOMB_X30_Y28_N2
\v_corner[9]~reg0feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \v_corner[9]~reg0feeder_combout\ = v_corner_sig(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => v_corner_sig(9),
	combout => \v_corner[9]~reg0feeder_combout\);

-- Location: FF_X30_Y28_N3
\v_corner[9]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \scan_finished~inputclkctrl_outclk\,
	d => \v_corner[9]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \v_corner[9]~reg0_q\);

ww_h_corner(0) <= \h_corner[0]~output_o\;

ww_h_corner(1) <= \h_corner[1]~output_o\;

ww_h_corner(2) <= \h_corner[2]~output_o\;

ww_h_corner(3) <= \h_corner[3]~output_o\;

ww_h_corner(4) <= \h_corner[4]~output_o\;

ww_h_corner(5) <= \h_corner[5]~output_o\;

ww_h_corner(6) <= \h_corner[6]~output_o\;

ww_h_corner(7) <= \h_corner[7]~output_o\;

ww_h_corner(8) <= \h_corner[8]~output_o\;

ww_h_corner(9) <= \h_corner[9]~output_o\;

ww_v_corner(0) <= \v_corner[0]~output_o\;

ww_v_corner(1) <= \v_corner[1]~output_o\;

ww_v_corner(2) <= \v_corner[2]~output_o\;

ww_v_corner(3) <= \v_corner[3]~output_o\;

ww_v_corner(4) <= \v_corner[4]~output_o\;

ww_v_corner(5) <= \v_corner[5]~output_o\;

ww_v_corner(6) <= \v_corner[6]~output_o\;

ww_v_corner(7) <= \v_corner[7]~output_o\;

ww_v_corner(8) <= \v_corner[8]~output_o\;

ww_v_corner(9) <= \v_corner[9]~output_o\;
END structure;


