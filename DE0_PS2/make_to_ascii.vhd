library ieee;
use ieee.std_logic_1164.all;

entity make_to_ascii is
	port (
		clk : in std_logic;
		reset_n : in std_logic;
		din : in std_logic_vector(7 downto 0);
		dout : out std_logic_vector(7 downto 0)
	);
end make_to_ascii;

architecture rtl of make_to_ascii is

	COMPONENT en_us_rom IS
		PORT (
			address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT en_us_rom;

	type statetype is (idle, break);
	signal state_reg, state_next : statetype;
	signal ascii_next, ascii_reg : std_logic_vector(7 downto 0);
	signal make_reg, make_next : std_logic_vector(7 downto 0);
	
begin

	rom1 : en_us_rom
		port map (
			address => make_reg,
			clock => clk
--			q => ascii_next
		);
	
	dout <= ascii_reg;
	
	process(clk, reset_n)
	begin
		if reset_n = '0' then
			ascii_reg <= (others => '0');
			state_reg <= idle;
			make_reg <= (others => '0');
		elsif falling_edge(clk) then
			ascii_reg <= ascii_next;
			state_reg <= state_next;
			make_reg <= make_next;
		end if;
	end process;
	
	make_next <= din;
	
	process(state_reg, make_reg, ascii_reg, din)
	begin
		state_next <= state_reg;
		make_next <= make_reg;
		ascii_next <= ascii_reg;
		
		case state_reg is
		
			when idle =>
				if din = x"F0" then
					state_next <= break;
				end if;
					
			when break =>
				ascii_next <= din;
				state_next <= idle;
				
		end case;
	end process;
	
end rtl;