/* FILE:   uart.h
 * AUTHOR: Casey Stark <starkca@msoe.edu> 
 * COURSE: CE3910
 * DATE:   3/14/12
 *
 * PURPOSE: Header file for UART API
 *			Contains declerations for 
 *			functions available with this
 *			API and and constants required
 */

#ifndef uart_h
#define uart_h

#include <stdint.h>
#include <stdio.h>

// Size for UART buffer
#define MAX_BUFFER_SIZE 50

/*
*	PURPOSE: Initializes UART Functionality for 
*				AtMega32. Enables functionality for
*				C's stdio functions as well.
*
*	PARAMETERS: None
*
*	RETURNS: None
*/
void uart_init(void);

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
char uart_getc(void);

/*
*	PURPOSE: Add char to queue to be sent out.
*				If char is '\n', send also '\r'
*	
*	PARAMETERS: char c: character to put transmited via
*						serial connection
*
*	RETURN: None
*/
void uart_putc(char c);

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
uint8_t readIO(uint16_t regAddress);

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
void writeIO(uint16_t regAddress,uint8_t data);

#endif
