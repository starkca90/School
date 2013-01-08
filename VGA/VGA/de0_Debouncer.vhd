-- *************************************************************
-- * FILENAME:  de0_Debouncer                                  *
-- * AUTHOR:    starkca@msoe.edu                               *
-- * DATE:      05 January 2013                                *
-- * PROVIDES:  Takes in all push buttons from the Terasic DE0 *
-- *			board and sends the signals throug a debouncer *
-- *														   *
-- *			During testing, it appears to be easier to just*
-- *			use individual debouncers on each signal, but  *
-- *			this was made and available if needed		   *
-- *                                                           *
-- *************************************************************

library ieee;
use ieee.std_logic_1164.all;

-- *************************************************************
-- * ENTITY DECLARATION                                        *
-- * - CLOCK_50			: System Clock						   *
-- * - ORG_BUTTON		: Push Buttons to be debounced		   *
-- * - button_debounced	: Resulting debounced signals		   *
-- *************************************************************

entity de0_Debouncer is
	port (
		CLOCK_50 : in std_logic;
		ORG_BUTTON : in std_logic_vector(2 downto 0);
		button_debounced : out std_logic_vector(2 downto 0)
	);
end entity de0_Debouncer;

-- *************************************************************
-- * ARCHITECTURE DESCRIPTION                                  *
-- * - Port Maps for each debouncer to their associated		   *
-- *	push buttons										   *
-- *														   *
-- * - COMPONENT buttonDebounce	: signal debouncer			   *
-- *************************************************************

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
			data_in => ORG_BUTTON(0),
			rst_n => '1',
			data_out => button_debounced(0)
		);
		
	debounce1 : buttonDebounce
		PORT MAP (
			clk => CLOCK_50,
			data_in => ORG_BUTTON(1),
			rst_n => '1',
			data_out => button_debounced(1)
		);
		
	debounce2 : buttonDebounce
		PORT MAP (
			clk => CLOCK_50,
			data_in => ORG_BUTTON(2),
			rst_n => '1',
			data_out => button_debounced(2)
		);
end architecture RTL;