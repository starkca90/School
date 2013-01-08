-- *************************************************************
-- * FILENAME:  buttonDebounce                                 *
-- * AUTHOR:    starkca@msoe.edu                               *
-- * DATE:      05 January 2013                                *
-- * PROVIDES:  a VHDL debouncer for a single push button	   *
-- *			logic came from resource disc from Terasic 	   *
-- *			DE0 board.									   *
-- *														   *
-- *			works by shifting the input signal quite a     *
-- *			few times, then ouputs the value in the last   *
-- *			register.									   *
-- *                                                           *
-- * HOW-TO USE:                                               *
-- * - Use with other components that require push button	   *
-- *	input by attaching hard ware button pin to data_in     *
-- *	and the resulting signal is from data_out			   *
-- *                                                           *
-- *************************************************************

library ieee;
use ieee.std_logic_1164.all;

-- *************************************************************
-- * ENTITY DECLARATION                                        *
-- * - clk		: clock input								   *
-- * - data_in	: signal to be debounced					   *
-- * - rst_n	: reset the process							   *
-- * - data_out	: debounced signal							   *
-- *************************************************************

entity buttonDebounce is
	port (
		clk : in std_logic;
		data_in : in std_logic;
		rst_n : in std_logic;
		data_out :out std_logic
	);
end entity buttonDebounce;

-- *************************************************************
-- * ARCHITECTURE DESCRIPTION                                  *
-- * - Shift register to debounce a signal.					   *
-- * - Shifts input to consecutive registers for some time,	   *
-- *	then outputs the value in the last register after time *
-- *	has passed.											   *
-- *************************************************************

architecture RTL of buttonDebounce is
	constant preset_val : std_logic := '0';
	constant counter_max : integer := 100000;
	
	signal data_in_0 : std_logic := '0';
	signal data_in_1 : std_logic := '0';
	signal data_in_2 : std_logic := '0';
	signal data_in_3 : std_logic := '0';
	signal counter : integer range 0 to 100000;
begin

	PROCESS(clk, rst_n)
	BEGIN
		IF clk'event AND clk = '1' THEN
			IF rst_n = '0' THEN
				data_out <= preset_val;
				counter <= counter_max;
				data_in_0 <= '0';
				data_in_1 <= '0';
				data_in_2 <= '0';
				data_in_3 <= '0';
			ELSE
				IF counter = 0 THEN
					data_out <= data_in_3;
					counter <= counter_max;
				ELSE
					counter <= counter - 1;
				END IF;
			data_in_0 <= data_in;
			data_in_1 <= data_in_0;
			data_in_2 <= data_in_1;
			data_in_3 <= data_in_2;
			END IF;
		END IF;
	END PROCESS;
end architecture RTL;
