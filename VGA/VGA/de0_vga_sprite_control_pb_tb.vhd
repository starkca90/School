library ieee;
use ieee.std_logic_1164.all;

entity de0_vga_sprite_control_pb_tb is
end entity de0_vga_sprite_control_pb_tb;

architecture RTL of de0_vga_sprite_control_pb_tb is
	
	
	component de0_vga_sprite_control_pb is
		port (
			SW9, SW8			: in std_logic;
			PB2, PB1			: in std_logic;
			rst_n				: in std_logic;
			clock				: in std_logic;
			sprite_x, sprite_y	: out std_logic_vector(9 downto 0)
		);
	end component de0_vga_sprite_control_pb;

	signal SW9_tb, SW8_tb, PB2_tb, PB1_tb, rst_n_tb, clock_tb : std_logic := '1';
	signal sprite_x_tb, sprite_y_tb : std_logic_vector(9 downto 0);
	
begin

	DUT : de0_vga_sprite_control_pb
	PORT MAP (
		SW9 => SW9_tb,
		SW8 => SW8_tb,
		PB2 => PB2_tb,
		PB1 => PB1_tb,
		rst_n => rst_n_tb,
		clock => clock_tb,
		sprite_x => sprite_x_tb,
		sprite_y => sprite_y_tb
	);
	
	clock_tb <= not clock_tb after 50 ns;
	
	PROCESS
	BEGIN
		
		rst_n_tb <= '0';
		wait for 100 ns;
		
		rst_n_tb <= '1';
		wait for 200 ns;
		
		-- Shift UP
		-- SW9 Set to 1 when declared
		PB2_tb <= '0';
		wait for 100 ns;
		
		PB2_tb <= '1';
		-- Note sprite_y_tb decreased by 10
		
		-- Shift right
		SW8_tb <= '0';
		PB1_tb <= '0';
		wait for 100 ns;
		
		PB1_tb <= '1';
		-- Note sprite_x_tb increased by 10
		
		-- Shift down
		SW9_tb <= '0';
		PB2_tb <= '0';
		wait for 200 ns; -- Note waited for 2 clock cycles
		
		PB2_tb <= '1';
		-- Note sprite_y_tb increased by 20
		
		-- Shift left
		SW8_tb <= '1';
		PB1_tb <= '0';
		wait for 200 ns; -- Note waited for 2 clock cycles
		
		PB1_tb <= '1';
	end process;
end architecture RTL;
