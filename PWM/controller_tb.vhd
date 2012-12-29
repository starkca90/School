LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY controller_tb IS
END;

ARCHITECTURE controller_tb_arch OF controller_tb IS
	SIGNAL address_tb :STD_LOGIC_VECTOR(1 downto 0);
	SIGNAL writedata_tb :STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL write_tb :STD_LOGIC;
	SIGNAL chipselect_tb :STD_LOGIC;
	SIGNAL clk_tb :STD_LOGIC := '1';
	SIGNAL reset_n_tb :STD_LOGIC;
	SIGNAL cnt_tb :STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL upDown_tb :STD_LOGIC;
	SIGNAL enable_tb :STD_LOGIC;
	SIGNAL coe_export_pwmOut_tb :STD_LOGIC;
	
	COMPONENT controller
		GENERIC(
			width :integer := 8
		);
		PORT(
			address :IN STD_LOGIC_VECTOR(1 downto 0);
			writedata :IN STD_LOGIC_VECTOR(width-1 downto 0);
			write :IN STD_LOGIC;
			chipselect :IN STD_LOGIC;
			clk :IN STD_LOGIC;
			reset_n :IN STD_LOGIC;
			cnt :IN STD_LOGIC_VECTOR(width-1 downto 0);
			upDown :IN STD_LOGIC;
			enable :OUT STD_LOGIC;
			coe_export_pwmOut :OUT STD_LOGIC
		);
END COMPONENT controller;

BEGIN

	DUT1 : controller
	GENERIC MAP(
		width => 8
		)
		
	PORT MAP(
		address => address_tb,
		writedata => writedata_tb,
		write => write_tb,
		chipselect => chipselect_tb,
		clk => clk_tb,
		reset_n => reset_n_tb,
		cnt => cnt_tb,
		upDown => upDown_tb,
		enable => enable_tb,
		coe_export_pwmOut => coe_export_pwmOut_tb
		);
	
	
	clk_tb <= not clk_tb after 50 ps;
	
	sim_process : PROCESS
	BEGIN
	
		reset_n_tb <= '0';
		wait for 100 ps;
		
		reset_n_tb <= '1';
		write_tb <= '1';
		address_tb <= "01";
		chipselect_tb <= '1';
		writedata_tb <= "00000101";
		wait for 100 ps;
		
		write_tb <= '0';
		cnt_tb <= "00000000";
		upDown_tb <= '0';
		wait for 100 ps;
		
		cnt_tb <= "00000001";
		wait for 100 ps;
		
		cnt_tb <= "00000010";
		wait for 100 ps;
		
		cnt_tb <= "00000011";
		wait for 100 ps;
		
		cnt_tb <= "00000100";
		wait for 100 ps;
		
		cnt_tb <= "00000101";
		wait for 100 ps;
		
		cnt_tb <= "00000110";
		wait for 100 ps;
		
		cnt_tb <= "00000111";
		wait for 100 ps;
		
		cnt_tb <= "00000110";
		upDown_tb <= '1';
		wait for 100 ps;
		
		cnt_tb <= "00000101";
		wait for 100 ps;
		
		cnt_tb <= "00000100";
		wait;
	END PROCESS sim_process;
end;
		