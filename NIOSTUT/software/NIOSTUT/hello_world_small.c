/*
 * Nightrider effected for NIOS II on DE0 dev board.
 * 
 * Moves a bit around in nightrider fashion and displays that
 * bit on LEDs on the DE0 board.
 * 
 * User can adjust the amount of time between each shift
 * by setting the 8 bit value using the switches also on
 * the DE0 board.
 */

#include "sys/alt_stdio.h" // Defines reduced driver stdio routines
#include <io.h> // Defines IORD and IOWR macros
#include <system.h>  // Defines base addresses for LEDS, SWITCHES,
// onchip memory, etc.
#include <stdio.h>
#include <ctype.h>  // needed for toupper() but not used here
#include <unistd.h> // contains usleep function

int main()
{ 
	alt_putstr("WELCOME TO NIGHTRIDER\n");

	int x = 1;
	int delay;
	int direction = 0;

	/* Event loop never exits. */
	while (1)
	{
		// Read the switches, multiply by 1000 to have better control over delay
		delay = (IORD_8DIRECT(SWITCHES_BASE, 0)) * 1000;

		// What direction are the LEDs going?
		// Shift x corresponding direction
		if(direction == 0)
			// Left (to LED7)
			x = x << 1;
		else
			// Right (to LED0)
			x = x >> 1;

		// Is the LED at the end of the direction
		if((x == 1) || (x == 128))
			// Start going the other way
			direction = !direction;

		// Output the new LED/x value
		IOWR_8DIRECT(LEDS_BASE, 0, x);

		// Sleep for the switch specified amount of time
		usleep(delay);
	}
	return 0;
}
