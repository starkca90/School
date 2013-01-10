library ieee;
use ieee.std_logic_1164.all;

entity colors is
	port (
		switches	: IN STD_LOGIC_VECTOR(7 downto 0);
		red, green, blue	: OUT STD_LOGIC_VECTOR(3 downto 0)
	);
end entity colors;

architecture RTL of colors is
	
begin

	red <= switches(7 downto 4);
	green <= switches(7 downto 6) & switches(3 downto 2);
	blue <= switches(7 downto 6) & switches(1 downto 0);
	
end architecture RTL;
