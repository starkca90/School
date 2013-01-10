LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY de0_vga_display IS
	PORT(
		pixel_col, pixel_row 	:IN STD_LOGIC_VECTOR(9 downto 0);
		sprite_x, sprite_y		:IN STD_LOGIC_VECTOR(9 downto 0);
		red, green, blue		:IN STD_LOGIC_VECTOR(3 downto 0); -- Switches
		video_on, clock		 	:IN std_logic;
		R_VGA, B_VGA, G_VGA 	:OUT std_logic_vector(3 downto 0)	
	);
END de0_vga_display;

ARCHITECTURE rtl of de0_vga_display IS
	-- Counter for sprite to get proper data from ROM
	SIGNAL sprite_count :std_logic_vector(7 downto 0) := (OTHERS => '0');
	-- Connection for ROM to hold the current rows sprite data
	SIGNAL sprite_data :std_logic_vector(15 downto 0) := (OTHERS => '0');
	
	-- Divided Clock
	SIGNAL pixel_clock :std_logic := '1';
	
	-- Sprite ROM component
	COMPONENT sprite IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q			: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
	END COMPONENT sprite;
	
	COMPONENT clkdiv IS
	PORT
	(
		inclk0	: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC 
	);
	END COMPONENT clkdiv;
	
BEGIN

	spriterom :sprite
		PORT MAP (
			address => sprite_count(7 downto 4),
			clock => clock,
			q => sprite_data
		);
		
	clockDiv : clkdiv
		PORT MAP (
		inclk0 => clock,
		c0 => pixel_clock
	);
	
	PROCESS(pixel_clock,video_on)
	BEGIN
		-- Rising Edge of clock and video_on signal controller is on
		IF rising_edge(pixel_clock) AND video_on = '1' THEN
			-- Current pixel is withing the rows of the sprite
			IF pixel_row >= sprite_y AND pixel_row <= sprite_y + 16 THEN
				-- Current pixel is within the columns of the sprite
				IF pixel_col >= sprite_x AND pixel_col <= sprite_x + 16 THEN
					-- Get the sprite data for that row from the ROM and make it red
					R_VGA <= sprite_data(CONV_INTEGER(sprite_count(3 downto 0))) & '1' & '1' & '1';
					-- Increment the counter
					sprite_count <= sprite_count + 1;
				END IF;	
			-- Not in the rows of the sprite
			ELSE
				-- Output the background color
				R_VGA <= red;
				G_VGA <= green;
				B_VGA <= blue;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE rtl;