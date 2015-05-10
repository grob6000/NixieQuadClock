/*
	GPS Nixie Clock
	Version:	0.1
	Author:		George Robinson
	Contact:	grobinson6000@gmail.com
	File:		nixieclock.h
	Descrip.:	Non-user-configurable parameters
*/


#ifndef VFDTUBECLOCK_H_
#define VFDTUBECLOCK_H_

// clock divisor for debounce timer
#define TIMER0_CLOCK_NONE() TCCR0B&=~0b00000111 // no clock
#define TIMER0_CLOCK_ON() TCCR0B|=0b00000100 // f_cpu/128
#define TIMER0_DIV 256 // used for calculating delays, please set accordingly

// clock divisor for menu timeout timer - 16-bit overflow only
#define TIMER1_CLOCK_NONE() TCCR1B&=~0b00000111 // no clock
#define TIMER1_CLOCK_ON() TCCR1B|=0b00000101 // f_cpu/1024
#define TIMER1_DIV	1024 // used for calculating delays, please set accordingly

// clock divisor for display timer
#define TIMER2_CLOCK_NONE() TCCR2B&=~0b00000111 // no clock
#define TIMER2_CLOCK_ON() TCCR2B|=0b00000101 // f_cpu/128
#define TIMER2_DIV 256 // used for calculating delays, please set accordingly

// various modes of operation
#define MODE_CATHODETRAIN 0 // mode to cycle through digits slowly
#define MODE_SHOWTIME 1 // normal display mode, shows 6-digit time on tubes
//#define MODEDIV_SHOW 2 // mode division: any mode less than this is a display mode (therefore any mode higher is a menu mode)
#define MODE_SELECTALARM 3 // menu to select which alarm to set
#define MODE_SETALARMSTATE 4 // menu to set alarm state (i.e. switch it off without changing value)
#define MODE_SETALARMTIME 5 // menu to set alarm time
#define MODE_SETTIMEZONE 6 // menu to set timezone

// wrapped buzzer control
#define BUZZER_ON() PORTB|=(1<<2)
#define BUZZER_OFF() PORTB&=~(1<<2)
#define BUZZER_TOG() PORTB^=(1<<2) // toggles buzzer

// comma mappings
#define COMMAL (1<<4)
#define COMMAR (1<<5)
#define IND_A1_ON() characters[0]|=COMMAL
#define IND_A1_OFF() characters[0]&=~COMMAL
#define IND_A1_TOG() characters[0]^=COMMAL
#define IND_A2_ON() characters[0]|=COMMAR
#define IND_A2_OFF() characters[0]&=~COMMAR
#define IND_A2_TOG() characters[0]^=COMMAR
#define IND_POS_ON() characters[1]|=COMMAR
#define IND_POS_OFF() characters[1]&=~COMMAR
#define IND_NEG_ON() characters[1]|=COMMAL
#define IND_NEG_OFF() characters[1]&=~COMMAL
#define IND_FIX_ON() characters[5]|=COMMAR
#define IND_FIX_OFF() characters[5]&=~COMMAR
#define IND_FIX_TOG() characters[5]^=COMMAR

// number masking
#define DIGIT_ENABLE 0x40
#define DIGIT_OFF 0x00
#define DIGIT_BLANK 0x0F

// wrapped routine to check pin state of buttons
#define BALARM_ISPRESSED() ((PIND&(1<<2))==0x00)
#define BZONE_ISPRESSED() ((PIND&(1<<3))==0x00)

// tzdir uses special state chars for viewing in eeprom
#define TZDIR_PLUS 0xD1 // positive timezone, e.g. UTC + 10:00
#define TZDIR_MINUS 0xD0 // negative timezone, e.g. UTC - 02:30

// alarmset uses special state chars for viewing in eeprom
#define ALARM_SET 0xA1 // value for alarm set (on, will buzz)
#define ALARM_CLEAR 0xA0 // value for alarm cleared (off, won't buzz)
#define ALARM_MUTE 0xC0 // alarm muted
#define ALARM_UNMUTE 0xC1 // alarm not muted

// state of beeper
#define ALARMBEEP_A2 0xB2 // beeps fast
#define ALARMBEEP_A1 0xB1 // beeps slow
#define ALARMBEEP_OFF 0xB0 // not beeping RIGHT NOW

// button states
#define BUTTONSTATE_NOREPEAT 0x00 // button is NOT to repeat
#define BUTTONSTATE_REPEATWAIT 0x01 // button has activated once, and is now waiting to begin repeating
#define BUTTONSTATE_REPEATING 0x02 // button is now repeating

// convenient value - number of minutes in a day (i.e. 60*24)
#define MINUTESINADAY 1440

// fix validity
#define FIX_VALID 'A'

// function prototypes
void MakeBeep(unsigned int beepcount);
void SetSegments(unsigned char character);
void DisplayTime();
void DisplayTimeZone();
void DisplayAlarmState();
//void DisplayAlarmSelection();
//void DisplayAlarmTime();
void UpdateDisplay();
void IncTz();
void DecTz();
void SaveEepromSettings();

#endif /* VFDTUBECLOCK_H_ */