/*
*	FILENAME:	main.c
*	AUTHOR:		Casey Stark <starkca@msoe.edu>
*	DATE:		9 MAY 2012
*	PROVIDES:	Sine or sawtooth wave generation on AtMega32. Waves can be toggled
*				by causing INT0 interrupt.
*	SOURCES:	http://www.resonancegroupusa.com/forum/index.php?topic=105.0 
*				http://www.daycounter.com/Calculators/Sine-Generator-Calculator.phtml
*				http://www.avr-tutorials.com/interrupts/avr-external-interrupt-c-programming
*/ 

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>

// How many bits will be used, either 4 or 8
// defaults to 8 if this is commented out
//#define four

#ifdef four
	// Number of probes for one sine period, 4 bits so 15 is max
	#define WAVE_PROBES 15
	
	// Setup wave table (See source 2)
	uint8_t wave[WAVE_PROBES] =
	{
		8,10,12,14,15,15,14,12,10,8,5,3,1,0,0,1,3,5										// Remove/Add 255s or zeros if needed
	};

#else
	// 8 bits so 255 is max
	#define WAVE_PROBES 255
	
	// Setup 8 bit wave table
	uint8_t wave[WAVE_PROBES] =
	{
	128,131,134,137,140,143,146,149,152,155,158,162,165,167,170,173,176,179,182,
	185,188,190,193,196,198,201,203,206,208,211,213,215,218,220,222,224,226,228,
	230,232,234,235,237,238,240,241,243,244,245,246,248,249,250,250,251,252,253,
	253,254,254,254,255,255,255,255,255,255,255,254,254,254,253,253,252,251,250,
	250,249,248,246,245,244,243,241,240,238,237,235,234,232,230,228,226,224,222,
	220,218,215,213,211,208,206,203,201,198,196,193,190,188,185,182,179,176,173,
	170,167,165,162,158,155,152,149,146,143,140,137,134,131,128,124,121,118,115,
	112,109,106,103,100,97,93,90,88,85,82,79,76,73,70,67,65,62,59,57,54,52,49,
	47,44,42,40,37,35,33,31,29,27,25,23,21,20,18,17,15,14,12,11,10,9,7,6,5,5,
	4,3,2,2,1,1,1,0,0,0,0,0,0,0,1,1,1,2,2,3,4,5,5,6,7,9,10,11,12,14,15,17,18,
	20,21,23,25,27,29,31,33,35,37,40,42,44,47,49,52,54,57,59,62,65,67,70,73,
	76,79,82,85,88,90,93,97,100,103,106,109,112,115,118,121,124,
	};
#endif

// Define mode settings
#define SINE 1
#define SAWTOOTH 0

// Set initial mode
uint8_t mode = SINE;

// Counter used in signal interrupt
static uint8_t sample = 0;

void initPWM(void)
{
	// PortB is output
	DDRB = 0xFF;
	
	// Phase Correct PWM
	// Clear OC0 on compare match, set OC0 at BOTTOM
	// No Clock divider
	TCCR0 = (1<<WGM00) | (1<<COM01) | (1<<CS00);
	
	// Enable timer Interrupts
	TIMSK = 1<<TOIE0; 
}

void initINT0(void)
{
	// PD2 Input
	DDRD = 1<<PD2;
	// Enable Pull Up
	PORTD = 1<<PD2;
	
	// Trigger rising edge
	MCUCR = 1<<ISC10 | 1<<ISC00;
	// Enable INT0 Interrupts
	GICR = 1<<INT0;
}
int main(void)
{
	// Initialize background systems
	initPWM();
	initINT0();
	
	// Enable global interrupts
	sei();
	
	// Loop here and do absolutely nothing
    while(1)
    {
        sleep_mode(); 
    }
}

// Timer 0 wants some love now
ISR(TIMER0_OVF_vect)
{
	cli();
	if(mode == SINE)
		// Grab the next value from table, send out to PORTB
		PORTB = wave[sample];
	else
		// Set PORTB to incremented sample counter
		PORTB = sample;
	
	// Increment counter
	sample++;
	
	// Maximum value reached
	if(sample > WAVE_PROBES)
		// Reset back to 0 to start new period
		sample = 0;
	sei();
}

ISR(INT0_vect)
{
	cli();
	// Wait for the push button to be released
	while(!(PIND & 1<<PD2));
	
	// Interrupt may have triggered while waiting, clear it just in case
	GIFR |= 1<<INTF0;
	
	// Toggle modes
	if(mode == SINE)
		mode = SAWTOOTH;
	else
		mode = SINE;
	sei();
}