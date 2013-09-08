library ieee;
use ieee.std_logic_1164.all;

entity de0_vga_display_tb is
end entity de0_vga_display_tb;

architecture RTL of de0_vga_display_tb is

	COMPONENT de0_vga_display IS
		PORT (
			pixel_col, pixel_row 	:IN STD_LOGIC_VECTOR(9 downto 0);
			sprite_x, sprite_y		:IN STD_LOGIC_VECTOR(9 downto 0);
			red, green, blue		:IN STD_LOGIC_VECTOR(3 downto 0); -- Switches
			video_on, clock		 	:IN std_logic;
			VGA_R, B_VGA, G_VGA 	:OUT std_logic_vector(3 downto 0)	
		);
	END COMPONENT de0_vga_display;
	
	COMPONENT de0_vga_sync_generator IS
		PORT (
			CLOCK_50 				:IN STD_LOGIC := '1';
			VGA_HS, VGA_VS			:OUT STD_LOGIC;
			video_on				:OUT STD_LOGIC;
			pixel_row, pixel_col 	:OUT STD_LOGIC_VECTOR(9 downto 0)
		);
	END COMPONENT de0_vga_sync_generator;
	
	SIGNAL pixel_col_sig, pixel_row_sig : STD_LOGIC_VECTOR(9 downto 0) := (OTHERS => '0');
	SIGNAL sprite_x_tb, sprite_y_tb : STD_LOGIC_VECTOR(9 downto 0);
	SIGNAL red_tb, green_tb, blue_tb : STD_LOGIC_VECTOR(3 downto 0) := b"1011";
	SIGNAL video_on_sig, clock_tb : STD_LOGIC := '1';
	SIGNAL VGA_R_tb, VGA_B_tb, VGA_G_tb : STD_LOGIC_VECTOR(3 downto 0);
	
begin

	DUT : de0_vga_display
		PORT MAP (
			pixel_col => pixel_col_sig,
			pixel_row => pixel_row_sig,
			sprite_x => sprite_x_tb,
			sprite_y => sprite_y_tb,
			red => red_tb,
			green => green_tb,
			blue => blue_tb,
			video_on => video_on_sig,
			clock => clock_tb,
			VGA_R => VGA_R_tb,
			G_VGA => VGA_G_tb,
			B_VGA => VGA_B_tb
		);
		
	controller : de0_vga_sync_generator
		PORT MAP (
			CLOCK_50 => clock_tb,
			video_on => video_on_sig,
			pixel_row => pixel_row_sig,
			pixel_col => pixel_col_sig
		);	
		
	sprite_x_tb <= b"0000110010";
	sprite_y_tb <= b"0001010000";
	clock_tb <= not clock_tb after 50 ns;

end architecture RTL;
