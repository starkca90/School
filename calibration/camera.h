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
#ifndef CAMERA_H
#define CAMERA_H

#include <stdint.h>

#define BLACK 0
#define WHITE 1

/*
PURPOSE:	Initilizes DDRs and pull-up resistors for PORTA (Pixel Data)
			and for VREF, HREF and PCLK
PARAMETERS:	VOID
RETURNS:	VOID
*/
void camInit(void);

/*
PURPOSE:	Calibrates camera in regards to the threashold for black and
			white pixel data. Requires user to place black paper in front
			of camera, start read process, then user must place white paper
			in front of camera, start read process. Average is taken of these
			values, then returned for usage later on.
PARAMETERS:	VOID
RETURNS:	uint8_t: Average of B&W values (Threashold)
*/
uint8_t camCal(void);

/*
PURPOSE:	Allows for verification that calibration was a sucess. Determins the
			average pixel color data from center of camera frame, then using the 
			threshold value as calculated during calibration, returns a 0 for BLACK
			and a 1 for WHITE.
PARAMETERS:	VOID
RETURNS:	uint8_t: 0 for BLACK; 1 for WHITE 
*/
uint8_t calCheck(void);

/*
PURPOSE:	Provides a countdown of how much time is left before a color 
			calibration is about to begin.
PARAMETERS: uint8_t delay: How big of a countdown should there be?
RETURNS:	VOID
*/
void countDown(uint8_t delay);

#endif
