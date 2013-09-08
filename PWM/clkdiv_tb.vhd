LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY clkdiv_tb IS
END clkdiv_tb;

ARCHITECTURE clkdiv_tb_arch OF clkdiv_tb IS
	SIGNAL clk_tb :STD_LOGIC := '1';
	SIGNAL clk_out_tb :STD_LOGIC;
	
	COMPONENT clkdiv IS
		PORT(
			clk :IN STD_LOGIC;
			clk_out :OUT STD_LOGIC
		);
	END COMPONENT clkdiv;
	
BEGIN

	DUT1 : clkdiv
	
	PORT MAP(
		clk => clk_tb,
		clk_out => clk_out_tb
	);
	
	clk_tb <= not clk_tb after 10 ns;
end;