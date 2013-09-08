LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY pwm IS
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
END pwm;

ARCHITECTURE behavior OF pwm IS
	
	-- Internal divided clock signal
	SIGNAL hzclk :STD_LOGIC;
	-- Internal upDown tracker
	SIGNAL upDown_int :STD_LOGIC;
	-- Internal enable tracker
	SIGNAL enable_int :STD_LOGIC;
	-- Internal counter signal
	SIGNAL counter_int :STD_LOGIC_VECTOR(width-1 downto 0);

	COMPONENT clkdiv
		PORT(
			clk :IN STD_LOGIC;
			clk_out :OUT STD_LOGIC
		);
	END COMPONENT clkdiv;
	
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
	
	COMPONENT controller

		GENERIC(
			width :integer :=8
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

	clkdiv1 : clkdiv
		PORT MAP(
			clk => clk,
			clk_out => hzclk
		);
		
	counter1 : counter
		GENERIC MAP(
			width => 8
		)
		
		PORT MAP(
			address => address,
			writedata => writedata,
			write => write,
			chipselect => chipselect,
			enable => enable_int,
			reset_n => reset_n,
			clock => hzclk,
			cnt => counter_int,
			upDown_out => upDown_int
			);			
			
	controller1 : controller
		GENERIC MAP(
			width => 8
		)
		
		PORT MAP(
			address => address,
			writedata => writedata,
			write => write,
			chipselect => chipselect,
			clk => hzclk,
			reset_n => reset_n,
			cnt => counter_int,
			upDown => upDown_int,
			enable => enable_int,
			coe_export_pwmOut => coe_export_pwmOut
		);
END;