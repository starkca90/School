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

-- DATE "01/16/2013 22:49:26"

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

ENTITY 	DE0_PS2 IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(0 DOWNTO 0);
	PS2_KBDAT : IN std_logic;
	PS2_KBCLK : IN std_logic;
	HEX0 : OUT std_logic_vector(0 TO 6);
	HEX1 : OUT std_logic_vector(0 TO 6);
	LEDG : OUT std_logic_vector(7 DOWNTO 0)
	);
END DE0_PS2;

-- Design Ports Information
-- HEX0[6]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[2]	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[3]	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[4]	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[5]	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[6]	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[7]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PS2_KBCLK	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PS2_KBDAT	=>  Location: PIN_P21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF DE0_PS2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_PS2_KBDAT : std_logic;
SIGNAL ww_PS2_KBCLK : std_logic;
SIGNAL ww_HEX0 : std_logic_vector(0 TO 6);
SIGNAL ww_HEX1 : std_logic_vector(0 TO 6);
SIGNAL ww_LEDG : std_logic_vector(7 DOWNTO 0);
SIGNAL \convert|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \convert|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \keyboard|Equal0~0_combout\ : std_logic;
SIGNAL \keyboard|n_next[1]~1_combout\ : std_logic;
SIGNAL \keyboard|Add0~0_combout\ : std_logic;
SIGNAL \keyboard|n_dec~0_combout\ : std_logic;
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX1[6]~output_o\ : std_logic;
SIGNAL \HEX1[5]~output_o\ : std_logic;
SIGNAL \HEX1[4]~output_o\ : std_logic;
SIGNAL \HEX1[3]~output_o\ : std_logic;
SIGNAL \HEX1[2]~output_o\ : std_logic;
SIGNAL \HEX1[1]~output_o\ : std_logic;
SIGNAL \HEX1[0]~output_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \LEDG[1]~output_o\ : std_logic;
SIGNAL \LEDG[2]~output_o\ : std_logic;
SIGNAL \LEDG[3]~output_o\ : std_logic;
SIGNAL \LEDG[4]~output_o\ : std_logic;
SIGNAL \LEDG[5]~output_o\ : std_logic;
SIGNAL \LEDG[6]~output_o\ : std_logic;
SIGNAL \LEDG[7]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \PS2_KBDAT~input_o\ : std_logic;
SIGNAL \keyboard|b_reg[10]~feeder_combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \PS2_KBCLK~input_o\ : std_logic;
SIGNAL \keyboard|filter_reg[5]~feeder_combout\ : std_logic;
SIGNAL \keyboard|filter_reg[0]~feeder_combout\ : std_logic;
SIGNAL \keyboard|Equal1~1_combout\ : std_logic;
SIGNAL \keyboard|Equal0~1_combout\ : std_logic;
SIGNAL \keyboard|f_ps2c_next~0_combout\ : std_logic;
SIGNAL \keyboard|f_ps2c_next~1_combout\ : std_logic;
SIGNAL \keyboard|f_ps2c_reg~q\ : std_logic;
SIGNAL \keyboard|fall_edge~combout\ : std_logic;
SIGNAL \keyboard|Selector1~0_combout\ : std_logic;
SIGNAL \keyboard|state_reg.idle~q\ : std_logic;
SIGNAL \keyboard|n_dec~1_combout\ : std_logic;
SIGNAL \keyboard|n_next[0]~2_combout\ : std_logic;
SIGNAL \keyboard|n_next[2]~3_combout\ : std_logic;
SIGNAL \keyboard|Equal1~0_combout\ : std_logic;
SIGNAL \keyboard|n_load~0_combout\ : std_logic;
SIGNAL \keyboard|n_load~1_combout\ : std_logic;
SIGNAL \keyboard|n_next[2]~4_combout\ : std_logic;
SIGNAL \keyboard|n_next[3]~5_combout\ : std_logic;
SIGNAL \keyboard|Equal2~0_combout\ : std_logic;
SIGNAL \keyboard|Equal2~1_combout\ : std_logic;
SIGNAL \keyboard|state_reg.extract~0_combout\ : std_logic;
SIGNAL \keyboard|state_reg.extract~q\ : std_logic;
SIGNAL \keyboard|Selector3~0_combout\ : std_logic;
SIGNAL \keyboard|state_reg.done~q\ : std_logic;
SIGNAL \keyboard|Selector0~0_combout\ : std_logic;
SIGNAL \keyboard|b_reg[9]~feeder_combout\ : std_logic;
SIGNAL \keyboard|b_reg[8]~feeder_combout\ : std_logic;
SIGNAL \keyboard|b_reg[7]~feeder_combout\ : std_logic;
SIGNAL \keyboard|b_reg[6]~feeder_combout\ : std_logic;
SIGNAL \keyboard|b_reg[5]~feeder_combout\ : std_logic;
SIGNAL \keyboard|b_reg[2]~feeder_combout\ : std_logic;
SIGNAL \display|char0dec|Mux6~0_combout\ : std_logic;
SIGNAL \display|char0dec|Mux5~0_combout\ : std_logic;
SIGNAL \display|char0dec|Mux4~0_combout\ : std_logic;
SIGNAL \display|char0dec|Mux3~0_combout\ : std_logic;
SIGNAL \display|char0dec|Mux2~0_combout\ : std_logic;
SIGNAL \display|char0dec|Mux1~0_combout\ : std_logic;
SIGNAL \display|char0dec|Mux0~0_combout\ : std_logic;
SIGNAL \display|char1dec|Mux6~0_combout\ : std_logic;
SIGNAL \display|char1dec|Mux5~0_combout\ : std_logic;
SIGNAL \display|char1dec|Mux4~0_combout\ : std_logic;
SIGNAL \display|char1dec|Mux3~0_combout\ : std_logic;
SIGNAL \display|char1dec|Mux2~0_combout\ : std_logic;
SIGNAL \display|char1dec|Mux1~0_combout\ : std_logic;
SIGNAL \display|char1dec|Mux0~0_combout\ : std_logic;
SIGNAL \display|char0dec|num_out\ : std_logic_vector(0 TO 6);
SIGNAL \keyboard|n_reg\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \keyboard|filter_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \keyboard|b_reg\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \convert|altsyncram_component|auto_generated|q_a\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \display|char1dec|num_out\ : std_logic_vector(0 TO 6);
SIGNAL \ALT_INV_KEY[0]~input_o\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_PS2_KBDAT <= PS2_KBDAT;
ww_PS2_KBCLK <= PS2_KBCLK;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
LEDG <= ww_LEDG;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\convert|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\keyboard|b_reg\(8) & \keyboard|b_reg\(7) & \keyboard|b_reg\(6) & \keyboard|b_reg\(5) & \keyboard|b_reg\(4) & \keyboard|b_reg\(3) & \keyboard|b_reg\(2) & 
\keyboard|b_reg\(1));

\convert|altsyncram_component|auto_generated|q_a\(0) <= \convert|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\convert|altsyncram_component|auto_generated|q_a\(1) <= \convert|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\convert|altsyncram_component|auto_generated|q_a\(2) <= \convert|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\convert|altsyncram_component|auto_generated|q_a\(3) <= \convert|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\convert|altsyncram_component|auto_generated|q_a\(4) <= \convert|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\convert|altsyncram_component|auto_generated|q_a\(5) <= \convert|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\convert|altsyncram_component|auto_generated|q_a\(6) <= \convert|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\convert|altsyncram_component|auto_generated|q_a\(7) <= \convert|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
\ALT_INV_KEY[0]~input_o\ <= NOT \KEY[0]~input_o\;

-- Location: LCCOMB_X27_Y25_N30
\keyboard|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|Equal0~0_combout\ = (!\keyboard|filter_reg\(7) & (!\keyboard|filter_reg\(5) & (!\keyboard|filter_reg\(6) & !\keyboard|filter_reg\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|filter_reg\(7),
	datab => \keyboard|filter_reg\(5),
	datac => \keyboard|filter_reg\(6),
	datad => \keyboard|filter_reg\(4),
	combout => \keyboard|Equal0~0_combout\);

-- Location: FF_X27_Y25_N5
\keyboard|n_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keyboard|n_next[1]~1_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|n_reg\(1));

-- Location: LCCOMB_X27_Y25_N4
\keyboard|n_next[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|n_next[1]~1_combout\ = (\keyboard|n_dec~1_combout\ & (\keyboard|n_reg\(0) $ ((!\keyboard|n_reg\(1))))) # (!\keyboard|n_dec~1_combout\ & (((\keyboard|n_reg\(1)) # (\keyboard|n_load~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011011110110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|n_reg\(0),
	datab => \keyboard|n_dec~1_combout\,
	datac => \keyboard|n_reg\(1),
	datad => \keyboard|n_load~1_combout\,
	combout => \keyboard|n_next[1]~1_combout\);

-- Location: LCCOMB_X27_Y25_N22
\keyboard|Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|Add0~0_combout\ = \keyboard|n_reg\(3) $ (((\keyboard|n_reg\(1)) # ((\keyboard|n_reg\(0)) # (\keyboard|n_reg\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|n_reg\(3),
	datab => \keyboard|n_reg\(1),
	datac => \keyboard|n_reg\(0),
	datad => \keyboard|n_reg\(2),
	combout => \keyboard|Add0~0_combout\);

-- Location: LCCOMB_X28_Y25_N6
\keyboard|n_dec~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|n_dec~0_combout\ = (\keyboard|n_next[1]~1_combout\) # ((\keyboard|n_next[3]~5_combout\) # (\keyboard|n_next[0]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \keyboard|n_next[1]~1_combout\,
	datac => \keyboard|n_next[3]~5_combout\,
	datad => \keyboard|n_next[0]~2_combout\,
	combout => \keyboard|n_dec~0_combout\);

-- Location: IOOBUF_X26_Y29_N16
\HEX0[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|char0dec|num_out\(6),
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOOBUF_X28_Y29_N23
\HEX0[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|char0dec|num_out\(5),
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

-- Location: IOOBUF_X26_Y29_N9
\HEX0[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|char0dec|num_out\(4),
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

-- Location: IOOBUF_X28_Y29_N30
\HEX0[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|char0dec|num_out\(3),
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

-- Location: IOOBUF_X26_Y29_N2
\HEX0[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|char0dec|num_out\(2),
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

-- Location: IOOBUF_X21_Y29_N30
\HEX0[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|char0dec|num_out\(1),
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

-- Location: IOOBUF_X21_Y29_N23
\HEX0[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|char0dec|num_out\(0),
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

-- Location: IOOBUF_X26_Y29_N23
\HEX1[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|char1dec|num_out\(6),
	devoe => ww_devoe,
	o => \HEX1[6]~output_o\);

-- Location: IOOBUF_X28_Y29_N16
\HEX1[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|char1dec|num_out\(5),
	devoe => ww_devoe,
	o => \HEX1[5]~output_o\);

-- Location: IOOBUF_X23_Y29_N30
\HEX1[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|char1dec|num_out\(4),
	devoe => ww_devoe,
	o => \HEX1[4]~output_o\);

-- Location: IOOBUF_X23_Y29_N23
\HEX1[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|char1dec|num_out\(3),
	devoe => ww_devoe,
	o => \HEX1[3]~output_o\);

-- Location: IOOBUF_X23_Y29_N2
\HEX1[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|char1dec|num_out\(2),
	devoe => ww_devoe,
	o => \HEX1[2]~output_o\);

-- Location: IOOBUF_X21_Y29_N9
\HEX1[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|char1dec|num_out\(1),
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

-- Location: IOOBUF_X21_Y29_N2
\HEX1[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|char1dec|num_out\(0),
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

-- Location: IOOBUF_X0_Y20_N9
\LEDG[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keyboard|b_reg\(1),
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOOBUF_X0_Y20_N2
\LEDG[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keyboard|b_reg\(2),
	devoe => ww_devoe,
	o => \LEDG[1]~output_o\);

-- Location: IOOBUF_X0_Y21_N23
\LEDG[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keyboard|b_reg\(3),
	devoe => ww_devoe,
	o => \LEDG[2]~output_o\);

-- Location: IOOBUF_X0_Y21_N16
\LEDG[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keyboard|b_reg\(4),
	devoe => ww_devoe,
	o => \LEDG[3]~output_o\);

-- Location: IOOBUF_X0_Y24_N23
\LEDG[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keyboard|b_reg\(5),
	devoe => ww_devoe,
	o => \LEDG[4]~output_o\);

-- Location: IOOBUF_X0_Y24_N16
\LEDG[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keyboard|b_reg\(6),
	devoe => ww_devoe,
	o => \LEDG[5]~output_o\);

-- Location: IOOBUF_X0_Y26_N23
\LEDG[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keyboard|b_reg\(7),
	devoe => ww_devoe,
	o => \LEDG[6]~output_o\);

-- Location: IOOBUF_X0_Y26_N16
\LEDG[7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \keyboard|b_reg\(8),
	devoe => ww_devoe,
	o => \LEDG[7]~output_o\);

-- Location: IOIBUF_X41_Y15_N1
\CLOCK_50~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G9
\CLOCK_50~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: IOIBUF_X41_Y12_N22
\PS2_KBDAT~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PS2_KBDAT,
	o => \PS2_KBDAT~input_o\);

-- Location: LCCOMB_X26_Y25_N10
\keyboard|b_reg[10]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|b_reg[10]~feeder_combout\ = \PS2_KBDAT~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PS2_KBDAT~input_o\,
	combout => \keyboard|b_reg[10]~feeder_combout\);

-- Location: IOIBUF_X0_Y21_N8
\KEY[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: IOIBUF_X41_Y11_N1
\PS2_KBCLK~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PS2_KBCLK,
	o => \PS2_KBCLK~input_o\);

-- Location: FF_X27_Y25_N27
\keyboard|filter_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \PS2_KBCLK~input_o\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|filter_reg\(7));

-- Location: FF_X27_Y25_N31
\keyboard|filter_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \keyboard|filter_reg\(7),
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|filter_reg\(6));

-- Location: LCCOMB_X27_Y25_N0
\keyboard|filter_reg[5]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|filter_reg[5]~feeder_combout\ = \keyboard|filter_reg\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \keyboard|filter_reg\(6),
	combout => \keyboard|filter_reg[5]~feeder_combout\);

-- Location: FF_X27_Y25_N1
\keyboard|filter_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keyboard|filter_reg[5]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|filter_reg\(5));

-- Location: FF_X27_Y25_N3
\keyboard|filter_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \keyboard|filter_reg\(5),
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|filter_reg\(4));

-- Location: FF_X27_Y25_N15
\keyboard|filter_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \keyboard|filter_reg\(4),
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|filter_reg\(3));

-- Location: FF_X27_Y25_N29
\keyboard|filter_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \keyboard|filter_reg\(3),
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|filter_reg\(2));

-- Location: FF_X27_Y25_N17
\keyboard|filter_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \keyboard|filter_reg\(2),
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|filter_reg\(1));

-- Location: LCCOMB_X27_Y25_N24
\keyboard|filter_reg[0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|filter_reg[0]~feeder_combout\ = \keyboard|filter_reg\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \keyboard|filter_reg\(1),
	combout => \keyboard|filter_reg[0]~feeder_combout\);

-- Location: FF_X27_Y25_N25
\keyboard|filter_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keyboard|filter_reg[0]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|filter_reg\(0));

-- Location: LCCOMB_X27_Y25_N14
\keyboard|Equal1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|Equal1~1_combout\ = (\keyboard|filter_reg\(2) & (\keyboard|filter_reg\(0) & (\keyboard|filter_reg\(3) & \keyboard|filter_reg\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|filter_reg\(2),
	datab => \keyboard|filter_reg\(0),
	datac => \keyboard|filter_reg\(3),
	datad => \keyboard|filter_reg\(1),
	combout => \keyboard|Equal1~1_combout\);

-- Location: LCCOMB_X27_Y25_N28
\keyboard|Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|Equal0~1_combout\ = (!\keyboard|filter_reg\(3) & (!\keyboard|filter_reg\(1) & (!\keyboard|filter_reg\(2) & !\keyboard|filter_reg\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|filter_reg\(3),
	datab => \keyboard|filter_reg\(1),
	datac => \keyboard|filter_reg\(2),
	datad => \keyboard|filter_reg\(0),
	combout => \keyboard|Equal0~1_combout\);

-- Location: LCCOMB_X27_Y25_N20
\keyboard|f_ps2c_next~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|f_ps2c_next~0_combout\ = (\keyboard|f_ps2c_reg~q\ & ((!\keyboard|Equal0~1_combout\) # (!\keyboard|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|Equal0~0_combout\,
	datab => \keyboard|f_ps2c_reg~q\,
	datad => \keyboard|Equal0~1_combout\,
	combout => \keyboard|f_ps2c_next~0_combout\);

-- Location: LCCOMB_X28_Y25_N10
\keyboard|f_ps2c_next~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|f_ps2c_next~1_combout\ = (\keyboard|f_ps2c_next~0_combout\) # ((\keyboard|Equal1~0_combout\ & \keyboard|Equal1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|Equal1~0_combout\,
	datac => \keyboard|Equal1~1_combout\,
	datad => \keyboard|f_ps2c_next~0_combout\,
	combout => \keyboard|f_ps2c_next~1_combout\);

-- Location: FF_X27_Y25_N11
\keyboard|f_ps2c_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \keyboard|f_ps2c_next~1_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|f_ps2c_reg~q\);

-- Location: LCCOMB_X27_Y25_N12
\keyboard|fall_edge\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|fall_edge~combout\ = (\keyboard|f_ps2c_reg~q\ & (!\keyboard|f_ps2c_next~0_combout\ & ((!\keyboard|Equal1~1_combout\) # (!\keyboard|Equal1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|Equal1~0_combout\,
	datab => \keyboard|f_ps2c_reg~q\,
	datac => \keyboard|Equal1~1_combout\,
	datad => \keyboard|f_ps2c_next~0_combout\,
	combout => \keyboard|fall_edge~combout\);

-- Location: LCCOMB_X28_Y25_N30
\keyboard|Selector1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|Selector1~0_combout\ = (!\keyboard|state_reg.done~q\ & ((\keyboard|fall_edge~combout\) # (\keyboard|state_reg.idle~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|state_reg.done~q\,
	datac => \keyboard|fall_edge~combout\,
	datad => \keyboard|state_reg.idle~q\,
	combout => \keyboard|Selector1~0_combout\);

-- Location: FF_X27_Y25_N9
\keyboard|state_reg.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \keyboard|Selector1~0_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|state_reg.idle~q\);

-- Location: LCCOMB_X28_Y25_N24
\keyboard|n_dec~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|n_dec~1_combout\ = (\keyboard|state_reg.extract~q\ & (\keyboard|fall_edge~combout\ & ((\keyboard|n_dec~0_combout\) # (\keyboard|n_next[2]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|n_dec~0_combout\,
	datab => \keyboard|state_reg.extract~q\,
	datac => \keyboard|fall_edge~combout\,
	datad => \keyboard|n_next[2]~4_combout\,
	combout => \keyboard|n_dec~1_combout\);

-- Location: LCCOMB_X27_Y25_N8
\keyboard|n_next[0]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|n_next[0]~2_combout\ = (\keyboard|n_reg\(0) & (!\keyboard|n_dec~1_combout\ & ((\keyboard|state_reg.idle~q\) # (!\keyboard|fall_edge~combout\)))) # (!\keyboard|n_reg\(0) & (\keyboard|n_dec~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|n_reg\(0),
	datab => \keyboard|n_dec~1_combout\,
	datac => \keyboard|state_reg.idle~q\,
	datad => \keyboard|fall_edge~combout\,
	combout => \keyboard|n_next[0]~2_combout\);

-- Location: FF_X27_Y25_N21
\keyboard|n_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \keyboard|n_next[0]~2_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|n_reg\(0));

-- Location: LCCOMB_X28_Y25_N26
\keyboard|n_next[2]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|n_next[2]~3_combout\ = (\keyboard|n_dec~1_combout\ & (\keyboard|n_reg\(2) $ (((!\keyboard|n_reg\(1) & !\keyboard|n_reg\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|n_reg\(1),
	datab => \keyboard|n_dec~1_combout\,
	datac => \keyboard|n_reg\(2),
	datad => \keyboard|n_reg\(0),
	combout => \keyboard|n_next[2]~3_combout\);

-- Location: LCCOMB_X27_Y25_N26
\keyboard|Equal1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|Equal1~0_combout\ = (\keyboard|filter_reg\(4) & (\keyboard|filter_reg\(6) & (\keyboard|filter_reg\(7) & \keyboard|filter_reg\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|filter_reg\(4),
	datab => \keyboard|filter_reg\(6),
	datac => \keyboard|filter_reg\(7),
	datad => \keyboard|filter_reg\(5),
	combout => \keyboard|Equal1~0_combout\);

-- Location: LCCOMB_X27_Y25_N6
\keyboard|n_load~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|n_load~0_combout\ = (!\keyboard|Equal1~0_combout\) # (!\keyboard|Equal1~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \keyboard|Equal1~1_combout\,
	datad => \keyboard|Equal1~0_combout\,
	combout => \keyboard|n_load~0_combout\);

-- Location: LCCOMB_X27_Y25_N10
\keyboard|n_load~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|n_load~1_combout\ = (!\keyboard|state_reg.idle~q\ & (!\keyboard|f_ps2c_next~0_combout\ & (\keyboard|f_ps2c_reg~q\ & \keyboard|n_load~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|state_reg.idle~q\,
	datab => \keyboard|f_ps2c_next~0_combout\,
	datac => \keyboard|f_ps2c_reg~q\,
	datad => \keyboard|n_load~0_combout\,
	combout => \keyboard|n_load~1_combout\);

-- Location: LCCOMB_X28_Y25_N4
\keyboard|n_next[2]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|n_next[2]~4_combout\ = (\keyboard|n_next[2]~3_combout\) # ((\keyboard|n_reg\(2) & (!\keyboard|n_dec~1_combout\ & !\keyboard|n_load~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|n_reg\(2),
	datab => \keyboard|n_dec~1_combout\,
	datac => \keyboard|n_next[2]~3_combout\,
	datad => \keyboard|n_load~1_combout\,
	combout => \keyboard|n_next[2]~4_combout\);

-- Location: FF_X28_Y25_N23
\keyboard|n_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \keyboard|n_next[2]~4_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|n_reg\(2));

-- Location: LCCOMB_X27_Y25_N18
\keyboard|n_next[3]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|n_next[3]~5_combout\ = (\keyboard|n_dec~1_combout\ & (!\keyboard|Add0~0_combout\)) # (!\keyboard|n_dec~1_combout\ & (((\keyboard|n_reg\(3)) # (\keyboard|n_load~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|Add0~0_combout\,
	datab => \keyboard|n_dec~1_combout\,
	datac => \keyboard|n_reg\(3),
	datad => \keyboard|n_load~1_combout\,
	combout => \keyboard|n_next[3]~5_combout\);

-- Location: FF_X27_Y25_N19
\keyboard|n_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keyboard|n_next[3]~5_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|n_reg\(3));

-- Location: LCCOMB_X28_Y25_N22
\keyboard|Equal2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|Equal2~0_combout\ = (\keyboard|n_reg\(2)) # (\keyboard|n_reg\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \keyboard|n_reg\(2),
	datad => \keyboard|n_reg\(3),
	combout => \keyboard|Equal2~0_combout\);

-- Location: LCCOMB_X28_Y25_N28
\keyboard|Equal2~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|Equal2~1_combout\ = (\keyboard|n_reg\(1)) # ((\keyboard|Equal2~0_combout\) # (\keyboard|n_reg\(0) $ (\keyboard|n_dec~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|n_reg\(1),
	datab => \keyboard|Equal2~0_combout\,
	datac => \keyboard|n_reg\(0),
	datad => \keyboard|n_dec~1_combout\,
	combout => \keyboard|Equal2~1_combout\);

-- Location: LCCOMB_X28_Y25_N20
\keyboard|state_reg.extract~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|state_reg.extract~0_combout\ = (\keyboard|fall_edge~combout\ & (((\keyboard|state_reg.extract~q\ & \keyboard|Equal2~1_combout\)) # (!\keyboard|state_reg.idle~q\))) # (!\keyboard|fall_edge~combout\ & (((\keyboard|state_reg.extract~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \keyboard|fall_edge~combout\,
	datab => \keyboard|state_reg.idle~q\,
	datac => \keyboard|state_reg.extract~q\,
	datad => \keyboard|Equal2~1_combout\,
	combout => \keyboard|state_reg.extract~0_combout\);

-- Location: FF_X28_Y25_N21
\keyboard|state_reg.extract\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keyboard|state_reg.extract~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|state_reg.extract~q\);

-- Location: LCCOMB_X28_Y25_N12
\keyboard|Selector3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|Selector3~0_combout\ = (\keyboard|state_reg.extract~q\ & (\keyboard|fall_edge~combout\ & !\keyboard|Equal2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \keyboard|state_reg.extract~q\,
	datac => \keyboard|fall_edge~combout\,
	datad => \keyboard|Equal2~1_combout\,
	combout => \keyboard|Selector3~0_combout\);

-- Location: FF_X28_Y25_N13
\keyboard|state_reg.done\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keyboard|Selector3~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|state_reg.done~q\);

-- Location: LCCOMB_X26_Y25_N24
\keyboard|Selector0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|Selector0~0_combout\ = (\keyboard|fall_edge~combout\ & !\keyboard|state_reg.done~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \keyboard|fall_edge~combout\,
	datad => \keyboard|state_reg.done~q\,
	combout => \keyboard|Selector0~0_combout\);

-- Location: FF_X26_Y25_N11
\keyboard|b_reg[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keyboard|b_reg[10]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \keyboard|Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|b_reg\(10));

-- Location: LCCOMB_X26_Y25_N20
\keyboard|b_reg[9]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|b_reg[9]~feeder_combout\ = \keyboard|b_reg\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \keyboard|b_reg\(10),
	combout => \keyboard|b_reg[9]~feeder_combout\);

-- Location: FF_X26_Y25_N21
\keyboard|b_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keyboard|b_reg[9]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \keyboard|Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|b_reg\(9));

-- Location: LCCOMB_X26_Y25_N6
\keyboard|b_reg[8]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|b_reg[8]~feeder_combout\ = \keyboard|b_reg\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \keyboard|b_reg\(9),
	combout => \keyboard|b_reg[8]~feeder_combout\);

-- Location: FF_X26_Y25_N7
\keyboard|b_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keyboard|b_reg[8]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \keyboard|Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|b_reg\(8));

-- Location: LCCOMB_X26_Y25_N0
\keyboard|b_reg[7]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|b_reg[7]~feeder_combout\ = \keyboard|b_reg\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \keyboard|b_reg\(8),
	combout => \keyboard|b_reg[7]~feeder_combout\);

-- Location: FF_X26_Y25_N1
\keyboard|b_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keyboard|b_reg[7]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \keyboard|Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|b_reg\(7));

-- Location: LCCOMB_X26_Y25_N2
\keyboard|b_reg[6]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|b_reg[6]~feeder_combout\ = \keyboard|b_reg\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \keyboard|b_reg\(7),
	combout => \keyboard|b_reg[6]~feeder_combout\);

-- Location: FF_X26_Y25_N3
\keyboard|b_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keyboard|b_reg[6]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \keyboard|Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|b_reg\(6));

-- Location: LCCOMB_X26_Y25_N8
\keyboard|b_reg[5]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|b_reg[5]~feeder_combout\ = \keyboard|b_reg\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \keyboard|b_reg\(6),
	combout => \keyboard|b_reg[5]~feeder_combout\);

-- Location: FF_X26_Y25_N9
\keyboard|b_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keyboard|b_reg[5]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \keyboard|Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|b_reg\(5));

-- Location: FF_X26_Y25_N27
\keyboard|b_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \keyboard|b_reg\(5),
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \keyboard|Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|b_reg\(4));

-- Location: FF_X26_Y25_N13
\keyboard|b_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \keyboard|b_reg\(4),
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \keyboard|Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|b_reg\(3));

-- Location: LCCOMB_X26_Y25_N22
\keyboard|b_reg[2]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \keyboard|b_reg[2]~feeder_combout\ = \keyboard|b_reg\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \keyboard|b_reg\(3),
	combout => \keyboard|b_reg[2]~feeder_combout\);

-- Location: FF_X26_Y25_N23
\keyboard|b_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \keyboard|b_reg[2]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \keyboard|Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|b_reg\(2));

-- Location: FF_X26_Y25_N25
\keyboard|b_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \keyboard|b_reg\(2),
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \keyboard|Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \keyboard|b_reg\(1));

-- Location: M9K_X25_Y26_N0
\convert|altsyncram_component|auto_generated|ram_block1a0\ : cycloneiii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001B0000000000000000000",
	mem_init0 => X"0000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000170000000174000A000000000000000000000F4005B00000002700000000000000002D001C0003B001B0002F000B80000000000039000C0006F001A4006B000B00000000000038000DC0075001A8006D000000000000000036001E40067001A00062001B80000000000035001C80074001980076000800000000000033000D000650019000780018C0000000000032001DC0061001CC007A000000000000000031001C40000000000000000000000000000000000240000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "en_us_mem.mif",
	init_file_layout => "port_a",
	logical_ram_name => "en_us_rom:convert|altsyncram:altsyncram_component|altsyncram_47a1:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 8,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 18,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 255,
	port_a_logical_ram_depth => 256,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 8,
	port_b_data_width => 18,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	portaaddr => \convert|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \convert|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCCOMB_X26_Y26_N12
\display|char0dec|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|char0dec|Mux6~0_combout\ = (\convert|altsyncram_component|auto_generated|q_a\(0) & (!\convert|altsyncram_component|auto_generated|q_a\(3) & (\convert|altsyncram_component|auto_generated|q_a\(1) $ 
-- (!\convert|altsyncram_component|auto_generated|q_a\(2))))) # (!\convert|altsyncram_component|auto_generated|q_a\(0) & (!\convert|altsyncram_component|auto_generated|q_a\(1) & (\convert|altsyncram_component|auto_generated|q_a\(2) $ 
-- (!\convert|altsyncram_component|auto_generated|q_a\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \convert|altsyncram_component|auto_generated|q_a\(1),
	datab => \convert|altsyncram_component|auto_generated|q_a\(0),
	datac => \convert|altsyncram_component|auto_generated|q_a\(2),
	datad => \convert|altsyncram_component|auto_generated|q_a\(3),
	combout => \display|char0dec|Mux6~0_combout\);

-- Location: FF_X26_Y26_N13
\display|char0dec|num_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \display|char0dec|Mux6~0_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|char0dec|num_out\(6));

-- Location: LCCOMB_X26_Y26_N6
\display|char0dec|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|char0dec|Mux5~0_combout\ = (\convert|altsyncram_component|auto_generated|q_a\(1) & (!\convert|altsyncram_component|auto_generated|q_a\(3) & ((\convert|altsyncram_component|auto_generated|q_a\(0)) # 
-- (!\convert|altsyncram_component|auto_generated|q_a\(2))))) # (!\convert|altsyncram_component|auto_generated|q_a\(1) & (\convert|altsyncram_component|auto_generated|q_a\(0) & (\convert|altsyncram_component|auto_generated|q_a\(2) $ 
-- (!\convert|altsyncram_component|auto_generated|q_a\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \convert|altsyncram_component|auto_generated|q_a\(1),
	datab => \convert|altsyncram_component|auto_generated|q_a\(0),
	datac => \convert|altsyncram_component|auto_generated|q_a\(2),
	datad => \convert|altsyncram_component|auto_generated|q_a\(3),
	combout => \display|char0dec|Mux5~0_combout\);

-- Location: FF_X26_Y26_N7
\display|char0dec|num_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \display|char0dec|Mux5~0_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|char0dec|num_out\(5));

-- Location: LCCOMB_X26_Y26_N0
\display|char0dec|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|char0dec|Mux4~0_combout\ = (\convert|altsyncram_component|auto_generated|q_a\(1) & (!\convert|altsyncram_component|auto_generated|q_a\(3) & (\convert|altsyncram_component|auto_generated|q_a\(0)))) # 
-- (!\convert|altsyncram_component|auto_generated|q_a\(1) & ((\convert|altsyncram_component|auto_generated|q_a\(2) & (!\convert|altsyncram_component|auto_generated|q_a\(3))) # (!\convert|altsyncram_component|auto_generated|q_a\(2) & 
-- ((\convert|altsyncram_component|auto_generated|q_a\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \convert|altsyncram_component|auto_generated|q_a\(1),
	datab => \convert|altsyncram_component|auto_generated|q_a\(3),
	datac => \convert|altsyncram_component|auto_generated|q_a\(0),
	datad => \convert|altsyncram_component|auto_generated|q_a\(2),
	combout => \display|char0dec|Mux4~0_combout\);

-- Location: FF_X26_Y26_N1
\display|char0dec|num_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \display|char0dec|Mux4~0_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|char0dec|num_out\(4));

-- Location: LCCOMB_X26_Y26_N10
\display|char0dec|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|char0dec|Mux3~0_combout\ = (\convert|altsyncram_component|auto_generated|q_a\(0) & (\convert|altsyncram_component|auto_generated|q_a\(1) $ ((!\convert|altsyncram_component|auto_generated|q_a\(2))))) # 
-- (!\convert|altsyncram_component|auto_generated|q_a\(0) & ((\convert|altsyncram_component|auto_generated|q_a\(1) & (!\convert|altsyncram_component|auto_generated|q_a\(2) & \convert|altsyncram_component|auto_generated|q_a\(3))) # 
-- (!\convert|altsyncram_component|auto_generated|q_a\(1) & (\convert|altsyncram_component|auto_generated|q_a\(2) & !\convert|altsyncram_component|auto_generated|q_a\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \convert|altsyncram_component|auto_generated|q_a\(1),
	datab => \convert|altsyncram_component|auto_generated|q_a\(0),
	datac => \convert|altsyncram_component|auto_generated|q_a\(2),
	datad => \convert|altsyncram_component|auto_generated|q_a\(3),
	combout => \display|char0dec|Mux3~0_combout\);

-- Location: FF_X26_Y26_N11
\display|char0dec|num_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \display|char0dec|Mux3~0_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|char0dec|num_out\(3));

-- Location: LCCOMB_X26_Y26_N4
\display|char0dec|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|char0dec|Mux2~0_combout\ = (\convert|altsyncram_component|auto_generated|q_a\(3) & (\convert|altsyncram_component|auto_generated|q_a\(2) & ((\convert|altsyncram_component|auto_generated|q_a\(1)) # 
-- (!\convert|altsyncram_component|auto_generated|q_a\(0))))) # (!\convert|altsyncram_component|auto_generated|q_a\(3) & (\convert|altsyncram_component|auto_generated|q_a\(1) & (!\convert|altsyncram_component|auto_generated|q_a\(0) & 
-- !\convert|altsyncram_component|auto_generated|q_a\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \convert|altsyncram_component|auto_generated|q_a\(1),
	datab => \convert|altsyncram_component|auto_generated|q_a\(3),
	datac => \convert|altsyncram_component|auto_generated|q_a\(0),
	datad => \convert|altsyncram_component|auto_generated|q_a\(2),
	combout => \display|char0dec|Mux2~0_combout\);

-- Location: FF_X26_Y26_N5
\display|char0dec|num_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \display|char0dec|Mux2~0_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|char0dec|num_out\(2));

-- Location: LCCOMB_X24_Y26_N4
\display|char0dec|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|char0dec|Mux1~0_combout\ = (\convert|altsyncram_component|auto_generated|q_a\(1) & ((\convert|altsyncram_component|auto_generated|q_a\(0) & ((\convert|altsyncram_component|auto_generated|q_a\(3)))) # 
-- (!\convert|altsyncram_component|auto_generated|q_a\(0) & (\convert|altsyncram_component|auto_generated|q_a\(2))))) # (!\convert|altsyncram_component|auto_generated|q_a\(1) & (\convert|altsyncram_component|auto_generated|q_a\(2) & 
-- (\convert|altsyncram_component|auto_generated|q_a\(0) $ (\convert|altsyncram_component|auto_generated|q_a\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \convert|altsyncram_component|auto_generated|q_a\(0),
	datab => \convert|altsyncram_component|auto_generated|q_a\(1),
	datac => \convert|altsyncram_component|auto_generated|q_a\(2),
	datad => \convert|altsyncram_component|auto_generated|q_a\(3),
	combout => \display|char0dec|Mux1~0_combout\);

-- Location: FF_X24_Y26_N5
\display|char0dec|num_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \display|char0dec|Mux1~0_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|char0dec|num_out\(1));

-- Location: LCCOMB_X24_Y26_N2
\display|char0dec|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|char0dec|Mux0~0_combout\ = (\convert|altsyncram_component|auto_generated|q_a\(2) & (!\convert|altsyncram_component|auto_generated|q_a\(1) & (\convert|altsyncram_component|auto_generated|q_a\(0) $ 
-- (!\convert|altsyncram_component|auto_generated|q_a\(3))))) # (!\convert|altsyncram_component|auto_generated|q_a\(2) & (\convert|altsyncram_component|auto_generated|q_a\(0) & (\convert|altsyncram_component|auto_generated|q_a\(1) $ 
-- (!\convert|altsyncram_component|auto_generated|q_a\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \convert|altsyncram_component|auto_generated|q_a\(0),
	datab => \convert|altsyncram_component|auto_generated|q_a\(1),
	datac => \convert|altsyncram_component|auto_generated|q_a\(2),
	datad => \convert|altsyncram_component|auto_generated|q_a\(3),
	combout => \display|char0dec|Mux0~0_combout\);

-- Location: FF_X24_Y26_N3
\display|char0dec|num_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \display|char0dec|Mux0~0_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|char0dec|num_out\(0));

-- Location: LCCOMB_X24_Y26_N24
\display|char1dec|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|char1dec|Mux6~0_combout\ = (\convert|altsyncram_component|auto_generated|q_a\(4) & (!\convert|altsyncram_component|auto_generated|q_a\(7) & (\convert|altsyncram_component|auto_generated|q_a\(6) $ 
-- (!\convert|altsyncram_component|auto_generated|q_a\(5))))) # (!\convert|altsyncram_component|auto_generated|q_a\(4) & (!\convert|altsyncram_component|auto_generated|q_a\(5) & (\convert|altsyncram_component|auto_generated|q_a\(6) $ 
-- (!\convert|altsyncram_component|auto_generated|q_a\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100001000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \convert|altsyncram_component|auto_generated|q_a\(4),
	datab => \convert|altsyncram_component|auto_generated|q_a\(6),
	datac => \convert|altsyncram_component|auto_generated|q_a\(7),
	datad => \convert|altsyncram_component|auto_generated|q_a\(5),
	combout => \display|char1dec|Mux6~0_combout\);

-- Location: FF_X24_Y26_N25
\display|char1dec|num_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \display|char1dec|Mux6~0_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|char1dec|num_out\(6));

-- Location: LCCOMB_X24_Y26_N6
\display|char1dec|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|char1dec|Mux5~0_combout\ = (\convert|altsyncram_component|auto_generated|q_a\(5) & (!\convert|altsyncram_component|auto_generated|q_a\(7) & ((\convert|altsyncram_component|auto_generated|q_a\(4)) # 
-- (!\convert|altsyncram_component|auto_generated|q_a\(6))))) # (!\convert|altsyncram_component|auto_generated|q_a\(5) & (\convert|altsyncram_component|auto_generated|q_a\(4) & (\convert|altsyncram_component|auto_generated|q_a\(7) $ 
-- (!\convert|altsyncram_component|auto_generated|q_a\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \convert|altsyncram_component|auto_generated|q_a\(7),
	datab => \convert|altsyncram_component|auto_generated|q_a\(5),
	datac => \convert|altsyncram_component|auto_generated|q_a\(6),
	datad => \convert|altsyncram_component|auto_generated|q_a\(4),
	combout => \display|char1dec|Mux5~0_combout\);

-- Location: FF_X24_Y26_N7
\display|char1dec|num_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \display|char1dec|Mux5~0_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|char1dec|num_out\(5));

-- Location: LCCOMB_X24_Y26_N0
\display|char1dec|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|char1dec|Mux4~0_combout\ = (\convert|altsyncram_component|auto_generated|q_a\(5) & (!\convert|altsyncram_component|auto_generated|q_a\(7) & ((\convert|altsyncram_component|auto_generated|q_a\(4))))) # 
-- (!\convert|altsyncram_component|auto_generated|q_a\(5) & ((\convert|altsyncram_component|auto_generated|q_a\(6) & (!\convert|altsyncram_component|auto_generated|q_a\(7))) # (!\convert|altsyncram_component|auto_generated|q_a\(6) & 
-- ((\convert|altsyncram_component|auto_generated|q_a\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \convert|altsyncram_component|auto_generated|q_a\(7),
	datab => \convert|altsyncram_component|auto_generated|q_a\(5),
	datac => \convert|altsyncram_component|auto_generated|q_a\(6),
	datad => \convert|altsyncram_component|auto_generated|q_a\(4),
	combout => \display|char1dec|Mux4~0_combout\);

-- Location: FF_X24_Y26_N1
\display|char1dec|num_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \display|char1dec|Mux4~0_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|char1dec|num_out\(4));

-- Location: LCCOMB_X24_Y26_N22
\display|char1dec|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|char1dec|Mux3~0_combout\ = (\convert|altsyncram_component|auto_generated|q_a\(4) & ((\convert|altsyncram_component|auto_generated|q_a\(5) $ (!\convert|altsyncram_component|auto_generated|q_a\(6))))) # 
-- (!\convert|altsyncram_component|auto_generated|q_a\(4) & ((\convert|altsyncram_component|auto_generated|q_a\(7) & (\convert|altsyncram_component|auto_generated|q_a\(5) & !\convert|altsyncram_component|auto_generated|q_a\(6))) # 
-- (!\convert|altsyncram_component|auto_generated|q_a\(7) & (!\convert|altsyncram_component|auto_generated|q_a\(5) & \convert|altsyncram_component|auto_generated|q_a\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \convert|altsyncram_component|auto_generated|q_a\(7),
	datab => \convert|altsyncram_component|auto_generated|q_a\(5),
	datac => \convert|altsyncram_component|auto_generated|q_a\(6),
	datad => \convert|altsyncram_component|auto_generated|q_a\(4),
	combout => \display|char1dec|Mux3~0_combout\);

-- Location: FF_X24_Y26_N23
\display|char1dec|num_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \display|char1dec|Mux3~0_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|char1dec|num_out\(3));

-- Location: LCCOMB_X24_Y26_N20
\display|char1dec|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|char1dec|Mux2~0_combout\ = (\convert|altsyncram_component|auto_generated|q_a\(7) & (\convert|altsyncram_component|auto_generated|q_a\(6) & ((\convert|altsyncram_component|auto_generated|q_a\(5)) # 
-- (!\convert|altsyncram_component|auto_generated|q_a\(4))))) # (!\convert|altsyncram_component|auto_generated|q_a\(7) & (\convert|altsyncram_component|auto_generated|q_a\(5) & (!\convert|altsyncram_component|auto_generated|q_a\(6) & 
-- !\convert|altsyncram_component|auto_generated|q_a\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \convert|altsyncram_component|auto_generated|q_a\(7),
	datab => \convert|altsyncram_component|auto_generated|q_a\(5),
	datac => \convert|altsyncram_component|auto_generated|q_a\(6),
	datad => \convert|altsyncram_component|auto_generated|q_a\(4),
	combout => \display|char1dec|Mux2~0_combout\);

-- Location: FF_X24_Y26_N21
\display|char1dec|num_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \display|char1dec|Mux2~0_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|char1dec|num_out\(2));

-- Location: LCCOMB_X24_Y26_N10
\display|char1dec|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|char1dec|Mux1~0_combout\ = (\convert|altsyncram_component|auto_generated|q_a\(7) & ((\convert|altsyncram_component|auto_generated|q_a\(4) & ((\convert|altsyncram_component|auto_generated|q_a\(5)))) # 
-- (!\convert|altsyncram_component|auto_generated|q_a\(4) & (\convert|altsyncram_component|auto_generated|q_a\(6))))) # (!\convert|altsyncram_component|auto_generated|q_a\(7) & (\convert|altsyncram_component|auto_generated|q_a\(6) & 
-- (\convert|altsyncram_component|auto_generated|q_a\(4) $ (\convert|altsyncram_component|auto_generated|q_a\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \convert|altsyncram_component|auto_generated|q_a\(4),
	datab => \convert|altsyncram_component|auto_generated|q_a\(6),
	datac => \convert|altsyncram_component|auto_generated|q_a\(7),
	datad => \convert|altsyncram_component|auto_generated|q_a\(5),
	combout => \display|char1dec|Mux1~0_combout\);

-- Location: FF_X24_Y26_N11
\display|char1dec|num_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \display|char1dec|Mux1~0_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|char1dec|num_out\(1));

-- Location: LCCOMB_X24_Y26_N12
\display|char1dec|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|char1dec|Mux0~0_combout\ = (\convert|altsyncram_component|auto_generated|q_a\(7) & (\convert|altsyncram_component|auto_generated|q_a\(4) & (\convert|altsyncram_component|auto_generated|q_a\(5) $ 
-- (\convert|altsyncram_component|auto_generated|q_a\(6))))) # (!\convert|altsyncram_component|auto_generated|q_a\(7) & (!\convert|altsyncram_component|auto_generated|q_a\(5) & (\convert|altsyncram_component|auto_generated|q_a\(6) $ 
-- (\convert|altsyncram_component|auto_generated|q_a\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \convert|altsyncram_component|auto_generated|q_a\(7),
	datab => \convert|altsyncram_component|auto_generated|q_a\(5),
	datac => \convert|altsyncram_component|auto_generated|q_a\(6),
	datad => \convert|altsyncram_component|auto_generated|q_a\(4),
	combout => \display|char1dec|Mux0~0_combout\);

-- Location: FF_X24_Y26_N13
\display|char1dec|num_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \display|char1dec|Mux0~0_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|char1dec|num_out\(0));

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX1(6) <= \HEX1[6]~output_o\;

ww_HEX1(5) <= \HEX1[5]~output_o\;

ww_HEX1(4) <= \HEX1[4]~output_o\;

ww_HEX1(3) <= \HEX1[3]~output_o\;

ww_HEX1(2) <= \HEX1[2]~output_o\;

ww_HEX1(1) <= \HEX1[1]~output_o\;

ww_HEX1(0) <= \HEX1[0]~output_o\;

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_LEDG(1) <= \LEDG[1]~output_o\;

ww_LEDG(2) <= \LEDG[2]~output_o\;

ww_LEDG(3) <= \LEDG[3]~output_o\;

ww_LEDG(4) <= \LEDG[4]~output_o\;

ww_LEDG(5) <= \LEDG[5]~output_o\;

ww_LEDG(6) <= \LEDG[6]~output_o\;

ww_LEDG(7) <= \LEDG[7]~output_o\;
END structure;


