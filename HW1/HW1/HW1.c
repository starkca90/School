/*
* HW1.c
*
* Periodically blinks LEDs:
*	- Case 0: (No Buttons)
*		* LED1 blink 1HZ 50% DC
*		* LED2 blink 1/6HZ 50%
*	- Case 1: (PD2 Pressed)
*		* LED1 blink 1/6HZ 50%
*		* LED2 blink 1HZ 50%
*	- Case 2: (PD3 Pressed)
*		* LED1 blink 2HZ
*		* LED2 1/3Hz
*	- Case 3: (Both PD2 & PD3)
*		* Test mode (Both lights on)
*
* Created: 9/6/2012 9:09:26 AM
*  Author: Stark, Casey <starkca@msoe.edu>
*/

// Define the CPU Clock Speed for delay functions
#define F_CPU 16000000UL

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdbool.h>
#include "uart.h"

#define mode0 0
#define mode1 1
#define mode2 2
#define mode3 3

volatile uint8_t function = mode0;
volatile bool PD2Down = false;
volatile bool PD3Down = false;
volatile uint8_t count1 = 0;
volatile uint8_t count2 = 0;

/*
* Initializes on board push buttons for interrupts
*/
void initButtons(void)
{
	// PD2 and PD3 Input
	DDRD |= 1<<PD2 | 1<<PD3;
	// Enable Pull-Up Resistors
	PORTD |= 1<<PD2 | 1<<PD3;
	
	// Trigger any logic change interrupt
	MCUCR |= 1<< ISC00 | 1<<ISC10;
	// Enable INT0 & INT1
	GICR |= 1<<INT0 | 1<<INT1;
}

/*
* Initializes Timer/Counter1 for CTC mode
*/
void initTimer(void)
{
	// Clear TCCR1 Register
	TCCR1A = 0;
	TCCR1B = 0;
	
	// Set compare match register
	OCR1A = 2603;
	
	// CTC Mode
	TCCR1B |= 1<<WGM12;
	
	// 1024 Prescale
	TCCR1B |= (1<<CS10) | (1<<CS12);
	
	// Enable Timer Compare Interrupt
	TIMSK |= 1<<OCIE1A;
	
	
}

int main(void)
{	
	initButtons();
	
	initTimer();
	
	// LEDs output
	DDRB = 0x03;
	
	// Global interrupt enable
	sei();
	
	while(1)
	{
		//Program interrupt driven, no need for code here
	}
}

/*
* Interrupt Service Routine for PB2 Falling Edge:
*	- Checks if PB3 is pressed:
*		* Yes, Run test mode
*		* No, Run Mode 1
*/
ISR(INT0_vect)
{		
	_delay_ms(20);
	
	PD2Down = !PD2Down;
	
	if(PD2Down)
	{
		// PD2 & PD3 Pressed, Enter test mode
		if(PD3Down)
		{
			function = mode3;
		}
		// Just PD2 is pressed
		else
		{
			function = mode1;
		}
	}
	// PD2 was released
	else
	{
		function = mode0;
	}
}

ISR(INT1_vect)
{
	_delay_ms(20);
	
	PD3Down = !PD3Down;
	
	if(PD3Down)
	{
		// PD3 and PD2 Pressed, Enter test mode
		if(PD2Down)
		{
			function = mode3;
		}
		// Just PD3 is pressed
		else
		{
			function = mode2;
		}
	}
	// PD3 was released
	else
	{
		function = mode0;
	}
}

ISR(TIMER1_COMPA_vect)
{	
	// Increment counter for 1Hz light
	count1++;
	
	switch(function)
	{
		case mode0:
			// Increment counter for 1/6 Hz
			count2++;
			if(count1 >= 12)
			{
				count1 = 0;
				// Toggle LED 0
				PORTB ^= 1 << PB0;
			}
			if(count2 >= 2)
			{
				count2 = 0;
				// Toggle LED 1
				PORTB ^= 1 << PB1;
			}
			break;
		
		case mode1:
			// Increment counter for 1/6 Hz
			count2++;
			if(count1 >= 12)
			{
				count1 = 0;
				// Toggle LED 1
				PORTB ^= 1 << PB1;
			}
			if(count2 >= 2)
			{
				count2 = 0;
				// Toggle LED 0
				PORTB ^= 1 << PB0;
			}
			break;
		
		case mode2:
			// CTC Occurs at a 1/3 Hz rate
			count2 = 0;
			if(count1 >= 6)
			{
				count1 = 0;
				// Toggle LED 0
				PORTB ^= 1 << PB0;
			}	
			// Toggle LED 1
			PORTB ^= 1 << PB1;
			break;
			
		case mode3:
			// No need for either counter as both
			// lights will be on
			count1 = 0;
			count2 = 0;
			// Turn on both LEDs
			PORTB = 0x03;
			break;
			
		default:
			break;
	}
}