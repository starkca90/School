library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity de0_debounce is
	port (
		CLOCK_50 : in std_logic;
		ORG_BUTTON : in std_logic_vector(2 downto 0);
		HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(0 to 6)
	);
end entity de0_debounce;

architecture RTL of de0_debounce is
	
	SIGNAL count : std_logic_vector(15 downto 0) := (OTHERS => '0');
	SIGNAL count_reg : std_logic_vector(15 downto 0) := (OTHERS => '0');
	SIGNAL db_pb : std_logic;
	
	SIGNAL seg7_format : std_logic_vector(19 downto 0);
	
	COMPONENT seg7_4 IS
		PORT (
			numbers :IN STD_LOGIC_VECTOR(19 downto 0);
			clk :IN STD_LOGIC;
			rst_n :IN STD_LOGIC;
			HEX0,HEX1,HEX2,HEX3 :OUT STD_LOGIC_VECTOR(0 to 6);
			dp0,dp1,dp2,dp3 :OUT STD_LOGIC
		);
	END COMPONENT seg7_4;
	
	COMPONENT buttonDebounce IS
		PORT (
			clk : in std_logic;
			data_in : in std_logic;
			rst_n : in std_logic;
			data_out :out std_logic
		);
	END COMPONENT buttonDebounce;
	
begin

	seg7_4_1 : seg7_4
		PORT MAP (
			numbers => seg7_format,
			clk => CLOCK_50,
			rst_n => ORG_BUTTON(0),
			HEX0 => HEX0,
			HEX1 => HEX1,
			HEX2 => HEX2,
			HEX3 => HEX3
		);
		
	debounce : buttonDebounce
		PORT MAP (
			clk => CLOCK_50,
			data_in => ORG_BUTTON(2),
			rst_n => '1',
			data_out => db_pb
		);
		
	PROCESS(CLOCK_50, ORG_BUTTON(0))
	BEGIN
		IF ORG_BUTTON(0) = '0' THEN
			count <= (OTHERS => '0');
			count_reg <= (OTHERS => '0');
		END IF;
		
		IF rising_edge(CLOCK_50) THEN
			count_reg <= count;
			seg7_format <= count_reg(15 downto 12) & '0' & count_reg(11 downto 8) & '0' & count_reg(7 downto 4) & '0' & count_reg(3 downto 0) & '0';
		END IF;
	END PROCESS;
	
	PROCESS(db_pb)
	BEGIN
		IF falling_edge(db_pb) THEN
			count <= count + '1';
		END IF;
	END PROCESS;
			
end architecture RTL;
