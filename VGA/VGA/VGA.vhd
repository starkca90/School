library ieee;
use ieee.std_logic_1164.all;

entity VGA is
	port (
		CLOCK_50 : in std_logic;
		SW : in std_logic_vector(9 downto 0);
		KEY : in std_logic_vector(2 downto 0);
		LED : out std_logic_vector(9 downto 0);
		VGA_R, VGA_B, VGA_G : out std_logic_vector(3 downto 0) := b"1111";
		VGA_HS, VGA_VS : out std_logic
	);
end entity VGA;

architecture RTL of VGA is
	
	COMPONENT de0_vga_display IS
		PORT(
			pixel_col, pixel_row 	:IN STD_LOGIC_VECTOR(9 downto 0);
			sprite_x, sprite_y		:IN STD_LOGIC_VECTOR(9 downto 0);
			red, green, blue		:IN STD_LOGIC_VECTOR(3 downto 0); -- Switches
			video_on, clock		 	:IN std_logic;
			R_VGA, B_VGA, G_VGA 	:OUT std_logic_vector(3 downto 0)	
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
	
	COMPONENT de0_vga_sprite_control_pb IS
		PORT (
			SW9, SW8			: in std_logic;
			PB2, PB1			: in std_logic;
			rst_n				: in std_logic;
			clock				: in std_logic;
			sprite_x, sprite_y	: out std_logic_vector(9 downto 0)
		);
	END COMPONENT de0_vga_sprite_control_pb;
	
	COMPONENT buttonDebounce IS
		PORT (
			clk : in std_logic;
			data_in : in std_logic;
			rst_n : in std_logic;
			data_out :out std_logic
		);
	END COMPONENT buttonDebounce;
	
	component colors is
		port (
			switches	: IN STD_LOGIC_VECTOR(7 downto 0);
			red, green, blue	: OUT STD_LOGIC_VECTOR(3 downto 0)
		);
	end component colors;
	
	SIGNAL pixel_col_sig, pixel_row_sig : STD_LOGIC_VECTOR(9 downto 0);
	SIGNAL sprite_x_sig, sprite_y_sig : STD_LOGIC_VECTOR(9 downto 0);
	SIGNAL red_sig, green_sig, blue_sig : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL video_on_sig : STD_LOGIC;
	
	SIGNAL PB2_debounce, PB1_debounce : STD_LOGIC;

begin

	display : de0_vga_display
		PORT MAP (
			pixel_col => pixel_col_sig,
			pixel_row => pixel_row_sig,
			sprite_x => sprite_x_sig,
			sprite_y => sprite_y_sig,
			red => red_sig,
			green => green_sig,
			blue => blue_sig,
			video_on => video_on_sig,
			clock => CLOCK_50,
			R_VGA => VGA_R,
			B_VGA => VGA_B,
			G_VGA => VGA_G
		);
			
		generator : de0_vga_sync_generator
			PORT MAP (
				CLOCK_50 => CLOCK_50,
				VGA_HS => VGA_HS,
				VGA_VS => VGA_VS,
				video_on => video_on_sig,
				pixel_row => pixel_row_sig,
				pixel_col => pixel_col_sig
			);
		
		sprite : de0_vga_sprite_control_pb
			PORT MAP (
				SW9 => SW(9),
				SW8 => SW(8),
				PB2 => PB2_debounce,
				PB1 => PB1_debounce,
				rst_n => KEY(0),
				clock => CLOCK_50,
				sprite_x => sprite_x_sig,
				sprite_y => sprite_y_sig
			);
			
		debounce2 : buttonDebounce
			PORT MAP (
				clk => CLOCK_50,
				data_in => KEY(2),
				rst_n => '1',
				data_out => PB2_debounce
			);
			
		debounce1 : buttonDebounce
			PORT MAP (
				clk => CLOCK_50,
				data_in => KEY(1),
				rst_n => '1',
				data_out => PB1_debounce
			);
			
		color : colors
			PORT MAP (
				switches => SW(7 downto 0),
				red => red_sig,
				green => green_sig,
				blue => blue_sig
			);
		
		LED <= SW;

end architecture RTL;
