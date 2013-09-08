/*
 * receive.c
 *
 * Created: 1/25/2013 5:24:19 PM
 *  Author: Casey
 */ 

#include <avr/io.h>
#include <stdbool.h>
#include <avr/interrupt.h>
#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>

#include "monitor.h"
#include "receive.h"

#define BUFFER_LENGTH 40

volatile char receiveBuffer[BUFFER_LENGTH] = {0};
volatile uint8_t receiveBufferCount = 0;
volatile uint8_t receiveCount = 0;
volatile uint8_t receiveLength = BUFFER_LENGTH;
volatile bool first = true;

void initReceive()
{
	DDRD &= ~(1 << PD6);
	receiveCount = 0;
	receiveLength = 0;
	receiveBufferCount = 0;
	first = true;
	
	MCUCR |= ((1 << ISC11) | (1 << ISC10));
	GICR |= (1 << INT1);
	
	TCCR0 |= (1 << WGM01);
	TIMSK |= (1 << OCIE0);
	OCR0 = 26; // 104us, 1/4 bit interval
}

void displayBuffer()
{
	volatile int i = 0;
	
	for(i = 0; i < receiveBufferCount; ++i)
	{
		char c = (receiveBuffer[i]) & (0x7F);
		printf("%c", c);
		receiveBuffer[i] = NULL;
	}
	
	printf("\r\n");
	receiveBufferCount = 0;
}

ISR(INT1_vect)
{
	TCCR0 |= (1 << CS01) | (1<<CS00); // clk/64 start timer
	
	if(first)
		OCR0 = 26; // 104us, 1/4 bit interval
}

ISR(TIMER0_COMP_vect)
{	
	if(first)
	{
		first = false;
		OCR0 = 104;
	}
	
	if(receiveBufferCount < BUFFER_LENGTH)
	{
		uint8_t data = (PIND >> PD6) & 0x01;
		receiveBuffer[receiveBufferCount] = (receiveBuffer[receiveBufferCount] << 1) | data;
		receiveCount++;
		
		if(receiveCount >= 8)
		{
			first = true;
			TCCR0 &= ~((1 << CS01) | (1 << CS00));
			
			receiveCount = 0;
			receiveBufferCount++;
			received = true;
		}
	}
}