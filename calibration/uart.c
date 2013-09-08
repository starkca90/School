/* FILE:   uart.c
 * AUTHOR: Casey Stark <starkca@msoe.edu> 
 * COURSE: CE3910
 * DATE:   3/14/12
 *
 * PURPOSE: This file contains functions
 *			that are required for 
 *			UART communication.
 *			Functions include an
 *			Initializer, putc, and 
 *			getc methods.
 */

#include "uart.h"
#include <avr/io.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Value to tell UART operations the clock

// speed and desired BAUD Rate.
#define UBRRL_VALUE 51

volatile char RX_BUFF[MAX_BUFFER_SIZE];
volatile char* rxptr;
volatile char* cptr;

// Create FILE that allows for UART to take over C IO functions
FILE uart_str = FDEV_SETUP_STREAM(uart_putc,uart_getc,_FDEV_SETUP_RW);

/*
*	PURPOSE: Initializes UART Functionality for 
*				AtMega32. Enables functionality for
*				C's stdio functions as well.
*
*	PARAMETERS: None
*
*	RETURNS: None
*/
void uart_init()
{
	// Set BAUD Rate
	UBRRL = UBRRL_VALUE;
	
	UCSRA = 0;
	
	// Transmit and Receive
	UCSRB = (1<<TXEN)|(1<<RXEN);
	
	// synchronous operation, 8-bit char size
	UCSRC = (1<<URSEL)|(1<<UCSZ1)|(1<<UCSZ0);

	// initialize pointers to 0
	rxptr = 0;
	cptr = 0;

	// Finish up C IO integration
	stdout=stdin=&uart_str;

	return;
}

/*
*	PURPOSE: Add char to queue to be sent out.
*				If char is '\n', send also '\r'
*	
*	PARAMETERS: char c: character to put transmited via
*						serial connection
*
*	RETURN: None
*/
void uart_putc(char c)
{
	// wait here until the UDR is empty
	while(!(UCSRA&(1<<UDRE)));

	// add the char to the UDR
	UDR = c;

	// if the char is a newline, also send return
	if(c == '\n')
	{
		uart_putc('\r');
	}
	return;
}

/*
*	PURPOSE: Grabs char from UDR, if char is return char, reset
*				buffer and take appropriate actions, otherwise
*				echo all printable chars back. If buffer becomes
*				full, send a beep as a warning. Backspace is also
*				implemented appropriatly.
*
*	PARAMETERS: None
*
*	RETURNS: Character that was processed
*/
char uart_getc(void)
{
	char c;
	// Start of new line?
	if(rxptr == 0)
	{
		// Write buffer = start of buffer
		for(cptr = RX_BUFF;;)
		{
			// poll for new character
			while(!(UCSRA&(1<<RXC)));
			c = UDR;
			// if the char is a return, replace with newline,
			// increment the pointer, send the newline, reset
			// the read pointer and break the loop
			if(c=='\r')
			{
				c = '\n';
				*cptr = c;
				cptr++;

				uart_putc(c);
				rxptr = RX_BUFF;
				break;
			}
			// if char is printable
			if((c >= ' ') && (c < 0x7F))
			{
				// if the buffer is full, send a beep to the terminal
				if(cptr == RX_BUFF + MAX_BUFFER_SIZE - 2)
				{
					uart_putc('\a'); // beep
				}
				// otherwise set the char, increment the pointer, and send it
				else
				{
					*cptr = c;
					cptr++;
					uart_putc(c);
				}

			}
			// if backspace or delete
			if((c == 0x08) || (c == 0x7F))
			{
				// if the write pointer is not at the start of the buffer
				if(cptr > RX_BUFF)
				{
					uart_putc(0x08); // send backspace
					uart_putc(' ');  // send space to overwrite previous char
					uart_putc(0x08); // send backspace
					cptr--; // decrement the buffer write pointer
				}
			}
		}
	}
	// get the character
	c = *rxptr;
	// increment the read pointer
	rxptr++;
	// if the char was a newline, reset the read pointer to 0
	if(c == '\n')
	{
		rxptr = 0;
	}
	// return the char
	return c;
}

/*
*	PURPOSE: Obtains the value located at regAddress
*				the prints it via stdio and returns
*				given value.
*
*	PARAMETERS: uint16_t regAddress: Address to 
*						collect data from
*
*	RETURNS:	Data at given regAddress
*/
uint8_t readIO(uint16_t regAddress)
{
	uint8_t regData = *(volatile uint8_t*) regAddress;
	printf("Register %u contains %u\n\n", regAddress, regData);
	return regData;
}

/*
*	PURPOSE: Writes data to regAddress
*
*	PARAMETERS: uint16_t regAddress: Address of IO port
*					to write data to.
*				uint8_t data: Data to be writen to 
*					regAddress
*
*	RETURN: None
*/
void writeIO(uint16_t regAddress,uint8_t data)
{
	if(data <= 0xFF)
	{
		volatile uint8_t* regData = (uint8_t*) regAddress;
		*regData = data;
		if(*regData == data)
		{
			printf("Value %u now resides in %u\n", *regData, regAddress);
		}
		else
		{
			printf("Something Failed");
		}
	}
	else
	{
		printf("How Big Do You Think My Data Capacity Is? Enter A Smaller Number For Data.");
	}
	printf("\n");
	return;
}
