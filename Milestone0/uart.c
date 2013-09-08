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

// This needs to be updated to use the equation
// Will be done by completion of MILESTONE 1
#define UBRRL_VALUE 51

volatile char RX_BUFF[MAX_BUFFER_SIZE];
volatile char* rxptr;
volatile char* cptr;

// UART Initialization
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

	return;
}

// Add char to queue to be sent out.
// If char is '\n', send also '\r'
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

// Grabs char from UDR, if char is return char, reset
// buffer and take appropriate actions, otherwise
// echo all printable chars back. If buffer becomes
// full, send a beep as a warning. Backspace is also
// implemented appropriatly.
char uart_getc()
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

