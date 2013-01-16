LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY de0_vga_sync_generator_tb IS
END de0_vga_sync_generator_tb;

ARCHITECTURE de0_vga_sync_generator_tb_arch OF de0_vga_sync_generator_tb IS
	SIGNAL clk_tb, VGA_HS_tb, VGA_VS_tb, video_on_tb: STD_LOGIC := '1';
	SIGNAL pixel_row_tb, pixel_col_tb :STD_LOGIC_VECTOR(9 downto 0);

	COMPONENT de0_vga_sync_generator IS
		PORT (
			CLOCK_50 				:IN STD_LOGIC := '1';
			VGA_HS, VGA_VS			:OUT STD_LOGIC;
			video_on				:OUT STD_LOGIC;
			pixel_row, pixel_col 	:OUT STD_LOGIC_VECTOR(9 downto 0)
		);
	END COMPONENT de0_vga_sync_generator;
	
	BEGIN
	
		DUT1 : de0_vga_sync_generator
		PORT MAP(
			CLOCK_50 => clk_tb,
			VGA_HS => VGA_HS_tb,
			VGA_VS => VGA_VS_tb,
			video_on => video_on_tb,
			pixel_row => pixel_row_tb,
			pixel_col => pixel_col_tb
		);
		
		clk_tb <= not clk_tb after 10 ns;
	END;