/*
 * FILENAME:	main.c
 *
 * DESCRIPTION:	Simple OS for AVR Based Systems
 *
 * Created: 9/16/2012 8:56:02 PM
 *  Author: Casey Stark <starkca@msoe.edu>
 *
 * Demonstrates usage of ATMEGA32 simple OS. Operates 4 processes (threads)
 * which currently outputs the process number to PORTB.
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>
#include "OS.h"
#include "RFID.h"

// Functions for each process
void p0(void);
void p1(void);
void p2(void);
void p3(void);


/************************************************************************
* Main Method. It Will:
*	1. Start OS
*	2. Spawn each new process
*	3. Execute each new process until system is shutdown
************************************************************************/
int main(void)
{	
	// Watchdog Reset
	uint8_t watchdog = MCUCSR;
	watchdog = watchdog & (1 << WDRF);
	// Watchdog was triggered
	if(!(watchdog == 0))
	{
		DDRC = 0xFF;
		PORTC = 0xFE;
		MCUCSR |= 1 << WDRF;
		while(1);
	}	
	
	// ADC Left Adjusts, Take sample from ADC5, AVCC is reference
	ADMUX |= (1 << ADLAR) | (1 << MUX2) | (1 << MUX0) | (1 << REFS0);
	
	// ADC clock = 125 kHz (64 Prescaler), Enable ADC
	ADCSRA |= (1 << ADEN) | (1 << ADPS2) | (1 << ADPS1);	
	
	// Set PORTB to all outputs
	DDRB = 0xFF;
	PORTB = 0x00;

	// Initialize the OS
	startOS();
	
	// Add each process to the OS
	addProcess(p0);
	addProcess(p1);
	addProcess(p2);
	addProcess(p3);
	
	sei();
    
	while(1)
    {
		// Sit here untill context switcher kicks in
    }
}

void powerLoss(void)
{
	TCCR1B &= ~(1 << CS12);
	
	WDTCR |= 1 << WDTOE;
	WDTCR &= ~(1 << WDE);
	
	DDRB |= 0xFF;
	PORTB = 0xFF;
	
	while(1);
}

/************************************************************************/
/* Process 0                                                            */
/************************************************************************/
void p0(void)
{
	while(1)
	{
		PORTB = 0x00;
		
		DDRA = 0x00;
		
		ADCSRA |= 1 << ADSC;
		while(!(ADCSRA & (1 << ADIF)));
		ADCSRA |= 1 << ADIF;
		
		uint8_t adcValLow = ADCL;
		uint8_t adcValHigh = ADCH;
		
		if(adcValLow < 0x8F)
			powerLoss();
	}
}
/************************************************************************
* Process 1
************************************************************************/
void p1(void)
{
	 // PORTA all inputs
	 DDRA = 0x00;	 
	 // AVCC as reference
	 ADMUX |= (1 << REFS0);
	 // Enable ADC, set prescaler to clk/128
	 ADCSRA |= (1 << ADEN) | (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);
	while(1)
	{
		// Start the conversion
		ADCSRA |= 1 << ADSC;
		// Wait for the conversion to complete
		while(!(ADCSRA & (1 << ADIF)));
		// Clear the complete conversion flag
		ADCSRA |= 1 << ADIF;
		
		// Grab the data
		uint8_t lowData = ADCL;
		uint8_t highData = ADCH;
		
		if(lowData > 3)
			PORTB |= 1 << PB7;
		else
			PORTB &= ~(1 << PB7);
	}
}


/************************************************************************
* Process 2
************************************************************************/
void p2(void)
{
	// Launch the RFID system that was implemented in CE 3200
	RFIDMAIN();
	
	while(1)
	{
		// Just in case the RFID program fails, sit here forever
	}
}


/************************************************************************
* Process 3
************************************************************************/
void p3(void)
{
	while(1)
	{
		PORTB = 0x03;
	}
}