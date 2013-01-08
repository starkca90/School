-- *************************************************************
-- * FILENAME:  de0_vga_sprite_control_pb.vhd                  *
-- * AUTHOR:    starkca@msoe.edu                               *
-- * DATE:      06 January 2013                                *
-- * PROVIDES:  a VHDL sprite controller controller with push  *
-- *			button and switch controlls. Designed with 	   *
-- *			the Terasic DE0 education board in mind		   *
-- *			controls the X and Y coordinate for the top	   *
-- *			right corner of the sprite, which is then used *
-- *			by a display controller to display the sprite. *
-- *                                                           *
-- * HOW-TO USE:                                               *
-- * - use this component in other entities to control the 	   *
-- *	position of a sprite.								   *
-- * - SW 9 controls the up and down direction				   *
-- *	- UP(Logic 1) = UP									   *
-- *	- DOWN(Logic 0) = DOWN								   *
-- * - SW 8 control the left and right direction			   *
-- *	- UP(Logic 1) = LEFT								   *
-- *	- DOWN(Logic 0) = RIGHT								   *
-- * - PB 2 reads SW 9										   *
-- * - PB 1 reads SW 8										   *
-- *                                                           *
-- *************************************************************

library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- *************************************************************
-- * ENTITY DECLARATION                                        *
-- * - SW9, SW8				: Switch Inputs                    *
-- * - PB2, PB1				: Push Button Inputs               *
-- * - rst_n				: Reset sprite to start			   *
-- * - clock				: clock
-- * - sprite_x, sprite_y	: Coordinates of sprite			   *
-- *************************************************************

entity de0_vga_sprite_control_pb is
port
	(
		SW9, SW8			: in std_logic;
		PB2, PB1			: in std_logic;
		rst_n				: in std_logic;
		sprite_x, sprite_y	: out std_logic_vector(9 downto 0)
	);
end entity de0_vga_sprite_control_pb;

-- *************************************************************
-- * ARCHITECTURE DESCRIPTION                                  *
-- * - Waits for a push button to be pressed, once a button is *
-- *	pressed, the corresponding action is taken place	   *
-- * - Sprite is moved by delta places						   *
-- *************************************************************

architecture RTL of de0_vga_sprite_control_pb is

	constant delta : std_logic_vector(9 downto 0) := b"0000001010"; -- 10
	
	constant x_start : std_logic_vector(9 downto 0) := b"0101000000"; -- 320
	constant y_start : std_logic_vector(9 downto 0) := b"0011110000"; -- 240
	
	constant x_max : std_logic_vector(9 downto 0) := b"1010000000"; -- 640
	constant y_max : std_logic_vector(9 downto 0) := b"0111100000"; -- 480
	
	signal sprite_x_reg : std_logic_vector(9 downto 0) := x_start;
	signal sprite_y_reg : std_logic_vector(9 downto 0) := y_start;
	
begin			

	process(PB2, PB1, rst_n, SW9, SW8)
	begin
		IF rst_n = '0' THEN
			sprite_x_reg <= x_start;
			sprite_y_reg <= y_start;
		ELSIF PB2 = '0' THEN
			IF SW9 = '1' THEN
				IF sprite_x_reg >= delta THEN
					sprite_x_reg <= sprite_x_reg - delta;
				END IF;
			ELSIF SW9 = '0' THEN
				IF sprite_x_reg <= x_max - delta THEN
					sprite_x_reg <= sprite_x_reg + delta;
				END IF;
			END IF;
		ELSIF PB1 = '0' THEN
			IF SW8 = '1' THEN 
				IF sprite_y_reg >= delta THEN
					sprite_y_reg <= sprite_y_reg - delta;
				END IF;
			ELSIF SW8 = '0' THEN 
				IF sprite_y_reg <= y_max - delta THEN
					sprite_y_reg <= sprite_y_reg + delta;
				END IF;
			END IF;
		END IF;
		
		sprite_x <= sprite_x_reg;
		sprite_y <= sprite_y_reg;
		
	end process;
end architecture RTL;