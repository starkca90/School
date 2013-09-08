/************************************************************************/
/* Provides an RFID system for the ATMEGA32 embedded platform that reads	*/
/* an RFID card, stores its unique ID in EEPROM, then displays the ID	*/
/* a serially connected device. The user can also view a complete		*/
/* history of cards scanned by the system since setup.					*/
/************************************************************************/

#define F_CPU 16000000UL

#define RFID_BAUD_H 0x01
#define RFID_BAUD_L 0xA0

#define ENABLEPIN PD5

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <util/delay.h>
#include <stdbool.h>
#include <string.h>
#include <avr/sleep.h>

#include "uart.h"
#include "eeprom.h"

// Counter used in UART interrupt to keep track of ID places
volatile uint8_t IDCount = 0;

// Data from current card in process
volatile char currentCard[10];

// Array of all unique cards detected
volatile char history[50][11];

// Array of counts of each unique card detected
volatile uint8_t historyCount[50];

// How many unique cards have been seen
volatile uint8_t crdCnt = 0;

/*
* Flags to track status of separate subsystems
* of the system
*/
// Antenna On or Off
volatile bool antennaStatus = false;
// Does the user want to toggle the antenna status
volatile bool antennaBtn = false;
// Antenna is in process of toggling
volatile bool antennaTgl = false;
// Should the Heart be toggled
volatile bool pulseHrt = false;
// Is heart currently being displayed or not
volatile bool heart = false;
// Heart is in process of changing
volatile bool hrtCng = false;
// User would like history to be displayed
volatile bool historyBtn = false;
// History is in process of being displayed
volatile bool historyFlag = false;
// System encountered an event that requires something to
// be printed to UART
volatile bool print = false;
// Can the system goto sleep?
volatile bool canSleep = false;

// Counter to keep track of how long system has been inactive
volatile uint8_t sleepCnt = 0;


/************************************************************************/
/* Grabs the history from EEPROM upon power up							*/
/*																		*/
/* PARAMETERS:															*/
/*	- VOID																*/
/*																		*/
/* RETURNS:																*/
/*	- VOID																*/
/************************************************************************/
void setupHistory(void)
{	
	uint8_t eepromSetupCnt = 0;
	// Get the count of cards
	crdCnt = eeprom_read_byte((const uint8_t*)&eepromCrdCnt);
	
	// The number of cards is between a reasonable amount
	// So we will assume there is no fault in the memory
	if(crdCnt > 0 && crdCnt < 10)
	{
		for(; eepromSetupCnt < crdCnt; eepromSetupCnt++)
		{
			// Read in the ID of each card
			eeprom_read_block((void*)history[eepromSetupCnt],(const void*)eepromHistory[eepromSetupCnt],10);
			// Add in NULL terminator
			history[eepromSetupCnt][11] = "/0";
			// Read in count of each card
			historyCount[eepromSetupCnt] = eeprom_read_byte((const uint8_t*)eepromHistoryCnt[eepromSetupCnt]);
		}	
	}
}

/************************************************************************/
/* Updates EEPROM with any new IDs seen and the count of each           */
/* ID seen																*/
/*																		*/
/* PARAMETERS:															*/
/*	- VOID																*/
/*																		*/
/* RETURNS:																*/
/*	- VOID																*/
/************************************************************************/
void updateEEPROMHistory(void)
{
	uint8_t eepromUpdateCnt = 0;
	// Update count of unique IDs seen
	eeprom_update_byte((uint8_t*)&crdCnt,eepromCrdCnt);
	
	for(; eepromUpdateCnt < crdCnt; eepromUpdateCnt++)
	{
		// Update list of each unique ID seen
		eeprom_update_block((const void*)&history[eepromUpdateCnt],(const void*)&eepromHistory[eepromUpdateCnt],10);
		// Update count of each unique ID seen
		eeprom_update_byte((uint8_t*)eepromHistoryCnt[eepromUpdateCnt],historyCount[eepromUpdateCnt]);
	}
}

/************************************************************************/
/*	Print the status and ID if available. Has to first set BAUD to      */
/*	9600 to work with Serial LCD panels, which means global interrupts  */
/*	must be disabled first.												*/
/*																		*/
/*	PARAMETERS:															*/
/*	 - bool status: Current status of system (Antenna on or off)		*/
/*																		*/
/*	RETURN:																*/
/*	 - VOID																*/
/************************************************************************/
void printStatus(bool status)
{
	// Disable Interrupts
	cli();
	
	// Set BAUD to 9600 with a 16MHz Clock
	UBRRH = LCD_BAUD_H;
	UBRRL = LCD_BAUD_L;
	
	// We found there needs to be a delay here to let the 
	// system setle in to the new BAUD
	_delay_ms(1);
	
	// Run defined output to clear terminal screen
	clrScr;
	
	// Start the status message
	printf("RFID Antenna Status: ");
	
	// The antenna is enabled, print out enabled
	// message
	if(status)
	{
		uint8_t prntCount = 0;
		// Inform user via UART that system is enabled
		printf("enabled");
		// Print generic message of tag ID
		printf("\nRFID Tag: ");
		
		// Card was presented and ready to print
		if(print)
		{
			// Print hex start
			printf("0x");
			
			// Iterate through holder for current card
			for(; prntCount < 10; prntCount++)
			{
				// Print each of the cards data values
				printf("%c",currentCard[prntCount]);
				
			}
			// Disable print flag other wise things will break
			print = false;
		}
	}			
		
	// System is currently off, so inform the user	
	else
	{
		// Complete status message
		printf("disabled");
		
		// Clear print flag just in case
		print = false;	
	}		

		
	// Allow rest of past message to run through the pipes before
	// resetting BAUD to RFID	
	_delay_ms(2);
		
	// Reset BAUD	
	UBRRH = RFID_BAUD_H;
	UBRRL = RFID_BAUD_L;
	
	// We found we needed this delay to allow for system to settle into new BAUD
	_delay_ms(1);
	
	// Enable global interrupts
	sei();
}

/************************************************************************/
/* Pulses the heart for the required heart beat.                        */
/* Displays an H to signify the heart.									*/
/*																		*/
/* PARAMETERS:															*/
/*	- VOID																*/
/*																		*/
/* RETURNS:																*/
/*	- VOID																*/
/************************************************************************/
void pulseHeart(void)
{
	// Going to be printing messages, disable interrupts
	cli();
	
	// Set flag to inform system the heart is changing
	hrtCng = true;
	
	// Change the BAUD to LCD	
	UBRRH = LCD_BAUD_H;
	UBRRL = LCD_BAUD_L;
	
	// Toggle "heart" LED
	PORTB ^= 1 << PB5;
	
	// Allow system to settle into new BAUD
	_delay_ms(1);
	
	// The heart is current present
	if(heart)
	{
		// Goto heart position
		hrt;
		// Clear the heart
		printf(" ");
	}
	// Heart is not present
	else
	{
		// Goto heart position
		hrt;
		// Display the heart with alarm (Pretty funny with African American Heart Monitor
		// As seen on Family Guy)
//		printf("H\a");
		// Dispaly the heart without sound
		printf("H");
	}
	
	// Allow data to finish travel
	_delay_ms(2);
	
	// Reset BAUD to RFID	
	UBRRH = RFID_BAUD_H;
	UBRRL = RFID_BAUD_L;
	
	// Allow system to get used to new BAUD
	_delay_ms(1);
	
	// Clear heart change flag
	hrtCng = false;
	// Toggle heart flag
	heart = !heart;
	// Clear toggle heart flag
	pulseHrt = false;

	// Enable Interrupts
	sei();
}

/************************************************************************/
/* Setup port that RFID will be residing for enabling/disabling			*/
/* In this implementation PD5 was used as it was free and UART is		*/
/* already being used so why not used PORTD.							*/
/*																		*/
/* PARAMETERS:															*/
/*	- VOID																*/
/*																		*/
/* RETURNS:																*/
/*	- VOID																*/
/************************************************************************/
void initRFID(void)
{	
	// Enable Bit Port Output
	DDRD |= 1 << ENABLEPIN;
	
	// Enable Bit on/Turns RFID Off
	PORTD |= 1 << ENABLEPIN;
}

/************************************************************************/
/* Initiate PORTD for the push button on PD2 and PD3 to trigger their	*/
/* external interrupts on a falling edge								*/
/*																		*/
/* PARAMETERS:															*/
/*	- VOID																*/
/*																		*/
/* RETURNS:																*/
/*	- VOID																*/
/************************************************************************/
void initButtons(void)
{
	// PD2 Input
	DDRD |= (1 << PD2) | (1 << PD3);
	// Enable Pull-Up Resistors
	PORTD |= (1 << PD2) | (1 << PD3);
	
	// Trigger falling edge Interrupt
	MCUCR |= 1 << ISC10 | 1 << ISC00;
	// Enable INT0 Interrupts
	GICR |= (1 << INT0) | (1 << INT1);
}

/************************************************************************/
/* Toggle the RFID antenna by writing a 0 - Enable or 1 - Disable to	*/
/* corresponding pin													*/
/************************************************************************/
void toggleAntenna(void)
{
	// Will be delaying in here, don't want to 
	// break any interrupts
	cli();
	
	// Inform system the antenna is in process of changing
	antennaTgl = true;
	
	// Clear flag to track antenna button
	antennaBtn = false;
	
	// Wait for push button to be released
	while(!(PIND & 1 << PD2));
	
	// Let bounces stop
	_delay_ms(20);
	
	// CLear Interrupt just in case
	GIFR |= 1 << INTF0;
	
	// Toggle antenna status
	antennaStatus = !antennaStatus;
	
	// Change the Antenna bit
	if(antennaStatus)
		PORTD = PORTD & (~(1 << ENABLEPIN));
	else
		PORTD = PORTD | (1 << ENABLEPIN);
	
	// Print status message of current antenna state
	printStatus(antennaStatus);
	
	// Inform system the toggel has finished
	antennaTgl = false;
	
	// Enable interrupts
	sei();
}

/************************************************************************/
/* Initialize Timer Counter 1 to track when the heart beat should pulse	*/
/*																		*/
/* PARAMETERS:															*/
/*	- VOID																*/
/*																		*/
/* RETURNS:																*/
/*	- VOID																*/
/************************************************************************/
void initHeart(void)
{
	// Clear the counter
	TCCR1A = 0;
	
	// Set overflow value to get 1/2 interrupt
	OCR1A = 7810;
	
	// CTC Mode
	TCCR1B |= 1 << WGM12;
	
	// 1024 Prescale
	TCCR1B |= (1 << CS10) | (1 << CS12);
	
	// Enable Interrupt
	TIMSK |= 1 << OCIE1A;
}

/************************************************************************/
/* Ensure the current ID is present in the ID History, if not add it	*/
/* also update the count of the ID										*/
/*																		*/
/* May also add in EEPROM stuff here, or to the printHistory function - */
/*	Not sure just yet													*/
/*																		*/
/* PARAMETERS:															*/
/*	- VOID																*/
/*																		*/
/* RETURNS:																*/
/*	- VOID																*/
/************************************************************************/
void updateHistory(void)
{
	// This process may take some time, so disable
	// Interrupts just in case
	cli();
	
	// Some tracking variables
	uint8_t card;
	uint8_t ID;
	
	bool matchFound = false;
	
	// Iterate through each card currently in History to see if
	// it is already there
	for(card = 0; card < crdCnt; card++)
	{
		bool match = true;
		// Iterate through each ID value to see if the cards are the same
		for(ID = 0; ID < 10; ID++)
		{
			// Compare each ID
			match &= (history[card][ID] == currentCard[ID]);
		}
		// Found a match, increment the count
		if(match)
		{
			historyCount[card] = historyCount[card] + 1;
			matchFound = true;
		}
	}
	
	// Card not currently in History, lets add it
	if(!matchFound)
	{
		for(ID = 0; ID < 10; ID++)
		{
			history[crdCnt][ID] = currentCard[ID];
		}
		
		// Add in null terminator for printing
		history[crdCnt][11] = "\0";
		// Start the count of this card
		historyCount[crdCnt] = 1;
		// Increment count of each unique ID
		crdCnt++;
	}
	
	updateEEPROMHistory();
	
	// Enable interrupts
	sei();
}

/************************************************************************/
/* Prints each of the IDs that have been seen since startup and the		*/
/* count that each card has been seen									*/
/*																		*/
/* PARAMETERS:															*/
/*	- VOID																*/
/*																		*/
/* RETURNS:																*/
/*	- VOID																*/
/************************************************************************/
void printHistory(void)
{
	// Will be printing, disable interrupts
	cli();
	
	// Tell system we are sending out history
	historyFlag = true;
	
	// Clear Button flag
	historyBtn = false;
	
	// Wait for button to be released
	while(!(PIND & 1 << PD3));
	
	// Allow button to debounce
	_delay_ms(20);
	
	// Clear interrupt flag just in case
	GIFR |= 1 << INTF1;
	
	// Set BAUD to LCD
	UBRRH = LCD_BAUD_H;
	UBRRL = LCD_BAUD_L;
	
	// Allow system to settle into new BAUD
	_delay_ms(1);
	
	// Clear the Screen
	clrScr;
	
	// Make a nice header
	printf("ID\t\tAccess Count\n");
	
	// Count number of card displayed
	uint8_t card;
	
	// Iterate through each card
	for(card = 0; card < crdCnt; card++)
	{
		// Print each card ID and count
		printf("0x%s\t\t%d\n",history[card], historyCount[card]);
	}
	
	// Print total number of unique cards seen
	printf("\n\n%d",crdCnt);
	
	// Allow final bits to travel
	_delay_ms(2);
	
	// Reset BAUD to RFID
	UBRRH = RFID_BAUD_H;
	UBRRL = RFID_BAUD_L;
	
	// Allow system to settle into new BAUD
	_delay_ms(1);
	
	// Done printing history
	historyFlag = false;
	
	// Enable interrupts
	sei();
}

/************************************************************************/
/* Main entry point into program. Allows the user to enable an RFID		*/
/* antenna connected via UART with the enable pin at ENABLEPIN on PORTD	*/
/*																		*/
/* System starts out in the disabled state, user must first trigger an	*/
/*	INT0 Interrupt (PD2) which will then enable the RFID Antenna		*/
/*																		*/
/* Once enabled, user can then scan an RFID equipped card and system	*/
/*	will then display the stored ID on a serial display					*/
/*																		*/
/* User can also trigger an INT1 interrupt which will then display a	*/
/*	history of each card the system has seen since deployment			*/
/*																		*/
/* System also stores the history inside of EEPROM so system can be		*/
/*	shutdown and history can still be viewed once power is restored		*/
/************************************************************************/
int main(void)
{
	// PORTB as output
	DDRB = 0xFF;
	
	// Initialize Subsystems
	uart_init();
	initButtons();
	initRFID();
	initHeart();
	setupHistory();
	
	printStatus(antennaStatus);
	
	// Enable Interrupts
	sei();
	
	// Loop through here to check each status flag
    while(1)
    {
		// User want to toggle antenna state and antenna is presently
		// not in the process of changing
        if(antennaBtn && !antennaTgl)
			// Toggle Antenna state
			toggleAntenna();
			
		// User wants to see the history and the history is currently
		// not being printed	
		if(historyBtn && !historyFlag)
			// Display history
			printHistory();
		
		// System says it's time to pulse the heart	
		if(pulseHrt && !hrtCng)
			pulseHeart(); 
			
		// Something wants to print	the status
		if(print)
		{
			updateHistory();
			printStatus(antennaStatus);
		}
		
		// Set sleep mode to idle
		set_sleep_mode(SLEEP_MODE_IDLE);
		
		cli();	
		if(canSleep)
		{
			sleep_enable();
			sei();
			sleep_cpu();
			sleep_disable();	
		}					
		
		sei();
    }
}

/************************************************************************/
/* Interrupt to toggle Antenna Status                                   */
/************************************************************************/
ISR(INT0_vect)
{	
	canSleep = false;
	sleepCnt = 0;
	
	// Antenna is currently not in process of changing
	if(!antennaTgl)
		// Set flag and system will get right on that
		antennaBtn = true;	
}

/************************************************************************/
/* Interrupt to display history											*/
/************************************************************************/
ISR(INT1_vect)
{
	canSleep = false;
	sleepCnt = 0;
	
	// History is currently not printing
	if(!historyFlag)
		// Set flag, system will get right on that
		historyBtn = true;
}

/************************************************************************/
/* Interrupt for Timer Counter for Heart Beat							*/
/************************************************************************/
ISR(TIMER1_COMPA_vect)
{
	if(sleepCnt < 10)
		sleepCnt++;
	else
		canSleep = true;
		
	// Heart is currently not changing
	if(!hrtCng)
		// Set flag, system will get right on that
		pulseHrt = true;
		
}

// Flag to track if an ID is on it's way in
volatile bool incomming = false;

/************************************************************************/
/* Interrupt for USART Receive which is used to receive the RFID ID		*/
/************************************************************************/
ISR(USART_RXC_vect)
{
	sleepCnt = 0;
	canSleep = false;
	
	// Get data from UDR, store in RAM
	uint8_t data = UDR;
	
	// Start bit of ID
	if(data == 10)
	{
		// Inform system we are getting some data
		incomming = true;
		IDCount = 0;	
	}
	// Currently receiving data, and not stop bit
	else if(incomming && data != 13)
	{
		// Store data into current card array
		currentCard[IDCount++] = data;
	}
	// Currently receiving and this is the stop bit
	else if(incomming && data == 13)
	{
		// Clear the counter
		IDCount = 0;
		// Tell system we are full
		incomming = false;
		// Print the ID
		print = true;
	}	
	// Something broke
	else
	{
		// Disable RFID as a failsafe
		toggleAntenna();
	}
}