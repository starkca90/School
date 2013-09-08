/*
 * eeprom.h
 *
 * Created: 10/14/2012 7:39:20 PM
 *  Author: starkca
 */ 


#ifndef EEPROM_H_
#define EEPROM_H_

uint8_t EEMEM eepromCrdCnt = 0;
char EEMEM eepromHistory[50][11];
uint8_t EEMEM eepromHistoryCnt[50];

#endif /* EEPROM_H_ */