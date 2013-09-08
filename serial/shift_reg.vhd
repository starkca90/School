LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY shift_reg IS
	GENERIC(
		n :INTEGER := 8
	);
	PORT(
		clock :IN STD_LOGIC;
		reset :IN STD_LOGIC;
		data :IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		bit_in :IN STD_LOGIC;
		enable :IN STD_LOGIC;
		load :IN STD_LOGIC;
		q :BUFFER STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	);
END shift_reg;

ARCHITECTURE Behaviour OF shift_reg IS
BEGIN
	PROCESS (clock)
	BEGIN
		IF clock'EVENT AND clock = '1' THEN
			IF (enable = '1') THEN
				IF (reset = '1') THEN
					q <= (OTHERS => '0');
				ELSE
					IF (load = '1') THEN
						q <= data;
					ELSE
						q(n-2 DOWNTO 0) <= q(n-1 DOWNTO 1);
						q(n-1) <= bit_in;
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;
END Behaviour;