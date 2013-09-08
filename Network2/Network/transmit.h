/*
 * transmit.h
 *
 * Created: 1/25/2013 4:25:39 PM
 *  Author: Casey
 */ 


#ifndef TRANSMIT_H_
#define TRANSMIT_H_

#include <stdint.h>
#include <stdbool.h>

// Status Flags
volatile bool sending;
volatile bool messageReady;
volatile bool wait;

void initSender(void);
void backOff();
void sendMessage(char input[]);
void handleCollison();

#endif /* TRANSMIT_H_ */