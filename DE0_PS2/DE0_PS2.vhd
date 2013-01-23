library ieee;
use ieee.std_logic_1164.all;

entity DE0_PS2 is
	port (
		CLOCK_50 : in std_logic;
		KEY : in std_logic_vector(0 downto 0);
		PS2_KBDAT, PS2_KBCLK : in std_logic;
		HEX0, HEX1 : out std_logic_vector(0 to 6);
		LEDG : out std_logic_vector(7 downto 0)
	);
end DE0_PS2;

architecture rtl of DE0_PS2 is

	component ps2KBD is
		port (
			clk, reset_n : in std_logic;
			ps2d, ps2c : in std_logic;
			rx_en : in std_logic;
			rx_done_tick : out std_logic;
			rx_idle : out std_logic;
			dout : out std_logic_vector(7 downto 0)
		);
	end component ps2KBD;
	
	component en_us_rom is
		port (
			address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	end component en_us_rom;
	
--	component make_to_ascii is
--		port (
--			clk : in std_logic;
--			reset_n : in std_logic;
--			din : in std_logic_vector(7 downto 0);
--			dout : out std_logic_vector(7 downto 0)
--		);
--	end component make_to_ascii;
	
	component ascii_to_7seg is
		port (
			clock, reset : in std_logic;
			ascii_code : in std_logic_vector(7 downto 0);
			char0, char1 : out std_logic_vector(0 to 6)
		);
	end component ascii_to_7seg;
	
	signal make_signal : std_logic_vector(7 downto 0);
	signal ascii_signal : std_logic_vector(7 downto 0);
	
begin

	LEDG <= make_signal;
	
	keyboard : ps2KBD
		port map (
			clk => CLOCK_50,
			reset_n => KEY(0),
			ps2d => PS2_KBDAT,
			ps2c => PS2_KBCLK,
			rx_en => '1',
			dout(7 downto 0) => make_signal(7 downto 0)
		);
		
	convert : en_us_rom
		port map (
			address => make_signal,
			clock => CLOCK_50,
			q => ascii_signal
		);
		
--	convert : make_to_ascii
--		port map(
--			clk => CLOCK_50,
--			reset_n => KEY(0),
--			din => make_signal,
--			dout => ascii_signal
--		);
		
	display : ascii_to_7seg
		port map (
			clock => CLOCK_50,
			reset => KEY(0),
			ascii_code(7 downto 0) => ascii_signal(7 downto 0),
			char0(0 to 6) => HEX0(0 to 6),
			char1(0 to 6) => HEX1(0 to 6)
		);
		
end rtl;