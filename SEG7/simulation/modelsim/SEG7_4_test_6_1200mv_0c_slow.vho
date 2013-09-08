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

-- DATE "12/14/2012 23:49:19"

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

ENTITY 	seg7_4_test IS
    PORT (
	dp : IN std_logic;
	clk : IN std_logic;
	rst_n : IN std_logic;
	HEX0 : OUT std_logic_vector(0 TO 6);
	HEX1 : OUT std_logic_vector(0 TO 6);
	HEX2 : OUT std_logic_vector(0 TO 6);
	HEX3 : OUT std_logic_vector(0 TO 6);
	dp0 : OUT std_logic;
	dp1 : OUT std_logic;
	dp2 : OUT std_logic;
	dp3 : OUT std_logic
	);
END seg7_4_test;

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
-- HEX2[6]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[5]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[4]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[3]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[2]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[1]	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[0]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[6]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[5]	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[4]	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[3]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[2]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[1]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[0]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dp0	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dp1	=>  Location: PIN_B15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dp2	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dp3	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst_n	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dp	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF seg7_4_test IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_dp : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst_n : std_logic;
SIGNAL ww_HEX0 : std_logic_vector(0 TO 6);
SIGNAL ww_HEX1 : std_logic_vector(0 TO 6);
SIGNAL ww_HEX2 : std_logic_vector(0 TO 6);
SIGNAL ww_HEX3 : std_logic_vector(0 TO 6);
SIGNAL ww_dp0 : std_logic;
SIGNAL ww_dp1 : std_logic;
SIGNAL ww_dp2 : std_logic;
SIGNAL ww_dp3 : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \delay[2]~27_combout\ : std_logic;
SIGNAL \delay[12]~47_combout\ : std_logic;
SIGNAL \delay[19]~61_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \cnt0~4_combout\ : std_logic;
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
SIGNAL \HEX2[6]~output_o\ : std_logic;
SIGNAL \HEX2[5]~output_o\ : std_logic;
SIGNAL \HEX2[4]~output_o\ : std_logic;
SIGNAL \HEX2[3]~output_o\ : std_logic;
SIGNAL \HEX2[2]~output_o\ : std_logic;
SIGNAL \HEX2[1]~output_o\ : std_logic;
SIGNAL \HEX2[0]~output_o\ : std_logic;
SIGNAL \HEX3[6]~output_o\ : std_logic;
SIGNAL \HEX3[5]~output_o\ : std_logic;
SIGNAL \HEX3[4]~output_o\ : std_logic;
SIGNAL \HEX3[3]~output_o\ : std_logic;
SIGNAL \HEX3[2]~output_o\ : std_logic;
SIGNAL \HEX3[1]~output_o\ : std_logic;
SIGNAL \HEX3[0]~output_o\ : std_logic;
SIGNAL \dp0~output_o\ : std_logic;
SIGNAL \dp1~output_o\ : std_logic;
SIGNAL \dp2~output_o\ : std_logic;
SIGNAL \dp3~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \rst_n~input_o\ : std_logic;
SIGNAL \cnt0~3_combout\ : std_logic;
SIGNAL \delay[1]~25_combout\ : std_logic;
SIGNAL \delay[1]~26\ : std_logic;
SIGNAL \delay[2]~28\ : std_logic;
SIGNAL \delay[3]~30\ : std_logic;
SIGNAL \delay[4]~31_combout\ : std_logic;
SIGNAL \delay[4]~32\ : std_logic;
SIGNAL \delay[5]~33_combout\ : std_logic;
SIGNAL \delay[5]~34\ : std_logic;
SIGNAL \delay[6]~36\ : std_logic;
SIGNAL \delay[7]~37_combout\ : std_logic;
SIGNAL \delay[7]~38\ : std_logic;
SIGNAL \delay[8]~39_combout\ : std_logic;
SIGNAL \delay[8]~40\ : std_logic;
SIGNAL \delay[9]~41_combout\ : std_logic;
SIGNAL \delay[9]~42\ : std_logic;
SIGNAL \delay[10]~43_combout\ : std_logic;
SIGNAL \delay[10]~44\ : std_logic;
SIGNAL \delay[11]~45_combout\ : std_logic;
SIGNAL \delay[11]~46\ : std_logic;
SIGNAL \delay[12]~48\ : std_logic;
SIGNAL \delay[13]~49_combout\ : std_logic;
SIGNAL \delay[13]~50\ : std_logic;
SIGNAL \delay[14]~51_combout\ : std_logic;
SIGNAL \delay[14]~52\ : std_logic;
SIGNAL \delay[15]~54\ : std_logic;
SIGNAL \delay[16]~56\ : std_logic;
SIGNAL \delay[17]~57_combout\ : std_logic;
SIGNAL \delay[17]~58\ : std_logic;
SIGNAL \delay[18]~59_combout\ : std_logic;
SIGNAL \delay[16]~55_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \delay[15]~53_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \delay[6]~35_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \delay[0]~24_combout\ : std_logic;
SIGNAL \delay[3]~29_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \delay[18]~60\ : std_logic;
SIGNAL \delay[19]~62\ : std_logic;
SIGNAL \delay[20]~63_combout\ : std_logic;
SIGNAL \delay[20]~64\ : std_logic;
SIGNAL \delay[21]~65_combout\ : std_logic;
SIGNAL \delay[21]~66\ : std_logic;
SIGNAL \delay[22]~68\ : std_logic;
SIGNAL \delay[23]~69_combout\ : std_logic;
SIGNAL \delay[23]~70\ : std_logic;
SIGNAL \delay[24]~71_combout\ : std_logic;
SIGNAL \delay[22]~67_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \Equal0~7_combout\ : std_logic;
SIGNAL \cnt0[3]~1_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \cnt2~1_combout\ : std_logic;
SIGNAL \cnt1~1_combout\ : std_logic;
SIGNAL \cnt1[1]~feeder_combout\ : std_logic;
SIGNAL \cnt0~2_combout\ : std_logic;
SIGNAL \cnt3~0_combout\ : std_logic;
SIGNAL \cnt2~0_combout\ : std_logic;
SIGNAL \cnt1~0_combout\ : std_logic;
SIGNAL \cnt0~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp0|Mux6~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp0|Mux5~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp0|Mux4~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp0|Mux3~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp0|Mux2~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp0|Mux1~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp0|Mux0~0_combout\ : std_logic;
SIGNAL \Add0~1_combout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \cnt2~3_combout\ : std_logic;
SIGNAL \cnt1~3_combout\ : std_logic;
SIGNAL \cnt2~2_combout\ : std_logic;
SIGNAL \cnt1~2_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp1|Mux6~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp1|Mux5~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp1|Mux4~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp1|Mux3~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp1|Mux2~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp1|Mux1~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp1|Mux0~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp2|Mux6~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp2|Mux5~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp2|Mux4~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp2|Mux3~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp2|Mux2~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp2|Mux1~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp2|Mux0~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp3|Mux6~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp3|Mux5~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp3|Mux4~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp3|Mux3~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp3|Mux2~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp3|Mux1~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp3|Mux0~0_combout\ : std_logic;
SIGNAL \dp~input_o\ : std_logic;
SIGNAL \seg7_4_1|dsp0|dp_out~0_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp0|dp_out~feeder_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp0|dp_out~q\ : std_logic;
SIGNAL \seg7_4_1|dsp1|dp_out~feeder_combout\ : std_logic;
SIGNAL \seg7_4_1|dsp1|dp_out~q\ : std_logic;
SIGNAL \seg7_4_1|dsp2|dp_out~q\ : std_logic;
SIGNAL \seg7_4_1|dsp1|num_out\ : std_logic_vector(0 TO 6);
SIGNAL \seg7_4_1|dsp2|num_out\ : std_logic_vector(0 TO 6);
SIGNAL \seg7_4_1|dsp3|num_out\ : std_logic_vector(0 TO 6);
SIGNAL delay : std_logic_vector(24 DOWNTO 0);
SIGNAL cnt3 : std_logic_vector(3 DOWNTO 0);
SIGNAL cnt2 : std_logic_vector(3 DOWNTO 0);
SIGNAL cnt1 : std_logic_vector(3 DOWNTO 0);
SIGNAL cnt0 : std_logic_vector(3 DOWNTO 0);
SIGNAL \seg7_4_1|dsp0|num_out\ : std_logic_vector(0 TO 6);
SIGNAL \ALT_INV_rst_n~input_o\ : std_logic;

BEGIN

ww_dp <= dp;
ww_clk <= clk;
ww_rst_n <= rst_n;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
HEX2 <= ww_HEX2;
HEX3 <= ww_HEX3;
dp0 <= ww_dp0;
dp1 <= ww_dp1;
dp2 <= ww_dp2;
dp3 <= ww_dp3;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_rst_n~input_o\ <= NOT \rst_n~input_o\;

-- Location: FF_X32_Y28_N11
\delay[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[2]~27_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(2));

-- Location: FF_X32_Y28_N31
\delay[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[12]~47_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(12));

-- Location: FF_X32_Y27_N13
\delay[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[19]~61_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(19));

-- Location: LCCOMB_X32_Y28_N10
\delay[2]~27\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[2]~27_combout\ = (delay(2) & (!\delay[1]~26\)) # (!delay(2) & ((\delay[1]~26\) # (GND)))
-- \delay[2]~28\ = CARRY((!\delay[1]~26\) # (!delay(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => delay(2),
	datad => VCC,
	cin => \delay[1]~26\,
	combout => \delay[2]~27_combout\,
	cout => \delay[2]~28\);

-- Location: LCCOMB_X32_Y28_N30
\delay[12]~47\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[12]~47_combout\ = (delay(12) & (!\delay[11]~46\)) # (!delay(12) & ((\delay[11]~46\) # (GND)))
-- \delay[12]~48\ = CARRY((!\delay[11]~46\) # (!delay(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => delay(12),
	datad => VCC,
	cin => \delay[11]~46\,
	combout => \delay[12]~47_combout\,
	cout => \delay[12]~48\);

-- Location: LCCOMB_X32_Y27_N12
\delay[19]~61\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[19]~61_combout\ = (delay(19) & (\delay[18]~60\ $ (GND))) # (!delay(19) & (!\delay[18]~60\ & VCC))
-- \delay[19]~62\ = CARRY((delay(19) & !\delay[18]~60\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => delay(19),
	datad => VCC,
	cin => \delay[18]~60\,
	combout => \delay[19]~61_combout\,
	cout => \delay[19]~62\);

-- Location: FF_X31_Y27_N7
\cnt0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt0~4_combout\,
	ena => \cnt0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt0(3));

-- Location: LCCOMB_X32_Y28_N6
\Equal0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (((!delay(11)) # (!delay(10))) # (!delay(9))) # (!delay(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => delay(8),
	datab => delay(9),
	datac => delay(10),
	datad => delay(11),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X31_Y27_N6
\cnt0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cnt0~4_combout\ = (\rst_n~input_o\ & cnt1(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_n~input_o\,
	datad => cnt1(3),
	combout => \cnt0~4_combout\);

-- Location: IOOBUF_X26_Y29_N16
\HEX0[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp0|num_out\(6),
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
	i => \seg7_4_1|dsp0|num_out\(5),
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
	i => \seg7_4_1|dsp0|num_out\(4),
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
	i => \seg7_4_1|dsp0|num_out\(3),
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
	i => \seg7_4_1|dsp0|num_out\(2),
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
	i => \seg7_4_1|dsp0|num_out\(1),
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
	i => \seg7_4_1|dsp0|num_out\(0),
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
	i => \seg7_4_1|dsp1|num_out\(6),
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
	i => \seg7_4_1|dsp1|num_out\(5),
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
	i => \seg7_4_1|dsp1|num_out\(4),
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
	i => \seg7_4_1|dsp1|num_out\(3),
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
	i => \seg7_4_1|dsp1|num_out\(2),
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
	i => \seg7_4_1|dsp1|num_out\(1),
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
	i => \seg7_4_1|dsp1|num_out\(0),
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

-- Location: IOOBUF_X37_Y29_N2
\HEX2[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp2|num_out\(6),
	devoe => ww_devoe,
	o => \HEX2[6]~output_o\);

-- Location: IOOBUF_X30_Y29_N23
\HEX2[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp2|num_out\(5),
	devoe => ww_devoe,
	o => \HEX2[5]~output_o\);

-- Location: IOOBUF_X30_Y29_N16
\HEX2[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp2|num_out\(4),
	devoe => ww_devoe,
	o => \HEX2[4]~output_o\);

-- Location: IOOBUF_X30_Y29_N2
\HEX2[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp2|num_out\(3),
	devoe => ww_devoe,
	o => \HEX2[3]~output_o\);

-- Location: IOOBUF_X28_Y29_N2
\HEX2[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp2|num_out\(2),
	devoe => ww_devoe,
	o => \HEX2[2]~output_o\);

-- Location: IOOBUF_X30_Y29_N30
\HEX2[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp2|num_out\(1),
	devoe => ww_devoe,
	o => \HEX2[1]~output_o\);

-- Location: IOOBUF_X32_Y29_N30
\HEX2[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp2|num_out\(0),
	devoe => ww_devoe,
	o => \HEX2[0]~output_o\);

-- Location: IOOBUF_X39_Y29_N30
\HEX3[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp3|num_out\(6),
	devoe => ww_devoe,
	o => \HEX3[6]~output_o\);

-- Location: IOOBUF_X37_Y29_N30
\HEX3[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp3|num_out\(5),
	devoe => ww_devoe,
	o => \HEX3[5]~output_o\);

-- Location: IOOBUF_X37_Y29_N23
\HEX3[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp3|num_out\(4),
	devoe => ww_devoe,
	o => \HEX3[4]~output_o\);

-- Location: IOOBUF_X32_Y29_N2
\HEX3[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp3|num_out\(3),
	devoe => ww_devoe,
	o => \HEX3[3]~output_o\);

-- Location: IOOBUF_X32_Y29_N9
\HEX3[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp3|num_out\(2),
	devoe => ww_devoe,
	o => \HEX3[2]~output_o\);

-- Location: IOOBUF_X39_Y29_N16
\HEX3[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp3|num_out\(1),
	devoe => ww_devoe,
	o => \HEX3[1]~output_o\);

-- Location: IOOBUF_X32_Y29_N23
\HEX3[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp3|num_out\(0),
	devoe => ww_devoe,
	o => \HEX3[0]~output_o\);

-- Location: IOOBUF_X23_Y29_N9
\dp0~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp0|dp_out~q\,
	devoe => ww_devoe,
	o => \dp0~output_o\);

-- Location: IOOBUF_X26_Y29_N30
\dp1~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp1|dp_out~q\,
	devoe => ww_devoe,
	o => \dp1~output_o\);

-- Location: IOOBUF_X32_Y29_N16
\dp2~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \seg7_4_1|dsp2|dp_out~q\,
	devoe => ww_devoe,
	o => \dp2~output_o\);

-- Location: IOOBUF_X39_Y29_N23
\dp3~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \dp3~output_o\);

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

-- Location: LCCOMB_X31_Y27_N12
\cnt0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cnt0~3_combout\ = (cnt1(2) & \rst_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt1(2),
	datac => \rst_n~input_o\,
	combout => \cnt0~3_combout\);

-- Location: LCCOMB_X32_Y28_N8
\delay[1]~25\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[1]~25_combout\ = (delay(0) & (delay(1) $ (VCC))) # (!delay(0) & (delay(1) & VCC))
-- \delay[1]~26\ = CARRY((delay(0) & delay(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => delay(0),
	datab => delay(1),
	datad => VCC,
	combout => \delay[1]~25_combout\,
	cout => \delay[1]~26\);

-- Location: FF_X32_Y28_N9
\delay[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[1]~25_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(1));

-- Location: LCCOMB_X32_Y28_N12
\delay[3]~29\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[3]~29_combout\ = (delay(3) & (\delay[2]~28\ $ (GND))) # (!delay(3) & (!\delay[2]~28\ & VCC))
-- \delay[3]~30\ = CARRY((delay(3) & !\delay[2]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => delay(3),
	datad => VCC,
	cin => \delay[2]~28\,
	combout => \delay[3]~29_combout\,
	cout => \delay[3]~30\);

-- Location: LCCOMB_X32_Y28_N14
\delay[4]~31\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[4]~31_combout\ = (delay(4) & (!\delay[3]~30\)) # (!delay(4) & ((\delay[3]~30\) # (GND)))
-- \delay[4]~32\ = CARRY((!\delay[3]~30\) # (!delay(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => delay(4),
	datad => VCC,
	cin => \delay[3]~30\,
	combout => \delay[4]~31_combout\,
	cout => \delay[4]~32\);

-- Location: FF_X32_Y28_N15
\delay[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[4]~31_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(4));

-- Location: LCCOMB_X32_Y28_N16
\delay[5]~33\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[5]~33_combout\ = (delay(5) & (\delay[4]~32\ $ (GND))) # (!delay(5) & (!\delay[4]~32\ & VCC))
-- \delay[5]~34\ = CARRY((delay(5) & !\delay[4]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => delay(5),
	datad => VCC,
	cin => \delay[4]~32\,
	combout => \delay[5]~33_combout\,
	cout => \delay[5]~34\);

-- Location: FF_X32_Y28_N17
\delay[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[5]~33_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(5));

-- Location: LCCOMB_X32_Y28_N18
\delay[6]~35\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[6]~35_combout\ = (delay(6) & (!\delay[5]~34\)) # (!delay(6) & ((\delay[5]~34\) # (GND)))
-- \delay[6]~36\ = CARRY((!\delay[5]~34\) # (!delay(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => delay(6),
	datad => VCC,
	cin => \delay[5]~34\,
	combout => \delay[6]~35_combout\,
	cout => \delay[6]~36\);

-- Location: LCCOMB_X32_Y28_N20
\delay[7]~37\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[7]~37_combout\ = (delay(7) & (\delay[6]~36\ $ (GND))) # (!delay(7) & (!\delay[6]~36\ & VCC))
-- \delay[7]~38\ = CARRY((delay(7) & !\delay[6]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => delay(7),
	datad => VCC,
	cin => \delay[6]~36\,
	combout => \delay[7]~37_combout\,
	cout => \delay[7]~38\);

-- Location: FF_X32_Y28_N21
\delay[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[7]~37_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(7));

-- Location: LCCOMB_X32_Y28_N22
\delay[8]~39\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[8]~39_combout\ = (delay(8) & (!\delay[7]~38\)) # (!delay(8) & ((\delay[7]~38\) # (GND)))
-- \delay[8]~40\ = CARRY((!\delay[7]~38\) # (!delay(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => delay(8),
	datad => VCC,
	cin => \delay[7]~38\,
	combout => \delay[8]~39_combout\,
	cout => \delay[8]~40\);

-- Location: FF_X32_Y28_N23
\delay[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[8]~39_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(8));

-- Location: LCCOMB_X32_Y28_N24
\delay[9]~41\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[9]~41_combout\ = (delay(9) & (\delay[8]~40\ $ (GND))) # (!delay(9) & (!\delay[8]~40\ & VCC))
-- \delay[9]~42\ = CARRY((delay(9) & !\delay[8]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => delay(9),
	datad => VCC,
	cin => \delay[8]~40\,
	combout => \delay[9]~41_combout\,
	cout => \delay[9]~42\);

-- Location: FF_X32_Y28_N25
\delay[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[9]~41_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(9));

-- Location: LCCOMB_X32_Y28_N26
\delay[10]~43\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[10]~43_combout\ = (delay(10) & (!\delay[9]~42\)) # (!delay(10) & ((\delay[9]~42\) # (GND)))
-- \delay[10]~44\ = CARRY((!\delay[9]~42\) # (!delay(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => delay(10),
	datad => VCC,
	cin => \delay[9]~42\,
	combout => \delay[10]~43_combout\,
	cout => \delay[10]~44\);

-- Location: FF_X32_Y28_N27
\delay[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[10]~43_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(10));

-- Location: LCCOMB_X32_Y28_N28
\delay[11]~45\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[11]~45_combout\ = (delay(11) & (\delay[10]~44\ $ (GND))) # (!delay(11) & (!\delay[10]~44\ & VCC))
-- \delay[11]~46\ = CARRY((delay(11) & !\delay[10]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => delay(11),
	datad => VCC,
	cin => \delay[10]~44\,
	combout => \delay[11]~45_combout\,
	cout => \delay[11]~46\);

-- Location: FF_X32_Y28_N29
\delay[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[11]~45_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(11));

-- Location: LCCOMB_X32_Y27_N0
\delay[13]~49\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[13]~49_combout\ = (delay(13) & (\delay[12]~48\ $ (GND))) # (!delay(13) & (!\delay[12]~48\ & VCC))
-- \delay[13]~50\ = CARRY((delay(13) & !\delay[12]~48\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => delay(13),
	datad => VCC,
	cin => \delay[12]~48\,
	combout => \delay[13]~49_combout\,
	cout => \delay[13]~50\);

-- Location: FF_X32_Y27_N1
\delay[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[13]~49_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(13));

-- Location: LCCOMB_X32_Y27_N2
\delay[14]~51\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[14]~51_combout\ = (delay(14) & (!\delay[13]~50\)) # (!delay(14) & ((\delay[13]~50\) # (GND)))
-- \delay[14]~52\ = CARRY((!\delay[13]~50\) # (!delay(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => delay(14),
	datad => VCC,
	cin => \delay[13]~50\,
	combout => \delay[14]~51_combout\,
	cout => \delay[14]~52\);

-- Location: FF_X32_Y27_N3
\delay[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[14]~51_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(14));

-- Location: LCCOMB_X32_Y27_N4
\delay[15]~53\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[15]~53_combout\ = (delay(15) & (\delay[14]~52\ $ (GND))) # (!delay(15) & (!\delay[14]~52\ & VCC))
-- \delay[15]~54\ = CARRY((delay(15) & !\delay[14]~52\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => delay(15),
	datad => VCC,
	cin => \delay[14]~52\,
	combout => \delay[15]~53_combout\,
	cout => \delay[15]~54\);

-- Location: LCCOMB_X32_Y27_N6
\delay[16]~55\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[16]~55_combout\ = (delay(16) & (!\delay[15]~54\)) # (!delay(16) & ((\delay[15]~54\) # (GND)))
-- \delay[16]~56\ = CARRY((!\delay[15]~54\) # (!delay(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => delay(16),
	datad => VCC,
	cin => \delay[15]~54\,
	combout => \delay[16]~55_combout\,
	cout => \delay[16]~56\);

-- Location: LCCOMB_X32_Y27_N8
\delay[17]~57\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[17]~57_combout\ = (delay(17) & (\delay[16]~56\ $ (GND))) # (!delay(17) & (!\delay[16]~56\ & VCC))
-- \delay[17]~58\ = CARRY((delay(17) & !\delay[16]~56\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => delay(17),
	datad => VCC,
	cin => \delay[16]~56\,
	combout => \delay[17]~57_combout\,
	cout => \delay[17]~58\);

-- Location: FF_X32_Y27_N9
\delay[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[17]~57_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(17));

-- Location: LCCOMB_X32_Y27_N10
\delay[18]~59\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[18]~59_combout\ = (delay(18) & (!\delay[17]~58\)) # (!delay(18) & ((\delay[17]~58\) # (GND)))
-- \delay[18]~60\ = CARRY((!\delay[17]~58\) # (!delay(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => delay(18),
	datad => VCC,
	cin => \delay[17]~58\,
	combout => \delay[18]~59_combout\,
	cout => \delay[18]~60\);

-- Location: FF_X32_Y27_N11
\delay[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[18]~59_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(18));

-- Location: FF_X32_Y27_N7
\delay[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[16]~55_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(16));

-- Location: LCCOMB_X32_Y27_N24
\Equal0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (((!delay(16)) # (!delay(17))) # (!delay(18))) # (!delay(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => delay(19),
	datab => delay(18),
	datac => delay(17),
	datad => delay(16),
	combout => \Equal0~5_combout\);

-- Location: FF_X32_Y27_N5
\delay[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[15]~53_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(15));

-- Location: LCCOMB_X32_Y27_N28
\Equal0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (((!delay(15)) # (!delay(14))) # (!delay(13))) # (!delay(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => delay(12),
	datab => delay(13),
	datac => delay(14),
	datad => delay(15),
	combout => \Equal0~3_combout\);

-- Location: FF_X32_Y28_N19
\delay[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[6]~35_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(6));

-- Location: LCCOMB_X32_Y28_N4
\Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (((!delay(6)) # (!delay(4))) # (!delay(7))) # (!delay(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => delay(5),
	datab => delay(7),
	datac => delay(4),
	datad => delay(6),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X32_Y28_N0
\delay[0]~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[0]~24_combout\ = \rst_n~input_o\ $ (delay(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst_n~input_o\,
	datac => delay(0),
	combout => \delay[0]~24_combout\);

-- Location: FF_X32_Y28_N1
\delay[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[0]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(0));

-- Location: FF_X32_Y28_N13
\delay[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[3]~29_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(3));

-- Location: LCCOMB_X32_Y28_N2
\Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (((!delay(3)) # (!delay(1))) # (!delay(0))) # (!delay(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => delay(2),
	datab => delay(0),
	datac => delay(1),
	datad => delay(3),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X32_Y27_N26
\Equal0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~2_combout\) # ((\Equal0~3_combout\) # ((\Equal0~1_combout\) # (\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~2_combout\,
	datab => \Equal0~3_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X32_Y27_N14
\delay[20]~63\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[20]~63_combout\ = (delay(20) & (!\delay[19]~62\)) # (!delay(20) & ((\delay[19]~62\) # (GND)))
-- \delay[20]~64\ = CARRY((!\delay[19]~62\) # (!delay(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => delay(20),
	datad => VCC,
	cin => \delay[19]~62\,
	combout => \delay[20]~63_combout\,
	cout => \delay[20]~64\);

-- Location: FF_X32_Y27_N15
\delay[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[20]~63_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(20));

-- Location: LCCOMB_X32_Y27_N16
\delay[21]~65\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[21]~65_combout\ = (delay(21) & (\delay[20]~64\ $ (GND))) # (!delay(21) & (!\delay[20]~64\ & VCC))
-- \delay[21]~66\ = CARRY((delay(21) & !\delay[20]~64\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => delay(21),
	datad => VCC,
	cin => \delay[20]~64\,
	combout => \delay[21]~65_combout\,
	cout => \delay[21]~66\);

-- Location: FF_X32_Y27_N17
\delay[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[21]~65_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(21));

-- Location: LCCOMB_X32_Y27_N18
\delay[22]~67\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[22]~67_combout\ = (delay(22) & (!\delay[21]~66\)) # (!delay(22) & ((\delay[21]~66\) # (GND)))
-- \delay[22]~68\ = CARRY((!\delay[21]~66\) # (!delay(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => delay(22),
	datad => VCC,
	cin => \delay[21]~66\,
	combout => \delay[22]~67_combout\,
	cout => \delay[22]~68\);

-- Location: LCCOMB_X32_Y27_N20
\delay[23]~69\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[23]~69_combout\ = (delay(23) & (\delay[22]~68\ $ (GND))) # (!delay(23) & (!\delay[22]~68\ & VCC))
-- \delay[23]~70\ = CARRY((delay(23) & !\delay[22]~68\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => delay(23),
	datad => VCC,
	cin => \delay[22]~68\,
	combout => \delay[23]~69_combout\,
	cout => \delay[23]~70\);

-- Location: FF_X32_Y27_N21
\delay[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[23]~69_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(23));

-- Location: LCCOMB_X32_Y27_N22
\delay[24]~71\ : cycloneiii_lcell_comb
-- Equation(s):
-- \delay[24]~71_combout\ = \delay[23]~70\ $ (delay(24))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => delay(24),
	cin => \delay[23]~70\,
	combout => \delay[24]~71_combout\);

-- Location: FF_X32_Y27_N23
\delay[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[24]~71_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(24));

-- Location: FF_X32_Y27_N19
\delay[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay[22]~67_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => delay(22));

-- Location: LCCOMB_X33_Y27_N12
\Equal0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = (((!delay(22)) # (!delay(21))) # (!delay(23))) # (!delay(20))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => delay(20),
	datab => delay(23),
	datac => delay(21),
	datad => delay(22),
	combout => \Equal0~6_combout\);

-- Location: LCCOMB_X33_Y27_N22
\Equal0~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~7_combout\ = (\Equal0~6_combout\) # (!delay(24))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => delay(24),
	datad => \Equal0~6_combout\,
	combout => \Equal0~7_combout\);

-- Location: LCCOMB_X32_Y27_N30
\cnt0[3]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cnt0[3]~1_combout\ = ((!\Equal0~5_combout\ & (!\Equal0~4_combout\ & !\Equal0~7_combout\))) # (!\rst_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst_n~input_o\,
	datab => \Equal0~5_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~7_combout\,
	combout => \cnt0[3]~1_combout\);

-- Location: FF_X31_Y27_N13
\cnt0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt0~3_combout\,
	ena => \cnt0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt0(2));

-- Location: LCCOMB_X33_Y27_N18
\Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = cnt3(0) $ (cnt3(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt3(0),
	datac => cnt3(1),
	combout => \Add0~0_combout\);

-- Location: FF_X33_Y27_N19
\cnt3[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	ena => \cnt0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt3(1));

-- Location: LCCOMB_X33_Y27_N20
\cnt2~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cnt2~1_combout\ = (\rst_n~input_o\ & cnt3(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst_n~input_o\,
	datad => cnt3(1),
	combout => \cnt2~1_combout\);

-- Location: FF_X33_Y27_N21
\cnt2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt2~1_combout\,
	ena => \cnt0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt2(1));

-- Location: LCCOMB_X33_Y27_N28
\cnt1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cnt1~1_combout\ = (\rst_n~input_o\ & cnt2(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst_n~input_o\,
	datad => cnt2(1),
	combout => \cnt1~1_combout\);

-- Location: LCCOMB_X31_Y27_N0
\cnt1[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cnt1[1]~feeder_combout\ = \cnt1~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \cnt1~1_combout\,
	combout => \cnt1[1]~feeder_combout\);

-- Location: FF_X31_Y27_N1
\cnt1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt1[1]~feeder_combout\,
	ena => \cnt0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt1(1));

-- Location: LCCOMB_X31_Y27_N30
\cnt0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cnt0~2_combout\ = (\rst_n~input_o\ & cnt1(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_n~input_o\,
	datad => cnt1(1),
	combout => \cnt0~2_combout\);

-- Location: FF_X31_Y27_N31
\cnt0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt0~2_combout\,
	ena => \cnt0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt0(1));

-- Location: LCCOMB_X33_Y27_N30
\cnt3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cnt3~0_combout\ = (!cnt3(0) & \rst_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => cnt3(0),
	datad => \rst_n~input_o\,
	combout => \cnt3~0_combout\);

-- Location: FF_X33_Y27_N31
\cnt3[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt3~0_combout\,
	ena => \cnt0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt3(0));

-- Location: LCCOMB_X33_Y27_N14
\cnt2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cnt2~0_combout\ = (\rst_n~input_o\ & cnt3(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst_n~input_o\,
	datac => cnt3(0),
	combout => \cnt2~0_combout\);

-- Location: FF_X33_Y27_N15
\cnt2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt2~0_combout\,
	ena => \cnt0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt2(0));

-- Location: LCCOMB_X33_Y27_N24
\cnt1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cnt1~0_combout\ = (\rst_n~input_o\ & cnt2(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst_n~input_o\,
	datac => cnt2(0),
	combout => \cnt1~0_combout\);

-- Location: FF_X33_Y27_N25
\cnt1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt1~0_combout\,
	ena => \cnt0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt1(0));

-- Location: LCCOMB_X31_Y27_N4
\cnt0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cnt0~0_combout\ = (\rst_n~input_o\ & cnt1(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_n~input_o\,
	datad => cnt1(0),
	combout => \cnt0~0_combout\);

-- Location: FF_X31_Y27_N5
\cnt0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt0~0_combout\,
	ena => \cnt0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt0(0));

-- Location: LCCOMB_X30_Y27_N28
\seg7_4_1|dsp0|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp0|Mux6~0_combout\ = (cnt0(0) & (!cnt0(3) & (cnt0(2) $ (!cnt0(1))))) # (!cnt0(0) & (!cnt0(1) & (cnt0(3) $ (!cnt0(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000100001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt0(3),
	datab => cnt0(2),
	datac => cnt0(1),
	datad => cnt0(0),
	combout => \seg7_4_1|dsp0|Mux6~0_combout\);

-- Location: FF_X30_Y27_N29
\seg7_4_1|dsp0|num_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp0|Mux6~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp0|num_out\(6));

-- Location: LCCOMB_X30_Y27_N30
\seg7_4_1|dsp0|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp0|Mux5~0_combout\ = (cnt0(2) & (cnt0(0) & (cnt0(3) $ (cnt0(1))))) # (!cnt0(2) & (!cnt0(3) & ((cnt0(1)) # (cnt0(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt0(3),
	datab => cnt0(2),
	datac => cnt0(1),
	datad => cnt0(0),
	combout => \seg7_4_1|dsp0|Mux5~0_combout\);

-- Location: FF_X30_Y27_N31
\seg7_4_1|dsp0|num_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp0|Mux5~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp0|num_out\(5));

-- Location: LCCOMB_X30_Y27_N16
\seg7_4_1|dsp0|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp0|Mux4~0_combout\ = (cnt0(1) & (!cnt0(3) & ((cnt0(0))))) # (!cnt0(1) & ((cnt0(2) & (!cnt0(3))) # (!cnt0(2) & ((cnt0(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt0(3),
	datab => cnt0(2),
	datac => cnt0(1),
	datad => cnt0(0),
	combout => \seg7_4_1|dsp0|Mux4~0_combout\);

-- Location: FF_X30_Y27_N17
\seg7_4_1|dsp0|num_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp0|Mux4~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp0|num_out\(4));

-- Location: LCCOMB_X30_Y27_N22
\seg7_4_1|dsp0|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp0|Mux3~0_combout\ = (cnt0(0) & ((cnt0(2) $ (!cnt0(1))))) # (!cnt0(0) & ((cnt0(3) & (!cnt0(2) & cnt0(1))) # (!cnt0(3) & (cnt0(2) & !cnt0(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt0(3),
	datab => cnt0(2),
	datac => cnt0(1),
	datad => cnt0(0),
	combout => \seg7_4_1|dsp0|Mux3~0_combout\);

-- Location: FF_X30_Y27_N23
\seg7_4_1|dsp0|num_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp0|Mux3~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp0|num_out\(3));

-- Location: LCCOMB_X30_Y27_N0
\seg7_4_1|dsp0|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp0|Mux2~0_combout\ = (cnt0(3) & (cnt0(2) & ((cnt0(1)) # (!cnt0(0))))) # (!cnt0(3) & (!cnt0(2) & (cnt0(1) & !cnt0(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt0(3),
	datab => cnt0(2),
	datac => cnt0(1),
	datad => cnt0(0),
	combout => \seg7_4_1|dsp0|Mux2~0_combout\);

-- Location: FF_X30_Y27_N1
\seg7_4_1|dsp0|num_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp0|Mux2~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp0|num_out\(2));

-- Location: LCCOMB_X30_Y27_N26
\seg7_4_1|dsp0|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp0|Mux1~0_combout\ = (cnt0(3) & ((cnt0(0) & ((cnt0(1)))) # (!cnt0(0) & (cnt0(2))))) # (!cnt0(3) & (cnt0(2) & (cnt0(1) $ (cnt0(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt0(3),
	datab => cnt0(2),
	datac => cnt0(1),
	datad => cnt0(0),
	combout => \seg7_4_1|dsp0|Mux1~0_combout\);

-- Location: FF_X30_Y27_N27
\seg7_4_1|dsp0|num_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp0|Mux1~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp0|num_out\(1));

-- Location: LCCOMB_X30_Y27_N8
\seg7_4_1|dsp0|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp0|Mux0~0_combout\ = (cnt0(3) & (cnt0(0) & (cnt0(2) $ (cnt0(1))))) # (!cnt0(3) & (!cnt0(1) & (cnt0(2) $ (cnt0(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt0(3),
	datab => cnt0(2),
	datac => cnt0(1),
	datad => cnt0(0),
	combout => \seg7_4_1|dsp0|Mux0~0_combout\);

-- Location: FF_X30_Y27_N9
\seg7_4_1|dsp0|num_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp0|Mux0~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp0|num_out\(0));

-- Location: LCCOMB_X33_Y27_N0
\Add0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~1_combout\ = cnt3(2) $ (((cnt3(0) & cnt3(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt3(0),
	datab => cnt3(1),
	datac => cnt3(2),
	combout => \Add0~1_combout\);

-- Location: FF_X33_Y27_N1
\cnt3[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~1_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	ena => \cnt0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt3(2));

-- Location: LCCOMB_X33_Y27_N2
\Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = cnt3(3) $ (((cnt3(0) & (cnt3(1) & cnt3(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt3(0),
	datab => cnt3(1),
	datac => cnt3(3),
	datad => cnt3(2),
	combout => \Add0~2_combout\);

-- Location: FF_X33_Y27_N3
\cnt3[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add0~2_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	ena => \cnt0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt3(3));

-- Location: LCCOMB_X33_Y27_N4
\cnt2~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cnt2~3_combout\ = (\rst_n~input_o\ & cnt3(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst_n~input_o\,
	datad => cnt3(3),
	combout => \cnt2~3_combout\);

-- Location: FF_X33_Y27_N5
\cnt2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt2~3_combout\,
	ena => \cnt0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt2(3));

-- Location: LCCOMB_X33_Y27_N8
\cnt1~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cnt1~3_combout\ = (\rst_n~input_o\ & cnt2(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst_n~input_o\,
	datac => cnt2(3),
	combout => \cnt1~3_combout\);

-- Location: FF_X33_Y27_N9
\cnt1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt1~3_combout\,
	ena => \cnt0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt1(3));

-- Location: LCCOMB_X33_Y27_N10
\cnt2~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cnt2~2_combout\ = (\rst_n~input_o\ & cnt3(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst_n~input_o\,
	datad => cnt3(2),
	combout => \cnt2~2_combout\);

-- Location: FF_X33_Y27_N11
\cnt2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt2~2_combout\,
	ena => \cnt0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt2(2));

-- Location: LCCOMB_X33_Y27_N26
\cnt1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \cnt1~2_combout\ = (\rst_n~input_o\ & cnt2(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst_n~input_o\,
	datad => cnt2(2),
	combout => \cnt1~2_combout\);

-- Location: FF_X33_Y27_N27
\cnt1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt1~2_combout\,
	ena => \cnt0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt1(2));

-- Location: LCCOMB_X30_Y27_N2
\seg7_4_1|dsp1|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp1|Mux6~0_combout\ = (cnt1(0) & (!cnt1(3) & (cnt1(1) $ (!cnt1(2))))) # (!cnt1(0) & (!cnt1(1) & (cnt1(3) $ (!cnt1(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010010000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt1(0),
	datab => cnt1(3),
	datac => cnt1(1),
	datad => cnt1(2),
	combout => \seg7_4_1|dsp1|Mux6~0_combout\);

-- Location: FF_X30_Y27_N3
\seg7_4_1|dsp1|num_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp1|Mux6~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp1|num_out\(6));

-- Location: LCCOMB_X30_Y27_N12
\seg7_4_1|dsp1|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp1|Mux5~0_combout\ = (cnt1(0) & (cnt1(3) $ (((cnt1(1)) # (!cnt1(2)))))) # (!cnt1(0) & (!cnt1(3) & (cnt1(1) & !cnt1(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt1(0),
	datab => cnt1(3),
	datac => cnt1(1),
	datad => cnt1(2),
	combout => \seg7_4_1|dsp1|Mux5~0_combout\);

-- Location: FF_X30_Y27_N13
\seg7_4_1|dsp1|num_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp1|Mux5~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp1|num_out\(5));

-- Location: LCCOMB_X30_Y27_N6
\seg7_4_1|dsp1|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp1|Mux4~0_combout\ = (cnt1(1) & (cnt1(0) & (!cnt1(3)))) # (!cnt1(1) & ((cnt1(2) & ((!cnt1(3)))) # (!cnt1(2) & (cnt1(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt1(0),
	datab => cnt1(3),
	datac => cnt1(1),
	datad => cnt1(2),
	combout => \seg7_4_1|dsp1|Mux4~0_combout\);

-- Location: FF_X30_Y27_N7
\seg7_4_1|dsp1|num_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp1|Mux4~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp1|num_out\(4));

-- Location: LCCOMB_X30_Y27_N20
\seg7_4_1|dsp1|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp1|Mux3~0_combout\ = (cnt1(0) & ((cnt1(1) $ (!cnt1(2))))) # (!cnt1(0) & ((cnt1(3) & (cnt1(1) & !cnt1(2))) # (!cnt1(3) & (!cnt1(1) & cnt1(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000101001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt1(0),
	datab => cnt1(3),
	datac => cnt1(1),
	datad => cnt1(2),
	combout => \seg7_4_1|dsp1|Mux3~0_combout\);

-- Location: FF_X30_Y27_N21
\seg7_4_1|dsp1|num_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp1|Mux3~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp1|num_out\(3));

-- Location: LCCOMB_X30_Y27_N18
\seg7_4_1|dsp1|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp1|Mux2~0_combout\ = (cnt1(3) & (cnt1(2) & ((cnt1(1)) # (!cnt1(0))))) # (!cnt1(3) & (!cnt1(0) & (cnt1(1) & !cnt1(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt1(0),
	datab => cnt1(3),
	datac => cnt1(1),
	datad => cnt1(2),
	combout => \seg7_4_1|dsp1|Mux2~0_combout\);

-- Location: FF_X30_Y27_N19
\seg7_4_1|dsp1|num_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp1|Mux2~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp1|num_out\(2));

-- Location: LCCOMB_X30_Y27_N24
\seg7_4_1|dsp1|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp1|Mux1~0_combout\ = (cnt1(3) & ((cnt1(0) & (cnt1(1))) # (!cnt1(0) & ((cnt1(2)))))) # (!cnt1(3) & (cnt1(2) & (cnt1(0) $ (cnt1(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101011010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt1(0),
	datab => cnt1(3),
	datac => cnt1(1),
	datad => cnt1(2),
	combout => \seg7_4_1|dsp1|Mux1~0_combout\);

-- Location: FF_X30_Y27_N25
\seg7_4_1|dsp1|num_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp1|Mux1~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp1|num_out\(1));

-- Location: LCCOMB_X30_Y27_N10
\seg7_4_1|dsp1|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp1|Mux0~0_combout\ = (cnt1(3) & (cnt1(0) & (cnt1(1) $ (cnt1(2))))) # (!cnt1(3) & (!cnt1(1) & (cnt1(0) $ (cnt1(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt1(0),
	datab => cnt1(3),
	datac => cnt1(1),
	datad => cnt1(2),
	combout => \seg7_4_1|dsp1|Mux0~0_combout\);

-- Location: FF_X30_Y27_N11
\seg7_4_1|dsp1|num_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp1|Mux0~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp1|num_out\(0));

-- Location: LCCOMB_X33_Y28_N28
\seg7_4_1|dsp2|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp2|Mux6~0_combout\ = (cnt2(0) & (!cnt2(3) & (cnt2(1) $ (!cnt2(2))))) # (!cnt2(0) & (!cnt2(1) & (cnt2(3) $ (!cnt2(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000101000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt2(1),
	datab => cnt2(3),
	datac => cnt2(2),
	datad => cnt2(0),
	combout => \seg7_4_1|dsp2|Mux6~0_combout\);

-- Location: FF_X33_Y28_N29
\seg7_4_1|dsp2|num_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp2|Mux6~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp2|num_out\(6));

-- Location: LCCOMB_X33_Y28_N2
\seg7_4_1|dsp2|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp2|Mux5~0_combout\ = (cnt2(1) & (!cnt2(3) & ((cnt2(0)) # (!cnt2(2))))) # (!cnt2(1) & (cnt2(0) & (cnt2(3) $ (!cnt2(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt2(1),
	datab => cnt2(3),
	datac => cnt2(2),
	datad => cnt2(0),
	combout => \seg7_4_1|dsp2|Mux5~0_combout\);

-- Location: FF_X33_Y28_N3
\seg7_4_1|dsp2|num_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp2|Mux5~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp2|num_out\(5));

-- Location: LCCOMB_X33_Y28_N0
\seg7_4_1|dsp2|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp2|Mux4~0_combout\ = (cnt2(1) & (!cnt2(3) & ((cnt2(0))))) # (!cnt2(1) & ((cnt2(2) & (!cnt2(3))) # (!cnt2(2) & ((cnt2(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt2(1),
	datab => cnt2(3),
	datac => cnt2(2),
	datad => cnt2(0),
	combout => \seg7_4_1|dsp2|Mux4~0_combout\);

-- Location: FF_X33_Y28_N1
\seg7_4_1|dsp2|num_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp2|Mux4~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp2|num_out\(4));

-- Location: LCCOMB_X33_Y28_N30
\seg7_4_1|dsp2|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp2|Mux3~0_combout\ = (cnt2(0) & (cnt2(1) $ (((!cnt2(2)))))) # (!cnt2(0) & ((cnt2(1) & (cnt2(3) & !cnt2(2))) # (!cnt2(1) & (!cnt2(3) & cnt2(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt2(1),
	datab => cnt2(3),
	datac => cnt2(2),
	datad => cnt2(0),
	combout => \seg7_4_1|dsp2|Mux3~0_combout\);

-- Location: FF_X33_Y28_N31
\seg7_4_1|dsp2|num_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp2|Mux3~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp2|num_out\(3));

-- Location: LCCOMB_X33_Y28_N24
\seg7_4_1|dsp2|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp2|Mux2~0_combout\ = (cnt2(3) & (cnt2(2) & ((cnt2(1)) # (!cnt2(0))))) # (!cnt2(3) & (cnt2(1) & (!cnt2(2) & !cnt2(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt2(1),
	datab => cnt2(3),
	datac => cnt2(2),
	datad => cnt2(0),
	combout => \seg7_4_1|dsp2|Mux2~0_combout\);

-- Location: FF_X33_Y28_N25
\seg7_4_1|dsp2|num_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp2|Mux2~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp2|num_out\(2));

-- Location: LCCOMB_X33_Y28_N22
\seg7_4_1|dsp2|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp2|Mux1~0_combout\ = (cnt2(1) & ((cnt2(0) & (cnt2(3))) # (!cnt2(0) & ((cnt2(2)))))) # (!cnt2(1) & (cnt2(2) & (cnt2(3) $ (cnt2(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt2(1),
	datab => cnt2(3),
	datac => cnt2(2),
	datad => cnt2(0),
	combout => \seg7_4_1|dsp2|Mux1~0_combout\);

-- Location: FF_X33_Y28_N23
\seg7_4_1|dsp2|num_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp2|Mux1~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp2|num_out\(1));

-- Location: LCCOMB_X33_Y28_N16
\seg7_4_1|dsp2|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp2|Mux0~0_combout\ = (cnt2(3) & (cnt2(0) & (cnt2(1) $ (cnt2(2))))) # (!cnt2(3) & (!cnt2(1) & (cnt2(2) $ (cnt2(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt2(1),
	datab => cnt2(3),
	datac => cnt2(2),
	datad => cnt2(0),
	combout => \seg7_4_1|dsp2|Mux0~0_combout\);

-- Location: FF_X33_Y28_N17
\seg7_4_1|dsp2|num_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp2|Mux0~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp2|num_out\(0));

-- Location: LCCOMB_X33_Y28_N26
\seg7_4_1|dsp3|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp3|Mux6~0_combout\ = (cnt3(0) & (!cnt3(3) & (cnt3(1) $ (!cnt3(2))))) # (!cnt3(0) & (!cnt3(1) & (cnt3(3) $ (!cnt3(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt3(3),
	datab => cnt3(0),
	datac => cnt3(1),
	datad => cnt3(2),
	combout => \seg7_4_1|dsp3|Mux6~0_combout\);

-- Location: FF_X33_Y28_N27
\seg7_4_1|dsp3|num_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp3|Mux6~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp3|num_out\(6));

-- Location: LCCOMB_X33_Y27_N16
\seg7_4_1|dsp3|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp3|Mux5~0_combout\ = (cnt3(1) & (!cnt3(3) & ((cnt3(0)) # (!cnt3(2))))) # (!cnt3(1) & (cnt3(0) & (cnt3(3) $ (!cnt3(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt3(1),
	datab => cnt3(3),
	datac => cnt3(0),
	datad => cnt3(2),
	combout => \seg7_4_1|dsp3|Mux5~0_combout\);

-- Location: FF_X33_Y27_N17
\seg7_4_1|dsp3|num_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp3|Mux5~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp3|num_out\(5));

-- Location: LCCOMB_X33_Y28_N4
\seg7_4_1|dsp3|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp3|Mux4~0_combout\ = (cnt3(1) & (!cnt3(3) & (cnt3(0)))) # (!cnt3(1) & ((cnt3(2) & (!cnt3(3))) # (!cnt3(2) & ((cnt3(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt3(3),
	datab => cnt3(0),
	datac => cnt3(1),
	datad => cnt3(2),
	combout => \seg7_4_1|dsp3|Mux4~0_combout\);

-- Location: FF_X33_Y28_N5
\seg7_4_1|dsp3|num_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp3|Mux4~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp3|num_out\(4));

-- Location: LCCOMB_X33_Y28_N14
\seg7_4_1|dsp3|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp3|Mux3~0_combout\ = (cnt3(0) & ((cnt3(1) $ (!cnt3(2))))) # (!cnt3(0) & ((cnt3(3) & (cnt3(1) & !cnt3(2))) # (!cnt3(3) & (!cnt3(1) & cnt3(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000100101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt3(3),
	datab => cnt3(0),
	datac => cnt3(1),
	datad => cnt3(2),
	combout => \seg7_4_1|dsp3|Mux3~0_combout\);

-- Location: FF_X33_Y28_N15
\seg7_4_1|dsp3|num_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp3|Mux3~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp3|num_out\(3));

-- Location: LCCOMB_X33_Y28_N20
\seg7_4_1|dsp3|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp3|Mux2~0_combout\ = (cnt3(3) & (cnt3(2) & ((cnt3(1)) # (!cnt3(0))))) # (!cnt3(3) & (!cnt3(0) & (cnt3(1) & !cnt3(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt3(3),
	datab => cnt3(0),
	datac => cnt3(1),
	datad => cnt3(2),
	combout => \seg7_4_1|dsp3|Mux2~0_combout\);

-- Location: FF_X33_Y28_N21
\seg7_4_1|dsp3|num_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp3|Mux2~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp3|num_out\(2));

-- Location: LCCOMB_X33_Y28_N6
\seg7_4_1|dsp3|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp3|Mux1~0_combout\ = (cnt3(3) & ((cnt3(0) & (cnt3(1))) # (!cnt3(0) & ((cnt3(2)))))) # (!cnt3(3) & (cnt3(2) & (cnt3(0) $ (cnt3(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011011010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt3(3),
	datab => cnt3(0),
	datac => cnt3(1),
	datad => cnt3(2),
	combout => \seg7_4_1|dsp3|Mux1~0_combout\);

-- Location: FF_X33_Y28_N7
\seg7_4_1|dsp3|num_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp3|Mux1~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp3|num_out\(1));

-- Location: LCCOMB_X33_Y28_N12
\seg7_4_1|dsp3|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp3|Mux0~0_combout\ = (cnt3(3) & (cnt3(0) & (cnt3(1) $ (cnt3(2))))) # (!cnt3(3) & (!cnt3(1) & (cnt3(0) $ (cnt3(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt3(3),
	datab => cnt3(0),
	datac => cnt3(1),
	datad => cnt3(2),
	combout => \seg7_4_1|dsp3|Mux0~0_combout\);

-- Location: FF_X33_Y28_N13
\seg7_4_1|dsp3|num_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp3|Mux0~0_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp3|num_out\(0));

-- Location: IOIBUF_X0_Y24_N1
\dp~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dp,
	o => \dp~input_o\);

-- Location: LCCOMB_X33_Y28_N18
\seg7_4_1|dsp0|dp_out~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp0|dp_out~0_combout\ = (\rst_n~input_o\ & !\dp~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_n~input_o\,
	datad => \dp~input_o\,
	combout => \seg7_4_1|dsp0|dp_out~0_combout\);

-- Location: LCCOMB_X33_Y28_N10
\seg7_4_1|dsp0|dp_out~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp0|dp_out~feeder_combout\ = \seg7_4_1|dsp0|dp_out~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \seg7_4_1|dsp0|dp_out~0_combout\,
	combout => \seg7_4_1|dsp0|dp_out~feeder_combout\);

-- Location: FF_X33_Y28_N11
\seg7_4_1|dsp0|dp_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp0|dp_out~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp0|dp_out~q\);

-- Location: LCCOMB_X33_Y28_N8
\seg7_4_1|dsp1|dp_out~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \seg7_4_1|dsp1|dp_out~feeder_combout\ = \seg7_4_1|dsp0|dp_out~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \seg7_4_1|dsp0|dp_out~0_combout\,
	combout => \seg7_4_1|dsp1|dp_out~feeder_combout\);

-- Location: FF_X33_Y28_N9
\seg7_4_1|dsp1|dp_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp1|dp_out~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp1|dp_out~q\);

-- Location: FF_X33_Y28_N19
\seg7_4_1|dsp2|dp_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \seg7_4_1|dsp0|dp_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg7_4_1|dsp2|dp_out~q\);

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

ww_HEX2(6) <= \HEX2[6]~output_o\;

ww_HEX2(5) <= \HEX2[5]~output_o\;

ww_HEX2(4) <= \HEX2[4]~output_o\;

ww_HEX2(3) <= \HEX2[3]~output_o\;

ww_HEX2(2) <= \HEX2[2]~output_o\;

ww_HEX2(1) <= \HEX2[1]~output_o\;

ww_HEX2(0) <= \HEX2[0]~output_o\;

ww_HEX3(6) <= \HEX3[6]~output_o\;

ww_HEX3(5) <= \HEX3[5]~output_o\;

ww_HEX3(4) <= \HEX3[4]~output_o\;

ww_HEX3(3) <= \HEX3[3]~output_o\;

ww_HEX3(2) <= \HEX3[2]~output_o\;

ww_HEX3(1) <= \HEX3[1]~output_o\;

ww_HEX3(0) <= \HEX3[0]~output_o\;

ww_dp0 <= \dp0~output_o\;

ww_dp1 <= \dp1~output_o\;

ww_dp2 <= \dp2~output_o\;

ww_dp3 <= \dp3~output_o\;
END structure;


