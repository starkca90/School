LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY de0_vga_sync_generator IS
	PORT (
		CLOCK_50 				:IN STD_LOGIC := '1';
		VGA_HS, VGA_VS			:OUT STD_LOGIC;
		video_on				:OUT STD_LOGIC;
		pixel_row, pixel_col 	:OUT STD_LOGIC_VECTOR(9 downto 0)
	);
END de0_vga_sync_generator;

ARCHITECTURE rtl OF de0_vga_sync_generator IS
	
	CONSTANT maximum_h		:NATURAL := 799;
	CONSTANT display_h		:NATURAL := 639;
	CONSTANT back_h			:NATURAL := 663;
	CONSTANT sync_h			:NATURAL := 758; 
	CONSTANT half_sync_h	:NATURAL := 710;
	
	CONSTANT maximum_v		:NATURAL := 522;
	CONSTANT display_v 		:NATURAL := 479;
	CONSTANT back_v 		:NATURAL := 490;
	CONSTANT sync_v 		:NATURAL := 492;
	
	SIGNAL pixel_clock 		:STD_LOGIC;
	SIGNAL h_count, h_count_nxt	:STD_LOGIC_VECTOR(9 downto 0) := (OTHERS => '0'); 
	SIGNAL v_count, v_count_nxt	:STD_LOGIC_VECTOR(9 downto 0) := (OTHERS => '0');
	SIGNAL h_on, v_on 			:STD_LOGIC := '0';
	
	COMPONENT clkdiv IS
		PORT
		(
			inclk0		: IN STD_LOGIC  := '0';
			c0		: OUT STD_LOGIC 
		);
	END COMPONENT clkdiv;
	
BEGIN
	
	clkdiv_inst : clkdiv
	PORT MAP(
		inclk0 => clock_50,
		c0 => pixel_clock
	);	
 	
 	-- vga_hs ------------------------------------_________---------
 	-- h_count0							639		663		  758	   799
 	PROCESS(h_count)
 	BEGIN
 		h_on <= '0';
 		h_count_nxt <= h_count;
 		pixel_col <= h_count;
 		
 		IF h_count = maximum_h THEN
 			h_count_nxt <= (OTHERS => '0');
 		ELSE
 			h_count_nxt <= h_count + 1;
 			
 			 IF h_count <= display_h THEN
 				h_on <= '1';
 				pixel_col <= h_count + 1;
 			ELSE
 				h_on <= '0';
 			END IF;
 			
 		END IF;
 	END PROCESS;
 	
 	-- Generate h_sync using h_count
 	VGA_HS <= 	'0'  WHEN h_count <= sync_h AND h_count >= back_h ELSE
 				'1';
 	
 	-- vga_vs  --------------------------------------______---------
 	-- v_count 0						479		   490	  492	   522
 	PROCESS(v_count, h_count)
 	BEGIN
 		v_on <= '0';
 		v_count_nxt <= v_count;
 		pixel_row <= v_count;
 	
 		IF v_count >= maximum_v AND h_count >= half_sync_h THEN
 			v_count_nxt <= (OTHERS => '0');
 		ELSIF h_count = half_sync_h THEN
 			v_count_nxt <= v_count + 1;
 			
 			IF v_count <= display_v THEN
 				v_on <= '1';
 				pixel_row <= v_count + 1;
 			ELSE
 				v_on <= '0';
 			END IF;
 		END IF;
 	END PROCESS;
 	
 	-- Generate v_sync using v_count
 	VGA_VS <= 	'0' WHEN v_count <= sync_v AND v_count >= back_v ELSE
 				'1';

 	-- Display video only when h_on and v_on are both "ready"
 	video_on <= h_on AND v_on;
 	
 	PROCESS(pixel_clock)
 	BEGIN
 		IF rising_edge(pixel_clock) THEN
 			h_count <= h_count_nxt;
 			v_count <= v_count_nxt;
 		END IF;
 	END PROCESS;

end architecture RTL;