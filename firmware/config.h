/*
 * NixieClock
 * config.h
 * Version:    1.0
 * Author:     grob6000
 * File:       config.h
 * Desc.:      User-configurable parameters
 */


#ifndef CONFIG_H_
#define CONFIG_H_

// feature configuration
#define NUM_DIGITS 4 // number of digits provided
#define ALARM_COUNT 4 // number of alarms enabled, maximum 8
#define ENABLE_TIMEZONE // turns timezone correction on and off (used for GPS / UTC time sources)
//#define ENABLE_VALIDITYMODE // turns on masking mode when GPS is invalid
//#define ENABLE_TESTMODE // allows startup test mode
#define ENABLE_EEPROM // implements saving setting to eeprom
#define ENABLE_ALARM // implements alarm clock
//#define ENABLE_DATES // tracks the date from NMEA (only needed if clock can display date)
#define ALARM_INCREMENT 5 // alarm setting increment, minutes
#define TZ_INCREMENT 30 // timezone setting increment, minutes
#define POWERONDELAY 200 // delay at startup to allow power/etc. to settle
#define AUTOOFF // define to enable auto off (switches off display after a time, turns on with button press)
#define AUTOOFF_DELAY 300 // time delay (in seconds) for display to switch off

// select sound source
#define SOUND_BEEPER
//#define SOUND_BELL

// select time source
#define TIMESOURCE_GPS
//#define TIMESOURCE_DS1302
//#define TIMESOURCE_ESP8266NTP

#define BUTTON_DEBOUNCE_MS 50 // debounce delay, in ms
#define BUTTON_WAIT_MS 1000 // delay between first press and repeating, in ms
#define BUTTON_REPEAT_MS 125 // period of repeating, in ms

#define TIMER0_DIV 256 // used for calculating delays, please set accordingly
#define TIMER1_DIV	1024 // used for calculating delays, please set accordingly
#define TIMER2_DIV 256 // used for calculating delays, please set accordingly

#endif /* CONFIG_H_ */