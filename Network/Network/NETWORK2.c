#include "channelMonitor.h"
#include "uart.h"
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>

volatile bool fallingEdge;
volatile bool idle;
volatile bool busy;
volatile bool collision;
volatile bool sending;
volatile bool messageReady;

volatile uint8_t outIndex = 0;
volatile bool firstSent = false;

volatile char outBuffer[250];
volatile uint8_t outBufferIndex = 0;

#define clrScr printf("\e[2J \e[H")
#define home printf("\e[H")
#define clrLn printf("\e[K")
#define hrt printf("\e[1;32f")
#define sleep printf("\e[2;0f")
#define pwr printf("\e[2;10f")

void initSender(void);

/*
* Purpose: The main function of the channelmonitor
* Parameters: None
* Returns: None
*/
int main(void)
{
	char input[244];
	int i = 0;
	
	initChannelMonitor();
	initSender();
	
	clrScr;
	home;
	printf("Welcome to my first network :P\r\n");
	
	
	DDRB = 0xFF;                                            //set port c as output
	while(1){

		if(fgets(input,244,stdin) != NULL)
		{
			for(i=0;i<244;i++)
			{
				if(input[i] == '\n')
					break;
			}
			
			sending = true;
			// Disable external interrupt 1 while sending, it will be busy
			GICR &= ~(1<<INT1);
			
			sendMessage(input);
			while(sending)
				PORTB = 0b01111111;
				
			// Re-Enable external interrupt
			GICR |= (1<<INT1);
			// Setup INT1 to trigger on falling edge
			MCUCR = (1<<ISC11)|(0<<ISC10); 
		}

		if(idle)
		PORTB = 1<<1;
		else if(busy)
		PORTB = 1<<2;
		else if(collision)
		PORTB = 1<<3;
		else
		PORTB = 0x00;
	}
	return 0;
}

/*
* Purpose: To setup the channel monitor
* Parameters: None
* Returns: None
*/
void initChannelMonitor(){
	idle = false;
	collision = false;
	busy = false;
	
	// Start by listening for a falling edge on INT1
	MCUCR = (1<<ISC11)|(0<<ISC10);
	// INT1 Interrupts
	GICR = (1<<INT1);
	// Set flag to look for falling edge
	fallingEdge = true;

	// CTC Mode
	TCCR1B = (1<<WGM12);
	// OCR1A Interrupt
	TIMSK |= (1<<OCIE1A);
	// Set overflow value
	OCR1A = T1_OVERFLOW;
	
	// TCP1 and INT1 as inputs
	DDRD |= (1<<PD6) | (1<<PD3);
	
	sei();
}

void initSender(void)
{
	sending = false;
	messageReady = false;
	
	TIMSK |= 1<<TOIE2;
	TCCR2 |= (1<<CS22)|(1<<CS21)|(1<<CS20);
	TCNT2 = 108;
	
	uart_init();
}

void write1(void)
{
	outBuffer[outBufferIndex] = '1';
	outBufferIndex++;
}

void write0(void)
{
	outBuffer[outBufferIndex] = '0';
	outBufferIndex++;
}

 void writeChar(uint8_t out)
 {	 
	// Add starting 1
	write1();
	 
	 for(int i = 6; i >= 0; i--)
	 {
		// if bit in character is 0
			// Send 0
		if((out & 1<<i) == 0)
			write0();
		//Assuming the only other option is a 1
		else
			write1();
	 }	
 }

void sendMessage(char input[])
{

	
	for(int i = 0; i < 244; i++)
	{
		if(input[i] == '\n')
			break;
		writeChar(input[i]);
	}
	
	messageReady = true;
}

/* INT1_vect
* Purpose:
* Parameters:
* Returns:
*/
ISR(INT1_vect)
{
	TCNT1 = 0;
	TCCR1B |= T1_PRESCALER_CODE;
	if(fallingEdge){
		//Start looking for rising edge
		fallingEdge = false;
		MCUCR |= (1<<ISC10);
	} else {
		//Start looking for a falling edge
		fallingEdge = true;
		MCUCR &= ~(1<<ISC10);
	}
	// State is busy
	busy = true;
	idle = false;
	collision = false;
}

/*
* Purpose:
* Parameters:
* Returns:
*/
ISR(TIMER1_COMPA_vect){
	// Shift PIND over to place ICP1 all the way to the right
	uint8_t val = (PIND>>PD6)&0x01;
	TCNT1 = 0;
	if(val==0x01)
	{
		// Idle State
		idle = true;
		collision = false;
		busy = false;
	} else {
		// Collision State
		idle = false;
		collision = true;
		busy = false;
	}
}

/*
* Purpose:
* Parameters:
* Returns:
*/
ISR(TIMER2_OVF_vect)
{
	if(sending)
	{
		if(messageReady)
		{
			if(outBufferIndex > 0 && outIndex < outBufferIndex)
			{
				if(outBuffer[outIndex] == '1')
				{
					if(!firstSent)
					{
						PORTD &= ~(1<<PD6);
						printf("L");
						firstSent = true;
					}
					else
					{
						PORTD |= 1<<PD6;
						firstSent = false;
						printf("H");
						outIndex++;
					}
				}
				else
				{
					if(!firstSent)
					{
						PORTD |= 1<<PD6;
						printf("H");
						firstSent = true;
					}
					else
					{
						PORTD &= ~(1<<PD6);
						printf("L");
						firstSent = false;
						outIndex++;
					}
				}
			}
			else
			{
				sending = false;
				messageReady = false;
				outIndex = 0;
				outBufferIndex = 0;
				PORTD &= ~(1<<PD6);
			}
			
		}
	}
	
	TCNT2 = 108;
}