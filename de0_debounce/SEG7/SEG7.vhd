LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY seg7 IS
PORT(
	-- 5 bit input, 4 downto 1 is value
	-- bit 0 is decimal point
	num_in :IN STD_LOGIC_VECTOR(4 downto 0);
	clk :IN STD_LOGIC;
	rst_n :IN STD_LOGIC;
	num_out :OUT STD_LOGIC_VECTOR(0 to 6);
	dp_out :OUT STD_LOGIC
	);
END seg7;

ARCHITECTURE behavior OF seg7 IS

BEGIN

	PROCESS(clk)
	BEGIN
		IF clk'EVENT AND clk = '1' THEN
			IF rst_n = '0' THEN
				num_out <= b"0000000";
				dp_out <= '0';
			ELSE
			
				CASE num_in(4 downto 1) IS
					WHEN b"0000" => num_out <= b"0000001"; -- 0
					WHEN b"0001" => num_out <= b"1001111"; -- 1
					WHEN b"0010" => num_out <= b"0010010"; -- 2
					WHEN b"0011" => num_out <= b"0000110"; -- 3
					WHEN b"0100" => num_out <= b"1001100"; -- 4
					WHEN b"0101" => num_out <= b"0100100"; -- 5
					WHEN b"0110" => num_out <= b"0100000"; -- 6
					WHEN b"0111" => num_out <= b"0001111"; -- 7
					WHEN b"1000" => num_out <= b"0000000"; -- 8
					WHEN b"1001" => num_out <= b"0001100"; -- 9
					WHEN b"1010" => num_out <= b"0001000"; -- 10/A
					WHEN b"1011" => num_out <= b"1100000"; -- 11/b
					WHEN b"1100" => num_out <= b"0110001"; -- 12/C
					WHEN b"1101" => num_out <= b"1000010"; -- 13/d
					WHEN b"1110" => num_out <= b"0110000"; -- 14/E
					WHEN b"1111" => num_out <= b"0111000"; -- 15/F
					WHEN OTHERS => num_out <= b"1111111"; -- OFF
				END CASE;
						
				dp_out <= NOT num_in(0); 
			END IF;
		END IF;
	END PROCESS;
END behavior;