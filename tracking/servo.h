/* FILE:   servo.h
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

#ifndef servo_h
#define servo_h

/*
*	PURPOSE: Initialize DDR for servo operations
*
*	PARAMETERS: None
*
*	RETURNS: None
*/
void initServoPort(void);

/*
*	PURPOSE: Initialize ICR1, OCR1A, OCR1B, TCCR1A, TCCR1B
*
*	PARAMETERS: None
*
*	RETURNS: None
*/
void initServo(void);

/*
*	PURPOSE: Provides an absolute x-axis servo postion.
*				col is to be a number between 0 and 176.
*				Corresponds to the horizontal resolution
*				of the camera. These values should casue
*				a full range of travel from left to right
*
*	PARAMETERS: int col: value between 0 and 176 that corresponds
*					to pixel column of camera
*
*	RETURNS: None
*/
void pan(int pan);

/*
*	PURPOSE: Provides an absolute y-axis servo postion.
*				row is to be a number between 0 and 144. 
*				Corresponds to vertical resoultion of camera.
*				Should cause full range of travel from top to
*				bottom.
*
*	PARAMETERS: int row: Value between 0 and 144 that corresponds
*					to poixel row of camera
*
*	RETURNS: None
*/
void tilt(int tilt);

/*
*	PURPOSE: Retreives the current xpos of servos. Allows for
*				servo movement relative to current postion.
*
*	PARAMETERS: None
*
*	RETURNS: int: Current xpos
*/
int getServoPan(void);

/*
*	PURPOSE: Sets the servo xpos. Allows for servo movement
*				relative to current postion
*
*	PARAMETERS: int xpos: Desired xpos of servo
*
*	RETURNS: None
*/
void setServoPan(int dPan);

/*
*	PURPOSE: Retreives current ypos of servos. Allows for
*				servo movement relative to current postion.
*
*	PARAMETERS: None
*
*	RETURNS: int: Current ypos
*/
int getServoTilt(void);

/*
*	PURPOSE: Sets servo ypos. Allows for servo movement
*				relative to current postion
*
*	PARAMETERS: int ypos: Desired ypos of servo
*
*	RETURNS: None
*/
void setServoTilt(int dTilt);

#endif
