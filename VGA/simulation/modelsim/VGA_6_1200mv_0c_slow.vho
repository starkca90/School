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

-- DATE "01/09/2013 23:49:22"

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

ENTITY 	VGA IS
    PORT (
	CLOCK_50 : IN std_logic;
	SW : IN std_logic_vector(9 DOWNTO 0);
	KEY : IN std_logic_vector(2 DOWNTO 0);
	VGA_R : OUT std_logic_vector(3 DOWNTO 0);
	VGA_B : OUT std_logic_vector(3 DOWNTO 0);
	VGA_G : OUT std_logic_vector(3 DOWNTO 0);
	VGA_HS : OUT std_logic;
	VGA_VS : OUT std_logic
	);
END VGA;

-- Design Ports Information
-- VGA_R[0]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[1]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[2]	=>  Location: PIN_H20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[3]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[0]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[1]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[2]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[3]	=>  Location: PIN_K18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[0]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[1]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[2]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[3]	=>  Location: PIN_J21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_HS	=>  Location: PIN_L21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_VS	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_G3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF VGA IS
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
SIGNAL ww_SW : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_KEY : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_VGA_R : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_VGA_B : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_VGA_G : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_VGA_HS : std_logic;
SIGNAL ww_VGA_VS : std_logic;
SIGNAL \generator|clkdiv_inst|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \generator|clkdiv_inst|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \generator|Add1~8_combout\ : std_logic;
SIGNAL \generator|Add1~14_combout\ : std_logic;
SIGNAL \generator|Add1~17\ : std_logic;
SIGNAL \generator|Add1~18_combout\ : std_logic;
SIGNAL \generator|VGA_HS~0_combout\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \generator|Add0~1\ : std_logic;
SIGNAL \generator|Add0~3\ : std_logic;
SIGNAL \generator|Add0~5\ : std_logic;
SIGNAL \generator|Add0~6_combout\ : std_logic;
SIGNAL \generator|Add0~7\ : std_logic;
SIGNAL \generator|Add0~8_combout\ : std_logic;
SIGNAL \generator|Add0~9\ : std_logic;
SIGNAL \generator|Add0~10_combout\ : std_logic;
SIGNAL \generator|Add0~0_combout\ : std_logic;
SIGNAL \generator|Equal0~1_combout\ : std_logic;
SIGNAL \generator|Add0~13\ : std_logic;
SIGNAL \generator|Add0~14_combout\ : std_logic;
SIGNAL \generator|Add0~15\ : std_logic;
SIGNAL \generator|Add0~17\ : std_logic;
SIGNAL \generator|Add0~18_combout\ : std_logic;
SIGNAL \generator|h_count_nxt[9]~1_combout\ : std_logic;
SIGNAL \generator|Add0~2_combout\ : std_logic;
SIGNAL \generator|Equal0~0_combout\ : std_logic;
SIGNAL \generator|Equal0~2_combout\ : std_logic;
SIGNAL \generator|h_count_nxt[5]~2_combout\ : std_logic;
SIGNAL \generator|Add0~11\ : std_logic;
SIGNAL \generator|Add0~12_combout\ : std_logic;
SIGNAL \generator|VGA_HS~1_combout\ : std_logic;
SIGNAL \generator|Add0~16_combout\ : std_logic;
SIGNAL \generator|h_count_nxt[8]~0_combout\ : std_logic;
SIGNAL \generator|VGA_HS~2_combout\ : std_logic;
SIGNAL \generator|Equal1~0_combout\ : std_logic;
SIGNAL \generator|Equal1~2_combout\ : std_logic;
SIGNAL \generator|Add0~4_combout\ : std_logic;
SIGNAL \generator|process_1~4_combout\ : std_logic;
SIGNAL \generator|v_count[8]~0_combout\ : std_logic;
SIGNAL \generator|Equal1~1_combout\ : std_logic;
SIGNAL \generator|process_1~5_combout\ : std_logic;
SIGNAL \generator|process_1~6_combout\ : std_logic;
SIGNAL \generator|v_count[7]~4_combout\ : std_logic;
SIGNAL \generator|v_count[4]~1_combout\ : std_logic;
SIGNAL \generator|Add1~0_combout\ : std_logic;
SIGNAL \generator|v_count_nxt[0]~3_combout\ : std_logic;
SIGNAL \generator|Add1~1\ : std_logic;
SIGNAL \generator|Add1~3\ : std_logic;
SIGNAL \generator|Add1~4_combout\ : std_logic;
SIGNAL \generator|v_count_nxt[2]~0_combout\ : std_logic;
SIGNAL \generator|Add1~5\ : std_logic;
SIGNAL \generator|Add1~7\ : std_logic;
SIGNAL \generator|Add1~9\ : std_logic;
SIGNAL \generator|Add1~10_combout\ : std_logic;
SIGNAL \generator|v_count[5]~6_combout\ : std_logic;
SIGNAL \generator|Add1~11\ : std_logic;
SIGNAL \generator|Add1~13\ : std_logic;
SIGNAL \generator|Add1~15\ : std_logic;
SIGNAL \generator|Add1~16_combout\ : std_logic;
SIGNAL \generator|v_count[8]~3_combout\ : std_logic;
SIGNAL \generator|process_1~2_combout\ : std_logic;
SIGNAL \generator|process_1~3_combout\ : std_logic;
SIGNAL \generator|Add1~6_combout\ : std_logic;
SIGNAL \generator|v_count_nxt[3]~2_combout\ : std_logic;
SIGNAL \generator|LessThan7~0_combout\ : std_logic;
SIGNAL \generator|Add1~2_combout\ : std_logic;
SIGNAL \generator|v_count_nxt[1]~1_combout\ : std_logic;
SIGNAL \generator|v_count[9]~2_combout\ : std_logic;
SIGNAL \generator|VGA_VS~0_combout\ : std_logic;
SIGNAL \generator|Add1~12_combout\ : std_logic;
SIGNAL \generator|v_count[6]~5_combout\ : std_logic;
SIGNAL \generator|VGA_VS~1_combout\ : std_logic;
SIGNAL \generator|VGA_VS~2_combout\ : std_logic;
SIGNAL \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \generator|v_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \generator|h_count\ : std_logic_vector(9 DOWNTO 0);

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_SW <= SW;
ww_KEY <= KEY;
VGA_R <= ww_VGA_R;
VGA_B <= ww_VGA_B;
VGA_G <= ww_VGA_G;
VGA_HS <= ww_VGA_HS;
VGA_VS <= ww_VGA_VS;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\generator|clkdiv_inst|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \CLOCK_50~input_o\);

\generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk\(0) <= \generator|clkdiv_inst|altpll_component|auto_generated|pll1_CLK_bus\(0);
\generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk\(1) <= \generator|clkdiv_inst|altpll_component|auto_generated|pll1_CLK_bus\(1);
\generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk\(2) <= \generator|clkdiv_inst|altpll_component|auto_generated|pll1_CLK_bus\(2);
\generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk\(3) <= \generator|clkdiv_inst|altpll_component|auto_generated|pll1_CLK_bus\(3);
\generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk\(4) <= \generator|clkdiv_inst|altpll_component|auto_generated|pll1_CLK_bus\(4);

\generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk\(0));

-- Location: PLL_2
\generator|clkdiv_inst|altpll_component|auto_generated|pll1\ : cycloneiii_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 12,
	c0_initial => 1,
	c0_low => 12,
	c0_mode => "even",
	c0_ph => 0,
	c1_high => 0,
	c1_initial => 0,
	c1_low => 0,
	c1_mode => "bypass",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c0",
	clk0_divide_by => 2,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 1,
	clk0_phase_shift => "0",
	clk1_counter => "unused",
	clk1_divide_by => 0,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 0,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 27,
	m => 12,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	pll_compensation_delay => 5052,
	self_reset_on_loss_lock => "off",
	simulation_type => "timing",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 208,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	fbin => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \generator|clkdiv_inst|altpll_component|auto_generated|pll1_INCLK_bus\,
	fbout => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: LCCOMB_X38_Y18_N16
\generator|Add1~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add1~8_combout\ = (\generator|v_count\(4) & (\generator|Add1~7\ $ (GND))) # (!\generator|v_count\(4) & (!\generator|Add1~7\ & VCC))
-- \generator|Add1~9\ = CARRY((\generator|v_count\(4) & !\generator|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \generator|v_count\(4),
	datad => VCC,
	cin => \generator|Add1~7\,
	combout => \generator|Add1~8_combout\,
	cout => \generator|Add1~9\);

-- Location: LCCOMB_X38_Y18_N22
\generator|Add1~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add1~14_combout\ = (\generator|v_count\(7) & (!\generator|Add1~13\)) # (!\generator|v_count\(7) & ((\generator|Add1~13\) # (GND)))
-- \generator|Add1~15\ = CARRY((!\generator|Add1~13\) # (!\generator|v_count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \generator|v_count\(7),
	datad => VCC,
	cin => \generator|Add1~13\,
	combout => \generator|Add1~14_combout\,
	cout => \generator|Add1~15\);

-- Location: LCCOMB_X38_Y18_N24
\generator|Add1~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add1~16_combout\ = (\generator|v_count\(8) & (\generator|Add1~15\ $ (GND))) # (!\generator|v_count\(8) & (!\generator|Add1~15\ & VCC))
-- \generator|Add1~17\ = CARRY((\generator|v_count\(8) & !\generator|Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \generator|v_count\(8),
	datad => VCC,
	cin => \generator|Add1~15\,
	combout => \generator|Add1~16_combout\,
	cout => \generator|Add1~17\);

-- Location: LCCOMB_X38_Y18_N26
\generator|Add1~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add1~18_combout\ = \generator|Add1~17\ $ (\generator|v_count\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \generator|v_count\(9),
	cin => \generator|Add1~17\,
	combout => \generator|Add1~18_combout\);

-- Location: LCCOMB_X40_Y18_N28
\generator|VGA_HS~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|VGA_HS~0_combout\ = (!\generator|h_count\(3) & (((!\generator|h_count\(1)) # (!\generator|h_count\(0))) # (!\generator|h_count\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(2),
	datab => \generator|h_count\(0),
	datac => \generator|h_count\(3),
	datad => \generator|h_count\(1),
	combout => \generator|VGA_HS~0_combout\);

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

-- Location: CLKCTRL_G8
\generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

-- Location: IOOBUF_X41_Y23_N23
\VGA_R[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_R(0));

-- Location: IOOBUF_X41_Y25_N2
\VGA_R[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_R(1));

-- Location: IOOBUF_X41_Y22_N2
\VGA_R[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_R(2));

-- Location: IOOBUF_X41_Y21_N23
\VGA_R[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_R(3));

-- Location: IOOBUF_X41_Y19_N16
\VGA_B[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_B(0));

-- Location: IOOBUF_X41_Y19_N9
\VGA_B[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_B(1));

-- Location: IOOBUF_X41_Y19_N2
\VGA_B[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_B(2));

-- Location: IOOBUF_X41_Y21_N9
\VGA_B[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_B(3));

-- Location: IOOBUF_X41_Y20_N2
\VGA_G[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_G(0));

-- Location: IOOBUF_X41_Y24_N23
\VGA_G[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_G(1));

-- Location: IOOBUF_X41_Y21_N16
\VGA_G[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_G(2));

-- Location: IOOBUF_X41_Y20_N23
\VGA_G[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_G(3));

-- Location: IOOBUF_X41_Y18_N16
\VGA_HS~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \generator|VGA_HS~2_combout\,
	devoe => ww_devoe,
	o => ww_VGA_HS);

-- Location: IOOBUF_X41_Y18_N23
\VGA_VS~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \generator|VGA_VS~2_combout\,
	devoe => ww_devoe,
	o => ww_VGA_VS);

-- Location: LCCOMB_X40_Y18_N8
\generator|Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add0~0_combout\ = \generator|h_count\(0) $ (VCC)
-- \generator|Add0~1\ = CARRY(\generator|h_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(0),
	datad => VCC,
	combout => \generator|Add0~0_combout\,
	cout => \generator|Add0~1\);

-- Location: LCCOMB_X40_Y18_N10
\generator|Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add0~2_combout\ = (\generator|h_count\(1) & (!\generator|Add0~1\)) # (!\generator|h_count\(1) & ((\generator|Add0~1\) # (GND)))
-- \generator|Add0~3\ = CARRY((!\generator|Add0~1\) # (!\generator|h_count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(1),
	datad => VCC,
	cin => \generator|Add0~1\,
	combout => \generator|Add0~2_combout\,
	cout => \generator|Add0~3\);

-- Location: LCCOMB_X40_Y18_N12
\generator|Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add0~4_combout\ = (\generator|h_count\(2) & (\generator|Add0~3\ $ (GND))) # (!\generator|h_count\(2) & (!\generator|Add0~3\ & VCC))
-- \generator|Add0~5\ = CARRY((\generator|h_count\(2) & !\generator|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(2),
	datad => VCC,
	cin => \generator|Add0~3\,
	combout => \generator|Add0~4_combout\,
	cout => \generator|Add0~5\);

-- Location: LCCOMB_X40_Y18_N14
\generator|Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add0~6_combout\ = (\generator|h_count\(3) & (!\generator|Add0~5\)) # (!\generator|h_count\(3) & ((\generator|Add0~5\) # (GND)))
-- \generator|Add0~7\ = CARRY((!\generator|Add0~5\) # (!\generator|h_count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \generator|h_count\(3),
	datad => VCC,
	cin => \generator|Add0~5\,
	combout => \generator|Add0~6_combout\,
	cout => \generator|Add0~7\);

-- Location: FF_X40_Y18_N15
\generator|h_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(3));

-- Location: LCCOMB_X40_Y18_N16
\generator|Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add0~8_combout\ = (\generator|h_count\(4) & (\generator|Add0~7\ $ (GND))) # (!\generator|h_count\(4) & (!\generator|Add0~7\ & VCC))
-- \generator|Add0~9\ = CARRY((\generator|h_count\(4) & !\generator|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \generator|h_count\(4),
	datad => VCC,
	cin => \generator|Add0~7\,
	combout => \generator|Add0~8_combout\,
	cout => \generator|Add0~9\);

-- Location: FF_X40_Y18_N17
\generator|h_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(4));

-- Location: LCCOMB_X40_Y18_N18
\generator|Add0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add0~10_combout\ = (\generator|h_count\(5) & (!\generator|Add0~9\)) # (!\generator|h_count\(5) & ((\generator|Add0~9\) # (GND)))
-- \generator|Add0~11\ = CARRY((!\generator|Add0~9\) # (!\generator|h_count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \generator|h_count\(5),
	datad => VCC,
	cin => \generator|Add0~9\,
	combout => \generator|Add0~10_combout\,
	cout => \generator|Add0~11\);

-- Location: FF_X40_Y18_N9
\generator|h_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(0));

-- Location: LCCOMB_X40_Y18_N4
\generator|Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Equal0~1_combout\ = (\generator|h_count\(3) & (!\generator|h_count\(6) & (\generator|h_count\(0) & \generator|h_count\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(3),
	datab => \generator|h_count\(6),
	datac => \generator|h_count\(0),
	datad => \generator|h_count\(4),
	combout => \generator|Equal0~1_combout\);

-- Location: LCCOMB_X40_Y18_N20
\generator|Add0~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add0~12_combout\ = (\generator|h_count\(6) & (\generator|Add0~11\ $ (GND))) # (!\generator|h_count\(6) & (!\generator|Add0~11\ & VCC))
-- \generator|Add0~13\ = CARRY((\generator|h_count\(6) & !\generator|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \generator|h_count\(6),
	datad => VCC,
	cin => \generator|Add0~11\,
	combout => \generator|Add0~12_combout\,
	cout => \generator|Add0~13\);

-- Location: LCCOMB_X40_Y18_N22
\generator|Add0~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add0~14_combout\ = (\generator|h_count\(7) & (!\generator|Add0~13\)) # (!\generator|h_count\(7) & ((\generator|Add0~13\) # (GND)))
-- \generator|Add0~15\ = CARRY((!\generator|Add0~13\) # (!\generator|h_count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \generator|h_count\(7),
	datad => VCC,
	cin => \generator|Add0~13\,
	combout => \generator|Add0~14_combout\,
	cout => \generator|Add0~15\);

-- Location: FF_X40_Y18_N23
\generator|h_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(7));

-- Location: LCCOMB_X40_Y18_N24
\generator|Add0~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add0~16_combout\ = (\generator|h_count\(8) & (\generator|Add0~15\ $ (GND))) # (!\generator|h_count\(8) & (!\generator|Add0~15\ & VCC))
-- \generator|Add0~17\ = CARRY((\generator|h_count\(8) & !\generator|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(8),
	datad => VCC,
	cin => \generator|Add0~15\,
	combout => \generator|Add0~16_combout\,
	cout => \generator|Add0~17\);

-- Location: LCCOMB_X40_Y18_N26
\generator|Add0~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add0~18_combout\ = \generator|Add0~17\ $ (\generator|h_count\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \generator|h_count\(9),
	cin => \generator|Add0~17\,
	combout => \generator|Add0~18_combout\);

-- Location: LCCOMB_X40_Y18_N0
\generator|h_count_nxt[9]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|h_count_nxt[9]~1_combout\ = (!\generator|Equal0~2_combout\ & \generator|Add0~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Equal0~2_combout\,
	datac => \generator|Add0~18_combout\,
	combout => \generator|h_count_nxt[9]~1_combout\);

-- Location: FF_X40_Y18_N1
\generator|h_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|h_count_nxt[9]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(9));

-- Location: FF_X40_Y18_N11
\generator|h_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(1));

-- Location: LCCOMB_X39_Y18_N0
\generator|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Equal0~0_combout\ = (\generator|h_count\(2) & (\generator|h_count\(9) & (\generator|h_count\(1) & !\generator|h_count\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(2),
	datab => \generator|h_count\(9),
	datac => \generator|h_count\(1),
	datad => \generator|h_count\(5),
	combout => \generator|Equal0~0_combout\);

-- Location: LCCOMB_X40_Y18_N30
\generator|Equal0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Equal0~2_combout\ = (\generator|h_count\(8) & (\generator|Equal0~1_combout\ & (\generator|Equal0~0_combout\ & !\generator|h_count\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(8),
	datab => \generator|Equal0~1_combout\,
	datac => \generator|Equal0~0_combout\,
	datad => \generator|h_count\(7),
	combout => \generator|Equal0~2_combout\);

-- Location: LCCOMB_X40_Y18_N2
\generator|h_count_nxt[5]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|h_count_nxt[5]~2_combout\ = (\generator|Add0~10_combout\ & !\generator|Equal0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \generator|Add0~10_combout\,
	datac => \generator|Equal0~2_combout\,
	combout => \generator|h_count_nxt[5]~2_combout\);

-- Location: FF_X40_Y18_N3
\generator|h_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|h_count_nxt[5]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(5));

-- Location: FF_X40_Y18_N21
\generator|h_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(6));

-- Location: LCCOMB_X40_Y18_N6
\generator|VGA_HS~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|VGA_HS~1_combout\ = (\generator|h_count\(6) & ((\generator|VGA_HS~0_combout\) # ((!\generator|h_count\(5)) # (!\generator|h_count\(4))))) # (!\generator|h_count\(6) & ((\generator|h_count\(5)) # ((!\generator|VGA_HS~0_combout\ & 
-- \generator|h_count\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|VGA_HS~0_combout\,
	datab => \generator|h_count\(4),
	datac => \generator|h_count\(6),
	datad => \generator|h_count\(5),
	combout => \generator|VGA_HS~1_combout\);

-- Location: LCCOMB_X39_Y18_N16
\generator|h_count_nxt[8]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|h_count_nxt[8]~0_combout\ = (\generator|Add0~16_combout\ & !\generator|Equal0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \generator|Add0~16_combout\,
	datac => \generator|Equal0~2_combout\,
	combout => \generator|h_count_nxt[8]~0_combout\);

-- Location: FF_X39_Y18_N17
\generator|h_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|h_count_nxt[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(8));

-- Location: LCCOMB_X36_Y18_N24
\generator|VGA_HS~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|VGA_HS~2_combout\ = (((\generator|h_count\(8)) # (!\generator|h_count\(9))) # (!\generator|h_count\(7))) # (!\generator|VGA_HS~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|VGA_HS~1_combout\,
	datab => \generator|h_count\(7),
	datac => \generator|h_count\(8),
	datad => \generator|h_count\(9),
	combout => \generator|VGA_HS~2_combout\);

-- Location: LCCOMB_X39_Y18_N20
\generator|Equal1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Equal1~0_combout\ = (!\generator|h_count\(8) & (!\generator|h_count\(3) & !\generator|h_count\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \generator|h_count\(8),
	datac => \generator|h_count\(3),
	datad => \generator|h_count\(4),
	combout => \generator|Equal1~0_combout\);

-- Location: LCCOMB_X39_Y18_N28
\generator|Equal1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Equal1~2_combout\ = (((\generator|h_count\(0)) # (!\generator|Equal0~0_combout\)) # (!\generator|Equal1~0_combout\)) # (!\generator|Equal1~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Equal1~1_combout\,
	datab => \generator|Equal1~0_combout\,
	datac => \generator|h_count\(0),
	datad => \generator|Equal0~0_combout\,
	combout => \generator|Equal1~2_combout\);

-- Location: FF_X40_Y18_N13
\generator|h_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(2));

-- Location: LCCOMB_X39_Y18_N6
\generator|process_1~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|process_1~4_combout\ = (!\generator|h_count\(5) & (\generator|Equal1~0_combout\ & ((!\generator|h_count\(1)) # (!\generator|h_count\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(5),
	datab => \generator|h_count\(2),
	datac => \generator|h_count\(1),
	datad => \generator|Equal1~0_combout\,
	combout => \generator|process_1~4_combout\);

-- Location: LCCOMB_X39_Y18_N14
\generator|v_count[8]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count[8]~0_combout\ = ((!\generator|process_1~5_combout\ & (!\generator|process_1~3_combout\ & !\generator|process_1~4_combout\))) # (!\generator|Equal1~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|process_1~5_combout\,
	datab => \generator|process_1~3_combout\,
	datac => \generator|Equal1~2_combout\,
	datad => \generator|process_1~4_combout\,
	combout => \generator|v_count[8]~0_combout\);

-- Location: LCCOMB_X39_Y18_N8
\generator|Equal1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Equal1~1_combout\ = (\generator|h_count\(6) & \generator|h_count\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \generator|h_count\(6),
	datad => \generator|h_count\(7),
	combout => \generator|Equal1~1_combout\);

-- Location: LCCOMB_X39_Y18_N10
\generator|process_1~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|process_1~5_combout\ = (((!\generator|Equal1~1_combout\ & !\generator|h_count\(8))) # (!\generator|h_count\(9))) # (!\generator|v_count\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(9),
	datab => \generator|Equal1~1_combout\,
	datac => \generator|h_count\(9),
	datad => \generator|h_count\(8),
	combout => \generator|process_1~5_combout\);

-- Location: LCCOMB_X38_Y18_N6
\generator|process_1~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|process_1~6_combout\ = (\generator|process_1~4_combout\) # ((\generator|process_1~5_combout\) # ((\generator|process_1~2_combout\ & \generator|LessThan7~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|process_1~4_combout\,
	datab => \generator|process_1~5_combout\,
	datac => \generator|process_1~2_combout\,
	datad => \generator|LessThan7~0_combout\,
	combout => \generator|process_1~6_combout\);

-- Location: LCCOMB_X38_Y18_N2
\generator|v_count[7]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count[7]~4_combout\ = (\generator|v_count[8]~0_combout\ & (\generator|Add1~14_combout\ & ((\generator|process_1~6_combout\)))) # (!\generator|v_count[8]~0_combout\ & (((\generator|v_count\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Add1~14_combout\,
	datab => \generator|v_count[8]~0_combout\,
	datac => \generator|v_count\(7),
	datad => \generator|process_1~6_combout\,
	combout => \generator|v_count[7]~4_combout\);

-- Location: FF_X38_Y18_N3
\generator|v_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(7));

-- Location: LCCOMB_X39_Y18_N26
\generator|v_count[4]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count[4]~1_combout\ = (\generator|v_count[8]~0_combout\ & (\generator|Add1~8_combout\ & (\generator|process_1~6_combout\))) # (!\generator|v_count[8]~0_combout\ & (((\generator|v_count\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Add1~8_combout\,
	datab => \generator|process_1~6_combout\,
	datac => \generator|v_count\(4),
	datad => \generator|v_count[8]~0_combout\,
	combout => \generator|v_count[4]~1_combout\);

-- Location: FF_X39_Y18_N27
\generator|v_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(4));

-- Location: LCCOMB_X38_Y18_N8
\generator|Add1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add1~0_combout\ = \generator|v_count\(0) $ (VCC)
-- \generator|Add1~1\ = CARRY(\generator|v_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \generator|v_count\(0),
	datad => VCC,
	combout => \generator|Add1~0_combout\,
	cout => \generator|Add1~1\);

-- Location: LCCOMB_X39_Y18_N30
\generator|v_count_nxt[0]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count_nxt[0]~3_combout\ = (\generator|Add1~0_combout\ & ((\generator|process_1~5_combout\) # ((\generator|process_1~3_combout\) # (\generator|process_1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|process_1~5_combout\,
	datab => \generator|process_1~3_combout\,
	datac => \generator|Add1~0_combout\,
	datad => \generator|process_1~4_combout\,
	combout => \generator|v_count_nxt[0]~3_combout\);

-- Location: FF_X39_Y18_N31
\generator|v_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count_nxt[0]~3_combout\,
	ena => \generator|v_count[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(0));

-- Location: LCCOMB_X38_Y18_N10
\generator|Add1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add1~2_combout\ = (\generator|v_count\(1) & (!\generator|Add1~1\)) # (!\generator|v_count\(1) & ((\generator|Add1~1\) # (GND)))
-- \generator|Add1~3\ = CARRY((!\generator|Add1~1\) # (!\generator|v_count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(1),
	datad => VCC,
	cin => \generator|Add1~1\,
	combout => \generator|Add1~2_combout\,
	cout => \generator|Add1~3\);

-- Location: LCCOMB_X38_Y18_N12
\generator|Add1~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add1~4_combout\ = (\generator|v_count\(2) & (\generator|Add1~3\ $ (GND))) # (!\generator|v_count\(2) & (!\generator|Add1~3\ & VCC))
-- \generator|Add1~5\ = CARRY((\generator|v_count\(2) & !\generator|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \generator|v_count\(2),
	datad => VCC,
	cin => \generator|Add1~3\,
	combout => \generator|Add1~4_combout\,
	cout => \generator|Add1~5\);

-- Location: LCCOMB_X39_Y18_N4
\generator|v_count_nxt[2]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count_nxt[2]~0_combout\ = (\generator|Add1~4_combout\ & ((\generator|process_1~5_combout\) # ((\generator|process_1~3_combout\) # (\generator|process_1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|process_1~5_combout\,
	datab => \generator|process_1~3_combout\,
	datac => \generator|Add1~4_combout\,
	datad => \generator|process_1~4_combout\,
	combout => \generator|v_count_nxt[2]~0_combout\);

-- Location: FF_X39_Y18_N5
\generator|v_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count_nxt[2]~0_combout\,
	ena => \generator|v_count[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(2));

-- Location: LCCOMB_X38_Y18_N14
\generator|Add1~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add1~6_combout\ = (\generator|v_count\(3) & (!\generator|Add1~5\)) # (!\generator|v_count\(3) & ((\generator|Add1~5\) # (GND)))
-- \generator|Add1~7\ = CARRY((!\generator|Add1~5\) # (!\generator|v_count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \generator|v_count\(3),
	datad => VCC,
	cin => \generator|Add1~5\,
	combout => \generator|Add1~6_combout\,
	cout => \generator|Add1~7\);

-- Location: LCCOMB_X38_Y18_N18
\generator|Add1~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add1~10_combout\ = (\generator|v_count\(5) & (!\generator|Add1~9\)) # (!\generator|v_count\(5) & ((\generator|Add1~9\) # (GND)))
-- \generator|Add1~11\ = CARRY((!\generator|Add1~9\) # (!\generator|v_count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(5),
	datad => VCC,
	cin => \generator|Add1~9\,
	combout => \generator|Add1~10_combout\,
	cout => \generator|Add1~11\);

-- Location: LCCOMB_X38_Y18_N30
\generator|v_count[5]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count[5]~6_combout\ = (\generator|v_count[8]~0_combout\ & (\generator|process_1~6_combout\ & ((\generator|Add1~10_combout\)))) # (!\generator|v_count[8]~0_combout\ & (((\generator|v_count\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|process_1~6_combout\,
	datab => \generator|v_count[8]~0_combout\,
	datac => \generator|v_count\(5),
	datad => \generator|Add1~10_combout\,
	combout => \generator|v_count[5]~6_combout\);

-- Location: FF_X38_Y18_N31
\generator|v_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count[5]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(5));

-- Location: LCCOMB_X38_Y18_N20
\generator|Add1~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add1~12_combout\ = (\generator|v_count\(6) & (\generator|Add1~11\ $ (GND))) # (!\generator|v_count\(6) & (!\generator|Add1~11\ & VCC))
-- \generator|Add1~13\ = CARRY((\generator|v_count\(6) & !\generator|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(6),
	datad => VCC,
	cin => \generator|Add1~11\,
	combout => \generator|Add1~12_combout\,
	cout => \generator|Add1~13\);

-- Location: LCCOMB_X38_Y18_N0
\generator|v_count[8]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count[8]~3_combout\ = (\generator|v_count[8]~0_combout\ & (\generator|process_1~6_combout\ & ((\generator|Add1~16_combout\)))) # (!\generator|v_count[8]~0_combout\ & (((\generator|v_count\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|process_1~6_combout\,
	datab => \generator|v_count[8]~0_combout\,
	datac => \generator|v_count\(8),
	datad => \generator|Add1~16_combout\,
	combout => \generator|v_count[8]~3_combout\);

-- Location: FF_X38_Y18_N1
\generator|v_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count[8]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(8));

-- Location: LCCOMB_X38_Y18_N4
\generator|process_1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|process_1~2_combout\ = (!\generator|v_count\(6) & (!\generator|v_count\(7) & (!\generator|v_count\(5) & !\generator|v_count\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(6),
	datab => \generator|v_count\(7),
	datac => \generator|v_count\(5),
	datad => \generator|v_count\(8),
	combout => \generator|process_1~2_combout\);

-- Location: LCCOMB_X39_Y18_N18
\generator|process_1~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|process_1~3_combout\ = (\generator|process_1~2_combout\ & \generator|LessThan7~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \generator|process_1~2_combout\,
	datad => \generator|LessThan7~0_combout\,
	combout => \generator|process_1~3_combout\);

-- Location: LCCOMB_X39_Y18_N24
\generator|v_count_nxt[3]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count_nxt[3]~2_combout\ = (\generator|Add1~6_combout\ & ((\generator|process_1~5_combout\) # ((\generator|process_1~3_combout\) # (\generator|process_1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|process_1~5_combout\,
	datab => \generator|process_1~3_combout\,
	datac => \generator|Add1~6_combout\,
	datad => \generator|process_1~4_combout\,
	combout => \generator|v_count_nxt[3]~2_combout\);

-- Location: FF_X39_Y18_N25
\generator|v_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count_nxt[3]~2_combout\,
	ena => \generator|v_count[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(3));

-- Location: LCCOMB_X39_Y18_N2
\generator|LessThan7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|LessThan7~0_combout\ = (!\generator|v_count\(4) & (((!\generator|v_count\(1) & !\generator|v_count\(2))) # (!\generator|v_count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(1),
	datab => \generator|v_count\(3),
	datac => \generator|v_count\(2),
	datad => \generator|v_count\(4),
	combout => \generator|LessThan7~0_combout\);

-- Location: LCCOMB_X39_Y18_N22
\generator|v_count_nxt[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count_nxt[1]~1_combout\ = (\generator|Add1~2_combout\ & ((\generator|process_1~5_combout\) # ((\generator|process_1~3_combout\) # (\generator|process_1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|process_1~5_combout\,
	datab => \generator|process_1~3_combout\,
	datac => \generator|Add1~2_combout\,
	datad => \generator|process_1~4_combout\,
	combout => \generator|v_count_nxt[1]~1_combout\);

-- Location: FF_X39_Y18_N23
\generator|v_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count_nxt[1]~1_combout\,
	ena => \generator|v_count[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(1));

-- Location: LCCOMB_X39_Y18_N12
\generator|v_count[9]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count[9]~2_combout\ = (\generator|v_count[8]~0_combout\ & (\generator|Add1~18_combout\ & (\generator|process_1~6_combout\))) # (!\generator|v_count[8]~0_combout\ & (((\generator|v_count\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Add1~18_combout\,
	datab => \generator|process_1~6_combout\,
	datac => \generator|v_count\(9),
	datad => \generator|v_count[8]~0_combout\,
	combout => \generator|v_count[9]~2_combout\);

-- Location: FF_X39_Y18_N13
\generator|v_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count[9]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(9));

-- Location: LCCOMB_X37_Y18_N0
\generator|VGA_VS~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|VGA_VS~0_combout\ = (\generator|v_count\(9)) # ((\generator|v_count\(2) & ((\generator|v_count\(0)) # (\generator|v_count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(2),
	datab => \generator|v_count\(0),
	datac => \generator|v_count\(1),
	datad => \generator|v_count\(9),
	combout => \generator|VGA_VS~0_combout\);

-- Location: LCCOMB_X38_Y18_N28
\generator|v_count[6]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count[6]~5_combout\ = (\generator|v_count[8]~0_combout\ & (\generator|process_1~6_combout\ & ((\generator|Add1~12_combout\)))) # (!\generator|v_count[8]~0_combout\ & (((\generator|v_count\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|process_1~6_combout\,
	datab => \generator|v_count[8]~0_combout\,
	datac => \generator|v_count\(6),
	datad => \generator|Add1~12_combout\,
	combout => \generator|v_count[6]~5_combout\);

-- Location: FF_X38_Y18_N29
\generator|v_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count[6]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(6));

-- Location: LCCOMB_X37_Y18_N2
\generator|VGA_VS~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|VGA_VS~1_combout\ = (((!\generator|v_count\(7)) # (!\generator|v_count\(8))) # (!\generator|v_count\(6))) # (!\generator|v_count\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(5),
	datab => \generator|v_count\(6),
	datac => \generator|v_count\(8),
	datad => \generator|v_count\(7),
	combout => \generator|VGA_VS~1_combout\);

-- Location: LCCOMB_X37_Y18_N4
\generator|VGA_VS~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|VGA_VS~2_combout\ = (\generator|LessThan7~0_combout\) # ((\generator|VGA_VS~0_combout\) # ((\generator|v_count\(4)) # (\generator|VGA_VS~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|LessThan7~0_combout\,
	datab => \generator|VGA_VS~0_combout\,
	datac => \generator|v_count\(4),
	datad => \generator|VGA_VS~1_combout\,
	combout => \generator|VGA_VS~2_combout\);

-- Location: IOIBUF_X0_Y27_N22
\SW[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: IOIBUF_X0_Y22_N15
\SW[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: IOIBUF_X0_Y25_N15
\SW[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: IOIBUF_X0_Y26_N8
\SW[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: IOIBUF_X0_Y24_N1
\SW[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: IOIBUF_X0_Y27_N1
\SW[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X0_Y25_N22
\SW[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: IOIBUF_X0_Y23_N8
\SW[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: IOIBUF_X0_Y25_N1
\SW[9]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: IOIBUF_X19_Y0_N1
\KEY[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: IOIBUF_X0_Y26_N1
\SW[8]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: IOIBUF_X0_Y23_N1
\KEY[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

-- Location: IOIBUF_X0_Y23_N15
\KEY[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);
END structure;


