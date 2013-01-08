LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY seg7_4 IS
	PORT(
		numbers :IN STD_LOGIC_VECTOR(19 downto 0);
		clk :IN STD_LOGIC;
		rst_n :IN STD_LOGIC;
		HEX0,HEX1,HEX2,HEX3 :OUT STD_LOGIC_VECTOR(0 to 6);
		dp0,dp1,dp2,dp3 :OUT STD_LOGIC
	);
END seg7_4;

ARCHITECTURE behavior OF seg7_4 IS

	COMPONENT seg7 IS	
		PORT(
			-- 5 bit input, 4 downto 1 is value
			-- bit 0 is decimal point
			num_in :IN STD_LOGIC_VECTOR(4 downto 0);
			clk :IN STD_LOGIC;
			rst_n :IN STD_LOGIC;
			num_out :OUT STD_LOGIC_VECTOR(0 to 6);
			dp_out :OUT STD_LOGIC
		);
	END COMPONENT seg7;
	
BEGIN

	dsp0 : seg7
		PORT MAP(
			num_in => numbers(4 downto 0),
			clk => clk,
			rst_n => rst_n,
			num_out => HEX0,
			dp_out => dp0
		);
		
	dsp1 : seg7
		PORT MAP(
			num_in => numbers(9 downto 5),
			clk => clk,
			rst_n => rst_n,
			num_out => HEX1,
			dp_out => dp1
		);
		
	dsp2 : seg7
		PORT MAP(
			num_in => numbers(14 downto 10),
			clk => clk,
			rst_n => rst_n,
			num_out => HEX2,
			dp_out => dp2
		);
		
	dsp3 : seg7
		PORT MAP(
			num_in => numbers(19 downto 15),
			clk => clk,
			rst_n => rst_n,
			num_out => HEX3,
			dp_out => dp3
		);
		
END behavior;	