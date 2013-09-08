#define F_CPU 160000000UL

#include "channelMonitor.h"
#include "uart.h"

#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>
#include <util/delay.h>
 
volatile bool fallingEdge;
volatile bool idle;
volatile bool busy;
volatile bool collision;
volatile bool sending;
volatile bool messageReady;
volatile bool wait;
 
volatile bool messagePrinted;
 
volatile uint8_t lastbitpart = 0;
volatile char currentChar[8];
volatile char printChar =0;
volatile uint8_t bitCount = 8;
volatile uint8_t inIndex = 0;
volatile uint8_t charCount = 0;
 
volatile uint8_t outIndex = 0;
volatile bool firstSent = false;
 
volatile char outBuffer[250];
volatile char messageBuffer[250];
volatile char receiveBuffer[250];
volatile char testBuffer[250];
volatile int receiveCount=0;
volatile uint8_t outBufferIndex = 0;
 
#define clrScr printf("\e[2J \e[H")
#define home printf("\e[H")
#define clrLn printf("\e[K")
#define hrt printf("\e[1;32f")
#define sleep printf("\e[2;0f")
#define pwr printf("\e[2;10f")
 
void initSender(void);
void backOff();
 
 
/*
* Purpose: The main function of the channelmonitor
* Parameters: None
* Returns: None
*/
int main(void)
{
                char input[244];
                int i = 0;
               
                initChannelMonitor();
                initSender();
               
                clrScr;
                home;
                printf("Welcome to my first network :P\r\n");
/*           for (int p=0; p<100; p++){
                                testBuffer[250-p] = 0x61;
                }
               
                for(int q=0; q<100; q++){
                                printf("%c", testBuffer[250-q]);
                }
                printf("%s",testBuffer);*/
               
                DDRB = 0xFF;                                            //set port b as output
               
                while(1){
 
                /*           if(wait == true){
                                                //            sei();
                                                               
                                                //            while(collision);
                                                                backOff();
                                                                sending = true;
                                                                wait = false;
                                                                sendMessage(input);
                                                }*/
 
                                if(fgets(input,244,stdin) != NULL)
                                {
                                                for(i=0;i<244;i++)
                                                {
                                                                if(input[i] == '\n')
                                                                                break;
                                                }
                                               
                                                sending = true;
                                               
                                                sendMessage(input);
                                               
                                                // Setup INT1 to trigger on falling edge
                                                MCUCR = (1<<ISC11)|(0<<ISC10);
 
                                                while(sending)
                                                                {
                                                                                if(wait)
                                                                                                backOff();
                                                                }
                                }
 
                                if(idle)
                                PORTB = 1<<1;
                                else if(busy)
                                PORTB = 1<<2;
                                else if(collision)
                                PORTB = 1<<4;
                                else
                                PORTB = 0x00;
                                if((idle)&&(receiveCount>0)){
                                                for(int q=0;q<=receiveCount; q++){
                                                                printf("%c", receiveBuffer[q]);
                                                }
                                                receiveCount = 0;
                                }
                }
                return 0;
}
 
void backOff(){
                PORTB = (1<<7);
                int random = rand()%128;
//            printf("backoff");
                for(int i = 0; i<random;i++){
                                                _delay_ms(10);
                }
                wait = 0;
                PORTB = (0);
}
 
/*
* Purpose: To setup the channel monitor
* Parameters: None
* Returns: None
*/
void initChannelMonitor(){
                idle = true;
                collision = false;
                busy = false;
               
                // Start by listening for a rising edge on INT1
                MCUCR = (1<<ISC11)|(1<<ISC10);
                // INT1 Interrupts
                GICR = (1<<INT1);
 
                // CTC Mode
                TCCR1B = (1<<WGM12);
                // OCR1A Interrupt
                TIMSK |= (1<<OCIE1A);
                // Set overflow value
                OCR1A = T1_OVERFLOW;
               
                TCNT1 = 0;
                TCCR1B |= T1_PRESCALER_CODE;
               
                // TCP1 and INT1 as inputs
                DDRD |= (0<<PD6) | (0<<PD3);
               
                sei();
}
 
void initSender(void)
{
                //sending = false;
                messageReady = false;
               
                TIMSK |= 1<<OCIE2;
                TCCR2 |= (1<<WGM21) | (1<<CS22) | (0<<CS21) | (0<<CS20);
                TCNT2 = 0;
                OCR2 = 51;
                DDRD |= 1<<PD7;
                PORTD |= 1<<PD7;
               
                uart_init();
}
 
void write1(void)
{             
                if(wait){
                                return;
                }
                outBuffer[outBufferIndex] = '1';
                outBufferIndex++;
}
 
void write0(void)
{
                if(wait){
                                return;
                }
                outBuffer[outBufferIndex] = '0';
                outBufferIndex++;
}
 
void writeChar(uint8_t out)
{            
                if(wait==true){
                                                return;
                                }
                // Add starting 1
                write1();
               
                 for(int i = 6; i >= 0; i--)
                {
                                // if bit in character is 0
                                                // Send 0
                                if((out & 1<<i) == 0)
                                                write0();
                                //Assuming the only other option is a 1
                                else
                                                write1();
                }            
}
 
void sendMessage(char input[])
{
 
               
                for(int i = 0; i < 244; i++)
                {
                                if(wait==true){
                                                return;
                                }
                                if(input[i] == '\n')
                                                break;
                                writeChar(input[i]);
                }
 
                if(wait==true){
                                                return;
                }
               
                messageReady = true;
}
 
volatile bool firstEdge = false;
volatile bool secondEdge = false;
volatile bool initialOne = false;
volatile uint8_t count = 0;
 
volatile uint8_t previousBit = 0;
volatile uint8_t presentBit = 0;
 
volatile bool receivedBit = false;
 
volatile uint8_t presentChar = 0;
 
/* INT1_vect
* Purpose:
* Parameters:
* Returns:
*/
ISR(INT1_vect)
{
                if(!busy)
                                TCNT2 = 38;
               
               
                //if(fallingEdge && !firstEdge)
                //{
                                ////Start looking for rising edge
                                //fallingEdge = false;
                                //MCUCR |= (1<<ISC10);
                                //firstEdge = true;
                //}
                //else if(!fallingEdge && firstEdge && !secondEdge)
                //{
                                //fallingEdge = true;
                                //MCUCR &= ~(1<<ISC10);
                                //secondEdge = true;
                                //initialOne = true;
                                //count = 0;
                                //presentBit = 1;
                //}                         
                //else if(count > 0 && initialOne){
                                //presentBit = (previousBit ^ 1);
                                //receivedBit = true;
                //}
                //else if(count == 0 && initialOne)
                //{
                                //presentBit = previousBit;
                                //receivedBit = true;
                //}
                //
                //if(receivedBit)
                //{
                                //presentChar |= presentBit << bitCount;
                                //bitCount--;
                                //previousBit = presentBit;
                //}
               
                // State is busy
                busy = true;
                idle = false;
                collision = false;
}
 
uint8_t displayCount = 0;
 
void writeMessage()
{
                //printf(messageBuffer);
                //if(messageBuffer[0] == 0x01)
                //{
                                //uint16_t x = 4;
                                //while(x < inIndex)
                                //{
                                                //if(messageBuffer[x] == 0x04)
                                                                //break;
                                                //printf(messageBuffer[x]);
                                                //x++;
                                //}
                //}
                //inIndex = 0;
}
 
/*
* Purpose:
* Parameters:
* Returns:
*/
ISR(TIMER1_COMPA_vect){
                // Shift PIND over to place ICP1 all the way to the right
                uint8_t val = (PIND>>PD6)&0x01;
                TCNT1 = 0;
                if(val==0x01)
                {
                                if(busy)
                                {
                                                cli();
                                                writeMessage();
                                                sei();
                                }
                                // Idle State
                                idle = true;
                                collision = false;
                                //busy = false;
                               
                                if(!messagePrinted)
                                                writeMessage();
                               
                } else {
                               
                                // Collision State
                                idle = false;
                                collision = true;
                                busy = false;
 
                                if(messageReady){
                                                wait = true;
                                                PORTD |= 1<<PD7;
                                                outIndex=0;
                                }
                }
}
 
volatile bool readBit = true;
/*
* Purpose:
* Parameters:
* Returns:
*/
ISR(TIMER2_COMP_vect)
{
                TCNT2 = 0;
                if((sending)&&(!wait)&&(!collision))
                {
                                if(messageReady)
                                {
                                                if(outBufferIndex > 0 && outIndex < outBufferIndex)
                                                {
                                                                if(outBuffer[outIndex] == '1')
                                                                {
                                                                                if(!firstSent)
                                                                                {
                                                                                                PORTD &= ~(1<<PD7);
                                                                                                //printf("L");
                                                                                                firstSent = true;
                                                                                }
                                                                                else
                                                                                {
                                                                                                PORTD |= 1<<PD7;
                                                                                                firstSent = false;
                                                                                                //printf("H");
                                                                                                outIndex++;
                                                                                }
                                                                }
                                                                else
                                                                {
                                                                                if(!firstSent)
                                                                                {
                                                                                                PORTD |= 1<<PD7;
                                                                                                //printf("H");
                                                                                                firstSent = true;
                                                                                }
                                                                                else
                                                                                {
                                                                                                PORTD &= ~(1<<PD7);
                                                                                                //printf("L");
                                                                                                firstSent = false;
                                                                                                outIndex++;
                                                                                }
                                                                }
                                                }
                                                else
                                                {
                                                                sending = false;
                                                                messageReady = false;
                                                                outIndex = 0;
                                                                outBufferIndex = 0;
                                                                PORTD |= (1<<PD7);
                                                }
                                               
                                }
                }
               
                else if((busy)&&(!sending))
                {             
                                uint8_t in = (PIND>>PD6)&0x01;
                                if(readBit)
                                {
                                                readBit = false;
                                                if(bitCount >=1)
                                                {
                                                                currentChar[bitCount - 1] = (PIND>>PD6)&0x01;//in;
                                                                printChar |= in << (bitCount-1);
                                                                bitCount--;
 
                                                }
                                                else
                                                {
                                                                printChar = printChar& 0b01111111;
                                                                bitCount = 8;
                                                               
                                                                receiveBuffer[receiveCount] = printChar;
                                                                receiveCount++;
                                                               
                                               
                                                                busy = false;
                                               
                                                }
                                               
                                }
                                else
                                                readBit = true;                  
                }
}