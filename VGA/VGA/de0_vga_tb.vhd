 LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY de0_vga_tb IS
END de0_vga_tb;

ARCHITECTURE de0_vga_tb_arch OF de0_vga_tb IS
	SIGNAL clk_tb, rst_n_tb, VGA_HS_tb, VGA_VS_tb, video_on_tb: STD_LOGIC := '1';
	SIGNAL vga_hcount_tb, vga_vcount_tb :STD_LOGIC_VECTOR(0 to 11);

	COMPONENT de0_vga_controller IS
		PORT (
			CLOCK_50 :IN STD_LOGIC := '1';
			rst_n :IN STD_LOGIC;
			VGA_HS, VGA_VS, video_on :OUT STD_LOGIC;
			vga_hcount, vga_vcount :OUT STD_LOGIC_VECTOR(0 to 11)
		);
	END COMPONENT de0_vga_controller;
	
	BEGIN
	
		DUT1 : de0_vga_controller
		PORT MAP(
			CLOCK_50 => clk_tb,
			rst_n => rst_n_tb,
			VGA_HS => VGA_HS_tb,
			VGA_VS => VGA_VS_tb,
			video_on => video_on_tb,
			vga_hcount => vga_hcount_tb,
			vga_vcount => vga_vcount_tb
		);
		
		clk_tb <= not clk_tb after 10 ns;
	END;