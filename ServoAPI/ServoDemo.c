/* FILE:   ServoDemo.c
 * AUTHOR: Casey Stark <starkca@msoe.edu> 
 * COURSE: CE3910
 * DATECreated:  3/27/12
 *
 * DateModified: 3/29/2012
 *
 * PURPOSE: Main entry point to Servo Milestone
 *			for CE3910. Demonstrates basic
 *			Servo manipulation via AtMega32 PWM
 *			operations. Also includes parts from
 *			MILESTONE 1.
 */

#include "uart.h"
#include "servo.h"
#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Commands size for IO operations,
#define COMMAND 3



/*
*	PURPOSE: Main Entry point into program
*				Intialized uart operations
*				Loops to allow IO and Servo
*				operations to take place
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

	initServo();


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

				// Pan to position
				else if(strcmp(command, "PAN") == 0)
				{
					pan(regAddress);
				}

				// Tilt to position
				else if(strcmp(command, "TLT") == 0)
				{
					tilt(regAddress);
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
