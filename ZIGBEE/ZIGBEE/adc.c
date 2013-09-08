/*
 * ADC.c
 *
 * Created: 10/19/2012 11:59:13 AM
 *  Author: starkca
 */ 

#include <avr/io.h>

#include "adc.h"

void initADC(void)
{
	// PORTA all inputs
	DDRA = 0x00;
	
	// AVCC as reference
	ADMUX |= (1 << REFS0);
	
	// Enable ADC, set prescaler to clk/128
	ADCSRA |= (1 << ADEN) | (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);
}

void adcStart(void)
{
	ADCSRA |= 1 << ADSC;
	
	while(!(ADCSRA & (1<<ADIF)));
	
	ADCSRA |= 1 << ADIF;
}

uint8_t getADCL(void)
{
	return ADCL;
}

uint8_t getADCH(void)
{
	return ADCH;
}