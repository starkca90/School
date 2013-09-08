/*
FILE:		CAMERA.H
PURPOSE:	Provides methods for use by the camera in tracking 
			of a white square on a black board. Supports calibration
			only at this time.
AUTHOR:		Stark, Casey <starkca@msoe.edu>
DATE:		APRIL 23 2012
CHANGELOG:	04/23/2012 - Initial Release
						- Supports Initilization
						- Supports Calibration	
*/

#define F_CPU 16000000UL
#include <util/delay.h>

#include "camera.h"

#include <avr/io.h>
#include <stdio.h>

#define MIDROW 88
#define MIDCOL 72
#define MAXPIXELS 5
#define CALDELAY 5

#define NOCAL 3

uint8_t threshold = 0;

/*
PURPOSE:	Initilizes DDRs and pull-up resistors for PORTA (Pixel Data)
			and for VREF, HREF and PCLK
PARAMETERS:	VOID
RETURNS:	VOID
*/
void camInit(void)
{
	// Make PortA all inputs
	DDRA = 0x00;  
	// Enable Pull-up Resistors on A
	PORTA = 0xFF;

	// Allow HREF, VSYNC and PCLK inputs on D
	DDRD &= ~((1<<PD6) | (1<<PD3) | (1<<PD2));
	// Enable Pull-up resistors on those
	PORTD |= (1<<PD6) | (1<<PD3) | (1<<PD2);
}

/*
PURPOSE:	Reads in MAXPIXELS points from a single frame from the
			rough center of the frame. Averages these pixel values
			the returns for further processing.
PARAMETERS:	VOID
RETURNS:	uint8_t: Average of read pixel data values.
*/
uint8_t readPixels(void)
{
	uint8_t rows = 0;
	uint8_t cols = 0;
	uint8_t pixels = 0; 
	int average = 0;

	// Loop until VSYNC pulses
		// Low
	while(!(PIND & 1<<PD6));
		// High
	while(PIND & 1<<PD6);

	// New frame is about to come out
	// Let HREF Pulse a few times untill the middle
	// of the frame is reached
	for(rows = 0; rows < MIDROW; rows++)
	{
		// HREF becomes high
		while(!(PIND & 1<<PD3));
		while(PIND & 1<<PD3);
	}

	// Do not necessarily require this, but wait until HREF is high
	// which means row is being sent out.
	while(!(PIND & 1<<PD3));

	// At the center row, goto center columns
	for(cols = 0; cols < MIDCOL; cols++)
	{
		// PCLK Pulses
		while(!(PIND & 1<<PD2));
		while(PIND & 1<<PD2);
	}

	// Arrived at pretty close to dead center of frame, start to 
	// Read pixel data from PINA.
	for(pixels = 0; pixels < MAXPIXELS; pixels++)
	{
		// Wait for rising edge of PCLK
		while(!(PIND & 1<<PD2));
		average += PINA;
	}

	// At this point, average holds the sum of MAXPIXELS points
	// We want the average of these points
	return average/MAXPIXELS;
}

/*
PURPOSE:	Provides a countdown of how much time is left before a color 
			calibration is about to begin.
PARAMETERS: uint8_t delay: How big of a countdown should there be?
RETURNS:	VOID
*/
void countDown(uint8_t delay)
{
	for(;delay > 0; delay--)
	{
		// Print how many seconds are left
		printf("%u.. ", delay);
		// One Second Delay
		_delay_ms(1000);
	}
	// Seconds were printed all in one line, break that up
	printf("\n");
}

/*
PURPOSE:	Calibrates camera in regards to the threashold for black and
			white pixel data. Requires user to place black paper in front
			of camera, start read process, then user must place white paper
			in front of camera, start read process. Average is taken of these
			values, then returned for usage later on.
PARAMETERS:	VOID
RETURNS:	uint8_t: Average of B&W values (Threashold)
*/
uint8_t camCal(void)
{	
	
	printf("About to calibrate for BLACK. Place BLACK paper in front of camera...\n");
	countDown(CALDELAY);
	uint8_t black = readPixels();
	printf("BLACK now calibrated. BLACK value = 0x%X\n", black);

	printf("About to calibrate for WHITE. Place WHITE paper in front of camera...\n");
	countDown(CALDELAY);
	uint8_t white = readPixels();
	printf("WHITE now calibrated. WHITE value = 0x%X\n", white);

	threshold = (black + white) / 2;

	return threshold;
}

/*
PURPOSE:	Allows for verification that calibration was a sucess. Determins the
			average pixel color data from center of camera frame, then using the 
			threshold value as calculated during calibration, returns a 0 for BLACK
			and a 1 for WHITE.
PARAMETERS:	VOID
RETURNS:	uint8_t: 0 for BLACK; 1 for WHITE 
*/
uint8_t calCheck(void)
{
	uint8_t value = readPixels();

	printf("Item Value = 0x%X\n", value);	

	if(threshold == 0)
		value = NOCAL;
	else if(value > threshold)
		value = WHITE;
	else
		value = BLACK;

	return value;
}
