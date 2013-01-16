library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ps2KBD is
	port (
		clk, reset_n : in std_logic;
		ps2d, ps2c : in std_logic;
		rx_en : in std_logic;
		rx_done_tick : out std_logic;
		rx_idle : out std_logic;
		dout : out std_logic_vector(7 downto 0)
	);
end ps2KBD;

architecture arch of ps2KBD is
	
	type statetype is (idle, extract, done);
	signal state_reg, state_next : statetype;
	signal filter_reg, filter_next : std_logic_vector(7 downto 0);
	signal f_ps2c_reg, f_ps2c_next : std_logic;
	signal b_reg, b_next :std_logic_vector(10 downto 0);
	signal n_reg, n_next : std_logic_vector(3 downto 0);
	signal fall_edge : std_logic;
	signal b_shift, n_load, n_dec, n_zero : std_logic;
	
begin
	
	dout <= b_reg(8 downto 1);
	
	process(clk, reset_n)
	begin
		if reset_n = '0' then
			filter_reg <= (others => '0');
			f_ps2c_reg <= '0';
		elsif rising_edge(clk) then
			filter_reg <= filter_next;
			f_ps2c_reg <= f_ps2c_next;
		end if;
	end process;
	
	filter_next <= ps2c & filter_reg(7 downto 1);
	
	f_ps2c_next <= '1' when filter_reg = "11111111" else
						'0' when filter_reg = "00000000" else
						f_ps2c_reg;
						
	fall_edge <= f_ps2c_reg and (not f_ps2c_next);
	
	n_next <= 	n_reg - 1 when n_dec = '1' else
					"1010" when n_load = '1' else
					n_reg;
					
	n_zero <= '1' when n_next = 0 else '0';
	
	b_next <= 	ps2d & b_reg(10 downto 1) when b_shift = '1' else
					b_reg;
					
	process(clk, reset_n)
	begin
		if reset_n = '0' then
			state_reg <= idle;
			n_reg <= (others => '0');
			b_reg <= (others => '0');
		elsif rising_edge(clk) then
			state_reg <= state_next;
			n_reg <= n_next;
			b_reg <= b_next;
		end if;
	end process;
	
	process(state_reg, n_reg, fall_edge, rx_en, n_zero)
	begin
		rx_idle <= '0';
		rx_done_tick <= '0';
		state_next <= state_reg;
		b_shift <= '0';
		n_load <= '0';
		n_dec <= '0';
		
		case state_reg is
			
			when idle =>
				rx_idle <= '1';
				if rx_en = '1' and fall_edge = '1' then
					b_shift <= '1';
					n_load <= '1';
					state_next <= extract;
				end if;
			
			when extract =>
				if fall_edge = '1' then
					b_shift <= '1';
					if n_zero = '1' then
						state_next <= done;
					else
						n_dec <= '1';
					end if;
				end if;
				
			when done =>
				rx_done_tick <= '1';
				state_next <= idle;
		
		end case;
	end process;
	
end arch;
			