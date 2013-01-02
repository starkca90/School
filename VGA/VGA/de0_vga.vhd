LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY de0_vga_controller IS
	PORT (
		CLOCK_50 :IN STD_LOGIC := '1';
		rst_n :IN STD_LOGIC;
		VGA_HS, VGA_VS, vga_on :OUT STD_LOGIC;
		vga_hcount, vga_vcount :OUT STD_LOGIC_VECTOR(0 to 11)
	);
END de0_vga_controller;

ARCHITECTURE rtl OF de0_vga_controller IS
	
	CONSTANT maximum_h :STD_LOGIC_VECTOR(0 to 11) := X"31F"; -- 799
	CONSTANT display_h :STD_LOGIC_VECTOR(0 to 11) := X"27F"; -- 639
	CONSTANT back_h :STD_LOGIC_VECTOR(0 to 11) := X"297"; -- 663
	CONSTANT sync_h :STD_LOGIC_VECTOR(0 to 11) := X"2F6"; -- 758
	CONSTANT half_sync_h :STD_LOGIC_VECTOR(0 to 11) := X"2C6"; -- 710
	
	CONSTANT maximum_v :STD_LOGIC_VECTOR(0 to 11) := X"20A"; -- 522
	CONSTANT display_v :STD_LOGIC_VECTOR(0 to 11) := X"1DF"; -- 479
	CONSTANT back_v :STD_LOGIC_VECTOR(0 to 11) := X"1EA"; -- 490
	CONSTANT sync_v :STD_LOGIC_VECTOR(0 to 11) := X"1EC"; -- 492

	SIGNAL h_count, h_count_nxt, v_count, v_count_nxt :STD_LOGIC_VECTOR(0 to 11) := (OTHERS => '0');
	SIGNAL h_on, v_on, video_on :STD_LOGIC := '0';
	
BEGIN
 	
 	-- vga_hs ------------------------------------_________---------
 	-- h_count0							639		663		  758	   799
 	PROCESS(h_count)
 	BEGIN
 		h_count_nxt <= h_count;
 		IF h_count = maximum_h THEN
 			h_count_nxt <= (OTHERS => '0');
 		ELSE
 			h_count_nxt <= h_count + 1;
 		END IF;
 	END PROCESS;
 	
 	-- Generate h_sync using h_count
 	VGA_HS <= 	'0'  WHEN h_count <= sync_h AND h_count >= back_h ELSE
 				'1';
 	
 	-- vga_vs  --------------------------------------______---------
 	-- v_count 0						479		   490	  492	   522
 	PROCESS(v_count, h_count)
 	BEGIN
 		v_count_nxt <= v_count;
 		IF v_count >= maximum_v AND h_count >= half_sync_h THEN
 			v_count_nxt <= (OTHERS => '0');
 		ELSIF h_count = half_sync_h THEN
 			v_count_nxt <= v_count + 1;
 		END IF;
 	END PROCESS;
 	
 	-- Generate v_sync using v_count
 	VGA_VS <= 	'0' WHEN v_count <= sync_v AND v_count >= back_v ELSE
 				'1';
 				
 	-- Generate video on screen signals for pixel data
 	h_on <=	'1' WHEN h_count <= display_h ELSE
 			'0';
 			
 	v_on <=	'1' WHEN v_count <= display_v ELSE
 			'0';
 	
 	-- Display video only when h_on and v_on are both "ready"
 	video_on <= h_on AND v_on;
 	vga_on <= h_on AND v_on;
 	
 	PROCESS(CLOCK_50, rst_n)
 	BEGIN
 		IF CLOCK_50'EVENT AND CLOCK_50 = '1' THEN
 			IF rst_n = '0' THEN
 				h_count <= (OTHERS => '0');
 				v_count <= (OTHERS => '0');
 				vga_hcount <= (OTHERS => '0');
 				vga_vcount <= (OTHERS => '0');
 			ELSE
 				h_count <= h_count_nxt;
 				v_count <= v_count_nxt;
 				vga_hcount <= h_count_nxt;
 				vga_vcount <= v_count_nxt;
 			END IF;
 		END IF;
 	END PROCESS;

end architecture RTL;
