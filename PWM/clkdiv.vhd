LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY clkdiv IS
	PORT(
		clk :IN STD_LOGIC;
		clk_out :OUT STD_LOGIC
	);
END clkdiv;

ARCHITECTURE behavior OF clkdiv IS

	SIGNAL max :INTEGER := 1953;
	SIGNAL half :INTEGER := max/2;
	SIGNAL count :INTEGER RANGE 0 to max;

BEGIN
	PROCESS
	BEGIN
		WAIT UNTIL rising_edge(clk);
			IF count < max THEN	
				count <= count + 1;
			ELSE
				count <= 0;
			END IF;

			IF count < half THEN
				clk_out <= '0';
			ELSE
				clk_out <= '1';
			END IF;

	END PROCESS;
END;		