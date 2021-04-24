/*
	GPS Nixie Clock
	Version:	0.1
	Author:		George Robinson
	Contact:	grobinson6000@gmail.com
	File:		nixieclock.h
	Descrip.:	Non-user-configurable parameters
*/


#ifndef NIXIECLOCK_H_
#define NIXIECLOCK_H_



#define BUTTON_BOUNCECOUNT (F_CPU/256/TIMER0_DIV*BUTTON_DEBOUNCE_MS/1000) // sets sensitivity of button debounce | larger value --> larger delay | please reference to F_CPU
#define BUTTON_WAITCOUNT (F_CPU/256/TIMER0_DIV*BUTTON_WAIT_MS/1000) // sets the repeat delay of +/- buttons | please reference to F_CPU
#define BUTTON_REPEATCOUNT (F_CPU/256/TIMER0_DIV*BUTTON_REPEAT_MS/1000) // sets the repeat speed of the +/- buttons | please reference to F_CPU

// number masking
#define DIGIT_ENABLE 0x40
#define DIGIT_OFF 0x00
#define DIGIT_BLANK 0x0F

// clock divisor for debounce timer
#define TIMER0_CLOCK_NONE() TCCR0B&=~0b00000111 // no clock
#if (TIMER0_DIV == 256)
	#define TIMER0_CLOCK_ON() TCCR0B|=0b00000100 // f_cpu/256
#else
	#error "Unknown value for TIMER0_DIV"
#endif

// clock divisor for menu timeout timer - 16-bit overflow only
#define TIMER1_CLOCK_NONE() TCCR1B&=~0b00000111 // no clock
#if TIMER1_DIV == 1024
	#define TIMER1_CLOCK_ON() TCCR1B|=0b00000101 // f_cpu/1024
#else
	#error "Unkown value for TIMER1_DIV"
#endif

// clock divisor for display timer
#define TIMER2_CLOCK_NONE() TCCR2B&=~0b00000111 // no clock
#if TIMER2_DIV == 256
	#define TIMER2_CLOCK_ON() TCCR2B|=0b00000101 // f_cpu/128
#else
	#error "Unknown value for TIMER2_DIV"
#endif

// various modes of operation
#define MODE_DISPLAYTEST 0 // mode to cycle through digits slowly
#define MODE_SHOWTIME 1 // normal display mode, shows 6-digit time on tubes
#define MODE_INVALIDFIX 2 // special mode to show when fix is invalid
#define MODE_SELECTALARM 3 // menu to select which alarm to set
#define MODE_SETALARMSTATE 4 // menu to set alarm state (i.e. switch it off without changing value)
#define MODE_SETALARMTIME 5 // menu to set alarm time
#define MODE_SETTIMEZONE 6 // menu to set timezone

// state of beeper (bitwise)
#define ALARM_OFF 0x00
#define ALARM_ON 0x01
#define ALARM_MUTE 0x02

// comma mappings
#define COMMAL (1<<4)
#define COMMAR (1<<5)

// number masking
#define DIGIT_ENABLE 0x40
#define DIGIT_OFF 0x00
#define DIGIT_BLANK 0x0F

// tzdir uses special state chars for viewing in eeprom
#define TZDIR_PLUS 0xD1 // positive timezone, e.g. UTC + 10:00
#define TZDIR_MINUS 0xD0 // negative timezone, e.g. UTC - 02:30

// eeprom saving check value
#define EEPROM_CHECK_BYTE 0xAA

// button states
#define BUTTONSTATE_NOREPEAT 0x00 // button is NOT to repeat
#define BUTTONSTATE_WAITING 0x01 // button has activated once, and is now waiting to begin repeating
#define BUTTONSTATE_REPEATING 0x02 // button is now repeating

// convenient value - number of minutes in a day (i.e. 60*24)
#define MINUTESINADAY 1440

// fix validity
#define FIX_VALID 'A'

// function prototypes
void SetSegments(unsigned char character);
void DisplayBlank();
void DisplayTime();
void DisplayTimeZone();
void DisplayAlarmState();
void DisplayAlarmSelection();
void DisplayAlarmTime();
void UpdateDisplay();
void IncTz();
void DecTz();
void TzUp();
void TzDown();
void SaveEepromSettings();

#endif /* NIXIECLOCK_H_ */