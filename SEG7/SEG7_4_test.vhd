LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

ENTITY seg7_4_test IS
	PORT(
		dp :IN STD_LOGIC;
		clk :IN STD_LOGIC;
		rst_n :IN STD_LOGIC;
		HEX0,HEX1,HEX2,HEX3 :OUT STD_LOGIC_VECTOR(0 to 6);
		dp0,dp1,dp2,dp3 :OUT STD_LOGIC
	);
END seg7_4_test;

ARCHITECTURE behavior OF seg7_4_test IS

	SIGNAL cnt0, cnt1, cnt2, cnt3 :STD_LOGIC_VECTOR(3 downto 0) := b"0000";
	SIGNAL numbers :STD_LOGIC_VECTOR(19 downto 0);
	SIGNAL decimal :STD_LOGIC;
	SIGNAL delay :STD_LOGIC_VECTOR(24 downto 0) := (OTHERS => '0');
	
	SIGNAL max :STD_LOGIC_VECTOR(24 downto 0) := (OTHERS => '1');

	COMPONENT seg7_4 IS
		PORT(
			numbers :IN STD_LOGIC_VECTOR(19 downto 0);
			clk :IN STD_LOGIC;
			rst_n :IN STD_LOGIC;
			HEX0,HEX1,HEX2,HEX3 :OUT STD_LOGIC_VECTOR(6 downto 0);
			dp0,dp1,dp2,dp3 :OUT STD_LOGIC
		);
	END COMPONENT seg7_4;
	
BEGIN

	seg7_4_1 : seg7_4
		PORT MAP(
			numbers => numbers,
			clk => clk,
			rst_n => rst_n,
			HEX0 => HEX0,
			HEX1 => HEX1,
			HEX2 => HEX2,
			HEX3 => HEX3,
			dp0 => dp0,
			dp1 => dp1,
			dp2 => dp2,
			dp3 => dp3
		);
		
	
	
	PROCESS(clk, rst_n, dp)
	BEGIN
		decimal <= dp;
		numbers <= cnt3 & '1' & cnt2 & decimal & cnt1 & decimal & cnt0 & decimal;
		IF clk'EVENT AND clk = '1' THEN
			IF rst_n = '0' THEN
				cnt3 <= b"0000";
				cnt2 <= b"0000";
				cnt1 <= b"0000";
				cnt0 <= b"0000";
			ELSIF delay = max THEN
				cnt3 <= UNSIGNED(cnt3) + '1';
				cnt2 <= cnt3;
				cnt1 <= cnt2;
				cnt0 <= cnt1;
				delay <= UNSIGNED(delay) + '1';
			ELSE
				delay <= UNSIGNED(delay) + '1';
			END IF;
		END IF;	
	END PROCESS;
END behavior;