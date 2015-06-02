/*
 * sound.h
 * Implements a generic sound profile - uses a buzzer
 * 
 * Created: 2015-06-02 09:44:56
 *  Author: george
 */ 


#ifndef SOUND_H_
#define SOUND_H_

// beeper
#define BEEP_CLICK_MS 1 // beep length for clicks (button presses etc) in ms
#define BEEP_SHORT_MS 10 // beep length for short beeps (save events, etc.) in ms
#define BEEP_LONG_MS 250 // beep length for long beeps (alerts, errors, etc.) in ms
#define BEEP_PERIOD_MS 500 // period of repeating beeps (alarms) in ms
#define BEEP_PERIODIC_MS 250 // length of periodic beep in ms

// convert config parameters (in ms) into a useable count
#define BEEP_CLICK_COUNT (F_CPU/256/TIMER2_DIV*BEEP_CLICK_MS/1000)
#define BEEP_SHORT_COUNT (F_CPU/256/TIMER2_DIV*BEEP_SHORT_MS/1000)
#define BEEP_LONG_COUNT (F_CPU/256/TIMER2_DIV*BEEP_LONG_MS/1000)
#define BEEP_PERIOD_COUNT (F_CPU/256/TIMER2_DIV*BEEP_PERIOD_MS/1000)
#define BEEP_PERIODIC_COUNT (F_CPU/256/TIMER2_DIV*BEEP_PERIODIC_MS/1000)

// enables the continuous-sounding alarm
void AlarmSoundOn();

// disables the continous-sounding alarm
void AlarmSoundOff();

// makes a single beep, e.g. appropriate for notification
void MakeBeep();

// makes a sound, e.g. appropriate for a button click
void MakeClick();

// routine to be called regularly to manage sound device
void SoundTick();

#endif /* SOUND_H_ */