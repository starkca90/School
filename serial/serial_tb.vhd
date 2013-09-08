-- serial_tb.vhd file
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-- Entity declaration only. No definition here
ENTITY serial_tb IS
END;

-- Architecture of the testbench with the signal names
ARCHITECTURE serial_tb_arch OF serial_tb IS
	SIGNAL A_tb : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL B_tb : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL start_tb : STD_LOGIC;
	SIGNAL resetn_tb : STD_LOGIC;
	SIGNAL clock_tb : STD_LOGIC := '0';
	SIGNAL sum_tb : STD_LOGIC_VECTOR(8 DOWNTO 0);
	
	COMPONENT serial IS
		PORT
		(A :IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		B :IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		start :IN STD_LOGIC;
		resetn :IN STD_LOGIC;
		clock :IN STD_LOGIC;
		sum :OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
		);
	END COMPONENT serial;
	
BEGIN
	DUT1 : serial
	-- Port mapping: Between the DUT and the testbench signal
	PORT MAP(
	A => A_tb,
	B => B_tb,
	start => start_tb,
	resetn => resetn_tb,
	clock => clock_tb,
	sum => sum_tb);
	
-- Add Test Logic Here
clock_tb <= not clock_tb after 50 ps; -- Generate the clock

sim_process: process
	begin
		resetn_tb <= '0';
		start_tb <= '0';
		wait for 100 ps;
		resetn_tb <= '1';
		start_tb <= '1';
		A_tb <= b"10001111";
		B_tb <= b"00111001";
		wait;
	end process sim_process;
end;