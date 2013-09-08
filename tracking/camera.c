/*
FILE:		CAMERA.H
PURPOSE:	Provides methods for use by the camera in tracking 
			of a white square on a black board. Supports calibration
			only at this time.
AUTHOR:		Stark, Casey <starkca@msoe.edu>
DATE:		APRIL 23 2012
CHANGELOG:	04/23/2012 - Initial Release
						- Supports Initialization
						- Supports Calibration	
						
			05/04/2012 - Update 1
						- Supports pan tracking
						- Backed changes to allow tilt tracking
						
			05/05/2012 - Update 2
						- Supports tilt tracking
						- Supports pan/tilt combo tracking			 
*/

#ifndef F_CPU
	#define F_CPU 16000000UL
#endif


// Should debug info be sent?
 
#ifndef DEBUG
	#define DEBUG
#endif


#include <util/delay.h>
#include <avr/io.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "camera.h"
#include "servo.h"

#define CALDELAY 5

#define NOCAL 3

#define VSYNC (PIND & 1<<PD6)
#define HREF (PIND & 1<<PD3)
#define PCLK (PIND & 1<<PD2)

#define PIC_HEIGHT 144
#define PIC_WIDTH 176
#define TOTAL_PIXELS 25344

#define THRESHOLD (black + white)/2

static volatile uint16_t black;
static volatile uint16_t white;
static volatile uint8_t centerX;
static volatile uint8_t centerY;

/*
PURPOSE:	Initializes DDRs and pull-up resistors for PORTA (Pixel Data)
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

void findCenter(void)
{
	// Store the color value of pixel
	volatile uint8_t color;
	// Point 1 X and Y values (Right and Bottom of board)
	volatile uint8_t highX = 0;
	volatile uint8_t highY = 0;
	
	// Point 2 X and Y values (Left and Top of board)
	volatile uint8_t lowX = 0;
	volatile uint8_t lowY = 0;
	
	// Flag if first white pixel
	volatile uint8_t first = 0;
	
	// Counters
	uint8_t y;
	uint8_t x;
	
	// Wait for current read to complete
	while(!VSYNC);
	while(VSYNC);
	for(y = 0; y <PIC_HEIGHT; y++)
	{
		while(!HREF);
		for(x = 0; x < PIC_WIDTH; x++)
		{
			while(PCLK);
			// Wait for PCLK
			while(!PCLK);
			// Save PINA
			color = PINA;
			
			// WHITE
			if(color > THRESHOLD)
			{
				if(first == 0)
				{
					lowX = x;
					lowY = y;
					first++;
				}
				// Check to see if it is furthest to right
				highX = x;
				// Save lowest Y
				highY = y;
			}				
		}
	}
	
	// Find center points
	centerX = (lowX + highX) / 2;
	centerY = (lowY + highY) / 2;
	
	#ifdef DEBUG
		printf("Lower: (%d, %d)\tHigher: (%d, %d)\nBlack: 0x%x\tWhite: 0x%x\nThreshold: 0x%x\r\n#",
		lowX,lowY,highX,highY,black,white,THRESHOLD);
	#endif
}

/*
PURPOSE:	Reads in entire frame of camera looking for high and low values. Averages
			high and low values to get rough idea of frame color value
PARAMETERS:	VOID
RETURNS:	uint8_t: Average of read pixel data values.
*/
uint8_t readPixels(void)
{
	uint16_t high = 0x00;
	uint16_t low = 0xFFFF;
	
	uint16_t pixels;

	// Loop until VSYNC pulses
		// Low
	while(!VSYNC);
		// High
	while(VSYNC);
	
	// VSYNC is low
	// Read in entire frame
	for(pixels = 0; pixels < TOTAL_PIXELS; pixels++)
	{
		// Wait for rising of PCLK
		while(!PCLK);
		// Store PINA value
		uint16_t value = PINA;
		// Found a higher value
		if(value > high) high = value;
		// Found a lower value
		if(value < low) low = value;
	}
	
	// Average of high and low values
	return (high + low) / 2;
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
	black = readPixels();
	printf("BLACK now calibrated. BLACK value = 0x%X\n", black);

	printf("About to calibrate for WHITE. Place WHITE paper in front of camera...\n");
	countDown(CALDELAY);
	white = readPixels();
	printf("WHITE now calibrated. WHITE value = 0x%X\n", white);

	return THRESHOLD;
}

/*
PURPOSE:	Allows for verification that calibration was a success. Determines the
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

	if(THRESHOLD == 0)
		value = NOCAL;
	else if(value > THRESHOLD)
		value = WHITE;
	else
		value = BLACK;

	return value;
}

/*
PURPOSE:	Tracks a white square on a black board in vertical and horizontal motions
			or a combination of the two. Once tracking has been started, there is no
			going back unless if entire system is restarted. Scans a frame to find where 
			the white square starts in the row, then checks when it ends. Using this information
			the row is updated as if the white was seen in that row, then corresponding counters are set.
			Then takes averages of spacing between counters and adjust servo positions accordingly.
PARAMETERS:	VOID
RETURNS:	VOID
*/
void track(void)
{	
	#ifdef DEBUG
		printf("Up = %d\tDown = %d\nCounterClock = %d\tClock = %d\n",(PIC_HEIGHT/2)+5,(PIC_HEIGHT/2)-5,(PIC_WIDTH/2)+25,(PIC_WIDTH/2)-25);
		_delay_ms(1000);
	#endif
	
	while(!(UCSRA & 1<<RXC))
	{
		findCenter();
		
		#ifdef DEBUG
			printf("Center: (%d, %d)\r\n#",centerX,centerY);
			_delay_ms(1000);
		#endif
		
		// Camera is already in center, or center is missing
		if(centerY == 0 && centerX == 0)
			continue;
			
		// Center the Y
		if(centerY > (PIC_HEIGHT / 2) + 50)
			setServoTilt(5);
		else if(centerY < (PIC_HEIGHT / 2) - 50)
			setServoTilt(-5);
			
		// Center the X
		if(centerX > (PIC_WIDTH / 2) + 50)
			setServoPan(-5);
		else if(centerX < (PIC_WIDTH / 2) - 50)
			setServoPan(5);
	}	
}