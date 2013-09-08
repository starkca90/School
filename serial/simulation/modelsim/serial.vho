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

-- DATE "12/04/2012 17:05:51"

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

ENTITY 	serial IS
    PORT (
	A : IN std_logic_vector(7 DOWNTO 0);
	B : IN std_logic_vector(7 DOWNTO 0);
	start : IN std_logic;
	resetn : IN std_logic;
	clock : IN std_logic;
	sum : OUT std_logic_vector(8 DOWNTO 0)
	);
END serial;

-- Design Ports Information
-- sum[0]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[1]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[2]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[3]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[4]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[5]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[6]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[7]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sum[8]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resetn	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[0]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[0]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[1]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[1]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[2]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[2]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[3]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[3]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[4]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[4]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[5]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[5]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[6]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[6]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[7]	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[7]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF serial IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_start : std_logic;
SIGNAL ww_resetn : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_sum : std_logic_vector(8 DOWNTO 0);
SIGNAL \resetn~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reg_B|q~0_combout\ : std_logic;
SIGNAL \my_control|counter~4_combout\ : std_logic;
SIGNAL \reg_B|q~1_combout\ : std_logic;
SIGNAL \reg_A|q~2_combout\ : std_logic;
SIGNAL \reg_B|q~2_combout\ : std_logic;
SIGNAL \reg_A|q~3_combout\ : std_logic;
SIGNAL \reg_B|q~3_combout\ : std_logic;
SIGNAL \reg_A|q~4_combout\ : std_logic;
SIGNAL \reg_B|q~4_combout\ : std_logic;
SIGNAL \reg_A|q~5_combout\ : std_logic;
SIGNAL \reg_B|q~5_combout\ : std_logic;
SIGNAL \reg_A|q~6_combout\ : std_logic;
SIGNAL \reg_B|q~6_combout\ : std_logic;
SIGNAL \reg_A|q~7_combout\ : std_logic;
SIGNAL \reg_B|q~7_combout\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \A[4]~input_o\ : std_logic;
SIGNAL \B[4]~input_o\ : std_logic;
SIGNAL \A[5]~input_o\ : std_logic;
SIGNAL \B[5]~input_o\ : std_logic;
SIGNAL \A[6]~input_o\ : std_logic;
SIGNAL \B[6]~input_o\ : std_logic;
SIGNAL \A[7]~input_o\ : std_logic;
SIGNAL \B[7]~input_o\ : std_logic;
SIGNAL \sum[0]~output_o\ : std_logic;
SIGNAL \sum[1]~output_o\ : std_logic;
SIGNAL \sum[2]~output_o\ : std_logic;
SIGNAL \sum[3]~output_o\ : std_logic;
SIGNAL \sum[4]~output_o\ : std_logic;
SIGNAL \sum[5]~output_o\ : std_logic;
SIGNAL \sum[6]~output_o\ : std_logic;
SIGNAL \sum[7]~output_o\ : std_logic;
SIGNAL \sum[8]~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \my_control|Mux1~0_combout\ : std_logic;
SIGNAL \resetn~input_o\ : std_logic;
SIGNAL \resetn~inputclkctrl_outclk\ : std_logic;
SIGNAL \my_control|counter~2_combout\ : std_logic;
SIGNAL \my_control|Equal1~0_combout\ : std_logic;
SIGNAL \my_control|counter~3_combout\ : std_logic;
SIGNAL \my_control|Add0~0_combout\ : std_logic;
SIGNAL \my_control|counter~5_combout\ : std_logic;
SIGNAL \my_control|Mux0~0_combout\ : std_logic;
SIGNAL \my_control|Mux0~1_combout\ : std_logic;
SIGNAL \reg_sum|q~1_combout\ : std_logic;
SIGNAL \my_control|enable~0_combout\ : std_logic;
SIGNAL \reg_sum|q~0_combout\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \my_control|reset~combout\ : std_logic;
SIGNAL \reg_A|q~1_combout\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \reg_A|q~0_combout\ : std_logic;
SIGNAL \cin~0_combout\ : std_logic;
SIGNAL \cin~q\ : std_logic;
SIGNAL \reg_sum|q~8_combout\ : std_logic;
SIGNAL \reg_sum|q~7_combout\ : std_logic;
SIGNAL \reg_sum|q~6_combout\ : std_logic;
SIGNAL \reg_sum|q~5_combout\ : std_logic;
SIGNAL \reg_sum|q~4_combout\ : std_logic;
SIGNAL \reg_sum|q~3_combout\ : std_logic;
SIGNAL \reg_sum|q~2_combout\ : std_logic;
SIGNAL \reg_B|q\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \my_control|current_state\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \my_control|counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reg_A|q\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \reg_sum|q\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \my_control|ALT_INV_current_state\ : std_logic_vector(1 DOWNTO 1);

BEGIN

ww_A <= A;
ww_B <= B;
ww_start <= start;
ww_resetn <= resetn;
ww_clock <= clock;
sum <= ww_sum;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\resetn~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \resetn~input_o\);

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);
\my_control|ALT_INV_current_state\(1) <= NOT \my_control|current_state\(1);

-- Location: FF_X30_Y27_N11
\reg_B|q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_B|q~0_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_B|q\(0));

-- Location: FF_X31_Y27_N27
\my_control|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \my_control|counter~4_combout\,
	clrn => \resetn~inputclkctrl_outclk\,
	ena => \my_control|ALT_INV_current_state\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_control|counter\(1));

-- Location: FF_X30_Y27_N3
\reg_B|q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_B|q~1_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_B|q\(1));

-- Location: LCCOMB_X30_Y27_N10
\reg_B|q~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_B|q~0_combout\ = (\my_control|reset~combout\ & ((\B[0]~input_o\))) # (!\my_control|reset~combout\ & (\reg_B|q\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reg_B|q\(1),
	datac => \B[0]~input_o\,
	datad => \my_control|reset~combout\,
	combout => \reg_B|q~0_combout\);

-- Location: LCCOMB_X31_Y27_N26
\my_control|counter~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \my_control|counter~4_combout\ = (\my_control|current_state\(0) & ((\my_control|counter\(1) $ (\my_control|counter\(0))))) # (!\my_control|current_state\(0) & (\my_control|current_state\(1) & (\my_control|counter\(1) $ (\my_control|counter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_control|current_state\(0),
	datab => \my_control|current_state\(1),
	datac => \my_control|counter\(1),
	datad => \my_control|counter\(0),
	combout => \my_control|counter~4_combout\);

-- Location: FF_X30_Y27_N13
\reg_A|q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_A|q~2_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_A|q\(2));

-- Location: FF_X30_Y27_N15
\reg_B|q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_B|q~2_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_B|q\(2));

-- Location: LCCOMB_X30_Y27_N2
\reg_B|q~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_B|q~1_combout\ = (\my_control|reset~combout\ & ((\B[1]~input_o\))) # (!\my_control|reset~combout\ & (\reg_B|q\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reg_B|q\(2),
	datac => \B[1]~input_o\,
	datad => \my_control|reset~combout\,
	combout => \reg_B|q~1_combout\);

-- Location: FF_X30_Y27_N29
\reg_A|q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_A|q~3_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_A|q\(3));

-- Location: LCCOMB_X30_Y27_N12
\reg_A|q~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_A|q~2_combout\ = (\my_control|reset~combout\ & (\A[2]~input_o\)) # (!\my_control|reset~combout\ & ((\reg_A|q\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[2]~input_o\,
	datab => \reg_A|q\(3),
	datad => \my_control|reset~combout\,
	combout => \reg_A|q~2_combout\);

-- Location: FF_X30_Y27_N27
\reg_B|q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_B|q~3_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_B|q\(3));

-- Location: LCCOMB_X30_Y27_N14
\reg_B|q~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_B|q~2_combout\ = (\my_control|reset~combout\ & (\B[2]~input_o\)) # (!\my_control|reset~combout\ & ((\reg_B|q\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[2]~input_o\,
	datac => \reg_B|q\(3),
	datad => \my_control|reset~combout\,
	combout => \reg_B|q~2_combout\);

-- Location: FF_X30_Y27_N21
\reg_A|q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_A|q~4_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_A|q\(4));

-- Location: LCCOMB_X30_Y27_N28
\reg_A|q~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_A|q~3_combout\ = (\my_control|reset~combout\ & ((\A[3]~input_o\))) # (!\my_control|reset~combout\ & (\reg_A|q\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reg_A|q\(4),
	datac => \A[3]~input_o\,
	datad => \my_control|reset~combout\,
	combout => \reg_A|q~3_combout\);

-- Location: FF_X30_Y27_N19
\reg_B|q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_B|q~4_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_B|q\(4));

-- Location: LCCOMB_X30_Y27_N26
\reg_B|q~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_B|q~3_combout\ = (\my_control|reset~combout\ & ((\B[3]~input_o\))) # (!\my_control|reset~combout\ & (\reg_B|q\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reg_B|q\(4),
	datac => \B[3]~input_o\,
	datad => \my_control|reset~combout\,
	combout => \reg_B|q~3_combout\);

-- Location: FF_X30_Y27_N5
\reg_A|q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_A|q~5_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_A|q\(5));

-- Location: LCCOMB_X30_Y27_N20
\reg_A|q~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_A|q~4_combout\ = (\my_control|reset~combout\ & (\A[4]~input_o\)) # (!\my_control|reset~combout\ & ((\reg_A|q\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A[4]~input_o\,
	datac => \reg_A|q\(5),
	datad => \my_control|reset~combout\,
	combout => \reg_A|q~4_combout\);

-- Location: FF_X30_Y27_N7
\reg_B|q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_B|q~5_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_B|q\(5));

-- Location: LCCOMB_X30_Y27_N18
\reg_B|q~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_B|q~4_combout\ = (\my_control|reset~combout\ & ((\B[4]~input_o\))) # (!\my_control|reset~combout\ & (\reg_B|q\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_B|q\(5),
	datac => \B[4]~input_o\,
	datad => \my_control|reset~combout\,
	combout => \reg_B|q~4_combout\);

-- Location: FF_X30_Y27_N17
\reg_A|q[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_A|q~6_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_A|q\(6));

-- Location: LCCOMB_X30_Y27_N4
\reg_A|q~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_A|q~5_combout\ = (\my_control|reset~combout\ & ((\A[5]~input_o\))) # (!\my_control|reset~combout\ & (\reg_A|q\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reg_A|q\(6),
	datac => \A[5]~input_o\,
	datad => \my_control|reset~combout\,
	combout => \reg_A|q~5_combout\);

-- Location: FF_X30_Y27_N31
\reg_B|q[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_B|q~6_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_B|q\(6));

-- Location: LCCOMB_X30_Y27_N6
\reg_B|q~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_B|q~5_combout\ = (\my_control|reset~combout\ & (\B[5]~input_o\)) # (!\my_control|reset~combout\ & ((\reg_B|q\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[5]~input_o\,
	datac => \reg_B|q\(6),
	datad => \my_control|reset~combout\,
	combout => \reg_B|q~5_combout\);

-- Location: FF_X32_Y27_N25
\reg_A|q[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_A|q~7_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_A|q\(7));

-- Location: LCCOMB_X30_Y27_N16
\reg_A|q~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_A|q~6_combout\ = (\my_control|reset~combout\ & (\A[6]~input_o\)) # (!\my_control|reset~combout\ & ((\reg_A|q\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[6]~input_o\,
	datac => \reg_A|q\(7),
	datad => \my_control|reset~combout\,
	combout => \reg_A|q~6_combout\);

-- Location: FF_X32_Y27_N7
\reg_B|q[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_B|q~7_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_B|q\(7));

-- Location: LCCOMB_X30_Y27_N30
\reg_B|q~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_B|q~6_combout\ = (\my_control|reset~combout\ & ((\B[6]~input_o\))) # (!\my_control|reset~combout\ & (\reg_B|q\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_B|q\(7),
	datac => \B[6]~input_o\,
	datad => \my_control|reset~combout\,
	combout => \reg_B|q~6_combout\);

-- Location: LCCOMB_X32_Y27_N24
\reg_A|q~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_A|q~7_combout\ = (\start~input_o\ & (!\my_control|current_state\(1) & (\A[7]~input_o\ & !\my_control|current_state\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datab => \my_control|current_state\(1),
	datac => \A[7]~input_o\,
	datad => \my_control|current_state\(0),
	combout => \reg_A|q~7_combout\);

-- Location: LCCOMB_X32_Y27_N6
\reg_B|q~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_B|q~7_combout\ = (\start~input_o\ & (!\my_control|current_state\(1) & (\B[7]~input_o\ & !\my_control|current_state\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datab => \my_control|current_state\(1),
	datac => \B[7]~input_o\,
	datad => \my_control|current_state\(0),
	combout => \reg_B|q~7_combout\);

-- Location: IOIBUF_X14_Y31_N1
\B[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(0),
	o => \B[0]~input_o\);

-- Location: IOIBUF_X24_Y31_N8
\B[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(1),
	o => \B[1]~input_o\);

-- Location: IOIBUF_X20_Y31_N8
\A[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

-- Location: IOIBUF_X33_Y22_N1
\B[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

-- Location: IOIBUF_X29_Y31_N8
\A[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

-- Location: IOIBUF_X22_Y31_N8
\B[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

-- Location: IOIBUF_X22_Y31_N1
\A[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(4),
	o => \A[4]~input_o\);

-- Location: IOIBUF_X29_Y31_N1
\B[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(4),
	o => \B[4]~input_o\);

-- Location: IOIBUF_X16_Y31_N1
\A[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(5),
	o => \A[5]~input_o\);

-- Location: IOIBUF_X16_Y31_N8
\B[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(5),
	o => \B[5]~input_o\);

-- Location: IOIBUF_X20_Y31_N1
\A[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(6),
	o => \A[6]~input_o\);

-- Location: IOIBUF_X26_Y31_N1
\B[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(6),
	o => \B[6]~input_o\);

-- Location: IOIBUF_X33_Y15_N1
\A[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(7),
	o => \A[7]~input_o\);

-- Location: IOIBUF_X33_Y27_N1
\B[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(7),
	o => \B[7]~input_o\);

-- Location: IOOBUF_X33_Y28_N9
\sum[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg_sum|q\(0),
	devoe => ww_devoe,
	o => \sum[0]~output_o\);

-- Location: IOOBUF_X33_Y24_N2
\sum[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg_sum|q\(1),
	devoe => ww_devoe,
	o => \sum[1]~output_o\);

-- Location: IOOBUF_X33_Y28_N2
\sum[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg_sum|q\(2),
	devoe => ww_devoe,
	o => \sum[2]~output_o\);

-- Location: IOOBUF_X31_Y31_N9
\sum[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg_sum|q\(3),
	devoe => ww_devoe,
	o => \sum[3]~output_o\);

-- Location: IOOBUF_X31_Y31_N2
\sum[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg_sum|q\(4),
	devoe => ww_devoe,
	o => \sum[4]~output_o\);

-- Location: IOOBUF_X33_Y25_N2
\sum[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg_sum|q\(5),
	devoe => ww_devoe,
	o => \sum[5]~output_o\);

-- Location: IOOBUF_X33_Y24_N9
\sum[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg_sum|q\(6),
	devoe => ww_devoe,
	o => \sum[6]~output_o\);

-- Location: IOOBUF_X33_Y25_N9
\sum[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg_sum|q\(7),
	devoe => ww_devoe,
	o => \sum[7]~output_o\);

-- Location: IOOBUF_X24_Y31_N2
\sum[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg_sum|q\(8),
	devoe => ww_devoe,
	o => \sum[8]~output_o\);

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

-- Location: IOIBUF_X33_Y27_N8
\start~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: LCCOMB_X31_Y27_N30
\my_control|Mux1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \my_control|Mux1~0_combout\ = (\start~input_o\) # ((!\my_control|current_state\(1) & \my_control|current_state\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_control|current_state\(1),
	datac => \my_control|current_state\(0),
	datad => \start~input_o\,
	combout => \my_control|Mux1~0_combout\);

-- Location: IOIBUF_X16_Y0_N22
\resetn~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_resetn,
	o => \resetn~input_o\);

-- Location: CLKCTRL_G19
\resetn~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \resetn~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \resetn~inputclkctrl_outclk\);

-- Location: FF_X31_Y27_N31
\my_control|current_state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \my_control|Mux1~0_combout\,
	clrn => \resetn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_control|current_state\(0));

-- Location: LCCOMB_X31_Y27_N14
\my_control|counter~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \my_control|counter~2_combout\ = (!\my_control|counter\(0) & ((\my_control|current_state\(0)) # (\my_control|current_state\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \my_control|current_state\(0),
	datac => \my_control|counter\(0),
	datad => \my_control|current_state\(1),
	combout => \my_control|counter~2_combout\);

-- Location: FF_X31_Y27_N15
\my_control|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \my_control|counter~2_combout\,
	clrn => \resetn~inputclkctrl_outclk\,
	ena => \my_control|ALT_INV_current_state\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_control|counter\(0));

-- Location: LCCOMB_X31_Y27_N2
\my_control|Equal1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \my_control|Equal1~0_combout\ = (\my_control|current_state\(0)) # (\my_control|current_state\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \my_control|current_state\(0),
	datad => \my_control|current_state\(1),
	combout => \my_control|Equal1~0_combout\);

-- Location: LCCOMB_X31_Y27_N4
\my_control|counter~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \my_control|counter~3_combout\ = (\my_control|Equal1~0_combout\ & (\my_control|counter\(2) $ (((\my_control|counter\(1) & \my_control|counter\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_control|counter\(1),
	datab => \my_control|counter\(0),
	datac => \my_control|counter\(2),
	datad => \my_control|Equal1~0_combout\,
	combout => \my_control|counter~3_combout\);

-- Location: FF_X31_Y27_N5
\my_control|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \my_control|counter~3_combout\,
	clrn => \resetn~inputclkctrl_outclk\,
	ena => \my_control|ALT_INV_current_state\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_control|counter\(2));

-- Location: LCCOMB_X31_Y27_N12
\my_control|Add0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \my_control|Add0~0_combout\ = \my_control|counter\(3) $ (((\my_control|counter\(1) & (\my_control|counter\(2) & \my_control|counter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_control|counter\(1),
	datab => \my_control|counter\(2),
	datac => \my_control|counter\(0),
	datad => \my_control|counter\(3),
	combout => \my_control|Add0~0_combout\);

-- Location: LCCOMB_X31_Y27_N0
\my_control|counter~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \my_control|counter~5_combout\ = (\my_control|Add0~0_combout\ & ((\my_control|current_state\(0)) # (\my_control|current_state\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \my_control|current_state\(0),
	datac => \my_control|current_state\(1),
	datad => \my_control|Add0~0_combout\,
	combout => \my_control|counter~5_combout\);

-- Location: FF_X31_Y27_N1
\my_control|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \my_control|counter~5_combout\,
	clrn => \resetn~inputclkctrl_outclk\,
	ena => \my_control|ALT_INV_current_state\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_control|counter\(3));

-- Location: LCCOMB_X31_Y27_N16
\my_control|Mux0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \my_control|Mux0~0_combout\ = (!\my_control|counter\(1) & (!\my_control|counter\(2) & (!\my_control|counter\(0) & \my_control|counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_control|counter\(1),
	datab => \my_control|counter\(2),
	datac => \my_control|counter\(0),
	datad => \my_control|counter\(3),
	combout => \my_control|Mux0~0_combout\);

-- Location: LCCOMB_X31_Y27_N28
\my_control|Mux0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \my_control|Mux0~1_combout\ = (\my_control|current_state\(0) & ((\my_control|current_state\(1) & (\start~input_o\)) # (!\my_control|current_state\(1) & ((\my_control|Mux0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_control|current_state\(0),
	datab => \start~input_o\,
	datac => \my_control|current_state\(1),
	datad => \my_control|Mux0~0_combout\,
	combout => \my_control|Mux0~1_combout\);

-- Location: FF_X31_Y27_N29
\my_control|current_state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \my_control|Mux0~1_combout\,
	clrn => \resetn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \my_control|current_state\(1));

-- Location: LCCOMB_X32_Y27_N10
\reg_sum|q~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_sum|q~1_combout\ = (\reg_sum|q\(2) & ((\my_control|current_state\(1)) # ((\my_control|current_state\(0)) # (!\start~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_sum|q\(2),
	datab => \my_control|current_state\(1),
	datac => \start~input_o\,
	datad => \my_control|current_state\(0),
	combout => \reg_sum|q~1_combout\);

-- Location: LCCOMB_X31_Y27_N24
\my_control|enable~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \my_control|enable~0_combout\ = (!\my_control|current_state\(1) & ((\start~input_o\) # (\my_control|current_state\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \start~input_o\,
	datac => \my_control|current_state\(0),
	datad => \my_control|current_state\(1),
	combout => \my_control|enable~0_combout\);

-- Location: FF_X32_Y27_N11
\reg_sum|q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_sum|q~1_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_sum|q\(1));

-- Location: LCCOMB_X32_Y27_N0
\reg_sum|q~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_sum|q~0_combout\ = (\reg_sum|q\(1) & (((\my_control|current_state\(1)) # (\my_control|current_state\(0))) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datab => \my_control|current_state\(1),
	datac => \reg_sum|q\(1),
	datad => \my_control|current_state\(0),
	combout => \reg_sum|q~0_combout\);

-- Location: FF_X32_Y27_N1
\reg_sum|q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_sum|q~0_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_sum|q\(0));

-- Location: IOIBUF_X33_Y22_N8
\A[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

-- Location: LCCOMB_X31_Y27_N18
\my_control|reset\ : cycloneiv_lcell_comb
-- Equation(s):
-- \my_control|reset~combout\ = (!\my_control|current_state\(0) & (\start~input_o\ & !\my_control|current_state\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \my_control|current_state\(0),
	datab => \start~input_o\,
	datac => \my_control|current_state\(1),
	combout => \my_control|reset~combout\);

-- Location: LCCOMB_X30_Y27_N24
\reg_A|q~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_A|q~1_combout\ = (\my_control|reset~combout\ & ((\A[1]~input_o\))) # (!\my_control|reset~combout\ & (\reg_A|q\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_A|q\(2),
	datac => \A[1]~input_o\,
	datad => \my_control|reset~combout\,
	combout => \reg_A|q~1_combout\);

-- Location: FF_X30_Y27_N25
\reg_A|q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_A|q~1_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_A|q\(1));

-- Location: IOIBUF_X26_Y31_N8
\A[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

-- Location: LCCOMB_X30_Y27_N0
\reg_A|q~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_A|q~0_combout\ = (\my_control|reset~combout\ & ((\A[0]~input_o\))) # (!\my_control|reset~combout\ & (\reg_A|q\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reg_A|q\(1),
	datac => \A[0]~input_o\,
	datad => \my_control|reset~combout\,
	combout => \reg_A|q~0_combout\);

-- Location: FF_X30_Y27_N1
\reg_A|q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_A|q~0_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_A|q\(0));

-- Location: LCCOMB_X30_Y27_N22
\cin~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \cin~0_combout\ = (!\my_control|reset~combout\ & ((\reg_B|q\(0) & ((\reg_A|q\(0)) # (\cin~q\))) # (!\reg_B|q\(0) & (\reg_A|q\(0) & \cin~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_B|q\(0),
	datab => \reg_A|q\(0),
	datac => \cin~q\,
	datad => \my_control|reset~combout\,
	combout => \cin~0_combout\);

-- Location: FF_X30_Y27_N23
cin : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \cin~0_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cin~q\);

-- Location: LCCOMB_X30_Y27_N8
\reg_sum|q~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_sum|q~8_combout\ = (!\my_control|reset~combout\ & (\reg_B|q\(0) $ (\reg_A|q\(0) $ (\cin~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_B|q\(0),
	datab => \reg_A|q\(0),
	datac => \cin~q\,
	datad => \my_control|reset~combout\,
	combout => \reg_sum|q~8_combout\);

-- Location: FF_X30_Y27_N9
\reg_sum|q[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_sum|q~8_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_sum|q\(8));

-- Location: LCCOMB_X32_Y27_N22
\reg_sum|q~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_sum|q~7_combout\ = (\reg_sum|q\(8) & (((\my_control|current_state\(1)) # (\my_control|current_state\(0))) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datab => \my_control|current_state\(1),
	datac => \reg_sum|q\(8),
	datad => \my_control|current_state\(0),
	combout => \reg_sum|q~7_combout\);

-- Location: FF_X32_Y27_N23
\reg_sum|q[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_sum|q~7_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_sum|q\(7));

-- Location: LCCOMB_X32_Y27_N8
\reg_sum|q~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_sum|q~6_combout\ = (\reg_sum|q\(7) & (((\my_control|current_state\(1)) # (\my_control|current_state\(0))) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datab => \my_control|current_state\(1),
	datac => \reg_sum|q\(7),
	datad => \my_control|current_state\(0),
	combout => \reg_sum|q~6_combout\);

-- Location: FF_X32_Y27_N9
\reg_sum|q[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_sum|q~6_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_sum|q\(6));

-- Location: LCCOMB_X32_Y27_N26
\reg_sum|q~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_sum|q~5_combout\ = (\reg_sum|q\(6) & (((\my_control|current_state\(1)) # (\my_control|current_state\(0))) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datab => \my_control|current_state\(1),
	datac => \reg_sum|q\(6),
	datad => \my_control|current_state\(0),
	combout => \reg_sum|q~5_combout\);

-- Location: FF_X32_Y27_N27
\reg_sum|q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_sum|q~5_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_sum|q\(5));

-- Location: LCCOMB_X32_Y27_N4
\reg_sum|q~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_sum|q~4_combout\ = (\reg_sum|q\(5) & (((\my_control|current_state\(1)) # (\my_control|current_state\(0))) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datab => \my_control|current_state\(1),
	datac => \reg_sum|q\(5),
	datad => \my_control|current_state\(0),
	combout => \reg_sum|q~4_combout\);

-- Location: FF_X32_Y27_N5
\reg_sum|q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_sum|q~4_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_sum|q\(4));

-- Location: LCCOMB_X32_Y27_N30
\reg_sum|q~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_sum|q~3_combout\ = (\reg_sum|q\(4) & (((\my_control|current_state\(1)) # (\my_control|current_state\(0))) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datab => \my_control|current_state\(1),
	datac => \reg_sum|q\(4),
	datad => \my_control|current_state\(0),
	combout => \reg_sum|q~3_combout\);

-- Location: FF_X32_Y27_N31
\reg_sum|q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_sum|q~3_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_sum|q\(3));

-- Location: LCCOMB_X32_Y27_N12
\reg_sum|q~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg_sum|q~2_combout\ = (\reg_sum|q\(3) & (((\my_control|current_state\(1)) # (\my_control|current_state\(0))) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datab => \my_control|current_state\(1),
	datac => \reg_sum|q\(3),
	datad => \my_control|current_state\(0),
	combout => \reg_sum|q~2_combout\);

-- Location: FF_X32_Y27_N13
\reg_sum|q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_sum|q~2_combout\,
	ena => \my_control|enable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg_sum|q\(2));

ww_sum(0) <= \sum[0]~output_o\;

ww_sum(1) <= \sum[1]~output_o\;

ww_sum(2) <= \sum[2]~output_o\;

ww_sum(3) <= \sum[3]~output_o\;

ww_sum(4) <= \sum[4]~output_o\;

ww_sum(5) <= \sum[5]~output_o\;

ww_sum(6) <= \sum[6]~output_o\;

ww_sum(7) <= \sum[7]~output_o\;

ww_sum(8) <= \sum[8]~output_o\;
END structure;


