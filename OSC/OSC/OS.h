/*
 * FILENAME:	OS.h
 *
 * DESCRIPTION:	Simple OS for AVR Based Systems
 *
 * Created: 9/16/2012 8:56:02 PM
 *  Author: Casey Stark <starkca@msoe.edu>
 *
 * Contains the interface for a very simple operating
 * system for embedded system. 
 * Provides a very simple round robin based scheduler 
 * based upon the AVR Timer Counter 1
 */ 

#ifndef OS_H_
#define OS_H_

// Stack size for each process
#define STACKSIZE 0x80

// Starting address of stack
#define STACKSTART 0x017F

// Maximum number of running processes
#define MAXPROCESSES 4

/************************************************************************
* Starts the operation of the OS. Process control blocks will be
* initialized, and calling process given process block 0 
************************************************************************/
void startOS(void);

/************************************************************************
* Add new process to OS. Process in passed in as a void pointer
*
* PARAMETERS:
*	void* function: Function which is to be the new process
*
* RETURNS:
*	int8_t:			Assigned Process ID (pid) or -1 if process can not
*						be added
************************************************************************/
int8_t addProcess(void* function);

#endif /* OS_H_ */