/*
FILE: 		TWIAPI.H
PURPOSE:	Enables Two Wire Interface (TWI) operations/devices on
			the Atmega32 chips. Designed for OV6620 Digital Camera.
AUTHOR:		Stark, Casey <starkca@msoe.edu>
DATE:		APRIL 18 2012	
*/

#ifndef TWIAPI_H
#define TWIAPI_H

#include <stdint.h>

/*
PURPOSE:	Initialize TWBR and TWSR registers for TWI operations
PARAMETERS:	VOID
RETURNS:	VOID
*/
void TWIinit(void);

/*
PURPOSE:	Read contents of registers on TWI connected device
PARAMETERS:	uint8_t regNumber:	Register to be read
RETURNS:	uint8_t:	8-bit value stored in register
*/
uint8_t TWIread(uint8_t regNumber);

/*
PURPOSE:	Writes a value to a specified register on TWI connected device
PARAMETERS:	uint8_t regNumber:	Register to write to
			uint8_t value:		Value to write
RETURNS:	VOID
*/
void TWIwrite(uint8_t regNumber, uint8_t value);

#endif
