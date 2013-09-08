/* FILE:   servo.c
 * AUTHOR: Casey Stark <starkca@msoe.edu> 
 * COURSE: CE3910
 * DATE:   3/27/12
 *
 * PURPOSE: This file contains functions
 *			to control HiTEC HS-422 servos
 *			using the AtMega32 Timmer Counter 1
 *			function in PWM mode. Functions
 *			by passing a desired degree to 
 *			the pan or tilt function. Also
 *			provides the ability to move servos
 *			relative to their current position.
 *			this can be done by calling setServoPan/Tilt
 *			and passing the desired change in postion.	
 */

#include "servo.h"

#include <avr/io.h>

// Constants for Max and Min Servo Positions
#define MAX_PAN 135	
#define MAX_TILT 135
#define MIN_PAN 45
#define MIN_TILT 45
#define INITIAL_PAN 90
#define INITIAL_TILT 90

// Constants for calculating OCR values
#define ICR_VALUE 10000
#define CALC_OFFSET 600
#define CALC_MULT 10

// To make understanding the OCRs the addresses
// are overwritten to help understand better
#define PAN   _SFR_IO16(0x2A)
#define TILT   _SFR_IO16(0x28)


// Private variables to keep track of servo positions
int PanVal = INITIAL_PAN;
int TiltVal = INITIAL_TILT;

/*
*	PURPOSE: Calculates an OCR value given a degree value. This is
*				intended to be private, therfore it is not in the
*				header.
*
*	PARAMETERS: int degree: desired degree value servo should move to
*
*	RETURNS: int: value that OCR should be set to.
*/
int calcOCR(int degree)
{
	degree=ICR_VALUE-(CALC_OFFSET+(CALC_MULT*degree));
	return degree;
}

/*
*	PURPOSE: Initialize DDR for servo operations
*
*	PARAMETERS: None
*
*	RETURNS: None
*/
void initServoPort(void)
{
	DDRD = (1<< PD5) | (1<<PD4);

	return;
}

/*
*	PURPOSE: Initialize ICR1, OCR1A, OCR1B, TCCR1A, TCCR1B
*
*	PARAMETERS: None
*
*	RETURNS: None
*/
void initServo(void)
{
	TCCR1A = (1<<COM1A1) | (1<<COM1A0) | (1<<COM1B1) | (1<<COM1B0);
	TCCR1B = (1<<CS11) | (1<<WGM13);
	ICR1 = ICR_VALUE;
	PAN = calcOCR(PanVal);
	TILT = calcOCR(TiltVal);
	
	initServoPort();
	
	return;	
}

/*
*	PURPOSE: Provides an absolute x-axis servo postion.
*				col is to be a number between 0 and 176.
*				Corresponds to the horizontal resolution
*				of the camera. These values should casue
*				a full range of travel from left to right
*
*	PARAMETERS: int pan: value between 0 and 176 that corresponds
*					to pixel column of camera
*
*	RETURNS: None
*/
void pan(int pan)
{
	if(pan > MAX_PAN)
		pan = MAX_PAN;
	if(pan < MIN_PAN)
		pan = MIN_PAN;  
	PanVal = pan;
	PAN = calcOCR(PanVal);
	return;
}

/*
*	PURPOSE: Provides an absolute y-axis servo postion.
*				row is to be a number between 0 and 144. 
*				Corresponds to vertical resoultion of camera.
*				Should cause full range of travel from top to
*				bottom.
*
*	PARAMETERS: int tilt: Value between 0 and 144 that corresponds
*					to poixel row of camera
*
*	RETURNS: None
*/
void tilt(int tilt)
{
	if(tilt > MAX_TILT)
		tilt = MAX_TILT;
	if(tilt < MIN_TILT)
		tilt = MIN_TILT; 
	TiltVal = tilt;
	TILT = calcOCR(TiltVal);
	return;
}

/*
*	PURPOSE: Retreives the current pan of servos. Allows for
*				servo movement relative to current postion.
*
*	PARAMETERS: None
*
*	RETURNS: int: Current xpos
*/
int getServoPan(void)
{
	return PanVal;
}

/*
*	PURPOSE: Sets the servo xpos. Allows for servo movement
*				relative to current postion
*
*	PARAMETERS: int dPan: Desired change of Pan
*
*	RETURNS: None
*/
void setServoPan(int dPan)
{
	PanVal = PanVal + dPan;
	pan(PanVal);
	return;
}

/*
*	PURPOSE: Retreives current ypos of servos. Allows for
*				servo movement relative to current postion.
*
*	PARAMETERS: None
*
*	RETURNS: int: Current ypos
*/
int getServoTilt(void)
{
	return TiltVal;
}

/*
*	PURPOSE: Sets servo ypos. Allows for servo movement
*				relative to current postion
*
*	PARAMETERS: int ypos: Desired ypos of servo
*
*	RETURNS: None
*/
void setServoTilt(int dTilt)
{
	TiltVal = TiltVal + dTilt;
	tilt(TiltVal);
	return;
}
