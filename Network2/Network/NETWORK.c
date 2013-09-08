#include <avr/interrupt.h>

#include "uart.h"
#include "transmit.h"
#include "monitor.h"
#include "receive.h"

#include <avr/io.h>

char input[244] = {0};

/*
* Purpose: 
* Parameters: None
* Returns: None
*/
int main(void)
{
	initChannelMonitor();
	initReceive();
	initSender();
	uart_init();
	
	sei();
	
	clrScr;
	home;
	printf("Welcome to my first network :P\r\n");
	
	while(1){

		if(fgets(input,244,stdin) != NULL)
		{
			uint8_t i = 0;
			
			for(i=0;i<244;i++)
			{
				if(input[i] == '\n')
					break;
			}
			
			sending = true;
			
			sendMessage(input); 

			while(sending)
				{
					if(wait)
						backOff();
				}
		}
	}
	return 0;
}