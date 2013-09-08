/*
FILE: 		TWIAPI.C
PURPOSE:	Enables Two Wire Interface (TWI) operations/devices on
			the Atmega32 chips. Designed for OV6620 Digital Camera.
AUTHOR:		Stark, Casey <starkca@msoe.edu>
DATE:		APRIL 18 2012	
*/

#define F_CPU 16000000UL

#include "TWIAPI.h"
#include <avr/io.h>
#include <util/twi.h>
#include <stdio.h>
#include <util/delay.h>

/*
Value to be stored in TWBR, obtained using:

	 CLOCK_FREQ  
	------------  -16
	SERIAL_CLOCK
	-------------------
			 8
*/
#define TWBR_VAL ((16000000/100000)-16)/8

// OV6620 Slave Read Address
#define SLA_R 0xC1
// OV6620 Slave Write Address
#define SLA_W 0xC0

/*
PUPOSE:		Performs operations that must be performed for each
			operation, such as clearing TWINT and enabling TWI
PARAMETERS:	uint8_t command:	command to be performed 
RETURNS:	uint8_t:	Returns status of operation (TWSR)
*/
uint8_t TWIaction(uint8_t command)
{
	// Setup Control Register with command and enable TWI
	TWCR = command | (1<<TWINT) | (1<<TWEN);
	// Command is not STOP, STOP doesn't set TWINT bit
	if(!(command == (1<<TWSTO)))
		// Operation has not completed yet, keep spinning
		while(!(TWCR & (1<<TWINT)));
	// Mask off clock divider bits from Status Reg
	return TW_STATUS;
}

/*
PURPOSE:	Initialize TWBR and TWSR registers for TWI operations
PARAMETERS:	VOID
RETURNS:	VOID
*/
void TWIinit(void)
{
	TWBR = TWBR_VAL;
	
	return;	
}

/*
PURPOSE:	Read contents of registers on TWI connected device
PARAMETERS:	uint8_t regNumber:	Register to be read
RETURNS:	uint8_t:	8-bit value stored in register
*/
uint8_t TWIread(uint8_t regNumber)
{
	uint8_t retVal = 0;

	// Start Communications
	if(TWIaction(1<<TWSTA) != TW_START)
		printf("Error Starting Read\n");
	
	// Send Camera Write Address
	TWDR = SLA_W;
	if(TWIaction(0) != TW_MT_SLA_ACK)
		printf("Error Sending Camera Write Address for Read\n");
	
	// Send Desired Reg Address
	TWDR = regNumber;
	if(TWIaction(0) != TW_MT_DATA_ACK)
		printf("Error Sending Camera Reg Address for Read\n");
		
	// Send a stop
	TWIaction(1<<TWSTO);
	// Let the stop take effect
	_delay_us(10);

	// Send START
	if(TWIaction(1<<TWSTA) != TW_START)
		printf("Error Sending Repeated Start\n");

	// Send Camera Read Address
	TWDR = SLA_R;
	if(TWIaction(0) != TW_MR_SLA_ACK)
		printf("Error Getting Camera Read ACK\n");

	// Ask for Data
	if(TWIaction(0) != TW_MR_DATA_NACK)
		printf("Error Reading From Camera Register\n");

	// Read data from TWDR to return value
	retVal = TWDR;

	// Stop Communications
	TWIaction(1<<TWSTO);

	// Return retVal
	return retVal;	
}

/*
PURPOSE:	Writes a value to a specified register on TWI connected device
PARAMETERS:	uint8_t regNumber:	Register to write to
			uint8_t value:		Value to write
RETURNS:	VOID
*/
void TWIwrite(uint8_t regNumber, uint8_t value)
{
	// Start Communications
	if(TWIaction(1<<TWSTA) != TW_START)
		printf("Error Starting Write\n");
	
	// Send Camera Write Address
	TWDR = SLA_W;
	if(TWIaction(0) != TW_MT_SLA_ACK)
		printf("Error Sending Camera Write Address for Write 0x%X\n",TW_STATUS);
	
	// Send Register Address
	TWDR = regNumber;	
	if(TWIaction(0) != TW_MT_DATA_ACK)
		printf("Error Sending Register to Camera 0x%X\n",TW_STATUS);
	
	// Send Data
	TWDR = value;
	if(TWIaction(0) != TW_MT_DATA_ACK)
		printf("Error Sending Data to Camera\n");

	// Stop Communications
	TWIaction(1<<TWSTO);
}
