/*
 * sound.c
 *
 * Created: 2015-06-02 09:55:32
 *  Author: george
 */ 

#include <avr/io.h>
#include "pins.h"
#include "sound.h"

uint16_t beepcount = 0;
uint16_t beepperiod = 0;
	
void AlarmSoundOn()
{
	beepperiod = BEEP_PERIOD_COUNT;
}

void AlarmSoundOff()
{
	beepperiod = 0;
}

void MakeBeep()
{
	beepcount = BEEP_SHORT_COUNT; // set displayloop countdown to specified value
	ON(BUZZ); // turn buzzer on
}

void MakeClick()
{
	beepcount = BEEP_CLICK_COUNT; // set displayloop countdown to specified value
	ON(BUZZ); // turn buzzer on	
}

void SoundTick()
{
	// maintain beep!
	if (beepcount > 0)
	{
		beepcount--; // decrement beep counter
	}
	else
	{
		OFF(BUZZ); // suppress! suppress!
	}
		
	// cycle for alarm sounding
	static uint16_t beepperiodcount = 0;
	if (beepperiodcount > 0)
	{
		beepperiodcount--;
	}
	else
	{
		if (beepperiod > 0)
		{
			beepperiodcount = beepperiod;
			beepcount = BEEP_PERIODIC_COUNT;
			ON(BUZZ);
		}
	}
}