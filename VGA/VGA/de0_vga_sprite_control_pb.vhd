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
use ieee.numeric_std.all;

-- *************************************************************
-- * ENTITY DECLARATION                                        *
-- * - SW9, SW8				: Switch Inputs                    *
-- * - PB2, PB1				: Push Button Inputs               *
-- * - rst_n				: Reset sprite to start			   *
-- * - sprite_x, sprite_y	: Coordinates of sprite			   *
-- *************************************************************

entity de0_vga_sprite_control_pb is
port
	(
		SW9, SW8			: in std_logic;
		PB2, PB1			: in std_logic;
		rst_n				: in std_logic;
		sprite_x, sprite_y	: out std_logic_vector(8 downto 0)
	);
end entity de0_vga_sprite_control_pb;

-- *************************************************************
-- * ARCHITECTURE DESCRIPTION                                  *
-- * - Waits for a push button to be pressed, once a button is *
-- *	pressed, the corresponding action is taken place	   *
-- * - Sprite is moved by delta places						   *
-- *************************************************************

architecture RTL of de0_vga_sprite_control_pb is

	constant delta : integer := 10;
	
	signal sprite_x_int : integer range 0 to 640 := 320;
	signal sprite_y_int : integer range 0 to 480 := 240;
	
begin

	sprite_x <= std_logic_vector(to_unsigned(sprite_x_int, 9));
	sprite_y <= std_logic_vector(to_unsigned(sprite_y_int, 9));

	process(PB2, PB1, rst_n, SW9, SW8, sprite_x_int, sprite_y_int)
	begin
		IF rst_n = '0' THEN
			sprite_x_int <= 320;
			sprite_y_int <= 240;
		ELSIF PB2 = '0' THEN
			IF SW9 = '1' AND sprite_x_int >= delta THEN
				sprite_x_int <= sprite_x_int - delta;
			ELSIF SW9 = '0' AND sprite_x_int <= 640 - delta THEN
				sprite_x_int <= sprite_x_int + delta;
			ELSE
				sprite_x_int <= sprite_x_int;
			END IF;
		ELSIF PB1 = '0' THEN
			IF SW8 = '1' AND sprite_y_int >= delta THEN
				sprite_y_int <= sprite_y_int - delta;
			ELSIF SW8 = '0' AND sprite_y_int <= 480 - delta THEN
				sprite_y_int <= sprite_y_int + delta;
			ELSE
				sprite_y_int <= sprite_y_int;
			END IF;
		ELSE
			-- Somehow the process got triggered when it shouldn't have
			-- Shove sprite to origin to show issue occured
			sprite_y_int <= 0;
			sprite_x_int <= 0;
		END IF;
	end process;
end architecture RTL;