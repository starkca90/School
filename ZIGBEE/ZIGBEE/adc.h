/*
 * ADC.h
 *
 * Created: 10/19/2012 12:05:01 PM
 *  Author: starkca
 */ 


#ifndef ADC_H_
#define ADC_H_

void initADC(void);

void adcStart(void);

uint8_t getADCL(void);

uint8_t getADCH(void);

#endif /* ADC_H_ */