LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY pwm_tb IS
END;

ARCHITECTURE pwm_tb_arch OF pwm_tb IS
	SIGNAL address_tb :STD_LOGIC_VECTOR(1 downto 0);
	SIGNAL writedata_tb :STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL write_tb :STD_LOGIC;
	SIGNAL chipselect_tb :STD_LOGIC;
	SIGNAL clk_tb :STD_LOGIC := '1';
	SIGNAL reset_n_tb :STD_LOGIC;
	SIGNAL coe_export_pwmOut_tb :StD_LOGIC;
	
	COMPONENT pwm	
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
			coe_export_pwmOut :OUT STD_LOGIC
		);
	END COMPONENT pwm;
	
BEGIN
	DUT1 : pwm
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
			coe_export_pwmOut => coe_export_pwmOut_tb
		);
	
	-- Clock process to simulate a 50MHz clock
	clock : PROCESS
	BEGIN
		wait for 10 ns;
		clk_tb <= not clk_tb;
	END PROCESS clock;
	
	-- Reset
	-- Setup OCR
	-- Sit
	-- Enable
	-- Sit
	-- Setup Top
	-- Setup TCNT
	-- Sit
	-- Disable
	
	sim_process : PROCESS
	BEGIN
		-- Reset system
		reset_n_tb <= '0';
		wait for 1 ms;
		
		-- Bring Reset high
		reset_n_tb <= '1';
		-- Set conditions for write to OCR
		write_tb <= '1';
		address_tb <= "01";
		chipselect_tb <= '1';
		-- Write 24 to OCR
		writedata_tb <= X"18";
		wait for 1 ms;
		
		-- Stop writing
		write_tb <= '0';
		-- Show that enable/disable works
		wait for 6 ms;
		
		write_tb <= '1';
		address_tb <= "00";
		-- Enable System
		writedata_tb <= X"80";
		wait for 0.5 ms;
		
		write_tb <= '0';
		wait for 6 ms;
		
		write_tb <= '1';
		address_tb <= "11";
		-- Set TCNT to 20
		writedata_tb <= X"14";
		wait for 1 ms;
		
		write_tb <= '0';
		wait for 6 ms;
		
		write_tb <= '1';
		address_tb <= "10";
		-- Write 34 as TOP
		writedata_tb <= X"22";
		wait for 1 ms;
		
		write_tb <= '0';
		wait;
	END PROCESS sim_process;
END;