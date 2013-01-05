LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY de0_vga_display IS
	PORT(
		vga_hcount, vga_vcount :IN STD_LOGIC_VECTOR(0 to 11);
		SW :IN std_logic_vector(9 downto 0);
		VGA_R, VGA_B, VGA_G :OUT std_logic_vector(3 downto 0)	
	);
END de0_vga_display;

ARCHITECTURE rtl of de0_vga_display IS

BEGIN

END ARCHITECTURE rtl;