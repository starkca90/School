LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY counter_tb IS
END;

ARCHITECTURE counter_tb_arch OF counter_tb IS
	SIGNAL address_tb :STD_LOGIC_VECTOR(1 downto 0);
	SIGNAL writedata_tb :STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL write_tb :STD_LOGIC;
	SIGNAL chipselect_tb :STD_LOGIC;
	SIGNAL enable_tb :STD_LOGIC;
	SIGNAL reset_n_tb :STD_LOGIC;
	SIGNAL clock_tb :STD_LOGIC := '1';
	SIGNAL cnt_tb :STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL upDown_out_tb :STD_LOGIC;
	
	COMPONENT counter
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
	END COMPONENT counter;
	
BEGIN
	DUT1 : counter
	GENERIC MAP(
		width => 8
		)
	PORT MAP(
		address => address_tb,
		writedata => writedata_tb,
		write => write_tb,
		chipselect => chipselect_tb,
		enable => enable_tb,
		reset_n => reset_n_tb,
		clock => clock_tb,
		cnt => cnt_tb,
		upDown_out => upDown_out_tb
		);
		
	clock_tb <= not clock_tb after 50 ps;
	
	sim_process : PROCESS
	BEGIN
		
		reset_n_tb <= '0';
		enable_tb <= '1';
		wait for 100 ps;
		
		reset_n_tb <= '1';
		address_tb <= "10";
		write_tb <= '1';
		chipselect_tb <= '1';
		writedata_tb <= X"C8";
		wait for 100 ps;
		
		write_tb <= '0';
		wait for 100 ps;
		
		address_tb <= "11";
		write_tb <= '1';
		writedata_tb <= X"BF";
		wait for 100 ps;
		
		write_tb <= '0';
		wait;
	END PROCESS sim_process;
end;