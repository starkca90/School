/* FILE:   ServoDemo.c
 * AUTHOR: Casey Stark <starkca@msoe.edu> 
 * COURSE: CE3910
 * DATECreated:  3/27/12
 *
 * DateModified: 3/29/2012
 *
 * PURPOSE: Main entry point to Two Wire Interface API
 *			Also includes all other parts from previous parts
 */

#include "uart.h"
#include "servo.h"
#include "TWIAPI.h"
#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Commands size for IO operations,
#define COMMAND 8

void camTwiInit(void)
{
	TWIwrite(0x39, 0x40);
	TWIwrite(0x14, 0x20);
	TWIwrite(0x11, 0x08);
}

/*
*	PURPOSE: Main Entry point into program
*				Intialized uart operations
*				Loops to allow IO, Servo and 
*				Two Wire Interface operations 
*				to take place
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

	TWIinit();

	camTwiInit();


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
					printf("\n\n");
				}

				// Tilt to position
				else if(strcmp(command, "TILT") == 0)
				{
					tilt(regAddress);
					printf("\n\n");
				}

				// Read Camera Register
				else if(strcmp(command, "RDCAMREG") == 0)
				{
					printf("Camera Register = 0x%X  Register Value = 0x%X\n\n",regAddress,TWIread(regAddress));
				}

				// Write to Camera Register
				else if(strcmp(command, "WRCAMREG") == 0)
				{
					TWIwrite(regAddress, data);
					printf("Write Done, Verifying\n");
					printf("Camera Register = 0x%X Now Contains 0x%X\n\n",regAddress,TWIread(regAddress));
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
