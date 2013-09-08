/*
* transmit.c
*
* Created: 1/25/2013 4:22:28 PM
*  Author: Casey
*/

#define F_CPU 160000000UL

#include <avr/io.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdlib.h>

#include "transmit.h"
#include "monitor.h"

volatile bool firstSent = false;
volatile char outBuffer[250];

// Number of bits in output buffer
volatile uint8_t outBufferIndex = 0;

// Bit currently being sent
volatile uint8_t outIndex = 0;

void handleCollison()
{
	wait = true;
	PORTD |= 1<<PD7;
	outIndex = 0;
}

void backOff()
{
	// Determine random backoff time
	int random = rand()%128;
	
	for(int i = 0; i<random; i++){
		_delay_ms(10);
	}
	
	// Done waiting
	wait = false;
}

void initSender(void)
{
	sending = false;
	messageReady = false;
	
	// Output Compare Interrupt on T/C2
	TIMSK |= 1<<OCIE2;
	// CTC
	TCCR2 |= (1<<WGM21);
	// Reset TCNT2 Just in case
	TCNT2 = 0;
	// Output compare register = 51
	OCR2 = 51;
	// Pin D 7 is output
	DDRD |= 1<<PD7;
	// Bring line high per spec
	PORTD |= 1<<PD7;
}

void write1(void)
{
	outBuffer[outBufferIndex++] = '1';
}

void write0(void)
{
	outBuffer[outBufferIndex++] = '0';
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
	// Iterate through entire string
	for(int i = 0; i < 244; i++)
	{
		// Came across where user pressed enter
		if(input[i] == '\n')
			// Ignore enter
			break;
		// Encode the character
		writeChar(input[i]);
	}
	// Let system know message was encoded and 
	// ready to go on the line	
	messageReady = true;
	
	// Enable timer Counter 2 with prescale of 64
	TCCR2 |= (1<<CS22) | (0<<CS21) | (0<<CS20);
}

ISR(TIMER2_COMP_vect)
{
	// Schedule next interrupt
	TCNT2 = 0;
	
	// Parameters are met to send message
	if((sending) && (!wait) && (!collision))
	{
		// Message has been compiled and can be sent
		if(messageReady)
		{
			if(outBufferIndex > 0 && outIndex < outBufferIndex)
			{
				if(outBuffer[outIndex] == '1')
				{
					if(!firstSent)
					{
						PORTD &= ~(1<<PD7);
						//printf("L");
						firstSent = true;
					}
					else
					{
						PORTD |= 1<<PD7;
						firstSent = false;
						//printf("H");
						outIndex++;
					}
				}
				else
				{
					if(!firstSent)
					{
						PORTD |= 1<<PD7;
						//printf("H");
						firstSent = true;
					}
					else
					{
						PORTD &= ~(1<<PD7);
						//printf("L");
						firstSent = false;
						outIndex++;
					}
				}
			}
			else // End of Message
			{
				// Turn of Timer Counter 2
				TCCR2 &= ~((1<<CS22) | (1<<CS21) | (1<<CS20));
				// Tell system to stop sending
				sending = false;
				// Message is no longer ready
				messageReady = false;
				// Reset Indexes
				outIndex = 0;
				outBufferIndex = 0;
				// Bring com line high per spec
				PORTD |= (1<<PD7);
			}
			
		}
	}
}