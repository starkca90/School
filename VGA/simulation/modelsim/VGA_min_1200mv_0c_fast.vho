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

-- DATE "01/10/2013 12:01:48"

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
-- CLOCK_50	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_G3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \generator|clkdiv_inst|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \generator|clkdiv_inst|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \debounce2|data_out~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \debounce1|data_out~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \KEY[0]~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \display|Add1~12_combout\ : std_logic;
SIGNAL \display|Add1~14_combout\ : std_logic;
SIGNAL \generator|Add1~4_combout\ : std_logic;
SIGNAL \generator|Add1~6_combout\ : std_logic;
SIGNAL \generator|Add1~16_combout\ : std_logic;
SIGNAL \debounce1|Add0~1\ : std_logic;
SIGNAL \debounce1|Add0~0_combout\ : std_logic;
SIGNAL \debounce1|Add0~3\ : std_logic;
SIGNAL \debounce1|Add0~2_combout\ : std_logic;
SIGNAL \debounce1|Add0~5\ : std_logic;
SIGNAL \debounce1|Add0~4_combout\ : std_logic;
SIGNAL \debounce1|Add0~7\ : std_logic;
SIGNAL \debounce1|Add0~6_combout\ : std_logic;
SIGNAL \debounce1|Add0~9\ : std_logic;
SIGNAL \debounce1|Add0~8_combout\ : std_logic;
SIGNAL \debounce1|Add0~11\ : std_logic;
SIGNAL \debounce1|Add0~10_combout\ : std_logic;
SIGNAL \debounce1|Add0~13\ : std_logic;
SIGNAL \debounce1|Add0~12_combout\ : std_logic;
SIGNAL \debounce1|Add0~15\ : std_logic;
SIGNAL \debounce1|Add0~14_combout\ : std_logic;
SIGNAL \debounce1|Add0~17\ : std_logic;
SIGNAL \debounce1|Add0~16_combout\ : std_logic;
SIGNAL \debounce1|Add0~19\ : std_logic;
SIGNAL \debounce1|Add0~18_combout\ : std_logic;
SIGNAL \debounce1|Add0~21\ : std_logic;
SIGNAL \debounce1|Add0~20_combout\ : std_logic;
SIGNAL \debounce1|Add0~23\ : std_logic;
SIGNAL \debounce1|Add0~22_combout\ : std_logic;
SIGNAL \debounce1|Add0~25\ : std_logic;
SIGNAL \debounce1|Add0~24_combout\ : std_logic;
SIGNAL \debounce1|Add0~27\ : std_logic;
SIGNAL \debounce1|Add0~26_combout\ : std_logic;
SIGNAL \debounce1|Add0~29\ : std_logic;
SIGNAL \debounce1|Add0~28_combout\ : std_logic;
SIGNAL \debounce1|Add0~31\ : std_logic;
SIGNAL \debounce1|Add0~30_combout\ : std_logic;
SIGNAL \debounce1|Add0~32_combout\ : std_logic;
SIGNAL \display|process_0~0_combout\ : std_logic;
SIGNAL \generator|Equal1~0_combout\ : std_logic;
SIGNAL \generator|pixel_row[7]~4_combout\ : std_logic;
SIGNAL \display|LessThan2~3_combout\ : std_logic;
SIGNAL \display|LessThan2~7_combout\ : std_logic;
SIGNAL \display|Mux0~0_combout\ : std_logic;
SIGNAL \display|Mux0~1_combout\ : std_logic;
SIGNAL \generator|Equal0~1_combout\ : std_logic;
SIGNAL \display|sprite_count[0]~13_combout\ : std_logic;
SIGNAL \debounce1|data_out~q\ : std_logic;
SIGNAL \debounce2|data_out~q\ : std_logic;
SIGNAL \debounce1|data_in_3~q\ : std_logic;
SIGNAL \debounce2|Equal0~0_combout\ : std_logic;
SIGNAL \debounce2|Equal0~1_combout\ : std_logic;
SIGNAL \debounce2|Equal0~2_combout\ : std_logic;
SIGNAL \debounce2|Equal0~3_combout\ : std_logic;
SIGNAL \debounce2|Equal0~4_combout\ : std_logic;
SIGNAL \debounce2|Equal0~5_combout\ : std_logic;
SIGNAL \debounce2|data_in_3~q\ : std_logic;
SIGNAL \debounce1|data_in_2~q\ : std_logic;
SIGNAL \debounce1|counter~0_combout\ : std_logic;
SIGNAL \debounce1|counter~1_combout\ : std_logic;
SIGNAL \debounce1|counter~2_combout\ : std_logic;
SIGNAL \debounce1|counter~3_combout\ : std_logic;
SIGNAL \debounce1|counter~4_combout\ : std_logic;
SIGNAL \debounce1|counter~5_combout\ : std_logic;
SIGNAL \debounce1|counter~6_combout\ : std_logic;
SIGNAL \debounce1|counter~7_combout\ : std_logic;
SIGNAL \debounce1|counter~8_combout\ : std_logic;
SIGNAL \debounce1|counter~9_combout\ : std_logic;
SIGNAL \debounce1|counter~10_combout\ : std_logic;
SIGNAL \debounce2|data_in_2~q\ : std_logic;
SIGNAL \debounce1|data_in_1~q\ : std_logic;
SIGNAL \debounce2|data_in_1~q\ : std_logic;
SIGNAL \debounce1|data_in_0~q\ : std_logic;
SIGNAL \debounce2|data_in_0~q\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \debounce2|data_out~clkctrl_outclk\ : std_logic;
SIGNAL \debounce1|data_out~clkctrl_outclk\ : std_logic;
SIGNAL \debounce1|data_out~feeder_combout\ : std_logic;
SIGNAL \debounce2|data_out~feeder_combout\ : std_logic;
SIGNAL \debounce1|data_in_3~feeder_combout\ : std_logic;
SIGNAL \debounce2|data_in_3~feeder_combout\ : std_logic;
SIGNAL \debounce2|data_in_2~feeder_combout\ : std_logic;
SIGNAL \debounce1|data_in_1~feeder_combout\ : std_logic;
SIGNAL \debounce2|data_in_1~feeder_combout\ : std_logic;
SIGNAL \debounce1|data_in_0~feeder_combout\ : std_logic;
SIGNAL \debounce2|data_in_0~feeder_combout\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \generator|Add0~0_combout\ : std_logic;
SIGNAL \generator|Add0~1\ : std_logic;
SIGNAL \generator|Add0~3\ : std_logic;
SIGNAL \generator|Add0~4_combout\ : std_logic;
SIGNAL \generator|Add0~5\ : std_logic;
SIGNAL \generator|Add0~7\ : std_logic;
SIGNAL \generator|Add0~8_combout\ : std_logic;
SIGNAL \generator|Add0~9\ : std_logic;
SIGNAL \generator|Add0~11\ : std_logic;
SIGNAL \generator|Add0~13\ : std_logic;
SIGNAL \generator|Add0~14_combout\ : std_logic;
SIGNAL \generator|Add0~15\ : std_logic;
SIGNAL \generator|Add0~16_combout\ : std_logic;
SIGNAL \generator|h_count_nxt[8]~0_combout\ : std_logic;
SIGNAL \generator|Equal0~2_combout\ : std_logic;
SIGNAL \generator|h_count_nxt[5]~1_combout\ : std_logic;
SIGNAL \generator|Add0~17\ : std_logic;
SIGNAL \generator|Add0~18_combout\ : std_logic;
SIGNAL \generator|h_count_nxt[9]~2_combout\ : std_logic;
SIGNAL \generator|Equal0~0_combout\ : std_logic;
SIGNAL \generator|Add0~6_combout\ : std_logic;
SIGNAL \generator|Equal1~1_combout\ : std_logic;
SIGNAL \generator|v_count[9]~0_combout\ : std_logic;
SIGNAL \generator|process_1~0_combout\ : std_logic;
SIGNAL \generator|v_count_nxt[3]~3_combout\ : std_logic;
SIGNAL \generator|Add1~1\ : std_logic;
SIGNAL \generator|Add1~2_combout\ : std_logic;
SIGNAL \generator|v_count_nxt[1]~2_combout\ : std_logic;
SIGNAL \generator|v_count_nxt[2]~1_combout\ : std_logic;
SIGNAL \generator|LessThan6~0_combout\ : std_logic;
SIGNAL \generator|Add1~3\ : std_logic;
SIGNAL \generator|Add1~5\ : std_logic;
SIGNAL \generator|Add1~7\ : std_logic;
SIGNAL \generator|Add1~9\ : std_logic;
SIGNAL \generator|Add1~10_combout\ : std_logic;
SIGNAL \generator|v_count_nxt[5]~7_combout\ : std_logic;
SIGNAL \generator|Add1~11\ : std_logic;
SIGNAL \generator|Add1~12_combout\ : std_logic;
SIGNAL \generator|v_count_nxt[6]~6_combout\ : std_logic;
SIGNAL \generator|Add1~13\ : std_logic;
SIGNAL \generator|Add1~14_combout\ : std_logic;
SIGNAL \generator|v_count_nxt[7]~5_combout\ : std_logic;
SIGNAL \generator|LessThan3~0_combout\ : std_logic;
SIGNAL \generator|pixel_row[9]~2_combout\ : std_logic;
SIGNAL \generator|v_count[8]~1_combout\ : std_logic;
SIGNAL \generator|LessThan4~0_combout\ : std_logic;
SIGNAL \generator|LessThan4~1_combout\ : std_logic;
SIGNAL \generator|v_on~combout\ : std_logic;
SIGNAL \generator|pixel_col[7]~11_combout\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \sprite|Add2~3\ : std_logic;
SIGNAL \sprite|Add2~5\ : std_logic;
SIGNAL \sprite|Add2~6_combout\ : std_logic;
SIGNAL \sprite|Add2~8_combout\ : std_logic;
SIGNAL \sprite|sprite_x_nxt[8]~3_combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \KEY[0]~inputclkctrl_outclk\ : std_logic;
SIGNAL \sprite|sprite_x_nxt[0]~feeder_combout\ : std_logic;
SIGNAL \sprite|sprite_x_reg[0]~feeder_combout\ : std_logic;
SIGNAL \sprite|sprite_x_nxt[5]~0_combout\ : std_logic;
SIGNAL \sprite|sprite_x_nxt[5]~1_combout\ : std_logic;
SIGNAL \sprite|sprite_x_nxt[5]~2_combout\ : std_logic;
SIGNAL \sprite|Add2~7\ : std_logic;
SIGNAL \sprite|Add2~9\ : std_logic;
SIGNAL \sprite|Add2~10_combout\ : std_logic;
SIGNAL \sprite|Add2~4_combout\ : std_logic;
SIGNAL \sprite|sprite_x_nxt[6]~4_combout\ : std_logic;
SIGNAL \display|Add1~1\ : std_logic;
SIGNAL \display|Add1~3_cout\ : std_logic;
SIGNAL \display|Add1~5_cout\ : std_logic;
SIGNAL \display|Add1~7_cout\ : std_logic;
SIGNAL \display|Add1~9_cout\ : std_logic;
SIGNAL \display|Add1~11\ : std_logic;
SIGNAL \display|Add1~13\ : std_logic;
SIGNAL \display|Add1~15\ : std_logic;
SIGNAL \display|Add1~17\ : std_logic;
SIGNAL \display|Add1~18_combout\ : std_logic;
SIGNAL \generator|LessThan0~0_combout\ : std_logic;
SIGNAL \display|LessThan3~9_combout\ : std_logic;
SIGNAL \display|LessThan3~2_combout\ : std_logic;
SIGNAL \display|LessThan3~3_combout\ : std_logic;
SIGNAL \display|Add1~10_combout\ : std_logic;
SIGNAL \display|LessThan3~4_combout\ : std_logic;
SIGNAL \generator|Add0~10_combout\ : std_logic;
SIGNAL \display|LessThan3~5_combout\ : std_logic;
SIGNAL \generator|Add0~12_combout\ : std_logic;
SIGNAL \display|process_0~6_combout\ : std_logic;
SIGNAL \display|Add1~0_combout\ : std_logic;
SIGNAL \generator|pixel_col[5]~6_combout\ : std_logic;
SIGNAL \generator|Add0~2_combout\ : std_logic;
SIGNAL \generator|h_count[1]~feeder_combout\ : std_logic;
SIGNAL \display|LessThan3~6_combout\ : std_logic;
SIGNAL \display|LessThan3~7_combout\ : std_logic;
SIGNAL \display|LessThan3~8_combout\ : std_logic;
SIGNAL \display|process_0~3_combout\ : std_logic;
SIGNAL \display|process_0~7_combout\ : std_logic;
SIGNAL \display|process_0~4_combout\ : std_logic;
SIGNAL \sprite|Add2~2_combout\ : std_logic;
SIGNAL \sprite|sprite_x_reg[5]~feeder_combout\ : std_logic;
SIGNAL \display|LessThan2~0_combout\ : std_logic;
SIGNAL \display|LessThan2~1_combout\ : std_logic;
SIGNAL \display|LessThan2~2_combout\ : std_logic;
SIGNAL \generator|pixel_col[6]~7_combout\ : std_logic;
SIGNAL \generator|pixel_col[4]~8_combout\ : std_logic;
SIGNAL \display|LessThan2~4_combout\ : std_logic;
SIGNAL \display|LessThan2~5_combout\ : std_logic;
SIGNAL \display|LessThan2~6_combout\ : std_logic;
SIGNAL \display|Add1~16_combout\ : std_logic;
SIGNAL \generator|pixel_col[9]~9_combout\ : std_logic;
SIGNAL \generator|pixel_col[8]~10_combout\ : std_logic;
SIGNAL \display|process_0~1_combout\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \sprite|Add0~3\ : std_logic;
SIGNAL \sprite|Add0~5\ : std_logic;
SIGNAL \sprite|Add0~7\ : std_logic;
SIGNAL \sprite|Add0~8_combout\ : std_logic;
SIGNAL \sprite|Add0~6_combout\ : std_logic;
SIGNAL \sprite|sprite_y_nxt[7]~3_combout\ : std_logic;
SIGNAL \sprite|sprite_y_reg[7]~feeder_combout\ : std_logic;
SIGNAL \sprite|Add0~4_combout\ : std_logic;
SIGNAL \sprite|sprite_y_nxt[6]~4_combout\ : std_logic;
SIGNAL \sprite|LessThan1~0_combout\ : std_logic;
SIGNAL \sprite|LessThan0~1_combout\ : std_logic;
SIGNAL \sprite|sprite_y_nxt~1_combout\ : std_logic;
SIGNAL \sprite|sprite_y_nxt[4]~2_combout\ : std_logic;
SIGNAL \sprite|sprite_y_reg[4]~feeder_combout\ : std_logic;
SIGNAL \sprite|Add0~2_combout\ : std_logic;
SIGNAL \sprite|sprite_y_nxt[5]~5_combout\ : std_logic;
SIGNAL \sprite|LessThan0~0_combout\ : std_logic;
SIGNAL \sprite|sprite_y_nxt[9]~0_combout\ : std_logic;
SIGNAL \sprite|Add0~9\ : std_logic;
SIGNAL \sprite|Add0~10_combout\ : std_logic;
SIGNAL \generator|Add1~15\ : std_logic;
SIGNAL \generator|Add1~17\ : std_logic;
SIGNAL \generator|Add1~18_combout\ : std_logic;
SIGNAL \generator|pixel_row[9]~8_combout\ : std_logic;
SIGNAL \generator|pixel_row[6]~5_combout\ : std_logic;
SIGNAL \generator|pixel_row[5]~6_combout\ : std_logic;
SIGNAL \generator|Add1~8_combout\ : std_logic;
SIGNAL \generator|v_count_nxt[4]~0_combout\ : std_logic;
SIGNAL \generator|pixel_row[4]~7_combout\ : std_logic;
SIGNAL \display|LessThan1~1_cout\ : std_logic;
SIGNAL \display|LessThan1~3_cout\ : std_logic;
SIGNAL \display|LessThan1~5_cout\ : std_logic;
SIGNAL \display|LessThan1~7_cout\ : std_logic;
SIGNAL \display|LessThan1~9_cout\ : std_logic;
SIGNAL \display|LessThan1~10_combout\ : std_logic;
SIGNAL \generator|pixel_row[8]~3_combout\ : std_logic;
SIGNAL \display|LessThan0~1_cout\ : std_logic;
SIGNAL \display|LessThan0~3_cout\ : std_logic;
SIGNAL \display|LessThan0~5_cout\ : std_logic;
SIGNAL \display|LessThan0~7_cout\ : std_logic;
SIGNAL \display|LessThan0~9_cout\ : std_logic;
SIGNAL \display|LessThan0~10_combout\ : std_logic;
SIGNAL \display|process_0~2_combout\ : std_logic;
SIGNAL \display|process_0~5_combout\ : std_logic;
SIGNAL \display|R_VGA~7_combout\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \display|R_VGA~8_combout\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \display|R_VGA~9_combout\ : std_logic;
SIGNAL \generator|h_on~combout\ : std_logic;
SIGNAL \generator|video_on~combout\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \display|sprite_count[1]~7_combout\ : std_logic;
SIGNAL \display|sprite_count[1]~8\ : std_logic;
SIGNAL \display|sprite_count[2]~10\ : std_logic;
SIGNAL \display|sprite_count[3]~12\ : std_logic;
SIGNAL \display|sprite_count[4]~14_combout\ : std_logic;
SIGNAL \display|sprite_count[4]~15\ : std_logic;
SIGNAL \display|sprite_count[5]~16_combout\ : std_logic;
SIGNAL \display|sprite_count[5]~17\ : std_logic;
SIGNAL \display|sprite_count[6]~18_combout\ : std_logic;
SIGNAL \display|sprite_count[6]~19\ : std_logic;
SIGNAL \display|sprite_count[7]~20_combout\ : std_logic;
SIGNAL \display|Mux0~7_combout\ : std_logic;
SIGNAL \display|Mux0~8_combout\ : std_logic;
SIGNAL \display|sprite_count[2]~9_combout\ : std_logic;
SIGNAL \display|Mux0~2_combout\ : std_logic;
SIGNAL \display|Mux0~3_combout\ : std_logic;
SIGNAL \display|Mux0~4_combout\ : std_logic;
SIGNAL \display|Mux0~5_combout\ : std_logic;
SIGNAL \display|sprite_count[3]~11_combout\ : std_logic;
SIGNAL \display|Mux0~6_combout\ : std_logic;
SIGNAL \display|Mux0~9_combout\ : std_logic;
SIGNAL \display|R_VGA~6_combout\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \display|B_VGA[0]~0_combout\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \display|B_VGA[1]~1_combout\ : std_logic;
SIGNAL \display|B_VGA[2]~2_combout\ : std_logic;
SIGNAL \display|B_VGA[3]~3_combout\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \display|G_VGA[0]~0_combout\ : std_logic;
SIGNAL \display|G_VGA[1]~1_combout\ : std_logic;
SIGNAL \display|G_VGA[2]~2_combout\ : std_logic;
SIGNAL \display|G_VGA[3]~3_combout\ : std_logic;
SIGNAL \generator|VGA_HS~0_combout\ : std_logic;
SIGNAL \generator|VGA_HS~1_combout\ : std_logic;
SIGNAL \generator|VGA_HS~2_combout\ : std_logic;
SIGNAL \generator|Add1~0_combout\ : std_logic;
SIGNAL \generator|v_count_nxt[0]~4_combout\ : std_logic;
SIGNAL \generator|VGA_VS~0_combout\ : std_logic;
SIGNAL \generator|VGA_VS~1_combout\ : std_logic;
SIGNAL \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \debounce1|counter\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \display|sprite_count\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \display|R_VGA\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \display|G_VGA\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \display|B_VGA\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \display|spriterom|altsyncram_component|auto_generated|q_a\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \generator|v_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \generator|h_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \sprite|sprite_y_reg\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \sprite|sprite_y_nxt\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \sprite|sprite_x_reg\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \sprite|sprite_x_nxt\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \debounce1|ALT_INV_data_out~clkctrl_outclk\ : std_logic;
SIGNAL \debounce2|ALT_INV_data_out~clkctrl_outclk\ : std_logic;

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

\display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\display|sprite_count\(7) & \display|sprite_count\(6) & \display|sprite_count\(5) & \display|sprite_count\(4));

\display|spriterom|altsyncram_component|auto_generated|q_a\(0) <= \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\display|spriterom|altsyncram_component|auto_generated|q_a\(1) <= \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\display|spriterom|altsyncram_component|auto_generated|q_a\(2) <= \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\display|spriterom|altsyncram_component|auto_generated|q_a\(3) <= \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\display|spriterom|altsyncram_component|auto_generated|q_a\(4) <= \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\display|spriterom|altsyncram_component|auto_generated|q_a\(5) <= \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\display|spriterom|altsyncram_component|auto_generated|q_a\(6) <= \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\display|spriterom|altsyncram_component|auto_generated|q_a\(7) <= \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);
\display|spriterom|altsyncram_component|auto_generated|q_a\(8) <= \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(8);
\display|spriterom|altsyncram_component|auto_generated|q_a\(9) <= \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(9);
\display|spriterom|altsyncram_component|auto_generated|q_a\(10) <= \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(10);
\display|spriterom|altsyncram_component|auto_generated|q_a\(11) <= \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(11);
\display|spriterom|altsyncram_component|auto_generated|q_a\(12) <= \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(12);
\display|spriterom|altsyncram_component|auto_generated|q_a\(13) <= \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(13);
\display|spriterom|altsyncram_component|auto_generated|q_a\(14) <= \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(14);
\display|spriterom|altsyncram_component|auto_generated|q_a\(15) <= \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(15);

\generator|clkdiv_inst|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \CLOCK_50~input_o\);

\generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk\(0) <= \generator|clkdiv_inst|altpll_component|auto_generated|pll1_CLK_bus\(0);
\generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk\(1) <= \generator|clkdiv_inst|altpll_component|auto_generated|pll1_CLK_bus\(1);
\generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk\(2) <= \generator|clkdiv_inst|altpll_component|auto_generated|pll1_CLK_bus\(2);
\generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk\(3) <= \generator|clkdiv_inst|altpll_component|auto_generated|pll1_CLK_bus\(3);
\generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk\(4) <= \generator|clkdiv_inst|altpll_component|auto_generated|pll1_CLK_bus\(4);

\debounce2|data_out~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \debounce2|data_out~q\);

\debounce1|data_out~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \debounce1|data_out~q\);

\KEY[0]~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \KEY[0]~input_o\);

\generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk\(0));

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
\debounce1|ALT_INV_data_out~clkctrl_outclk\ <= NOT \debounce1|data_out~clkctrl_outclk\;
\debounce2|ALT_INV_data_out~clkctrl_outclk\ <= NOT \debounce2|data_out~clkctrl_outclk\;

-- Location: LCCOMB_X28_Y22_N16
\display|Add1~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Add1~12_combout\ = (\sprite|sprite_x_reg\(6) & (!\display|Add1~11\ & VCC)) # (!\sprite|sprite_x_reg\(6) & (\display|Add1~11\ $ (GND)))
-- \display|Add1~13\ = CARRY((!\sprite|sprite_x_reg\(6) & !\display|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sprite|sprite_x_reg\(6),
	datad => VCC,
	cin => \display|Add1~11\,
	combout => \display|Add1~12_combout\,
	cout => \display|Add1~13\);

-- Location: LCCOMB_X28_Y22_N18
\display|Add1~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Add1~14_combout\ = (\sprite|sprite_x_reg\(7) & (!\display|Add1~13\)) # (!\sprite|sprite_x_reg\(7) & ((\display|Add1~13\) # (GND)))
-- \display|Add1~15\ = CARRY((!\display|Add1~13\) # (!\sprite|sprite_x_reg\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sprite|sprite_x_reg\(7),
	datad => VCC,
	cin => \display|Add1~13\,
	combout => \display|Add1~14_combout\,
	cout => \display|Add1~15\);

-- Location: LCCOMB_X30_Y20_N10
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

-- Location: LCCOMB_X30_Y20_N12
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

-- Location: LCCOMB_X30_Y20_N22
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

-- Location: M9K_X25_Y23_N0
\display|spriterom|altsyncram_component|auto_generated|ram_block1a0\ : cycloneiii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"00C00048000400048000100048000C00000000000000000C000480001000040012000300",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "VGA.mif",
	init_file_layout => "port_a",
	logical_ram_name => "de0_vga_display:display|sprite:spriterom|altsyncram:altsyncram_component|altsyncram_vi91:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 4,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 18,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 15,
	port_a_logical_ram_depth => 16,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 4,
	port_b_data_width => 18,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	portaaddr => \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \display|spriterom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCCOMB_X21_Y2_N16
\debounce1|Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~0_combout\ = \debounce1|counter\(0) $ (VCC)
-- \debounce1|Add0~1\ = CARRY(\debounce1|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce1|counter\(0),
	datad => VCC,
	combout => \debounce1|Add0~0_combout\,
	cout => \debounce1|Add0~1\);

-- Location: LCCOMB_X21_Y2_N18
\debounce1|Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~2_combout\ = (\debounce1|counter\(1) & (\debounce1|Add0~1\ & VCC)) # (!\debounce1|counter\(1) & (!\debounce1|Add0~1\))
-- \debounce1|Add0~3\ = CARRY((!\debounce1|counter\(1) & !\debounce1|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce1|counter\(1),
	datad => VCC,
	cin => \debounce1|Add0~1\,
	combout => \debounce1|Add0~2_combout\,
	cout => \debounce1|Add0~3\);

-- Location: LCCOMB_X21_Y2_N20
\debounce1|Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~4_combout\ = (\debounce1|counter\(2) & ((GND) # (!\debounce1|Add0~3\))) # (!\debounce1|counter\(2) & (\debounce1|Add0~3\ $ (GND)))
-- \debounce1|Add0~5\ = CARRY((\debounce1|counter\(2)) # (!\debounce1|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce1|counter\(2),
	datad => VCC,
	cin => \debounce1|Add0~3\,
	combout => \debounce1|Add0~4_combout\,
	cout => \debounce1|Add0~5\);

-- Location: LCCOMB_X21_Y2_N22
\debounce1|Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~6_combout\ = (\debounce1|counter\(3) & (\debounce1|Add0~5\ & VCC)) # (!\debounce1|counter\(3) & (!\debounce1|Add0~5\))
-- \debounce1|Add0~7\ = CARRY((!\debounce1|counter\(3) & !\debounce1|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce1|counter\(3),
	datad => VCC,
	cin => \debounce1|Add0~5\,
	combout => \debounce1|Add0~6_combout\,
	cout => \debounce1|Add0~7\);

-- Location: LCCOMB_X21_Y2_N24
\debounce1|Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~8_combout\ = (\debounce1|counter\(4) & ((GND) # (!\debounce1|Add0~7\))) # (!\debounce1|counter\(4) & (\debounce1|Add0~7\ $ (GND)))
-- \debounce1|Add0~9\ = CARRY((\debounce1|counter\(4)) # (!\debounce1|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce1|counter\(4),
	datad => VCC,
	cin => \debounce1|Add0~7\,
	combout => \debounce1|Add0~8_combout\,
	cout => \debounce1|Add0~9\);

-- Location: LCCOMB_X21_Y2_N26
\debounce1|Add0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~10_combout\ = (\debounce1|counter\(5) & (\debounce1|Add0~9\ & VCC)) # (!\debounce1|counter\(5) & (!\debounce1|Add0~9\))
-- \debounce1|Add0~11\ = CARRY((!\debounce1|counter\(5) & !\debounce1|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce1|counter\(5),
	datad => VCC,
	cin => \debounce1|Add0~9\,
	combout => \debounce1|Add0~10_combout\,
	cout => \debounce1|Add0~11\);

-- Location: LCCOMB_X21_Y2_N28
\debounce1|Add0~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~12_combout\ = (\debounce1|counter\(6) & ((GND) # (!\debounce1|Add0~11\))) # (!\debounce1|counter\(6) & (\debounce1|Add0~11\ $ (GND)))
-- \debounce1|Add0~13\ = CARRY((\debounce1|counter\(6)) # (!\debounce1|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce1|counter\(6),
	datad => VCC,
	cin => \debounce1|Add0~11\,
	combout => \debounce1|Add0~12_combout\,
	cout => \debounce1|Add0~13\);

-- Location: LCCOMB_X21_Y2_N30
\debounce1|Add0~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~14_combout\ = (\debounce1|counter\(7) & (\debounce1|Add0~13\ & VCC)) # (!\debounce1|counter\(7) & (!\debounce1|Add0~13\))
-- \debounce1|Add0~15\ = CARRY((!\debounce1|counter\(7) & !\debounce1|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce1|counter\(7),
	datad => VCC,
	cin => \debounce1|Add0~13\,
	combout => \debounce1|Add0~14_combout\,
	cout => \debounce1|Add0~15\);

-- Location: LCCOMB_X21_Y1_N0
\debounce1|Add0~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~16_combout\ = (\debounce1|counter\(8) & ((GND) # (!\debounce1|Add0~15\))) # (!\debounce1|counter\(8) & (\debounce1|Add0~15\ $ (GND)))
-- \debounce1|Add0~17\ = CARRY((\debounce1|counter\(8)) # (!\debounce1|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce1|counter\(8),
	datad => VCC,
	cin => \debounce1|Add0~15\,
	combout => \debounce1|Add0~16_combout\,
	cout => \debounce1|Add0~17\);

-- Location: LCCOMB_X21_Y1_N2
\debounce1|Add0~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~18_combout\ = (\debounce1|counter\(9) & (\debounce1|Add0~17\ & VCC)) # (!\debounce1|counter\(9) & (!\debounce1|Add0~17\))
-- \debounce1|Add0~19\ = CARRY((!\debounce1|counter\(9) & !\debounce1|Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce1|counter\(9),
	datad => VCC,
	cin => \debounce1|Add0~17\,
	combout => \debounce1|Add0~18_combout\,
	cout => \debounce1|Add0~19\);

-- Location: LCCOMB_X21_Y1_N4
\debounce1|Add0~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~20_combout\ = (\debounce1|counter\(10) & ((GND) # (!\debounce1|Add0~19\))) # (!\debounce1|counter\(10) & (\debounce1|Add0~19\ $ (GND)))
-- \debounce1|Add0~21\ = CARRY((\debounce1|counter\(10)) # (!\debounce1|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce1|counter\(10),
	datad => VCC,
	cin => \debounce1|Add0~19\,
	combout => \debounce1|Add0~20_combout\,
	cout => \debounce1|Add0~21\);

-- Location: LCCOMB_X21_Y1_N6
\debounce1|Add0~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~22_combout\ = (\debounce1|counter\(11) & (\debounce1|Add0~21\ & VCC)) # (!\debounce1|counter\(11) & (!\debounce1|Add0~21\))
-- \debounce1|Add0~23\ = CARRY((!\debounce1|counter\(11) & !\debounce1|Add0~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce1|counter\(11),
	datad => VCC,
	cin => \debounce1|Add0~21\,
	combout => \debounce1|Add0~22_combout\,
	cout => \debounce1|Add0~23\);

-- Location: LCCOMB_X21_Y1_N8
\debounce1|Add0~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~24_combout\ = (\debounce1|counter\(12) & ((GND) # (!\debounce1|Add0~23\))) # (!\debounce1|counter\(12) & (\debounce1|Add0~23\ $ (GND)))
-- \debounce1|Add0~25\ = CARRY((\debounce1|counter\(12)) # (!\debounce1|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce1|counter\(12),
	datad => VCC,
	cin => \debounce1|Add0~23\,
	combout => \debounce1|Add0~24_combout\,
	cout => \debounce1|Add0~25\);

-- Location: LCCOMB_X21_Y1_N10
\debounce1|Add0~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~26_combout\ = (\debounce1|counter\(13) & (\debounce1|Add0~25\ & VCC)) # (!\debounce1|counter\(13) & (!\debounce1|Add0~25\))
-- \debounce1|Add0~27\ = CARRY((!\debounce1|counter\(13) & !\debounce1|Add0~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce1|counter\(13),
	datad => VCC,
	cin => \debounce1|Add0~25\,
	combout => \debounce1|Add0~26_combout\,
	cout => \debounce1|Add0~27\);

-- Location: LCCOMB_X21_Y1_N12
\debounce1|Add0~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~28_combout\ = (\debounce1|counter\(14) & ((GND) # (!\debounce1|Add0~27\))) # (!\debounce1|counter\(14) & (\debounce1|Add0~27\ $ (GND)))
-- \debounce1|Add0~29\ = CARRY((\debounce1|counter\(14)) # (!\debounce1|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debounce1|counter\(14),
	datad => VCC,
	cin => \debounce1|Add0~27\,
	combout => \debounce1|Add0~28_combout\,
	cout => \debounce1|Add0~29\);

-- Location: LCCOMB_X21_Y1_N14
\debounce1|Add0~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~30_combout\ = (\debounce1|counter\(15) & (\debounce1|Add0~29\ & VCC)) # (!\debounce1|counter\(15) & (!\debounce1|Add0~29\))
-- \debounce1|Add0~31\ = CARRY((!\debounce1|counter\(15) & !\debounce1|Add0~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debounce1|counter\(15),
	datad => VCC,
	cin => \debounce1|Add0~29\,
	combout => \debounce1|Add0~30_combout\,
	cout => \debounce1|Add0~31\);

-- Location: LCCOMB_X21_Y1_N16
\debounce1|Add0~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|Add0~32_combout\ = \debounce1|Add0~31\ $ (\debounce1|counter\(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \debounce1|counter\(16),
	cin => \debounce1|Add0~31\,
	combout => \debounce1|Add0~32_combout\);

-- Location: LCCOMB_X29_Y22_N10
\display|process_0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|process_0~0_combout\ = (\generator|pixel_col[9]~9_combout\ & ((\sprite|sprite_x_reg\(8)) # ((\generator|pixel_col[8]~10_combout\) # (!\sprite|sprite_x_reg\(9))))) # (!\generator|pixel_col[9]~9_combout\ & (!\sprite|sprite_x_reg\(9) & 
-- ((\sprite|sprite_x_reg\(8)) # (\generator|pixel_col[8]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_x_reg\(8),
	datab => \generator|pixel_col[9]~9_combout\,
	datac => \sprite|sprite_x_reg\(9),
	datad => \generator|pixel_col[8]~10_combout\,
	combout => \display|process_0~0_combout\);

-- Location: LCCOMB_X32_Y22_N6
\generator|Equal1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Equal1~0_combout\ = (\generator|h_count\(6) & (!\generator|h_count\(8) & (\generator|h_count\(7) & !\generator|h_count\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(6),
	datab => \generator|h_count\(8),
	datac => \generator|h_count\(7),
	datad => \generator|h_count\(4),
	combout => \generator|Equal1~0_combout\);

-- Location: LCCOMB_X30_Y19_N6
\generator|pixel_row[7]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|pixel_row[7]~4_combout\ = (\generator|LessThan4~1_combout\ & (((\generator|v_count\(7))))) # (!\generator|LessThan4~1_combout\ & ((\generator|pixel_row[9]~2_combout\ & (\generator|Add1~14_combout\)) # (!\generator|pixel_row[9]~2_combout\ & 
-- ((\generator|v_count\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Add1~14_combout\,
	datab => \generator|LessThan4~1_combout\,
	datac => \generator|v_count\(7),
	datad => \generator|pixel_row[9]~2_combout\,
	combout => \generator|pixel_row[7]~4_combout\);

-- Location: LCCOMB_X30_Y22_N30
\display|LessThan2~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan2~3_combout\ = \sprite|sprite_x_reg\(5) $ (((\generator|LessThan0~0_combout\ & ((\generator|h_count\(5)))) # (!\generator|LessThan0~0_combout\ & (\generator|Add0~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_x_reg\(5),
	datab => \generator|LessThan0~0_combout\,
	datac => \generator|Add0~10_combout\,
	datad => \generator|h_count\(5),
	combout => \display|LessThan2~3_combout\);

-- Location: LCCOMB_X28_Y22_N26
\display|LessThan2~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan2~7_combout\ = (\sprite|sprite_x_reg\(8) & (!\generator|pixel_col[8]~10_combout\ & (\sprite|sprite_x_reg\(9) $ (!\generator|pixel_col[9]~9_combout\)))) # (!\sprite|sprite_x_reg\(8) & (\generator|pixel_col[8]~10_combout\ & 
-- (\sprite|sprite_x_reg\(9) $ (!\generator|pixel_col[9]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_x_reg\(8),
	datab => \sprite|sprite_x_reg\(9),
	datac => \generator|pixel_col[8]~10_combout\,
	datad => \generator|pixel_col[9]~9_combout\,
	combout => \display|LessThan2~7_combout\);

-- Location: LCCOMB_X26_Y23_N20
\display|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Mux0~0_combout\ = (\display|sprite_count\(1) & (((\display|sprite_count\(2))))) # (!\display|sprite_count\(1) & ((\display|sprite_count\(2) & ((\display|spriterom|altsyncram_component|auto_generated|q_a\(12)))) # (!\display|sprite_count\(2) & 
-- (\display|spriterom|altsyncram_component|auto_generated|q_a\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|spriterom|altsyncram_component|auto_generated|q_a\(8),
	datab => \display|spriterom|altsyncram_component|auto_generated|q_a\(12),
	datac => \display|sprite_count\(1),
	datad => \display|sprite_count\(2),
	combout => \display|Mux0~0_combout\);

-- Location: LCCOMB_X26_Y23_N14
\display|Mux0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Mux0~1_combout\ = (\display|sprite_count\(1) & ((\display|Mux0~0_combout\ & (\display|spriterom|altsyncram_component|auto_generated|q_a\(14))) # (!\display|Mux0~0_combout\ & ((\display|spriterom|altsyncram_component|auto_generated|q_a\(10)))))) # 
-- (!\display|sprite_count\(1) & (((\display|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|spriterom|altsyncram_component|auto_generated|q_a\(14),
	datab => \display|spriterom|altsyncram_component|auto_generated|q_a\(10),
	datac => \display|sprite_count\(1),
	datad => \display|Mux0~0_combout\,
	combout => \display|Mux0~1_combout\);

-- Location: FF_X27_Y22_N23
\display|sprite_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|sprite_count[0]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|sprite_count\(0));

-- Location: LCCOMB_X32_Y22_N22
\generator|Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Equal0~1_combout\ = (!\generator|h_count\(6) & (\generator|h_count\(4) & (\generator|h_count\(3) & \generator|h_count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(6),
	datab => \generator|h_count\(4),
	datac => \generator|h_count\(3),
	datad => \generator|h_count\(0),
	combout => \generator|Equal0~1_combout\);

-- Location: LCCOMB_X27_Y22_N22
\display|sprite_count[0]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|sprite_count[0]~13_combout\ = \display|process_0~5_combout\ $ (\display|sprite_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display|process_0~5_combout\,
	datac => \display|sprite_count\(0),
	combout => \display|sprite_count[0]~13_combout\);

-- Location: FF_X19_Y27_N23
\debounce1|data_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|data_out~feeder_combout\,
	ena => \debounce2|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|data_out~q\);

-- Location: FF_X21_Y1_N29
\debounce2|data_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce2|data_out~feeder_combout\,
	ena => \debounce2|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce2|data_out~q\);

-- Location: FF_X12_Y23_N5
\debounce1|data_in_3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|data_in_3~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|data_in_3~q\);

-- Location: FF_X21_Y2_N5
\debounce1|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(2));

-- Location: FF_X21_Y2_N11
\debounce1|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(3));

-- Location: LCCOMB_X21_Y2_N0
\debounce2|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce2|Equal0~0_combout\ = (!\debounce1|counter\(2) & !\debounce1|counter\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce1|counter\(2),
	datad => \debounce1|counter\(3),
	combout => \debounce2|Equal0~0_combout\);

-- Location: FF_X21_Y2_N7
\debounce1|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|counter~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(4));

-- Location: FF_X21_Y2_N27
\debounce1|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(5));

-- Location: FF_X21_Y2_N13
\debounce1|counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(6));

-- Location: FF_X21_Y2_N31
\debounce1|counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(7));

-- Location: LCCOMB_X20_Y2_N12
\debounce2|Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce2|Equal0~1_combout\ = (!\debounce1|counter\(5) & (!\debounce1|counter\(6) & (!\debounce1|counter\(7) & !\debounce1|counter\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce1|counter\(5),
	datab => \debounce1|counter\(6),
	datac => \debounce1|counter\(7),
	datad => \debounce1|counter\(4),
	combout => \debounce2|Equal0~1_combout\);

-- Location: FF_X21_Y2_N3
\debounce1|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|counter~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(0));

-- Location: FF_X21_Y2_N9
\debounce1|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|counter~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(1));

-- Location: LCCOMB_X21_Y2_N14
\debounce2|Equal0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce2|Equal0~2_combout\ = (\debounce2|Equal0~1_combout\ & (!\debounce1|counter\(0) & (!\debounce1|counter\(1) & \debounce2|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce2|Equal0~1_combout\,
	datab => \debounce1|counter\(0),
	datac => \debounce1|counter\(1),
	datad => \debounce2|Equal0~0_combout\,
	combout => \debounce2|Equal0~2_combout\);

-- Location: FF_X21_Y1_N25
\debounce1|counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|counter~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(8));

-- Location: FF_X21_Y1_N3
\debounce1|counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(9));

-- Location: FF_X21_Y1_N5
\debounce1|counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(10));

-- Location: FF_X21_Y1_N21
\debounce1|counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|counter~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(11));

-- Location: LCCOMB_X22_Y1_N4
\debounce2|Equal0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce2|Equal0~3_combout\ = (!\debounce1|counter\(9) & (!\debounce1|counter\(11) & (!\debounce1|counter\(10) & !\debounce1|counter\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce1|counter\(9),
	datab => \debounce1|counter\(11),
	datac => \debounce1|counter\(10),
	datad => \debounce1|counter\(8),
	combout => \debounce2|Equal0~3_combout\);

-- Location: FF_X21_Y1_N19
\debounce1|counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|counter~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(12));

-- Location: FF_X21_Y1_N31
\debounce1|counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|counter~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(13));

-- Location: FF_X21_Y1_N23
\debounce1|counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|counter~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(14));

-- Location: FF_X21_Y1_N15
\debounce1|counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|Add0~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(15));

-- Location: LCCOMB_X22_Y1_N6
\debounce2|Equal0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce2|Equal0~4_combout\ = (!\debounce1|counter\(14) & (!\debounce1|counter\(13) & (!\debounce1|counter\(15) & !\debounce1|counter\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce1|counter\(14),
	datab => \debounce1|counter\(13),
	datac => \debounce1|counter\(15),
	datad => \debounce1|counter\(12),
	combout => \debounce2|Equal0~4_combout\);

-- Location: FF_X21_Y1_N17
\debounce1|counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|Add0~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|counter\(16));

-- Location: LCCOMB_X21_Y1_N26
\debounce2|Equal0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce2|Equal0~5_combout\ = (\debounce2|Equal0~4_combout\ & (!\debounce1|counter\(16) & (\debounce2|Equal0~2_combout\ & \debounce2|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce2|Equal0~4_combout\,
	datab => \debounce1|counter\(16),
	datac => \debounce2|Equal0~2_combout\,
	datad => \debounce2|Equal0~3_combout\,
	combout => \debounce2|Equal0~5_combout\);

-- Location: FF_X22_Y1_N29
\debounce2|data_in_3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce2|data_in_3~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce2|data_in_3~q\);

-- Location: FF_X12_Y23_N3
\debounce1|data_in_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \debounce1|data_in_1~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|data_in_2~q\);

-- Location: LCCOMB_X21_Y2_N4
\debounce1|counter~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|counter~0_combout\ = (!\debounce2|Equal0~5_combout\ & \debounce1|Add0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce2|Equal0~5_combout\,
	datad => \debounce1|Add0~4_combout\,
	combout => \debounce1|counter~0_combout\);

-- Location: LCCOMB_X21_Y2_N10
\debounce1|counter~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|counter~1_combout\ = (!\debounce2|Equal0~5_combout\ & \debounce1|Add0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce2|Equal0~5_combout\,
	datac => \debounce1|Add0~6_combout\,
	combout => \debounce1|counter~1_combout\);

-- Location: LCCOMB_X21_Y2_N6
\debounce1|counter~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|counter~2_combout\ = (!\debounce2|Equal0~5_combout\ & \debounce1|Add0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce2|Equal0~5_combout\,
	datad => \debounce1|Add0~8_combout\,
	combout => \debounce1|counter~2_combout\);

-- Location: LCCOMB_X21_Y2_N12
\debounce1|counter~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|counter~3_combout\ = (!\debounce2|Equal0~5_combout\ & \debounce1|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce2|Equal0~5_combout\,
	datad => \debounce1|Add0~12_combout\,
	combout => \debounce1|counter~3_combout\);

-- Location: LCCOMB_X21_Y2_N2
\debounce1|counter~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|counter~4_combout\ = (!\debounce2|Equal0~5_combout\ & \debounce1|Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce2|Equal0~5_combout\,
	datad => \debounce1|Add0~0_combout\,
	combout => \debounce1|counter~4_combout\);

-- Location: LCCOMB_X21_Y2_N8
\debounce1|counter~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|counter~5_combout\ = (!\debounce2|Equal0~5_combout\ & \debounce1|Add0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debounce2|Equal0~5_combout\,
	datad => \debounce1|Add0~2_combout\,
	combout => \debounce1|counter~5_combout\);

-- Location: LCCOMB_X21_Y1_N24
\debounce1|counter~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|counter~6_combout\ = (\debounce1|Add0~16_combout\ & !\debounce2|Equal0~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \debounce1|Add0~16_combout\,
	datac => \debounce2|Equal0~5_combout\,
	combout => \debounce1|counter~6_combout\);

-- Location: LCCOMB_X21_Y1_N20
\debounce1|counter~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|counter~7_combout\ = (!\debounce2|Equal0~5_combout\ & \debounce1|Add0~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce2|Equal0~5_combout\,
	datac => \debounce1|Add0~22_combout\,
	combout => \debounce1|counter~7_combout\);

-- Location: LCCOMB_X21_Y1_N18
\debounce1|counter~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|counter~8_combout\ = (!\debounce2|Equal0~5_combout\ & \debounce1|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce2|Equal0~5_combout\,
	datac => \debounce1|Add0~24_combout\,
	combout => \debounce1|counter~8_combout\);

-- Location: LCCOMB_X21_Y1_N30
\debounce1|counter~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|counter~9_combout\ = (\debounce1|Add0~26_combout\ & !\debounce2|Equal0~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce1|Add0~26_combout\,
	datac => \debounce2|Equal0~5_combout\,
	combout => \debounce1|counter~9_combout\);

-- Location: LCCOMB_X21_Y1_N22
\debounce1|counter~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|counter~10_combout\ = (\debounce1|Add0~28_combout\ & !\debounce2|Equal0~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debounce1|Add0~28_combout\,
	datac => \debounce2|Equal0~5_combout\,
	combout => \debounce1|counter~10_combout\);

-- Location: FF_X12_Y23_N9
\debounce2|data_in_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce2|data_in_2~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce2|data_in_2~q\);

-- Location: FF_X12_Y23_N23
\debounce1|data_in_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|data_in_1~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|data_in_1~q\);

-- Location: FF_X12_Y23_N13
\debounce2|data_in_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce2|data_in_1~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce2|data_in_1~q\);

-- Location: FF_X12_Y23_N11
\debounce1|data_in_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce1|data_in_0~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce1|data_in_0~q\);

-- Location: FF_X12_Y23_N29
\debounce2|data_in_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \debounce2|data_in_0~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debounce2|data_in_0~q\);

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

-- Location: CLKCTRL_G16
\debounce2|data_out~clkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \debounce2|data_out~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \debounce2|data_out~clkctrl_outclk\);

-- Location: CLKCTRL_G14
\debounce1|data_out~clkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \debounce1|data_out~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \debounce1|data_out~clkctrl_outclk\);

-- Location: LCCOMB_X19_Y27_N22
\debounce1|data_out~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|data_out~feeder_combout\ = \debounce1|data_in_3~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \debounce1|data_in_3~q\,
	combout => \debounce1|data_out~feeder_combout\);

-- Location: LCCOMB_X21_Y1_N28
\debounce2|data_out~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce2|data_out~feeder_combout\ = \debounce2|data_in_3~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \debounce2|data_in_3~q\,
	combout => \debounce2|data_out~feeder_combout\);

-- Location: LCCOMB_X12_Y23_N4
\debounce1|data_in_3~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|data_in_3~feeder_combout\ = \debounce1|data_in_2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \debounce1|data_in_2~q\,
	combout => \debounce1|data_in_3~feeder_combout\);

-- Location: LCCOMB_X22_Y1_N28
\debounce2|data_in_3~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce2|data_in_3~feeder_combout\ = \debounce2|data_in_2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \debounce2|data_in_2~q\,
	combout => \debounce2|data_in_3~feeder_combout\);

-- Location: LCCOMB_X12_Y23_N8
\debounce2|data_in_2~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce2|data_in_2~feeder_combout\ = \debounce2|data_in_1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \debounce2|data_in_1~q\,
	combout => \debounce2|data_in_2~feeder_combout\);

-- Location: LCCOMB_X12_Y23_N22
\debounce1|data_in_1~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|data_in_1~feeder_combout\ = \debounce1|data_in_0~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \debounce1|data_in_0~q\,
	combout => \debounce1|data_in_1~feeder_combout\);

-- Location: LCCOMB_X12_Y23_N12
\debounce2|data_in_1~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce2|data_in_1~feeder_combout\ = \debounce2|data_in_0~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \debounce2|data_in_0~q\,
	combout => \debounce2|data_in_1~feeder_combout\);

-- Location: LCCOMB_X12_Y23_N10
\debounce1|data_in_0~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce1|data_in_0~feeder_combout\ = \KEY[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \KEY[1]~input_o\,
	combout => \debounce1|data_in_0~feeder_combout\);

-- Location: LCCOMB_X12_Y23_N28
\debounce2|data_in_0~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \debounce2|data_in_0~feeder_combout\ = \KEY[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \KEY[2]~input_o\,
	combout => \debounce2|data_in_0~feeder_combout\);

-- Location: IOOBUF_X41_Y23_N23
\VGA_R[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display|R_VGA\(0),
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
	i => \display|R_VGA\(1),
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
	i => \display|R_VGA\(2),
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
	i => \display|R_VGA\(3),
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
	i => \display|B_VGA\(0),
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
	i => \display|B_VGA\(1),
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
	i => \display|B_VGA\(2),
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
	i => \display|B_VGA\(3),
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
	i => \display|G_VGA\(0),
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
	i => \display|G_VGA\(1),
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
	i => \display|G_VGA\(2),
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
	i => \display|G_VGA\(3),
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
	i => \generator|VGA_VS~1_combout\,
	devoe => ww_devoe,
	o => ww_VGA_VS);

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
	pll_compensation_delay => 3403,
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

-- Location: LCCOMB_X31_Y22_N0
\generator|Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add0~0_combout\ = \generator|h_count\(0) $ (VCC)
-- \generator|Add0~1\ = CARRY(\generator|h_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \generator|h_count\(0),
	datad => VCC,
	combout => \generator|Add0~0_combout\,
	cout => \generator|Add0~1\);

-- Location: FF_X31_Y22_N21
\generator|h_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \generator|Add0~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(0));

-- Location: LCCOMB_X31_Y22_N2
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

-- Location: LCCOMB_X31_Y22_N4
\generator|Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add0~4_combout\ = (\generator|h_count\(2) & (\generator|Add0~3\ $ (GND))) # (!\generator|h_count\(2) & (!\generator|Add0~3\ & VCC))
-- \generator|Add0~5\ = CARRY((\generator|h_count\(2) & !\generator|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \generator|h_count\(2),
	datad => VCC,
	cin => \generator|Add0~3\,
	combout => \generator|Add0~4_combout\,
	cout => \generator|Add0~5\);

-- Location: FF_X32_Y22_N31
\generator|h_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \generator|Add0~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(2));

-- Location: LCCOMB_X31_Y22_N6
\generator|Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add0~6_combout\ = (\generator|h_count\(3) & (!\generator|Add0~5\)) # (!\generator|h_count\(3) & ((\generator|Add0~5\) # (GND)))
-- \generator|Add0~7\ = CARRY((!\generator|Add0~5\) # (!\generator|h_count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(3),
	datad => VCC,
	cin => \generator|Add0~5\,
	combout => \generator|Add0~6_combout\,
	cout => \generator|Add0~7\);

-- Location: LCCOMB_X31_Y22_N8
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

-- Location: FF_X32_Y22_N1
\generator|h_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \generator|Add0~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(4));

-- Location: LCCOMB_X31_Y22_N10
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

-- Location: LCCOMB_X31_Y22_N12
\generator|Add0~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add0~12_combout\ = (\generator|h_count\(6) & (\generator|Add0~11\ $ (GND))) # (!\generator|h_count\(6) & (!\generator|Add0~11\ & VCC))
-- \generator|Add0~13\ = CARRY((\generator|h_count\(6) & !\generator|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(6),
	datad => VCC,
	cin => \generator|Add0~11\,
	combout => \generator|Add0~12_combout\,
	cout => \generator|Add0~13\);

-- Location: LCCOMB_X31_Y22_N14
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

-- Location: FF_X32_Y22_N29
\generator|h_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \generator|Add0~14_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(7));

-- Location: LCCOMB_X31_Y22_N16
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

-- Location: LCCOMB_X32_Y22_N26
\generator|h_count_nxt[8]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|h_count_nxt[8]~0_combout\ = (\generator|Add0~16_combout\ & !\generator|Equal0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \generator|Add0~16_combout\,
	datad => \generator|Equal0~2_combout\,
	combout => \generator|h_count_nxt[8]~0_combout\);

-- Location: FF_X32_Y22_N27
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

-- Location: LCCOMB_X32_Y22_N4
\generator|Equal0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Equal0~2_combout\ = (\generator|Equal0~1_combout\ & (\generator|h_count\(8) & (!\generator|h_count\(7) & \generator|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Equal0~1_combout\,
	datab => \generator|h_count\(8),
	datac => \generator|h_count\(7),
	datad => \generator|Equal0~0_combout\,
	combout => \generator|Equal0~2_combout\);

-- Location: LCCOMB_X32_Y22_N20
\generator|h_count_nxt[5]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|h_count_nxt[5]~1_combout\ = (\generator|Add0~10_combout\ & !\generator|Equal0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Add0~10_combout\,
	datad => \generator|Equal0~2_combout\,
	combout => \generator|h_count_nxt[5]~1_combout\);

-- Location: FF_X32_Y22_N21
\generator|h_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|h_count_nxt[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(5));

-- Location: LCCOMB_X31_Y22_N18
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

-- Location: LCCOMB_X32_Y22_N8
\generator|h_count_nxt[9]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|h_count_nxt[9]~2_combout\ = (!\generator|Equal0~2_combout\ & \generator|Add0~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Equal0~2_combout\,
	datad => \generator|Add0~18_combout\,
	combout => \generator|h_count_nxt[9]~2_combout\);

-- Location: FF_X32_Y22_N9
\generator|h_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|h_count_nxt[9]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(9));

-- Location: LCCOMB_X32_Y22_N18
\generator|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Equal0~0_combout\ = (\generator|h_count\(1) & (!\generator|h_count\(5) & (\generator|h_count\(2) & \generator|h_count\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(1),
	datab => \generator|h_count\(5),
	datac => \generator|h_count\(2),
	datad => \generator|h_count\(9),
	combout => \generator|Equal0~0_combout\);

-- Location: FF_X31_Y22_N27
\generator|h_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \generator|Add0~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(3));

-- Location: LCCOMB_X31_Y22_N28
\generator|Equal1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Equal1~1_combout\ = (\generator|Equal1~0_combout\ & (\generator|Equal0~0_combout\ & (!\generator|h_count\(3) & !\generator|h_count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Equal1~0_combout\,
	datab => \generator|Equal0~0_combout\,
	datac => \generator|h_count\(3),
	datad => \generator|h_count\(0),
	combout => \generator|Equal1~1_combout\);

-- Location: LCCOMB_X31_Y20_N24
\generator|v_count[9]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count[9]~0_combout\ = (\generator|Add1~18_combout\ & ((\generator|pixel_row[9]~2_combout\) # ((\generator|v_count\(9) & !\generator|Equal1~1_combout\)))) # (!\generator|Add1~18_combout\ & (((\generator|v_count\(9) & 
-- !\generator|Equal1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Add1~18_combout\,
	datab => \generator|pixel_row[9]~2_combout\,
	datac => \generator|v_count\(9),
	datad => \generator|Equal1~1_combout\,
	combout => \generator|v_count[9]~0_combout\);

-- Location: FF_X31_Y20_N25
\generator|v_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(9));

-- Location: LCCOMB_X31_Y20_N28
\generator|process_1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|process_1~0_combout\ = (\generator|v_count\(9) & (\generator|Equal1~1_combout\ & ((!\generator|LessThan6~0_combout\) # (!\generator|LessThan3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|LessThan3~0_combout\,
	datab => \generator|v_count\(9),
	datac => \generator|Equal1~1_combout\,
	datad => \generator|LessThan6~0_combout\,
	combout => \generator|process_1~0_combout\);

-- Location: LCCOMB_X30_Y20_N28
\generator|v_count_nxt[3]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count_nxt[3]~3_combout\ = (\generator|Add1~6_combout\ & !\generator|process_1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Add1~6_combout\,
	datad => \generator|process_1~0_combout\,
	combout => \generator|v_count_nxt[3]~3_combout\);

-- Location: FF_X30_Y20_N29
\generator|v_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count_nxt[3]~3_combout\,
	ena => \generator|Equal1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(3));

-- Location: LCCOMB_X30_Y20_N6
\generator|Add1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add1~0_combout\ = \generator|v_count\(0) $ (VCC)
-- \generator|Add1~1\ = CARRY(\generator|v_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(0),
	datad => VCC,
	combout => \generator|Add1~0_combout\,
	cout => \generator|Add1~1\);

-- Location: LCCOMB_X30_Y20_N8
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

-- Location: LCCOMB_X30_Y20_N26
\generator|v_count_nxt[1]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count_nxt[1]~2_combout\ = (\generator|Add1~2_combout\ & !\generator|process_1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \generator|Add1~2_combout\,
	datad => \generator|process_1~0_combout\,
	combout => \generator|v_count_nxt[1]~2_combout\);

-- Location: FF_X30_Y20_N27
\generator|v_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count_nxt[1]~2_combout\,
	ena => \generator|Equal1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(1));

-- Location: LCCOMB_X30_Y20_N0
\generator|v_count_nxt[2]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count_nxt[2]~1_combout\ = (\generator|Add1~4_combout\ & !\generator|process_1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Add1~4_combout\,
	datad => \generator|process_1~0_combout\,
	combout => \generator|v_count_nxt[2]~1_combout\);

-- Location: FF_X30_Y20_N1
\generator|v_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count_nxt[2]~1_combout\,
	ena => \generator|Equal1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(2));

-- Location: LCCOMB_X30_Y20_N2
\generator|LessThan6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|LessThan6~0_combout\ = (!\generator|v_count\(4) & (((!\generator|v_count\(1) & !\generator|v_count\(2))) # (!\generator|v_count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(4),
	datab => \generator|v_count\(3),
	datac => \generator|v_count\(1),
	datad => \generator|v_count\(2),
	combout => \generator|LessThan6~0_combout\);

-- Location: LCCOMB_X30_Y20_N14
\generator|Add1~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add1~8_combout\ = (\generator|v_count\(4) & (\generator|Add1~7\ $ (GND))) # (!\generator|v_count\(4) & (!\generator|Add1~7\ & VCC))
-- \generator|Add1~9\ = CARRY((\generator|v_count\(4) & !\generator|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(4),
	datad => VCC,
	cin => \generator|Add1~7\,
	combout => \generator|Add1~8_combout\,
	cout => \generator|Add1~9\);

-- Location: LCCOMB_X30_Y20_N16
\generator|Add1~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add1~10_combout\ = (\generator|v_count\(5) & (!\generator|Add1~9\)) # (!\generator|v_count\(5) & ((\generator|Add1~9\) # (GND)))
-- \generator|Add1~11\ = CARRY((!\generator|Add1~9\) # (!\generator|v_count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \generator|v_count\(5),
	datad => VCC,
	cin => \generator|Add1~9\,
	combout => \generator|Add1~10_combout\,
	cout => \generator|Add1~11\);

-- Location: LCCOMB_X31_Y20_N26
\generator|v_count_nxt[5]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count_nxt[5]~7_combout\ = (!\generator|process_1~0_combout\ & \generator|Add1~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|process_1~0_combout\,
	datac => \generator|Add1~10_combout\,
	combout => \generator|v_count_nxt[5]~7_combout\);

-- Location: FF_X31_Y20_N27
\generator|v_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count_nxt[5]~7_combout\,
	ena => \generator|Equal1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(5));

-- Location: LCCOMB_X30_Y20_N18
\generator|Add1~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add1~12_combout\ = (\generator|v_count\(6) & (\generator|Add1~11\ $ (GND))) # (!\generator|v_count\(6) & (!\generator|Add1~11\ & VCC))
-- \generator|Add1~13\ = CARRY((\generator|v_count\(6) & !\generator|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \generator|v_count\(6),
	datad => VCC,
	cin => \generator|Add1~11\,
	combout => \generator|Add1~12_combout\,
	cout => \generator|Add1~13\);

-- Location: LCCOMB_X31_Y20_N8
\generator|v_count_nxt[6]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count_nxt[6]~6_combout\ = (\generator|Add1~12_combout\ & !\generator|process_1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \generator|Add1~12_combout\,
	datac => \generator|process_1~0_combout\,
	combout => \generator|v_count_nxt[6]~6_combout\);

-- Location: FF_X31_Y20_N9
\generator|v_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count_nxt[6]~6_combout\,
	ena => \generator|Equal1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(6));

-- Location: LCCOMB_X30_Y20_N20
\generator|Add1~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|Add1~14_combout\ = (\generator|v_count\(7) & (!\generator|Add1~13\)) # (!\generator|v_count\(7) & ((\generator|Add1~13\) # (GND)))
-- \generator|Add1~15\ = CARRY((!\generator|Add1~13\) # (!\generator|v_count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(7),
	datad => VCC,
	cin => \generator|Add1~13\,
	combout => \generator|Add1~14_combout\,
	cout => \generator|Add1~15\);

-- Location: LCCOMB_X31_Y20_N4
\generator|v_count_nxt[7]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count_nxt[7]~5_combout\ = (\generator|Add1~14_combout\ & !\generator|process_1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \generator|Add1~14_combout\,
	datac => \generator|process_1~0_combout\,
	combout => \generator|v_count_nxt[7]~5_combout\);

-- Location: FF_X31_Y20_N5
\generator|v_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count_nxt[7]~5_combout\,
	ena => \generator|Equal1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(7));

-- Location: LCCOMB_X31_Y20_N0
\generator|LessThan3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|LessThan3~0_combout\ = (!\generator|v_count\(5) & (!\generator|v_count\(7) & (!\generator|v_count\(6) & !\generator|v_count\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(5),
	datab => \generator|v_count\(7),
	datac => \generator|v_count\(6),
	datad => \generator|v_count\(8),
	combout => \generator|LessThan3~0_combout\);

-- Location: LCCOMB_X31_Y22_N30
\generator|pixel_row[9]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|pixel_row[9]~2_combout\ = (\generator|Equal1~1_combout\ & (((\generator|LessThan6~0_combout\ & \generator|LessThan3~0_combout\)) # (!\generator|v_count\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(9),
	datab => \generator|LessThan6~0_combout\,
	datac => \generator|LessThan3~0_combout\,
	datad => \generator|Equal1~1_combout\,
	combout => \generator|pixel_row[9]~2_combout\);

-- Location: LCCOMB_X31_Y20_N14
\generator|v_count[8]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count[8]~1_combout\ = (\generator|Add1~16_combout\ & ((\generator|pixel_row[9]~2_combout\) # ((\generator|v_count\(8) & !\generator|Equal1~1_combout\)))) # (!\generator|Add1~16_combout\ & (((\generator|v_count\(8) & 
-- !\generator|Equal1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Add1~16_combout\,
	datab => \generator|pixel_row[9]~2_combout\,
	datac => \generator|v_count\(8),
	datad => \generator|Equal1~1_combout\,
	combout => \generator|v_count[8]~1_combout\);

-- Location: FF_X31_Y20_N15
\generator|v_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count[8]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(8));

-- Location: LCCOMB_X31_Y20_N22
\generator|LessThan4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|LessThan4~0_combout\ = (\generator|v_count\(5) & (\generator|v_count\(8) & (\generator|v_count\(6) & \generator|v_count\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(5),
	datab => \generator|v_count\(8),
	datac => \generator|v_count\(6),
	datad => \generator|v_count\(7),
	combout => \generator|LessThan4~0_combout\);

-- Location: LCCOMB_X31_Y20_N30
\generator|LessThan4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|LessThan4~1_combout\ = (\generator|v_count\(9)) # (\generator|LessThan4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(9),
	datac => \generator|LessThan4~0_combout\,
	combout => \generator|LessThan4~1_combout\);

-- Location: LCCOMB_X31_Y20_N12
\generator|v_on\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_on~combout\ = (\generator|pixel_row[9]~2_combout\ & ((!\generator|LessThan4~1_combout\))) # (!\generator|pixel_row[9]~2_combout\ & (\generator|v_on~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_on~combout\,
	datac => \generator|LessThan4~1_combout\,
	datad => \generator|pixel_row[9]~2_combout\,
	combout => \generator|v_on~combout\);

-- Location: LCCOMB_X30_Y22_N2
\generator|pixel_col[7]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|pixel_col[7]~11_combout\ = (\generator|h_count\(9) & ((\generator|h_count\(7)) # ((!\generator|h_count\(8) & \generator|Add0~14_combout\)))) # (!\generator|h_count\(9) & (((\generator|Add0~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(7),
	datab => \generator|h_count\(8),
	datac => \generator|Add0~14_combout\,
	datad => \generator|h_count\(9),
	combout => \generator|pixel_col[7]~11_combout\);

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

-- Location: LCCOMB_X29_Y22_N16
\sprite|Add2~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|Add2~2_combout\ = \sprite|sprite_x_reg\(5) $ (VCC)
-- \sprite|Add2~3\ = CARRY(\sprite|sprite_x_reg\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_x_reg\(5),
	datad => VCC,
	combout => \sprite|Add2~2_combout\,
	cout => \sprite|Add2~3\);

-- Location: LCCOMB_X29_Y22_N18
\sprite|Add2~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|Add2~4_combout\ = (\sprite|sprite_x_reg\(6) & ((\SW[8]~input_o\ & (!\sprite|Add2~3\)) # (!\SW[8]~input_o\ & ((\sprite|Add2~3\) # (GND))))) # (!\sprite|sprite_x_reg\(6) & ((\SW[8]~input_o\ & (\sprite|Add2~3\ & VCC)) # (!\SW[8]~input_o\ & 
-- (!\sprite|Add2~3\))))
-- \sprite|Add2~5\ = CARRY((\sprite|sprite_x_reg\(6) & ((!\sprite|Add2~3\) # (!\SW[8]~input_o\))) # (!\sprite|sprite_x_reg\(6) & (!\SW[8]~input_o\ & !\sprite|Add2~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_x_reg\(6),
	datab => \SW[8]~input_o\,
	datad => VCC,
	cin => \sprite|Add2~3\,
	combout => \sprite|Add2~4_combout\,
	cout => \sprite|Add2~5\);

-- Location: LCCOMB_X29_Y22_N20
\sprite|Add2~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|Add2~6_combout\ = ((\SW[8]~input_o\ $ (\sprite|sprite_x_reg\(7) $ (!\sprite|Add2~5\)))) # (GND)
-- \sprite|Add2~7\ = CARRY((\SW[8]~input_o\ & ((\sprite|sprite_x_reg\(7)) # (!\sprite|Add2~5\))) # (!\SW[8]~input_o\ & (\sprite|sprite_x_reg\(7) & !\sprite|Add2~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \sprite|sprite_x_reg\(7),
	datad => VCC,
	cin => \sprite|Add2~5\,
	combout => \sprite|Add2~6_combout\,
	cout => \sprite|Add2~7\);

-- Location: LCCOMB_X29_Y22_N22
\sprite|Add2~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|Add2~8_combout\ = (\sprite|sprite_x_reg\(8) & ((\SW[8]~input_o\ & (!\sprite|Add2~7\)) # (!\SW[8]~input_o\ & ((\sprite|Add2~7\) # (GND))))) # (!\sprite|sprite_x_reg\(8) & ((\SW[8]~input_o\ & (\sprite|Add2~7\ & VCC)) # (!\SW[8]~input_o\ & 
-- (!\sprite|Add2~7\))))
-- \sprite|Add2~9\ = CARRY((\sprite|sprite_x_reg\(8) & ((!\sprite|Add2~7\) # (!\SW[8]~input_o\))) # (!\sprite|sprite_x_reg\(8) & (!\SW[8]~input_o\ & !\sprite|Add2~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_x_reg\(8),
	datab => \SW[8]~input_o\,
	datad => VCC,
	cin => \sprite|Add2~7\,
	combout => \sprite|Add2~8_combout\,
	cout => \sprite|Add2~9\);

-- Location: LCCOMB_X29_Y22_N30
\sprite|sprite_x_nxt[8]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|sprite_x_nxt[8]~3_combout\ = !\sprite|Add2~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sprite|Add2~8_combout\,
	combout => \sprite|sprite_x_nxt[8]~3_combout\);

-- Location: FF_X29_Y22_N31
\sprite|sprite_x_nxt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce1|ALT_INV_data_out~clkctrl_outclk\,
	d => \sprite|sprite_x_nxt[8]~3_combout\,
	ena => \sprite|sprite_x_nxt[5]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_x_nxt\(8));

-- Location: IOIBUF_X0_Y14_N1
\KEY[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: CLKCTRL_G2
\KEY[0]~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \KEY[0]~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \KEY[0]~inputclkctrl_outclk\);

-- Location: FF_X29_Y22_N5
\sprite|sprite_x_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \sprite|sprite_x_nxt\(8),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_x_reg\(8));

-- Location: LCCOMB_X28_Y22_N28
\sprite|sprite_x_nxt[0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|sprite_x_nxt[0]~feeder_combout\ = \sprite|sprite_x_reg\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sprite|sprite_x_reg\(0),
	combout => \sprite|sprite_x_nxt[0]~feeder_combout\);

-- Location: FF_X28_Y22_N29
\sprite|sprite_x_nxt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce1|ALT_INV_data_out~clkctrl_outclk\,
	d => \sprite|sprite_x_nxt[0]~feeder_combout\,
	ena => \sprite|sprite_x_nxt[5]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_x_nxt\(0));

-- Location: LCCOMB_X28_Y22_N24
\sprite|sprite_x_reg[0]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|sprite_x_reg[0]~feeder_combout\ = \sprite|sprite_x_nxt\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sprite|sprite_x_nxt\(0),
	combout => \sprite|sprite_x_reg[0]~feeder_combout\);

-- Location: FF_X28_Y22_N25
\sprite|sprite_x_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \sprite|sprite_x_reg[0]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_x_reg\(0));

-- Location: LCCOMB_X29_Y22_N0
\sprite|sprite_x_nxt[5]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|sprite_x_nxt[5]~0_combout\ = (\sprite|sprite_x_reg\(5) & ((\sprite|sprite_x_reg\(9)) # (\sprite|sprite_x_reg\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_x_reg\(5),
	datab => \sprite|sprite_x_reg\(9),
	datad => \sprite|sprite_x_reg\(0),
	combout => \sprite|sprite_x_nxt[5]~0_combout\);

-- Location: LCCOMB_X29_Y22_N12
\sprite|sprite_x_nxt[5]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|sprite_x_nxt[5]~1_combout\ = (\sprite|sprite_x_reg\(9) & ((\sprite|sprite_x_reg\(7)) # ((!\sprite|sprite_x_reg\(6) & \sprite|sprite_x_nxt[5]~0_combout\)))) # (!\sprite|sprite_x_reg\(9) & (\sprite|sprite_x_reg\(6) & (!\sprite|sprite_x_reg\(7) & 
-- !\sprite|sprite_x_nxt[5]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_x_reg\(6),
	datab => \sprite|sprite_x_reg\(9),
	datac => \sprite|sprite_x_reg\(7),
	datad => \sprite|sprite_x_nxt[5]~0_combout\,
	combout => \sprite|sprite_x_nxt[5]~1_combout\);

-- Location: LCCOMB_X29_Y22_N4
\sprite|sprite_x_nxt[5]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|sprite_x_nxt[5]~2_combout\ = (\sprite|sprite_x_reg\(8) & ((\sprite|sprite_x_reg\(9) $ (!\SW[8]~input_o\)) # (!\sprite|sprite_x_nxt[5]~1_combout\))) # (!\sprite|sprite_x_reg\(8) & (((\SW[8]~input_o\)) # (!\sprite|sprite_x_reg\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001110111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_x_reg\(9),
	datab => \SW[8]~input_o\,
	datac => \sprite|sprite_x_reg\(8),
	datad => \sprite|sprite_x_nxt[5]~1_combout\,
	combout => \sprite|sprite_x_nxt[5]~2_combout\);

-- Location: FF_X29_Y22_N21
\sprite|sprite_x_nxt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce1|ALT_INV_data_out~clkctrl_outclk\,
	d => \sprite|Add2~6_combout\,
	ena => \sprite|sprite_x_nxt[5]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_x_nxt\(7));

-- Location: FF_X29_Y22_N13
\sprite|sprite_x_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \sprite|sprite_x_nxt\(7),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_x_reg\(7));

-- Location: LCCOMB_X29_Y22_N24
\sprite|Add2~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|Add2~10_combout\ = \SW[8]~input_o\ $ (\sprite|Add2~9\ $ (!\sprite|sprite_x_reg\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \SW[8]~input_o\,
	datad => \sprite|sprite_x_reg\(9),
	cin => \sprite|Add2~9\,
	combout => \sprite|Add2~10_combout\);

-- Location: FF_X29_Y22_N25
\sprite|sprite_x_nxt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce1|ALT_INV_data_out~clkctrl_outclk\,
	d => \sprite|Add2~10_combout\,
	ena => \sprite|sprite_x_nxt[5]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_x_nxt\(9));

-- Location: FF_X29_Y22_N11
\sprite|sprite_x_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \sprite|sprite_x_nxt\(9),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_x_reg\(9));

-- Location: LCCOMB_X29_Y22_N14
\sprite|sprite_x_nxt[6]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|sprite_x_nxt[6]~4_combout\ = !\sprite|Add2~4_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sprite|Add2~4_combout\,
	combout => \sprite|sprite_x_nxt[6]~4_combout\);

-- Location: FF_X29_Y22_N15
\sprite|sprite_x_nxt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce1|ALT_INV_data_out~clkctrl_outclk\,
	d => \sprite|sprite_x_nxt[6]~4_combout\,
	ena => \sprite|sprite_x_nxt[5]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_x_nxt\(6));

-- Location: FF_X29_Y22_N1
\sprite|sprite_x_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \sprite|sprite_x_nxt\(6),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_x_reg\(6));

-- Location: LCCOMB_X28_Y22_N4
\display|Add1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Add1~0_combout\ = \sprite|sprite_x_reg\(0) $ (VCC)
-- \display|Add1~1\ = CARRY(\sprite|sprite_x_reg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sprite|sprite_x_reg\(0),
	datad => VCC,
	combout => \display|Add1~0_combout\,
	cout => \display|Add1~1\);

-- Location: LCCOMB_X28_Y22_N6
\display|Add1~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Add1~3_cout\ = CARRY((!\sprite|sprite_x_reg\(0) & !\display|Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sprite|sprite_x_reg\(0),
	datad => VCC,
	cin => \display|Add1~1\,
	cout => \display|Add1~3_cout\);

-- Location: LCCOMB_X28_Y22_N8
\display|Add1~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Add1~5_cout\ = CARRY((\sprite|sprite_x_reg\(0)) # (!\display|Add1~3_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sprite|sprite_x_reg\(0),
	datad => VCC,
	cin => \display|Add1~3_cout\,
	cout => \display|Add1~5_cout\);

-- Location: LCCOMB_X28_Y22_N10
\display|Add1~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Add1~7_cout\ = CARRY((!\sprite|sprite_x_reg\(0) & !\display|Add1~5_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sprite|sprite_x_reg\(0),
	datad => VCC,
	cin => \display|Add1~5_cout\,
	cout => \display|Add1~7_cout\);

-- Location: LCCOMB_X28_Y22_N12
\display|Add1~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Add1~9_cout\ = CARRY((\sprite|sprite_x_reg\(0) & !\display|Add1~7_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sprite|sprite_x_reg\(0),
	datad => VCC,
	cin => \display|Add1~7_cout\,
	cout => \display|Add1~9_cout\);

-- Location: LCCOMB_X28_Y22_N14
\display|Add1~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Add1~10_combout\ = (\sprite|sprite_x_reg\(5) & (!\display|Add1~9_cout\)) # (!\sprite|sprite_x_reg\(5) & ((\display|Add1~9_cout\) # (GND)))
-- \display|Add1~11\ = CARRY((!\display|Add1~9_cout\) # (!\sprite|sprite_x_reg\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_x_reg\(5),
	datad => VCC,
	cin => \display|Add1~9_cout\,
	combout => \display|Add1~10_combout\,
	cout => \display|Add1~11\);

-- Location: LCCOMB_X28_Y22_N20
\display|Add1~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Add1~16_combout\ = (\sprite|sprite_x_reg\(8) & (!\display|Add1~15\ & VCC)) # (!\sprite|sprite_x_reg\(8) & (\display|Add1~15\ $ (GND)))
-- \display|Add1~17\ = CARRY((!\sprite|sprite_x_reg\(8) & !\display|Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sprite|sprite_x_reg\(8),
	datad => VCC,
	cin => \display|Add1~15\,
	combout => \display|Add1~16_combout\,
	cout => \display|Add1~17\);

-- Location: LCCOMB_X28_Y22_N22
\display|Add1~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Add1~18_combout\ = \sprite|sprite_x_reg\(9) $ (\display|Add1~17\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sprite|sprite_x_reg\(9),
	cin => \display|Add1~17\,
	combout => \display|Add1~18_combout\);

-- Location: LCCOMB_X32_Y22_N14
\generator|LessThan0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|LessThan0~0_combout\ = (\generator|h_count\(9) & ((\generator|h_count\(7)) # (\generator|h_count\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \generator|h_count\(7),
	datac => \generator|h_count\(8),
	datad => \generator|h_count\(9),
	combout => \generator|LessThan0~0_combout\);

-- Location: LCCOMB_X32_Y22_N24
\display|LessThan3~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan3~9_combout\ = ((!\generator|h_count\(8) & ((\display|Add1~18_combout\) # (!\generator|h_count\(7))))) # (!\generator|h_count\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(8),
	datab => \generator|h_count\(7),
	datac => \display|Add1~18_combout\,
	datad => \generator|h_count\(9),
	combout => \display|LessThan3~9_combout\);

-- Location: LCCOMB_X30_Y22_N28
\display|LessThan3~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan3~2_combout\ = \display|Add1~16_combout\ $ (((\display|LessThan3~9_combout\ & ((\generator|LessThan0~0_combout\) # (!\generator|Add0~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Add1~16_combout\,
	datab => \generator|LessThan0~0_combout\,
	datac => \display|LessThan3~9_combout\,
	datad => \generator|Add0~16_combout\,
	combout => \display|LessThan3~2_combout\);

-- Location: LCCOMB_X30_Y22_N22
\display|LessThan3~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan3~3_combout\ = (\display|LessThan3~2_combout\ & (\display|Add1~18_combout\ $ (((!\generator|LessThan0~0_combout\ & !\generator|Add0~18_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|LessThan0~0_combout\,
	datab => \generator|Add0~18_combout\,
	datac => \display|Add1~18_combout\,
	datad => \display|LessThan3~2_combout\,
	combout => \display|LessThan3~3_combout\);

-- Location: LCCOMB_X32_Y22_N16
\display|LessThan3~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan3~4_combout\ = (\generator|LessThan0~0_combout\ & (\generator|h_count\(4) & (\generator|h_count\(5) $ (!\display|Add1~10_combout\)))) # (!\generator|LessThan0~0_combout\ & (((\display|Add1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|LessThan0~0_combout\,
	datab => \generator|h_count\(4),
	datac => \generator|h_count\(5),
	datad => \display|Add1~10_combout\,
	combout => \display|LessThan3~4_combout\);

-- Location: LCCOMB_X31_Y22_N24
\display|LessThan3~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan3~5_combout\ = (\generator|LessThan0~0_combout\ & (\display|LessThan3~4_combout\)) # (!\generator|LessThan0~0_combout\ & (\generator|Add0~8_combout\ & (\display|LessThan3~4_combout\ $ (!\generator|Add0~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|LessThan0~0_combout\,
	datab => \display|LessThan3~4_combout\,
	datac => \generator|Add0~8_combout\,
	datad => \generator|Add0~10_combout\,
	combout => \display|LessThan3~5_combout\);

-- Location: FF_X32_Y22_N11
\generator|h_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \generator|Add0~12_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(6));

-- Location: LCCOMB_X30_Y22_N8
\display|process_0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|process_0~6_combout\ = (\generator|LessThan0~0_combout\ & (\generator|h_count\(6))) # (!\generator|LessThan0~0_combout\ & ((\generator|Add0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \generator|h_count\(6),
	datac => \generator|Add0~12_combout\,
	datad => \generator|LessThan0~0_combout\,
	combout => \display|process_0~6_combout\);

-- Location: LCCOMB_X30_Y22_N4
\generator|pixel_col[5]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|pixel_col[5]~6_combout\ = (\generator|LessThan0~0_combout\ & ((\generator|h_count\(5)))) # (!\generator|LessThan0~0_combout\ & (\generator|Add0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \generator|LessThan0~0_combout\,
	datac => \generator|Add0~10_combout\,
	datad => \generator|h_count\(5),
	combout => \generator|pixel_col[5]~6_combout\);

-- Location: LCCOMB_X32_Y22_N12
\generator|h_count[1]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|h_count[1]~feeder_combout\ = \generator|Add0~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \generator|Add0~2_combout\,
	combout => \generator|h_count[1]~feeder_combout\);

-- Location: FF_X32_Y22_N13
\generator|h_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|h_count[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|h_count\(1));

-- Location: LCCOMB_X32_Y22_N10
\display|LessThan3~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan3~6_combout\ = (\generator|h_count\(2) & (\generator|h_count\(1) & \generator|h_count\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(2),
	datab => \generator|h_count\(1),
	datad => \generator|h_count\(0),
	combout => \display|LessThan3~6_combout\);

-- Location: LCCOMB_X31_Y22_N26
\display|LessThan3~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan3~7_combout\ = (\generator|Add0~0_combout\ & (\generator|Add0~4_combout\ & (\generator|Add0~6_combout\ & \generator|Add0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Add0~0_combout\,
	datab => \generator|Add0~4_combout\,
	datac => \generator|Add0~6_combout\,
	datad => \generator|Add0~2_combout\,
	combout => \display|LessThan3~7_combout\);

-- Location: LCCOMB_X30_Y22_N6
\display|LessThan3~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan3~8_combout\ = (\generator|LessThan0~0_combout\ & (\generator|h_count\(3) & (\display|LessThan3~6_combout\))) # (!\generator|LessThan0~0_combout\ & (((\display|LessThan3~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|LessThan0~0_combout\,
	datab => \generator|h_count\(3),
	datac => \display|LessThan3~6_combout\,
	datad => \display|LessThan3~7_combout\,
	combout => \display|LessThan3~8_combout\);

-- Location: LCCOMB_X30_Y22_N24
\display|process_0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|process_0~3_combout\ = (\display|Add1~10_combout\ & (!\display|Add1~0_combout\ & (\generator|pixel_col[5]~6_combout\ & \display|LessThan3~8_combout\))) # (!\display|Add1~10_combout\ & ((\generator|pixel_col[5]~6_combout\) # 
-- ((!\display|Add1~0_combout\ & \display|LessThan3~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Add1~10_combout\,
	datab => \display|Add1~0_combout\,
	datac => \generator|pixel_col[5]~6_combout\,
	datad => \display|LessThan3~8_combout\,
	combout => \display|process_0~3_combout\);

-- Location: LCCOMB_X30_Y22_N10
\display|process_0~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|process_0~7_combout\ = (\display|Add1~12_combout\ & (\display|process_0~6_combout\ & ((\display|LessThan3~5_combout\) # (\display|process_0~3_combout\)))) # (!\display|Add1~12_combout\ & ((\display|LessThan3~5_combout\) # 
-- ((\display|process_0~6_combout\) # (\display|process_0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Add1~12_combout\,
	datab => \display|LessThan3~5_combout\,
	datac => \display|process_0~6_combout\,
	datad => \display|process_0~3_combout\,
	combout => \display|process_0~7_combout\);

-- Location: LCCOMB_X30_Y22_N26
\display|process_0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|process_0~4_combout\ = ((\display|Add1~14_combout\ & ((!\display|process_0~7_combout\) # (!\generator|pixel_col[7]~11_combout\))) # (!\display|Add1~14_combout\ & (!\generator|pixel_col[7]~11_combout\ & !\display|process_0~7_combout\))) # 
-- (!\display|LessThan3~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Add1~14_combout\,
	datab => \generator|pixel_col[7]~11_combout\,
	datac => \display|LessThan3~3_combout\,
	datad => \display|process_0~7_combout\,
	combout => \display|process_0~4_combout\);

-- Location: FF_X29_Y22_N17
\sprite|sprite_x_nxt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce1|ALT_INV_data_out~clkctrl_outclk\,
	d => \sprite|Add2~2_combout\,
	ena => \sprite|sprite_x_nxt[5]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_x_nxt\(5));

-- Location: LCCOMB_X29_Y22_N6
\sprite|sprite_x_reg[5]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|sprite_x_reg[5]~feeder_combout\ = \sprite|sprite_x_nxt\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sprite|sprite_x_nxt\(5),
	combout => \sprite|sprite_x_reg[5]~feeder_combout\);

-- Location: FF_X29_Y22_N7
\sprite|sprite_x_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \sprite|sprite_x_reg[5]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_x_reg\(5));

-- Location: LCCOMB_X31_Y22_N22
\display|LessThan2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan2~0_combout\ = (\generator|LessThan0~0_combout\ & (((\sprite|sprite_x_reg\(6))))) # (!\generator|LessThan0~0_combout\ & (!\generator|Add0~10_combout\ & (\sprite|sprite_x_reg\(6) $ (\generator|Add0~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000111000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Add0~10_combout\,
	datab => \sprite|sprite_x_reg\(6),
	datac => \generator|LessThan0~0_combout\,
	datad => \generator|Add0~12_combout\,
	combout => \display|LessThan2~0_combout\);

-- Location: LCCOMB_X30_Y22_N20
\display|LessThan2~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan2~1_combout\ = (\generator|LessThan0~0_combout\ & (!\generator|h_count\(5) & (\generator|h_count\(6) $ (\display|LessThan2~0_combout\)))) # (!\generator|LessThan0~0_combout\ & (((\display|LessThan2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(6),
	datab => \generator|h_count\(5),
	datac => \generator|LessThan0~0_combout\,
	datad => \display|LessThan2~0_combout\,
	combout => \display|LessThan2~1_combout\);

-- Location: LCCOMB_X30_Y22_N14
\display|LessThan2~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan2~2_combout\ = (\sprite|sprite_x_reg\(7) & (((\sprite|sprite_x_reg\(5) & \display|LessThan2~1_combout\)) # (!\generator|pixel_col[7]~11_combout\))) # (!\sprite|sprite_x_reg\(7) & (!\generator|pixel_col[7]~11_combout\ & 
-- (\sprite|sprite_x_reg\(5) & \display|LessThan2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_x_reg\(7),
	datab => \generator|pixel_col[7]~11_combout\,
	datac => \sprite|sprite_x_reg\(5),
	datad => \display|LessThan2~1_combout\,
	combout => \display|LessThan2~2_combout\);

-- Location: LCCOMB_X30_Y22_N0
\generator|pixel_col[6]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|pixel_col[6]~7_combout\ = (\generator|LessThan0~0_combout\ & (\generator|h_count\(6))) # (!\generator|LessThan0~0_combout\ & ((\generator|Add0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \generator|h_count\(6),
	datac => \generator|Add0~12_combout\,
	datad => \generator|LessThan0~0_combout\,
	combout => \generator|pixel_col[6]~7_combout\);

-- Location: LCCOMB_X31_Y22_N20
\generator|pixel_col[4]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|pixel_col[4]~8_combout\ = (\generator|LessThan0~0_combout\ & (\generator|h_count\(4))) # (!\generator|LessThan0~0_combout\ & ((\generator|Add0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|LessThan0~0_combout\,
	datab => \generator|h_count\(4),
	datad => \generator|Add0~8_combout\,
	combout => \generator|pixel_col[4]~8_combout\);

-- Location: LCCOMB_X30_Y22_N16
\display|LessThan2~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan2~4_combout\ = (\sprite|sprite_x_reg\(0) & ((!\display|LessThan3~8_combout\) # (!\generator|pixel_col[4]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sprite|sprite_x_reg\(0),
	datac => \generator|pixel_col[4]~8_combout\,
	datad => \display|LessThan3~8_combout\,
	combout => \display|LessThan2~4_combout\);

-- Location: LCCOMB_X30_Y22_N18
\display|LessThan2~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan2~5_combout\ = (\generator|pixel_col[6]~7_combout\ & ((\display|LessThan2~3_combout\) # ((\sprite|sprite_x_reg\(6)) # (!\display|LessThan2~4_combout\)))) # (!\generator|pixel_col[6]~7_combout\ & (\sprite|sprite_x_reg\(6) & 
-- ((\display|LessThan2~3_combout\) # (!\display|LessThan2~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|LessThan2~3_combout\,
	datab => \generator|pixel_col[6]~7_combout\,
	datac => \sprite|sprite_x_reg\(6),
	datad => \display|LessThan2~4_combout\,
	combout => \display|LessThan2~5_combout\);

-- Location: LCCOMB_X30_Y22_N12
\display|LessThan2~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan2~6_combout\ = (\display|LessThan2~2_combout\) # ((!\display|LessThan2~5_combout\ & (\sprite|sprite_x_reg\(7) $ (!\generator|pixel_col[7]~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_x_reg\(7),
	datab => \generator|pixel_col[7]~11_combout\,
	datac => \display|LessThan2~2_combout\,
	datad => \display|LessThan2~5_combout\,
	combout => \display|LessThan2~6_combout\);

-- Location: LCCOMB_X29_Y22_N26
\generator|pixel_col[9]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|pixel_col[9]~9_combout\ = (\generator|Add0~18_combout\) # ((\generator|h_count\(9) & ((\generator|h_count\(8)) # (\generator|h_count\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(8),
	datab => \generator|h_count\(7),
	datac => \generator|h_count\(9),
	datad => \generator|Add0~18_combout\,
	combout => \generator|pixel_col[9]~9_combout\);

-- Location: LCCOMB_X28_Y22_N2
\generator|pixel_col[8]~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|pixel_col[8]~10_combout\ = (\generator|h_count\(9) & ((\generator|h_count\(8)) # ((!\generator|h_count\(7) & \generator|Add0~16_combout\)))) # (!\generator|h_count\(9) & (((\generator|Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(7),
	datab => \generator|h_count\(8),
	datac => \generator|h_count\(9),
	datad => \generator|Add0~16_combout\,
	combout => \generator|pixel_col[8]~10_combout\);

-- Location: LCCOMB_X29_Y22_N2
\display|process_0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|process_0~1_combout\ = (\display|Add1~18_combout\ & ((\display|Add1~16_combout\) # ((!\generator|pixel_col[8]~10_combout\) # (!\generator|pixel_col[9]~9_combout\)))) # (!\display|Add1~18_combout\ & (!\generator|pixel_col[9]~9_combout\ & 
-- ((\display|Add1~16_combout\) # (!\generator|pixel_col[8]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Add1~18_combout\,
	datab => \display|Add1~16_combout\,
	datac => \generator|pixel_col[9]~9_combout\,
	datad => \generator|pixel_col[8]~10_combout\,
	combout => \display|process_0~1_combout\);

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

-- Location: LCCOMB_X29_Y19_N0
\sprite|Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|Add0~2_combout\ = \sprite|sprite_y_reg\(5) $ (GND)
-- \sprite|Add0~3\ = CARRY(!\sprite|sprite_y_reg\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_y_reg\(5),
	datad => VCC,
	combout => \sprite|Add0~2_combout\,
	cout => \sprite|Add0~3\);

-- Location: LCCOMB_X29_Y19_N2
\sprite|Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|Add0~4_combout\ = (\sprite|sprite_y_reg\(6) & ((\SW[9]~input_o\ & (!\sprite|Add0~3\)) # (!\SW[9]~input_o\ & ((\sprite|Add0~3\) # (GND))))) # (!\sprite|sprite_y_reg\(6) & ((\SW[9]~input_o\ & (\sprite|Add0~3\ & VCC)) # (!\SW[9]~input_o\ & 
-- (!\sprite|Add0~3\))))
-- \sprite|Add0~5\ = CARRY((\sprite|sprite_y_reg\(6) & ((!\sprite|Add0~3\) # (!\SW[9]~input_o\))) # (!\sprite|sprite_y_reg\(6) & (!\SW[9]~input_o\ & !\sprite|Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_y_reg\(6),
	datab => \SW[9]~input_o\,
	datad => VCC,
	cin => \sprite|Add0~3\,
	combout => \sprite|Add0~4_combout\,
	cout => \sprite|Add0~5\);

-- Location: LCCOMB_X29_Y19_N4
\sprite|Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|Add0~6_combout\ = ((\sprite|sprite_y_reg\(7) $ (\SW[9]~input_o\ $ (\sprite|Add0~5\)))) # (GND)
-- \sprite|Add0~7\ = CARRY((\sprite|sprite_y_reg\(7) & (\SW[9]~input_o\ & !\sprite|Add0~5\)) # (!\sprite|sprite_y_reg\(7) & ((\SW[9]~input_o\) # (!\sprite|Add0~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_y_reg\(7),
	datab => \SW[9]~input_o\,
	datad => VCC,
	cin => \sprite|Add0~5\,
	combout => \sprite|Add0~6_combout\,
	cout => \sprite|Add0~7\);

-- Location: LCCOMB_X29_Y19_N6
\sprite|Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|Add0~8_combout\ = (\SW[9]~input_o\ & ((\sprite|sprite_y_reg\(8) & (\sprite|Add0~7\ & VCC)) # (!\sprite|sprite_y_reg\(8) & (!\sprite|Add0~7\)))) # (!\SW[9]~input_o\ & ((\sprite|sprite_y_reg\(8) & (!\sprite|Add0~7\)) # (!\sprite|sprite_y_reg\(8) & 
-- ((\sprite|Add0~7\) # (GND)))))
-- \sprite|Add0~9\ = CARRY((\SW[9]~input_o\ & (!\sprite|sprite_y_reg\(8) & !\sprite|Add0~7\)) # (!\SW[9]~input_o\ & ((!\sprite|Add0~7\) # (!\sprite|sprite_y_reg\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \sprite|sprite_y_reg\(8),
	datad => VCC,
	cin => \sprite|Add0~7\,
	combout => \sprite|Add0~8_combout\,
	cout => \sprite|Add0~9\);

-- Location: LCCOMB_X29_Y19_N16
\sprite|sprite_y_nxt[7]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|sprite_y_nxt[7]~3_combout\ = !\sprite|Add0~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sprite|Add0~6_combout\,
	combout => \sprite|sprite_y_nxt[7]~3_combout\);

-- Location: FF_X29_Y19_N17
\sprite|sprite_y_nxt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce2|ALT_INV_data_out~clkctrl_outclk\,
	d => \sprite|sprite_y_nxt[7]~3_combout\,
	ena => \sprite|sprite_y_nxt[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_y_nxt\(7));

-- Location: LCCOMB_X28_Y19_N12
\sprite|sprite_y_reg[7]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|sprite_y_reg[7]~feeder_combout\ = \sprite|sprite_y_nxt\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sprite|sprite_y_nxt\(7),
	combout => \sprite|sprite_y_reg[7]~feeder_combout\);

-- Location: FF_X28_Y19_N13
\sprite|sprite_y_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \sprite|sprite_y_reg[7]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_y_reg\(7));

-- Location: LCCOMB_X29_Y19_N14
\sprite|sprite_y_nxt[6]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|sprite_y_nxt[6]~4_combout\ = !\sprite|Add0~4_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sprite|Add0~4_combout\,
	combout => \sprite|sprite_y_nxt[6]~4_combout\);

-- Location: FF_X29_Y19_N15
\sprite|sprite_y_nxt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce2|ALT_INV_data_out~clkctrl_outclk\,
	d => \sprite|sprite_y_nxt[6]~4_combout\,
	ena => \sprite|sprite_y_nxt[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_y_nxt\(6));

-- Location: FF_X29_Y19_N13
\sprite|sprite_y_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \sprite|sprite_y_nxt\(6),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_y_reg\(6));

-- Location: LCCOMB_X28_Y19_N26
\sprite|LessThan1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|LessThan1~0_combout\ = (\sprite|sprite_y_reg\(9)) # ((!\sprite|sprite_y_reg\(7) & (!\sprite|sprite_y_reg\(6) & \sprite|sprite_y_reg\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_y_reg\(9),
	datab => \sprite|sprite_y_reg\(7),
	datac => \sprite|sprite_y_reg\(6),
	datad => \sprite|sprite_y_reg\(8),
	combout => \sprite|LessThan1~0_combout\);

-- Location: LCCOMB_X29_Y19_N12
\sprite|LessThan0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|LessThan0~1_combout\ = (!\sprite|sprite_y_reg\(7)) # (!\sprite|sprite_y_reg\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sprite|sprite_y_reg\(6),
	datad => \sprite|sprite_y_reg\(7),
	combout => \sprite|LessThan0~1_combout\);

-- Location: LCCOMB_X28_Y19_N18
\sprite|sprite_y_nxt~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|sprite_y_nxt~1_combout\ = (\SW[9]~input_o\ & ((\sprite|LessThan0~0_combout\) # ((\sprite|LessThan0~1_combout\)))) # (!\SW[9]~input_o\ & (((!\sprite|LessThan1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100011111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \sprite|LessThan0~0_combout\,
	datac => \sprite|LessThan0~1_combout\,
	datad => \sprite|LessThan1~0_combout\,
	combout => \sprite|sprite_y_nxt~1_combout\);

-- Location: LCCOMB_X28_Y19_N24
\sprite|sprite_y_nxt[4]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|sprite_y_nxt[4]~2_combout\ = (\sprite|sprite_y_nxt~1_combout\ & (\sprite|sprite_y_reg\(4))) # (!\sprite|sprite_y_nxt~1_combout\ & ((\sprite|sprite_y_nxt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sprite|sprite_y_reg\(4),
	datac => \sprite|sprite_y_nxt\(4),
	datad => \sprite|sprite_y_nxt~1_combout\,
	combout => \sprite|sprite_y_nxt[4]~2_combout\);

-- Location: FF_X28_Y19_N25
\sprite|sprite_y_nxt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce2|ALT_INV_data_out~clkctrl_outclk\,
	d => \sprite|sprite_y_nxt[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_y_nxt\(4));

-- Location: LCCOMB_X28_Y19_N2
\sprite|sprite_y_reg[4]~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|sprite_y_reg[4]~feeder_combout\ = \sprite|sprite_y_nxt\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sprite|sprite_y_nxt\(4),
	combout => \sprite|sprite_y_reg[4]~feeder_combout\);

-- Location: FF_X28_Y19_N3
\sprite|sprite_y_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \sprite|sprite_y_reg[4]~feeder_combout\,
	clrn => \KEY[0]~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_y_reg\(4));

-- Location: LCCOMB_X29_Y19_N10
\sprite|sprite_y_nxt[5]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|sprite_y_nxt[5]~5_combout\ = !\sprite|Add0~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sprite|Add0~2_combout\,
	combout => \sprite|sprite_y_nxt[5]~5_combout\);

-- Location: FF_X29_Y19_N11
\sprite|sprite_y_nxt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce2|ALT_INV_data_out~clkctrl_outclk\,
	d => \sprite|sprite_y_nxt[5]~5_combout\,
	ena => \sprite|sprite_y_nxt[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_y_nxt\(5));

-- Location: FF_X29_Y19_N1
\sprite|sprite_y_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \sprite|sprite_y_nxt\(5),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_y_reg\(5));

-- Location: LCCOMB_X28_Y19_N20
\sprite|LessThan0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|LessThan0~0_combout\ = (\sprite|sprite_y_reg\(8)) # ((\sprite|sprite_y_reg\(9)) # ((!\sprite|sprite_y_reg\(4) & !\sprite|sprite_y_reg\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_y_reg\(8),
	datab => \sprite|sprite_y_reg\(4),
	datac => \sprite|sprite_y_reg\(5),
	datad => \sprite|sprite_y_reg\(9),
	combout => \sprite|LessThan0~0_combout\);

-- Location: LCCOMB_X29_Y19_N18
\sprite|sprite_y_nxt[9]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|sprite_y_nxt[9]~0_combout\ = (\SW[9]~input_o\ & ((\sprite|LessThan0~1_combout\) # ((\sprite|LessThan0~0_combout\)))) # (!\SW[9]~input_o\ & (((!\sprite|LessThan1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|LessThan0~1_combout\,
	datab => \SW[9]~input_o\,
	datac => \sprite|LessThan1~0_combout\,
	datad => \sprite|LessThan0~0_combout\,
	combout => \sprite|sprite_y_nxt[9]~0_combout\);

-- Location: FF_X29_Y19_N7
\sprite|sprite_y_nxt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce2|ALT_INV_data_out~clkctrl_outclk\,
	d => \sprite|Add0~8_combout\,
	ena => \sprite|sprite_y_nxt[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_y_nxt\(8));

-- Location: FF_X29_Y19_N5
\sprite|sprite_y_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \sprite|sprite_y_nxt\(8),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_y_reg\(8));

-- Location: LCCOMB_X29_Y19_N8
\sprite|Add0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \sprite|Add0~10_combout\ = \SW[9]~input_o\ $ (\sprite|sprite_y_reg\(9) $ (!\sprite|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \sprite|sprite_y_reg\(9),
	cin => \sprite|Add0~9\,
	combout => \sprite|Add0~10_combout\);

-- Location: FF_X29_Y19_N9
\sprite|sprite_y_nxt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \debounce2|ALT_INV_data_out~clkctrl_outclk\,
	d => \sprite|Add0~10_combout\,
	ena => \sprite|sprite_y_nxt[9]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_y_nxt\(9));

-- Location: FF_X29_Y19_N3
\sprite|sprite_y_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \sprite|sprite_y_nxt\(9),
	clrn => \KEY[0]~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sprite|sprite_y_reg\(9));

-- Location: LCCOMB_X30_Y20_N24
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

-- Location: LCCOMB_X30_Y19_N26
\generator|pixel_row[9]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|pixel_row[9]~8_combout\ = (\generator|v_count\(9)) # ((!\generator|LessThan4~0_combout\ & (\generator|Add1~18_combout\ & \generator|pixel_row[9]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|LessThan4~0_combout\,
	datab => \generator|Add1~18_combout\,
	datac => \generator|v_count\(9),
	datad => \generator|pixel_row[9]~2_combout\,
	combout => \generator|pixel_row[9]~8_combout\);

-- Location: LCCOMB_X30_Y19_N8
\generator|pixel_row[6]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|pixel_row[6]~5_combout\ = (\generator|LessThan4~1_combout\ & (\generator|v_count\(6))) # (!\generator|LessThan4~1_combout\ & ((\generator|pixel_row[9]~2_combout\ & ((\generator|Add1~12_combout\))) # (!\generator|pixel_row[9]~2_combout\ & 
-- (\generator|v_count\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(6),
	datab => \generator|LessThan4~1_combout\,
	datac => \generator|Add1~12_combout\,
	datad => \generator|pixel_row[9]~2_combout\,
	combout => \generator|pixel_row[6]~5_combout\);

-- Location: LCCOMB_X30_Y19_N10
\generator|pixel_row[5]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|pixel_row[5]~6_combout\ = (\generator|LessThan4~1_combout\ & (((\generator|v_count\(5))))) # (!\generator|LessThan4~1_combout\ & ((\generator|pixel_row[9]~2_combout\ & (\generator|Add1~10_combout\)) # (!\generator|pixel_row[9]~2_combout\ & 
-- ((\generator|v_count\(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Add1~10_combout\,
	datab => \generator|LessThan4~1_combout\,
	datac => \generator|v_count\(5),
	datad => \generator|pixel_row[9]~2_combout\,
	combout => \generator|pixel_row[5]~6_combout\);

-- Location: LCCOMB_X30_Y20_N30
\generator|v_count_nxt[4]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count_nxt[4]~0_combout\ = (\generator|Add1~8_combout\ & !\generator|process_1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \generator|Add1~8_combout\,
	datad => \generator|process_1~0_combout\,
	combout => \generator|v_count_nxt[4]~0_combout\);

-- Location: FF_X30_Y20_N31
\generator|v_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count_nxt[4]~0_combout\,
	ena => \generator|Equal1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(4));

-- Location: LCCOMB_X30_Y19_N12
\generator|pixel_row[4]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|pixel_row[4]~7_combout\ = (\generator|LessThan4~1_combout\ & (((\generator|v_count\(4))))) # (!\generator|LessThan4~1_combout\ & ((\generator|pixel_row[9]~2_combout\ & (\generator|Add1~8_combout\)) # (!\generator|pixel_row[9]~2_combout\ & 
-- ((\generator|v_count\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Add1~8_combout\,
	datab => \generator|v_count\(4),
	datac => \generator|LessThan4~1_combout\,
	datad => \generator|pixel_row[9]~2_combout\,
	combout => \generator|pixel_row[4]~7_combout\);

-- Location: LCCOMB_X29_Y19_N20
\display|LessThan1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan1~1_cout\ = CARRY((\sprite|sprite_y_reg\(4) & \generator|pixel_row[4]~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_y_reg\(4),
	datab => \generator|pixel_row[4]~7_combout\,
	datad => VCC,
	cout => \display|LessThan1~1_cout\);

-- Location: LCCOMB_X29_Y19_N22
\display|LessThan1~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan1~3_cout\ = CARRY((\sprite|sprite_y_reg\(5) & (!\generator|pixel_row[5]~6_combout\ & !\display|LessThan1~1_cout\)) # (!\sprite|sprite_y_reg\(5) & ((!\display|LessThan1~1_cout\) # (!\generator|pixel_row[5]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_y_reg\(5),
	datab => \generator|pixel_row[5]~6_combout\,
	datad => VCC,
	cin => \display|LessThan1~1_cout\,
	cout => \display|LessThan1~3_cout\);

-- Location: LCCOMB_X29_Y19_N24
\display|LessThan1~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan1~5_cout\ = CARRY((\sprite|sprite_y_reg\(6) & ((\generator|pixel_row[6]~5_combout\) # (!\display|LessThan1~3_cout\))) # (!\sprite|sprite_y_reg\(6) & (\generator|pixel_row[6]~5_combout\ & !\display|LessThan1~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_y_reg\(6),
	datab => \generator|pixel_row[6]~5_combout\,
	datad => VCC,
	cin => \display|LessThan1~3_cout\,
	cout => \display|LessThan1~5_cout\);

-- Location: LCCOMB_X29_Y19_N26
\display|LessThan1~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan1~7_cout\ = CARRY((\generator|pixel_row[7]~4_combout\ & (!\sprite|sprite_y_reg\(7) & !\display|LessThan1~5_cout\)) # (!\generator|pixel_row[7]~4_combout\ & ((!\display|LessThan1~5_cout\) # (!\sprite|sprite_y_reg\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \generator|pixel_row[7]~4_combout\,
	datab => \sprite|sprite_y_reg\(7),
	datad => VCC,
	cin => \display|LessThan1~5_cout\,
	cout => \display|LessThan1~7_cout\);

-- Location: LCCOMB_X29_Y19_N28
\display|LessThan1~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan1~9_cout\ = CARRY((\generator|pixel_row[8]~3_combout\ & ((!\display|LessThan1~7_cout\) # (!\sprite|sprite_y_reg\(8)))) # (!\generator|pixel_row[8]~3_combout\ & (!\sprite|sprite_y_reg\(8) & !\display|LessThan1~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \generator|pixel_row[8]~3_combout\,
	datab => \sprite|sprite_y_reg\(8),
	datad => VCC,
	cin => \display|LessThan1~7_cout\,
	cout => \display|LessThan1~9_cout\);

-- Location: LCCOMB_X29_Y19_N30
\display|LessThan1~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan1~10_combout\ = (\sprite|sprite_y_reg\(9) & (\display|LessThan1~9_cout\ & \generator|pixel_row[9]~8_combout\)) # (!\sprite|sprite_y_reg\(9) & ((\display|LessThan1~9_cout\) # (\generator|pixel_row[9]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sprite|sprite_y_reg\(9),
	datad => \generator|pixel_row[9]~8_combout\,
	cin => \display|LessThan1~9_cout\,
	combout => \display|LessThan1~10_combout\);

-- Location: LCCOMB_X30_Y19_N4
\generator|pixel_row[8]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|pixel_row[8]~3_combout\ = (\generator|LessThan4~1_combout\ & (((\generator|v_count\(8))))) # (!\generator|LessThan4~1_combout\ & ((\generator|pixel_row[9]~2_combout\ & (\generator|Add1~16_combout\)) # (!\generator|pixel_row[9]~2_combout\ & 
-- ((\generator|v_count\(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|Add1~16_combout\,
	datab => \generator|LessThan4~1_combout\,
	datac => \generator|v_count\(8),
	datad => \generator|pixel_row[9]~2_combout\,
	combout => \generator|pixel_row[8]~3_combout\);

-- Location: LCCOMB_X30_Y19_N14
\display|LessThan0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan0~1_cout\ = CARRY((!\generator|pixel_row[4]~7_combout\ & !\sprite|sprite_y_reg\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \generator|pixel_row[4]~7_combout\,
	datab => \sprite|sprite_y_reg\(4),
	datad => VCC,
	cout => \display|LessThan0~1_cout\);

-- Location: LCCOMB_X30_Y19_N16
\display|LessThan0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan0~3_cout\ = CARRY((\generator|pixel_row[5]~6_combout\ & ((\sprite|sprite_y_reg\(5)) # (!\display|LessThan0~1_cout\))) # (!\generator|pixel_row[5]~6_combout\ & (\sprite|sprite_y_reg\(5) & !\display|LessThan0~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \generator|pixel_row[5]~6_combout\,
	datab => \sprite|sprite_y_reg\(5),
	datad => VCC,
	cin => \display|LessThan0~1_cout\,
	cout => \display|LessThan0~3_cout\);

-- Location: LCCOMB_X30_Y19_N18
\display|LessThan0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan0~5_cout\ = CARRY((\sprite|sprite_y_reg\(6) & (!\generator|pixel_row[6]~5_combout\ & !\display|LessThan0~3_cout\)) # (!\sprite|sprite_y_reg\(6) & ((!\display|LessThan0~3_cout\) # (!\generator|pixel_row[6]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_y_reg\(6),
	datab => \generator|pixel_row[6]~5_combout\,
	datad => VCC,
	cin => \display|LessThan0~3_cout\,
	cout => \display|LessThan0~5_cout\);

-- Location: LCCOMB_X30_Y19_N20
\display|LessThan0~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan0~7_cout\ = CARRY((\generator|pixel_row[7]~4_combout\ & ((\sprite|sprite_y_reg\(7)) # (!\display|LessThan0~5_cout\))) # (!\generator|pixel_row[7]~4_combout\ & (\sprite|sprite_y_reg\(7) & !\display|LessThan0~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \generator|pixel_row[7]~4_combout\,
	datab => \sprite|sprite_y_reg\(7),
	datad => VCC,
	cin => \display|LessThan0~5_cout\,
	cout => \display|LessThan0~7_cout\);

-- Location: LCCOMB_X30_Y19_N22
\display|LessThan0~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan0~9_cout\ = CARRY((\sprite|sprite_y_reg\(8) & ((!\display|LessThan0~7_cout\) # (!\generator|pixel_row[8]~3_combout\))) # (!\sprite|sprite_y_reg\(8) & (!\generator|pixel_row[8]~3_combout\ & !\display|LessThan0~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sprite|sprite_y_reg\(8),
	datab => \generator|pixel_row[8]~3_combout\,
	datad => VCC,
	cin => \display|LessThan0~7_cout\,
	cout => \display|LessThan0~9_cout\);

-- Location: LCCOMB_X30_Y19_N24
\display|LessThan0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|LessThan0~10_combout\ = (\generator|pixel_row[9]~8_combout\ & (\display|LessThan0~9_cout\ & \sprite|sprite_y_reg\(9))) # (!\generator|pixel_row[9]~8_combout\ & ((\display|LessThan0~9_cout\) # (\sprite|sprite_y_reg\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \generator|pixel_row[9]~8_combout\,
	datad => \sprite|sprite_y_reg\(9),
	cin => \display|LessThan0~9_cout\,
	combout => \display|LessThan0~10_combout\);

-- Location: LCCOMB_X29_Y22_N28
\display|process_0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|process_0~2_combout\ = (\display|process_0~0_combout\ & (\display|process_0~1_combout\ & (!\display|LessThan1~10_combout\ & !\display|LessThan0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|process_0~0_combout\,
	datab => \display|process_0~1_combout\,
	datac => \display|LessThan1~10_combout\,
	datad => \display|LessThan0~10_combout\,
	combout => \display|process_0~2_combout\);

-- Location: LCCOMB_X29_Y22_N8
\display|process_0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|process_0~5_combout\ = (\display|process_0~4_combout\ & (\display|process_0~2_combout\ & ((!\display|LessThan2~6_combout\) # (!\display|LessThan2~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|LessThan2~7_combout\,
	datab => \display|process_0~4_combout\,
	datac => \display|LessThan2~6_combout\,
	datad => \display|process_0~2_combout\,
	combout => \display|process_0~5_combout\);

-- Location: LCCOMB_X33_Y22_N0
\display|R_VGA~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|R_VGA~7_combout\ = (\generator|h_on~combout\ & (\generator|v_on~combout\ & ((\SW[4]~input_o\) # (\display|process_0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_on~combout\,
	datab => \SW[4]~input_o\,
	datac => \generator|v_on~combout\,
	datad => \display|process_0~5_combout\,
	combout => \display|R_VGA~7_combout\);

-- Location: FF_X33_Y22_N1
\display|R_VGA[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|R_VGA~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|R_VGA\(0));

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

-- Location: LCCOMB_X33_Y22_N10
\display|R_VGA~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|R_VGA~8_combout\ = (\generator|h_on~combout\ & (\generator|v_on~combout\ & ((\SW[5]~input_o\) # (\display|process_0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_on~combout\,
	datab => \SW[5]~input_o\,
	datac => \generator|v_on~combout\,
	datad => \display|process_0~5_combout\,
	combout => \display|R_VGA~8_combout\);

-- Location: FF_X33_Y22_N11
\display|R_VGA[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|R_VGA~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|R_VGA\(1));

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

-- Location: LCCOMB_X33_Y22_N24
\display|R_VGA~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|R_VGA~9_combout\ = (\generator|h_on~combout\ & (\generator|v_on~combout\ & ((\SW[6]~input_o\) # (\display|process_0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_on~combout\,
	datab => \SW[6]~input_o\,
	datac => \generator|v_on~combout\,
	datad => \display|process_0~5_combout\,
	combout => \display|R_VGA~9_combout\);

-- Location: FF_X33_Y22_N25
\display|R_VGA[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|R_VGA~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|R_VGA\(2));

-- Location: LCCOMB_X32_Y22_N2
\generator|h_on\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|h_on~combout\ = (\generator|Equal0~2_combout\ & (\generator|h_on~combout\)) # (!\generator|Equal0~2_combout\ & ((!\generator|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_on~combout\,
	datac => \generator|LessThan0~0_combout\,
	datad => \generator|Equal0~2_combout\,
	combout => \generator|h_on~combout\);

-- Location: LCCOMB_X33_Y22_N2
\generator|video_on\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|video_on~combout\ = (\generator|v_on~combout\ & \generator|h_on~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \generator|v_on~combout\,
	datad => \generator|h_on~combout\,
	combout => \generator|video_on~combout\);

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

-- Location: LCCOMB_X27_Y22_N8
\display|sprite_count[1]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|sprite_count[1]~7_combout\ = (\display|sprite_count\(0) & (\display|sprite_count\(1) $ (VCC))) # (!\display|sprite_count\(0) & (\display|sprite_count\(1) & VCC))
-- \display|sprite_count[1]~8\ = CARRY((\display|sprite_count\(0) & \display|sprite_count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|sprite_count\(0),
	datab => \display|sprite_count\(1),
	datad => VCC,
	combout => \display|sprite_count[1]~7_combout\,
	cout => \display|sprite_count[1]~8\);

-- Location: FF_X27_Y22_N9
\display|sprite_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|sprite_count[1]~7_combout\,
	ena => \display|process_0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|sprite_count\(1));

-- Location: LCCOMB_X27_Y22_N10
\display|sprite_count[2]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|sprite_count[2]~9_combout\ = (\display|sprite_count\(2) & (!\display|sprite_count[1]~8\)) # (!\display|sprite_count\(2) & ((\display|sprite_count[1]~8\) # (GND)))
-- \display|sprite_count[2]~10\ = CARRY((!\display|sprite_count[1]~8\) # (!\display|sprite_count\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|sprite_count\(2),
	datad => VCC,
	cin => \display|sprite_count[1]~8\,
	combout => \display|sprite_count[2]~9_combout\,
	cout => \display|sprite_count[2]~10\);

-- Location: LCCOMB_X27_Y22_N12
\display|sprite_count[3]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|sprite_count[3]~11_combout\ = (\display|sprite_count\(3) & (\display|sprite_count[2]~10\ $ (GND))) # (!\display|sprite_count\(3) & (!\display|sprite_count[2]~10\ & VCC))
-- \display|sprite_count[3]~12\ = CARRY((\display|sprite_count\(3) & !\display|sprite_count[2]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \display|sprite_count\(3),
	datad => VCC,
	cin => \display|sprite_count[2]~10\,
	combout => \display|sprite_count[3]~11_combout\,
	cout => \display|sprite_count[3]~12\);

-- Location: LCCOMB_X27_Y22_N14
\display|sprite_count[4]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|sprite_count[4]~14_combout\ = (\display|sprite_count\(4) & (!\display|sprite_count[3]~12\)) # (!\display|sprite_count\(4) & ((\display|sprite_count[3]~12\) # (GND)))
-- \display|sprite_count[4]~15\ = CARRY((!\display|sprite_count[3]~12\) # (!\display|sprite_count\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|sprite_count\(4),
	datad => VCC,
	cin => \display|sprite_count[3]~12\,
	combout => \display|sprite_count[4]~14_combout\,
	cout => \display|sprite_count[4]~15\);

-- Location: FF_X27_Y22_N15
\display|sprite_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|sprite_count[4]~14_combout\,
	ena => \display|process_0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|sprite_count\(4));

-- Location: LCCOMB_X27_Y22_N16
\display|sprite_count[5]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|sprite_count[5]~16_combout\ = (\display|sprite_count\(5) & (\display|sprite_count[4]~15\ $ (GND))) # (!\display|sprite_count\(5) & (!\display|sprite_count[4]~15\ & VCC))
-- \display|sprite_count[5]~17\ = CARRY((\display|sprite_count\(5) & !\display|sprite_count[4]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|sprite_count\(5),
	datad => VCC,
	cin => \display|sprite_count[4]~15\,
	combout => \display|sprite_count[5]~16_combout\,
	cout => \display|sprite_count[5]~17\);

-- Location: FF_X27_Y22_N17
\display|sprite_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|sprite_count[5]~16_combout\,
	ena => \display|process_0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|sprite_count\(5));

-- Location: LCCOMB_X27_Y22_N18
\display|sprite_count[6]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|sprite_count[6]~18_combout\ = (\display|sprite_count\(6) & (!\display|sprite_count[5]~17\)) # (!\display|sprite_count\(6) & ((\display|sprite_count[5]~17\) # (GND)))
-- \display|sprite_count[6]~19\ = CARRY((!\display|sprite_count[5]~17\) # (!\display|sprite_count\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \display|sprite_count\(6),
	datad => VCC,
	cin => \display|sprite_count[5]~17\,
	combout => \display|sprite_count[6]~18_combout\,
	cout => \display|sprite_count[6]~19\);

-- Location: FF_X27_Y22_N19
\display|sprite_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|sprite_count[6]~18_combout\,
	ena => \display|process_0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|sprite_count\(6));

-- Location: LCCOMB_X27_Y22_N20
\display|sprite_count[7]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|sprite_count[7]~20_combout\ = \display|sprite_count[6]~19\ $ (!\display|sprite_count\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \display|sprite_count\(7),
	cin => \display|sprite_count[6]~19\,
	combout => \display|sprite_count[7]~20_combout\);

-- Location: FF_X27_Y22_N21
\display|sprite_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|sprite_count[7]~20_combout\,
	ena => \display|process_0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|sprite_count\(7));

-- Location: LCCOMB_X26_Y23_N12
\display|Mux0~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Mux0~7_combout\ = (\display|sprite_count\(2) & (((\display|sprite_count\(1)) # (\display|spriterom|altsyncram_component|auto_generated|q_a\(13))))) # (!\display|sprite_count\(2) & (\display|spriterom|altsyncram_component|auto_generated|q_a\(9) & 
-- (!\display|sprite_count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|sprite_count\(2),
	datab => \display|spriterom|altsyncram_component|auto_generated|q_a\(9),
	datac => \display|sprite_count\(1),
	datad => \display|spriterom|altsyncram_component|auto_generated|q_a\(13),
	combout => \display|Mux0~7_combout\);

-- Location: LCCOMB_X26_Y23_N30
\display|Mux0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Mux0~8_combout\ = (\display|sprite_count\(1) & ((\display|Mux0~7_combout\ & (\display|spriterom|altsyncram_component|auto_generated|q_a\(15))) # (!\display|Mux0~7_combout\ & ((\display|spriterom|altsyncram_component|auto_generated|q_a\(11)))))) # 
-- (!\display|sprite_count\(1) & (((\display|Mux0~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|spriterom|altsyncram_component|auto_generated|q_a\(15),
	datab => \display|spriterom|altsyncram_component|auto_generated|q_a\(11),
	datac => \display|sprite_count\(1),
	datad => \display|Mux0~7_combout\,
	combout => \display|Mux0~8_combout\);

-- Location: FF_X27_Y22_N11
\display|sprite_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|sprite_count[2]~9_combout\,
	ena => \display|process_0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|sprite_count\(2));

-- Location: LCCOMB_X26_Y23_N4
\display|Mux0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Mux0~2_combout\ = (\display|sprite_count\(1) & ((\display|spriterom|altsyncram_component|auto_generated|q_a\(3)) # ((\display|sprite_count\(2))))) # (!\display|sprite_count\(1) & (((\display|spriterom|altsyncram_component|auto_generated|q_a\(1) & 
-- !\display|sprite_count\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|spriterom|altsyncram_component|auto_generated|q_a\(3),
	datab => \display|spriterom|altsyncram_component|auto_generated|q_a\(1),
	datac => \display|sprite_count\(1),
	datad => \display|sprite_count\(2),
	combout => \display|Mux0~2_combout\);

-- Location: LCCOMB_X26_Y23_N18
\display|Mux0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Mux0~3_combout\ = (\display|Mux0~2_combout\ & ((\display|spriterom|altsyncram_component|auto_generated|q_a\(7)) # ((!\display|sprite_count\(2))))) # (!\display|Mux0~2_combout\ & (((\display|spriterom|altsyncram_component|auto_generated|q_a\(5) & 
-- \display|sprite_count\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|spriterom|altsyncram_component|auto_generated|q_a\(7),
	datab => \display|spriterom|altsyncram_component|auto_generated|q_a\(5),
	datac => \display|Mux0~2_combout\,
	datad => \display|sprite_count\(2),
	combout => \display|Mux0~3_combout\);

-- Location: LCCOMB_X26_Y23_N0
\display|Mux0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Mux0~4_combout\ = (\display|sprite_count\(1) & ((\display|spriterom|altsyncram_component|auto_generated|q_a\(2)) # ((\display|sprite_count\(2))))) # (!\display|sprite_count\(1) & (((\display|spriterom|altsyncram_component|auto_generated|q_a\(0) & 
-- !\display|sprite_count\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|spriterom|altsyncram_component|auto_generated|q_a\(2),
	datab => \display|spriterom|altsyncram_component|auto_generated|q_a\(0),
	datac => \display|sprite_count\(1),
	datad => \display|sprite_count\(2),
	combout => \display|Mux0~4_combout\);

-- Location: LCCOMB_X26_Y23_N6
\display|Mux0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Mux0~5_combout\ = (\display|Mux0~4_combout\ & ((\display|spriterom|altsyncram_component|auto_generated|q_a\(6)) # ((!\display|sprite_count\(2))))) # (!\display|Mux0~4_combout\ & (((\display|spriterom|altsyncram_component|auto_generated|q_a\(4) & 
-- \display|sprite_count\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|spriterom|altsyncram_component|auto_generated|q_a\(6),
	datab => \display|Mux0~4_combout\,
	datac => \display|spriterom|altsyncram_component|auto_generated|q_a\(4),
	datad => \display|sprite_count\(2),
	combout => \display|Mux0~5_combout\);

-- Location: FF_X27_Y22_N13
\display|sprite_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|sprite_count[3]~11_combout\,
	ena => \display|process_0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|sprite_count\(3));

-- Location: LCCOMB_X27_Y22_N26
\display|Mux0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Mux0~6_combout\ = (\display|sprite_count\(0) & ((\display|Mux0~3_combout\) # ((\display|sprite_count\(3))))) # (!\display|sprite_count\(0) & (((\display|Mux0~5_combout\ & !\display|sprite_count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|sprite_count\(0),
	datab => \display|Mux0~3_combout\,
	datac => \display|Mux0~5_combout\,
	datad => \display|sprite_count\(3),
	combout => \display|Mux0~6_combout\);

-- Location: LCCOMB_X27_Y22_N28
\display|Mux0~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|Mux0~9_combout\ = (\display|Mux0~6_combout\ & (((\display|Mux0~8_combout\) # (!\display|sprite_count\(3))))) # (!\display|Mux0~6_combout\ & (\display|Mux0~1_combout\ & ((\display|sprite_count\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|Mux0~1_combout\,
	datab => \display|Mux0~8_combout\,
	datac => \display|Mux0~6_combout\,
	datad => \display|sprite_count\(3),
	combout => \display|Mux0~9_combout\);

-- Location: LCCOMB_X33_Y22_N30
\display|R_VGA~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|R_VGA~6_combout\ = (\generator|video_on~combout\ & ((\display|process_0~5_combout\ & ((\display|Mux0~9_combout\))) # (!\display|process_0~5_combout\ & (\SW[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[7]~input_o\,
	datab => \generator|video_on~combout\,
	datac => \display|Mux0~9_combout\,
	datad => \display|process_0~5_combout\,
	combout => \display|R_VGA~6_combout\);

-- Location: FF_X33_Y22_N31
\display|R_VGA[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|R_VGA~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|R_VGA\(3));

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

-- Location: LCCOMB_X27_Y22_N0
\display|B_VGA[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|B_VGA[0]~0_combout\ = (\display|process_0~5_combout\ & (((\display|B_VGA\(0))))) # (!\display|process_0~5_combout\ & (\generator|video_on~combout\ & (\SW[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|video_on~combout\,
	datab => \SW[0]~input_o\,
	datac => \display|B_VGA\(0),
	datad => \display|process_0~5_combout\,
	combout => \display|B_VGA[0]~0_combout\);

-- Location: FF_X27_Y22_N1
\display|B_VGA[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|B_VGA[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|B_VGA\(0));

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

-- Location: LCCOMB_X27_Y22_N2
\display|B_VGA[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|B_VGA[1]~1_combout\ = (\display|process_0~5_combout\ & (((\display|B_VGA\(1))))) # (!\display|process_0~5_combout\ & (\generator|video_on~combout\ & (\SW[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|video_on~combout\,
	datab => \SW[1]~input_o\,
	datac => \display|B_VGA\(1),
	datad => \display|process_0~5_combout\,
	combout => \display|B_VGA[1]~1_combout\);

-- Location: FF_X27_Y22_N3
\display|B_VGA[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|B_VGA[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|B_VGA\(1));

-- Location: LCCOMB_X33_Y22_N12
\display|B_VGA[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|B_VGA[2]~2_combout\ = (\display|process_0~5_combout\ & (((\display|B_VGA\(2))))) # (!\display|process_0~5_combout\ & (\generator|video_on~combout\ & ((\SW[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|process_0~5_combout\,
	datab => \generator|video_on~combout\,
	datac => \display|B_VGA\(2),
	datad => \SW[6]~input_o\,
	combout => \display|B_VGA[2]~2_combout\);

-- Location: FF_X33_Y22_N13
\display|B_VGA[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|B_VGA[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|B_VGA\(2));

-- Location: LCCOMB_X33_Y22_N22
\display|B_VGA[3]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|B_VGA[3]~3_combout\ = (\display|process_0~5_combout\ & (((\display|B_VGA\(3))))) # (!\display|process_0~5_combout\ & (\SW[7]~input_o\ & (\generator|video_on~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[7]~input_o\,
	datab => \generator|video_on~combout\,
	datac => \display|B_VGA\(3),
	datad => \display|process_0~5_combout\,
	combout => \display|B_VGA[3]~3_combout\);

-- Location: FF_X33_Y22_N23
\display|B_VGA[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|B_VGA[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|B_VGA\(3));

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

-- Location: LCCOMB_X27_Y22_N24
\display|G_VGA[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|G_VGA[0]~0_combout\ = (\display|process_0~5_combout\ & (((\display|G_VGA\(0))))) # (!\display|process_0~5_combout\ & (\generator|video_on~combout\ & (\SW[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|video_on~combout\,
	datab => \SW[2]~input_o\,
	datac => \display|G_VGA\(0),
	datad => \display|process_0~5_combout\,
	combout => \display|G_VGA[0]~0_combout\);

-- Location: FF_X27_Y22_N25
\display|G_VGA[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|G_VGA[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|G_VGA\(0));

-- Location: LCCOMB_X33_Y22_N20
\display|G_VGA[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|G_VGA[1]~1_combout\ = (\display|process_0~5_combout\ & (((\display|G_VGA\(1))))) # (!\display|process_0~5_combout\ & (\SW[3]~input_o\ & (\generator|video_on~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[3]~input_o\,
	datab => \generator|video_on~combout\,
	datac => \display|G_VGA\(1),
	datad => \display|process_0~5_combout\,
	combout => \display|G_VGA[1]~1_combout\);

-- Location: FF_X33_Y22_N21
\display|G_VGA[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|G_VGA[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|G_VGA\(1));

-- Location: LCCOMB_X33_Y22_N18
\display|G_VGA[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|G_VGA[2]~2_combout\ = (\display|process_0~5_combout\ & (((\display|G_VGA\(2))))) # (!\display|process_0~5_combout\ & (\generator|video_on~combout\ & ((\SW[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display|process_0~5_combout\,
	datab => \generator|video_on~combout\,
	datac => \display|G_VGA\(2),
	datad => \SW[6]~input_o\,
	combout => \display|G_VGA[2]~2_combout\);

-- Location: FF_X33_Y22_N19
\display|G_VGA[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|G_VGA[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|G_VGA\(2));

-- Location: LCCOMB_X33_Y22_N8
\display|G_VGA[3]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \display|G_VGA[3]~3_combout\ = (\display|process_0~5_combout\ & (((\display|G_VGA\(3))))) # (!\display|process_0~5_combout\ & (\SW[7]~input_o\ & (\generator|video_on~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[7]~input_o\,
	datab => \generator|video_on~combout\,
	datac => \display|G_VGA\(3),
	datad => \display|process_0~5_combout\,
	combout => \display|G_VGA[3]~3_combout\);

-- Location: FF_X33_Y22_N9
\display|G_VGA[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \display|G_VGA[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \display|G_VGA\(3));

-- Location: LCCOMB_X32_Y22_N30
\generator|VGA_HS~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|VGA_HS~0_combout\ = (!\generator|h_count\(3) & (((!\generator|h_count\(0)) # (!\generator|h_count\(2))) # (!\generator|h_count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(3),
	datab => \generator|h_count\(1),
	datac => \generator|h_count\(2),
	datad => \generator|h_count\(0),
	combout => \generator|VGA_HS~0_combout\);

-- Location: LCCOMB_X32_Y22_N0
\generator|VGA_HS~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|VGA_HS~1_combout\ = (\generator|h_count\(5) & (!\generator|VGA_HS~0_combout\ & (\generator|h_count\(4) & \generator|h_count\(6)))) # (!\generator|h_count\(5) & (!\generator|h_count\(6) & ((\generator|VGA_HS~0_combout\) # 
-- (!\generator|h_count\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000001000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(5),
	datab => \generator|VGA_HS~0_combout\,
	datac => \generator|h_count\(4),
	datad => \generator|h_count\(6),
	combout => \generator|VGA_HS~1_combout\);

-- Location: LCCOMB_X32_Y22_N28
\generator|VGA_HS~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|VGA_HS~2_combout\ = ((\generator|VGA_HS~1_combout\) # ((\generator|h_count\(8)) # (!\generator|h_count\(7)))) # (!\generator|h_count\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|h_count\(9),
	datab => \generator|VGA_HS~1_combout\,
	datac => \generator|h_count\(7),
	datad => \generator|h_count\(8),
	combout => \generator|VGA_HS~2_combout\);

-- Location: LCCOMB_X31_Y20_N20
\generator|v_count_nxt[0]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|v_count_nxt[0]~4_combout\ = (!\generator|process_1~0_combout\ & \generator|Add1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|process_1~0_combout\,
	datac => \generator|Add1~0_combout\,
	combout => \generator|v_count_nxt[0]~4_combout\);

-- Location: FF_X31_Y20_N21
\generator|v_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \generator|clkdiv_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \generator|v_count_nxt[0]~4_combout\,
	ena => \generator|Equal1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \generator|v_count\(0));

-- Location: LCCOMB_X30_Y20_N4
\generator|VGA_VS~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|VGA_VS~0_combout\ = (\generator|v_count\(9)) # ((\generator|v_count\(2) & ((\generator|v_count\(1)) # (\generator|v_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|v_count\(1),
	datab => \generator|v_count\(2),
	datac => \generator|v_count\(0),
	datad => \generator|v_count\(9),
	combout => \generator|VGA_VS~0_combout\);

-- Location: LCCOMB_X31_Y20_N10
\generator|VGA_VS~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \generator|VGA_VS~1_combout\ = ((\generator|v_count\(4)) # ((\generator|VGA_VS~0_combout\) # (\generator|LessThan6~0_combout\))) # (!\generator|LessThan4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \generator|LessThan4~0_combout\,
	datab => \generator|v_count\(4),
	datac => \generator|VGA_VS~0_combout\,
	datad => \generator|LessThan6~0_combout\,
	combout => \generator|VGA_VS~1_combout\);
END structure;


