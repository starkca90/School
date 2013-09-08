LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY seg7_tb IS
END;

ARCHITECTURE seg7_tb_arch OF seg7_tb IS
	
	SIGNAL num_in_tb :STD_LOGIC_VECTOR(4 downto 0);
	SIGNAL clk_tb :STD_LOGIC := '0';
	SIGNAL rst_n_tb :STD_LOGIC;
	SIGNAL num_out_tb :STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL dp_out_tb :STD_LOGIC;
	
	COMPONENT seg7 IS
	 PORT(
		-- 5 bit input, 4 downto 1 is value
		-- bit 0 is decimal point
	num_in :IN STD_LOGIC_VECTOR(4 downto 0);
	clk :IN STD_LOGIC;
	rst_n :IN STD_LOGIC;
	num_out :OUT STD_LOGIC_VECTOR(6 downto 0);
	dp_out :OUT STD_LOGIC
	);
	END COMPONENT seg7;
	
BEGIN

	DUT1 : seg7
	PORT MAP(
		num_in => num_in_tb,
		clk => clk_tb,
		rst_n => rst_n_tb,
		num_out => num_out_tb,
		dp_out => dp_out_tb
	);
	
	clk_tb <= NOT clk_tb AFTER 1 ms;
	
	sim_process : PROCESS
	BEGIN
		rst_n_tb <= '0';
		wait for 4 ms;
		
		rst_n_tb <= '1';
		num_in_tb <= b"00000"; -- 0/N
		wait for 2 ms;
		
		num_in_tb <= b"00001"; -- 0/Y
		wait;
		
	END PROCESS sim_process;
END;