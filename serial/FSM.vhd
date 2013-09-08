LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY FSM IS
	GENERIC(
		WAIT_STATE :STD_LOGIC_VECTOR(1 DOWNTO 0) := B"00";
		WORK_STATE :STD_LOGIC_VECTOR(1 DOWNTO 0) := B"01";
		END_STATE :STD_LOGIC_VECTOR(1 DOWNTO 0) := B"11"
	);
	PORT(
		start :IN STD_LOGIC;
		clock :IN STD_LOGIC;
		resetn :IN STD_LOGIC;
		reset :BUFFER STD_LOGIC;
		enable :BUFFER STD_LOGIC;
		load :BUFFER STD_LOGIC
	);
	END FSM;

ARCHITECTURE Behaviour OF FSM IS
	SIGNAL current_state :STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL next_state :STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL counter :STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
-- next state logic
	PROCESS(current_state, start, next_state, counter)
	BEGIN
		CASE(current_state) IS
		WHEN WAIT_STATE =>
			IF (start = '1') THEN
				next_state <= WORK_STATE;
			ELSE
				next_state <= WAIT_STATE;
			END IF;
		WHEN WORK_STATE =>
			IF (counter = B"1000") THEN
				next_state <= END_STATE;
			ELSE
				next_state <= WORK_STATE;
			END IF;
		WHEN END_STATE =>
			IF (start = '0') THEN
				next_state <= WAIT_STATE;
			ELSE
				next_state <= END_STATE;
			END IF;
		WHEN OTHERS =>
			next_state <= '-' & '-'; -- don't care
		END CASE;
	END PROCESS;

-- state registers and a counter
	PROCESS(clock, resetn)
	BEGIN
		IF (resetn = '0') THEN
			current_state <= WAIT_STATE;
			counter <= (OTHERS => '0');
		ELSIF (clock'EVENT AND clock = '1') THEN
			current_state <= next_state;
			IF (current_state = WAIT_STATE) THEN
				counter <= (OTHERS => '0');
			ELSIF (current_state = WORK_STATE) THEN
				counter <= counter + '1';
			END IF;
		END IF;
	END PROCESS;

-- Outputs
	reset <= '1' WHEN (current_state = WAIT_STATE) AND (start = '1') ELSE '0';
	load <= '1' WHEN (current_state = WAIT_STATE) AND (start = '1') ELSE '0';
	enable <= '1' WHEN (load = '1') OR (current_state = WORK_STATE) ELSE '0';
END Behaviour;