/* FILE:   main.c
 * AUTHOR: Casey Stark <starkca@msoe.edu> 
 * COURSE: CE3910
 * DATE:   3/14/12
 *
 * PURPOSE: Main entry point to MILESTONE 1a 
 *			for CE3910. Demonstrates basic
 *			UART Functionality. 
 *			First Initializes UART functionality
 *			Then reads in a string via UART, then echos
 *			it back.
 */

#include "uart.h"
#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Create FILE that allows for UART to take over C IO functions
FILE uart_str = FDEV_SETUP_STREAM(uart_putc,uart_getc,_FDEV_SETUP_RW);

int main(void)
{
	// Create buffer to store input string
	char text[MAX_BUFFER_SIZE];
	// Initialize UART
	uart_init();
	// Finish up C IO integration
	stdout=stdin=&uart_str;

	// Loop forever
	for(;;)
	{
		// Input string is not empty, read it in
		if(fgets(text,MAX_BUFFER_SIZE,stdin) != NULL)
		{
			int i;
			for(i = 0; text[i]; i++)
			text[i] = toupper(text[i]);
			// Echo string back out
			printf("%s",text);
		}
	}

	return 0;
}
