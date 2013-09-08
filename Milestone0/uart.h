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

#define MAX_BUFFER_SIZE 50

void uart_init(void);
char uart_getc(void);
void uart_putc(char c);

#endif
