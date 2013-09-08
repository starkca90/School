#ifndef channelMonitor_h
#define channelMonitor_h

#define HALF_BIT_TIME 400 //The half-bit duration is 416 us according to specs
#define CLK_FREQ 16 //This is the clock frequency in MHz
#define T1_CLOCK_PRESCALER 8 //Sets the clock-prescaler to 8
#define T1_PRESCALER_CODE (0<<CS12)|(1<<CS11)|(0<<CS10) //Sets the code used for clock bit select
#define T1_OVERFLOW ((HALF_BIT_TIME*CLK_FREQ)/T1_CLOCK_PRESCALER);

void initChannelMonitor();
void sendMessage(char input[]);

#endif