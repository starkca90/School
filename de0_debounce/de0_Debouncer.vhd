library ieee;
use ieee.std_logic_1164.all;

entity de0_Debouncer is
	port (
		clock_50 : in std_logic;
		buttons : in std_logic_vector(2 downto 0);
		buttons_debounced : out std_logic_vector(2 downto 0)
	);
end entity de0_Debouncer;

architecture RTL of de0_debouncer is

	component buttonDebounce is
		port (
			clk : in std_logic;
			data_in : in std_logic;
			rst_n : in std_logic;
			data_out : out std_logic
		);
	end component buttonDebounce;
	
begin
	
	debounce0 : buttonDebounce
		PORT MAP (
			clk => CLOCK_50,
			data_in => buttons(0),
			rst_n => '1',
			data_out => buttons_debounced(0)
		);
		
	debounce1 : buttonDebounce
		PORT MAP (
			clk => CLOCK_50,
			data_in => buttons(1),
			rst_n => '1',
			data_out => buttons_debounced(1)
		);
		
	debounce2 : buttonDebounce
		PORT MAP (
			clk => CLOCK_50,
			data_in => buttons(2),
			rst_n => '1',
			data_out => buttons_debounced(2)
		);
end architecture RTL;