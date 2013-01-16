library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--
-- Implements a single NIOS II system with parallel I/O
-- 
-- Inputs:
--		CLOCK_50	- System CloCK
-- 	KEY(0) 	- Active low system reset
--		switches	- Parallel input to NIOS system
--	
-- Outputs:
--		LEDG		- Parallel output to NIOS system
--

entity NIOSINTRO is
	port (
		CLOCK_50 : IN std_logic;
		SW : IN std_logic_vector(7 downto 0);
		LEDG : OUT std_logic_vector(7 downto 0);
		KEY : IN std_logic_vector(0 downto 0) -- reset
	);
end NIOSINTRO;

architecture of rtl of NIOSINTRO is

begin

end rtl;