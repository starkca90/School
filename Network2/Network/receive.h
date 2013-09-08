/*
 * receive.h
 *
 * Created: 1/25/2013 5:21:07 PM
 *  Author: Casey
 */ 


#ifndef RECEIVE_H_
#define RECEIVE_H_

#include <stdbool.h>

volatile bool received;

void initReceive();

void displayBuffer();

#endif /* RECEIVE_H_ */