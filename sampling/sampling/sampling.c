/*
 * sampling.c
 *
 * Created: 5/14/2012 3:32:47 PM
 *  Author: starkca
 */ 

#define F_CPU 16000000UL

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdbool.h>

// Enable debug functions
//#define DEBUG

#define SAMPLES 2000
#define MAXCOUNTER 4000
#define RECORD 1
#define PLAYBACK 2

uint8_t function = RECORD;

bool play = false;

uint8_t sample[SAMPLES];

uint16_t counter;

void initCTC(void)
{
	// PORTB as output
	DDRB = 0xFF;
	
	// Timer 1 for CTC mode
	TCCR1B |= 1<<WGM12;
	
	// Enable CTC Interrupt
	TIMSK |= 1<<OCIE1A;
	
	// Set CTC compare value to 4KHz at 16MHz Clock with prescaler of 8
	OCR1A = 499;
}

void initINT0(void)
{
	// PD2 Input
	DDRD |= 1<<PD2;
	// PD2 Pull-Up Resistor
	PORTD |= 1<<PD2;
	
	// Trigger rising edge
	MCUCR |= 1<<ISC10 | 1<<ISC00;
	// Enable INT0 Interrupts
	GICR |= 1<<INT0;
}

void initADC(void)
{
	DDRA |= (1<<PA0);
	
	// AVCC as Reference | Left Adjust
	ADMUX |= (1<<REFS0) | (1<<ADLAR);
	
	// Enable | Interrupt | 128 Pre-scale
	ADCSRA |= (1<<ADEN) | (1<<ADIE) | (1<<ADPS2) | (1<<ADPS1) | (1<<ADPS0);
}

int main(void)
{
	initCTC();
	initINT0();
	initADC();
	
	// Clear out the SAMPLES SRAM location, init to 0
	for(counter = 0; counter < SAMPLES; counter++)
	{
		sample[counter] = 0;
		#ifdef DEBUG
		PORTB = counter;
		_delay_ms(1);
		#endif
	}
			
	// Reset counter back to 0 for further use
	counter = 0;

#ifdef DEBUG	
	PORTB = 0xFF;
	_delay_ms(500);
	PORTB = 0x00;
	_delay_ms(500);
	PORTB = 0xFF;
	_delay_ms(500);
	PORTB = 0x00;
#endif
	sei();
		
    while(1)
    {
        //TODO:: Please write your application code 
    }
}

ISR(TIMER1_COMPA_vect)
{
	cli();
	
	// Need to record sample
	if(function == RECORD)
	{
		// Start ADC Conversions
		ADCSRA |= 1 << ADSC;
	}
	// Sample Recorded, playback sample
	else if(play)
	{
		// Not all SAMPLES samples were sent
		if(counter < SAMPLES)
		{
			// Send next sample
			PORTB = sample[counter];
			
			// Increment sample counter
			counter++;
		}
		else
			#ifdef DEBUG
			// Flash PORTB for debug purposes
			PORTB = 0x00;
			_delay_ms(500);
			PORTB = 0xF0;
			_delay_ms(500);
			PORTB = 0x00;
			#endif
			// All samples have been sent, disable timer
			TCCR1B &= ~(1<<CS11);
	}
	
	sei();
}

ISR(INT0_vect)
{
	cli();
	
	// Button was pressed, reset counter
	counter = 0;
	
	_delay_ms(50);
	
	// Wait for push button to be released
	while(!(PIND & 1<<PD2));
	
	_delay_ms(100);
	
	// Interrupt may have triggered while waiting, clear it just in case
	GIFR |= 1<<INTF0;
	

	// Start timer with pre-scaler of 8
	// T/C ISR will determine what to do
	TCCR1B |= 1<<CS11;
	
	if(function == PLAYBACK)
		play = true;
	
	sei();
}

ISR(ADC_vect)
{
	// Store the ADC data
	uint8_t data = ADCH;
	
	// Not all MAXCOUNTER samples were completed
	if(counter < MAXCOUNTER)
	{
		// Processed enough data samples, start storing samples
		// Starts storing at data sample SAMPLES
		if(counter > (SAMPLES-1))
			// counter is starting at SAMPLES at this point, must be adjusted to start storing at 0 to SAMPLES-1
			sample[counter-SAMPLES] = data;
		
		// Increment sample counter	
		counter++;
	}
	// Processed enough samples, time to shutdown timer
	else
	{
		if(function == RECORD)
		{
			#ifdef DEBUG
			// Flash LEDs on PORTB to signal all recording is done
			PORTB = 0x00;
			_delay_ms(500);
			PORTB = 0xFF;
			_delay_ms(500);
			PORTB = 0x00;
			_delay_ms(500);
			PORTB = 0xFF;
			_delay_ms(500);
			PORTB = 0x00;
			#endif
			// Set new function to PLAYBACK
			function = PLAYBACK;
			
			// Disables timer
			TCCR1B &= ~(1<<CS11);
		}			
	}
}