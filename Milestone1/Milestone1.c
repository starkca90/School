/* FILE:   Mileston1.c
 * AUTHOR: Casey Stark <starkca@msoe.edu> 
 * COURSE: CE3910
 * DATECreated:  3/14/12
 *
 * DateModified: 3/20/2012
 *
 * PURPOSE: Main entry point to MILESTONE 1 
 *			for CE3910. Demonstrates basic
 *			UART Functionality. 
 *			First Initializes UART functionality
 *			Allows for debug operations
 */

#include "uart.h"
#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Commands size for IO operations,
// Presently supports either rio or wio
// so only 3 char bits need to be alocated
#define COMMAND 3



/*
*	PURPOSE: Main Entry point into program
*				Intialized uart operations
*				Loops to allow IO operations to take
*				place
*
*	PARAMETERS: VOID
*
*	RETURNS: exit code integer, however, should nver
*				return
*/

int main(void)
{
	// Create buffer to store input string
	char input[MAX_BUFFER_SIZE];
	// Initialize UART
	uart_init();


	// Setup some variables for debug
	char command[COMMAND];
	uint16_t regAddress, data;

	// Loop forever
	for(;;)
	{
		// Clear variable for debug
		command[0] ='\0';
		regAddress = '\0';
		data = '\0';

		// Input string is not empty, read it in
		if(fgets(input,MAX_BUFFER_SIZE,stdin) != NULL)
		{
			// Process input string into 3 individual components
			sscanf(input, "%s %i %i",command, &regAddress, &data);
			
			// Make the command string uppercase to process easier
			int i;
			for(i = 0; command[i]; i++)
			command[i] = toupper(command[i]);

			// Command is not blank
			if(command != '\0')
			{
				// Read from IO address
				if(strcmp(command, "RIO") == 0)
				{
					readIO(regAddress);
				}

				// Write to IO address
				else if(strcmp(command, "WIO") == 0)
				{
					writeIO(regAddress, data);
				}

				// Something unwanted was entered
				else
				{
					printf("No Valid Function Found\n\n");
				}
			}
		}
	}
	
	// Should never get to this point
	printf("IF YOU ARE READING THIS, SOMETHING BORKED...OOPS");

	// Should this point be reached, try to protect the system
	while(1);

	// Should this point be reached, good luck
	return 0;
}
