/*
 * monitor.c
 *
 * Created: 1/25/2013 5:00:58 PM
 *  Author: Casey
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>

#include "receive.h"
#include "transmit.h"
#include "monitor.h"

// Used to print received messages
volatile uint8_t idleCount = 0;

/*
* Purpose: To setup the channel monitor
* Parameters: None
* Returns: None
*/
void initChannelMonitor()
{
	idle = true;
	collision = false;
	
	// CTC Mode
	TCCR1B |= (1<<WGM12);
	// OCR1A Interrupt
	TIMSK |= (1<<OCIE1A);
	// Set overflow value
	OCR1A = T1_OVERFLOW;
	
	TCNT1 = 0;
	TCCR1B |= T1_PRESCALER_CODE;
	
	// TCP1 and INT1 as inputs
	DDRD |= (0<<PD6);
}

/*
* Purpose:
* Parameters:
* Returns:
*/
ISR(TIMER1_COMPA_vect){
	// Shift PIND over to place ICP1 all the way to the right
	uint8_t val = (PIND>>PD6)&0x01;
	
	// Schedule next interrupt
	TCNT1 = 0;
	
	// Line is high
	if(val==0x01)
	{
		// Idle State
		idle = true;
		collision = false;
		busy = false;
		
		if(received)
			idleCount++;
		
		PORTB = 1 << PB1;
	} 
	
	else 
	{
		// Collision State
		idle = false;
		collision = true;
		busy = false;
		
		idleCount = 0;
		
		PORTB = 1 << PB3;

		if(messageReady){
			handleCollison();
		}
	}
	
	if(idleCount > 5 && idle && received)
	{
		displayBuffer();
		received = false;
		idleCount = 0;
	}
	
}