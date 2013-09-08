LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY counter IS
	GENERIC(
		width :integer := 8
		);
PORT(
	address :IN STD_LOGIC_VECTOR(1 downto 0);
	writedata :IN STD_LOGIC_VECTOR(width-1 downto 0);
	write :IN STD_LOGIC;
	chipselect :IN STD_LOGIC;
	enable :IN STD_LOGIC;
	reset_n :IN STD_LOGIC;
	clock :IN STD_LOGIC;
	cnt :OUT STD_LOGIC_VECTOR(width-1 downto 0);
	upDown_out :OUT STD_LOGIC
	);
END counter;

ARCHITECTURE behavior OF counter IS

	SIGNAL max :STD_LOGIC_VECTOR(width-1 downto 0) := (others => '1');
	
	SIGNAL count :STD_LOGIC_VECTOR(width-1 downto 0);
	
	-- 0 == UP
	-- 1 == DOWN
	SIGNAL upDown :STD_LOGIC;
	
BEGIN
	PROCESS(clock, reset_n)
	BEGIN
		-- Do work on rising edge of clock
		IF clock'EVENT AND clock = '1' THEN
			IF reset_n = '0' THEN
				count <= (others => '0');
				upDown <= '0';
				upDown_out <= '0';
			ELSIF write = '1' AND address = "10" AND chipselect = '1' THEN
				max <= writedata;
			ELSIF write = '1' AND address = "11" AND chipselect = '1' THEN
				count <= writedata;
			ELSIF enable = '1' THEN	
				-- Counter has reached the maximum value
				-- and up counting
				IF (count = max) AND (upDown = '0') THEN
					-- Start counting down
					upDown <= '1';
					upDown_out <= '1';
					-- Decrement count
					cnt <= count - 1;
					count <= count - 1;
				-- Counter has reached 0 and down counting
				ELSIF (count = 0) AND (upDown = '1') THEN
					-- Start counting up
				  upDown <= '0';
				  upDown_out <= '0';
				  -- Increment count
				  cnt <= count + 1;
				  count <= count + 1;
				 -- Counting up
				ELSIF upDown = '0' THEN
					-- Increment count
					cnt <= count + 1;
					count <= count + 1;
				-- Counting Down
				ELSE
					-- Decrement count
					cnt <= count - 1;
					count <= count - 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;
END behavior;