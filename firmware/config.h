/*
	VFD Tube Clock
	Version:	1.0
	Author:		George Robinson
	Contact:	grobinson6000@gmail.com
	File:		config.h
	Descrip.:	User-configurable parameters
*/


#ifndef CONFIG_H_
#define CONFIG_H_

// display config
//#define NUM_DIGITS 4

//#define ENABLE_TIMEZONE // turns timezone correction on and off (used for GPS / UTC time sources)
//#define ENABLE_VALIDITYMODE // turns validity checking on and off (e.g. checks signal validity for GPS)
//#define ENABLE_TESTMODE
//#define ENABLE_EEPROM

// number of available alarms (recommend no more than number of digits)
//#define ALARM_COUNT 4

// button config
#define BUTTON_BOUNCECOUNT (F_CPU/256/TIMER0_DIV/50) // sets sensitivity of button debounce | larger value --> larger delay | please reference to F_CPU
#define BUTTON_REPEAT_DELAY (F_CPU/256/TIMER0_DIV*1) // sets the repeat delay of +/- buttons | please reference to F_CPU
#define BUTTON_REPEAT_PERIOD (F_CPU/256/TIMER0_DIV/8) // sets the repeat speed of the +/- buttons | please reference to F_CPU

// units config
#define ALARM_INCREMENT 5 // increment of alarm value (in minutes) | best to keep this as some factor of 60 (e.g. 5, 10)
#define TZ_INCREMENT 30 // increment of timezone (in minutes) | timezones worldwide tend to be in no less than 1/2hr intervals, so 30 should be sufficient

// beeper config
#define EXTRASHORTBEEPCOUNT (F_CPU/256/TIMER2_DIV/200) // length of extra short beep (used for buttons) | please reference to F_CPU
#define SHORTBEEPCOUNT (F_CPU/256/TIMER2_DIV/20) // length of 'short' beep (used for menu notifications and startup) | please reference to F_CPU
#define LONGBEEPCOUNT (F_CPU/256/TIMER2_DIV/2) // length of 'long' beep (used on training mode startup) | please reference to F_CPU

#define CATHODE_TRAIN_TIME (F_CPU/256/TIMER2_DIV*5) // in cathode training mode, determines length to light each digit

// alarm config
#define ALARM1BEEPCOUNT (F_CPU/256/TIMER2_DIV/6) // determines frequency of alarm1 beeper | larger value --> slower beeping | please reference to F_CPU
#define ALARM2BEEPCOUNT (F_CPU/256/TIMER2_DIV/12) // determines frequency of alarm2 beeper | larger value --> slower beeping | please reference to F_CPU

// boot config
#define POWERONDELAY 200 // delay at startup (in ms) between i/o initialiation and enabling of interrupts etc.

#endif /* CONFIG_H_ */