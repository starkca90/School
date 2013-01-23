-- niostut.vhd
-- Casey Stark <starkca@msoe.edu>
-- January 18 2013
-- 
-- Provides top level entity for a NIOS II processor with
-- input of SWITCHES on DE0 and output of LEDS on DE0.

library ieee;
use ieee.std_logic_1164.all;

entity NIOSTUT is
	port (
		CLOCK_50 	: in std_logic;
		KEY 		: in std_logic_vector(0 downto 0);
		SW 			: in std_logic_vector(7 downto 0);
		LEDG		: out std_logic_vector(7 downto 0)
	);
end entity NIOSTUT;

architecture RTL of NIOSTUT is
	
    component nios_system is
        port (
            clk_clk         : in  std_logic                    := 'X';             -- clk
            reset_reset_n   : in  std_logic                    := 'X';             -- reset_n
            switches_export : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
            leds_export     : out std_logic_vector(7 downto 0)                     -- export
        );
    end component nios_system;

begin

    u0 : component nios_system
        port map (
            clk_clk         => CLOCK_50,        --      clk.clk
            reset_reset_n   => KEY(0),   		--    reset.reset_n
            switches_export => SW(7 downto 0), 	-- switches.export
            leds_export     => LEDG(7 downto 0) --     leds.export
        );

end architecture RTL;