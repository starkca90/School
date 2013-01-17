library ieee;
use ieee.std_logic_1164.all;

entity ascii_to_7seg is
	port (
		clock, reset : in std_logic;
		ascii_code : in std_logic_vector(7 downto 0);
		char0, char1 : out std_logic_vector(0 to 6)
	);
end ascii_to_7seg;

architecture rtl of ascii_to_7seg is

	component seg7 is
		port (
			-- 5 bit input, 4 downto 1 is value
			-- bit 0 is decimal point
			num_in :IN STD_LOGIC_VECTOR(4 downto 0);
			clk :IN STD_LOGIC;
			rst_n :IN STD_LOGIC;
			num_out :OUT STD_LOGIC_VECTOR(0 to 6);
			dp_out :OUT STD_LOGIC
		);
	end component seg7;
	
begin

	char1dec : seg7
		port map (
			num_in => ascii_code(7 downto 4) & '1',
			clk => clock,
			rst_n => reset,
			num_out(0 to 6) => char1(0 to 6)
		);
		
	char0dec : seg7
		port map (
			num_in => ascii_code(3 downto 0) & '1',
			clk => clock,
			rst_n => reset,
			num_out(0 to 6) => char0(0 to 6)
		);
		
end rtl;