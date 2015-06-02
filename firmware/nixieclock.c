/*
	Flexible Nixie Clock
	Version:	0.2
	Author:		George Robinson
	Contact:	grobinson6000@gmail.com
	File:		nixieclock.c
	Descrip.:	Main code file
*/

// includes
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/eeprom.h>
#include "pins.h"
#include "uart.h" // parameters and config for uart connection
//#include "config.h" // configurable parameters for this code
#include "nixieclock.h" // other parameters and defines for this code
#include "sound.h"

// global parameters
uint8_t characters[NUM_DIGITS] = { 0x00 }; // buffer to hold current characters (nixie format)
uint8_t hour = 0x00; // current hour (0 to 23)
uint8_t minute = 0x00; // current minute (0 to 59)
uint8_t second = 0x00; // current second (0 to 59)

#ifdef ENABLE_TIMEZONE
	uint16_t tz = 0x00;
	uint8_t tzdir = TZDIR_PLUS;
	#ifdef ENABLE_EEPROM
		uint16_t ee_tz EEMEM = 0x0000;
		uint8_t ee_tzdir EEMEM = 0x00;
	#endif
#endif

uint8_t currentmode = MODE_SHOWTIME; // the current display/menu mode
uint8_t buttonstate = BUTTONSTATE_NOREPEAT; // the current repeating state of the button

#ifdef ENABLE_ALARM
	uint8_t alarm_states = 0x00; // bits used to hold current alarm on/off states: up to 8.
	uint16_t alarm_times[ALARM_COUNT] = { 0x0000 };
	uint8_t selectedalarm = 0;
	uint8_t beeper_state = ALARM_OFF;
	#ifdef ENABLE_EEPROM
		uint8_t ee_alarm_states EEMEM = 0x00;
		uint16_t ee_alarm_times[ALARM_COUNT] EEMEM = {0x00};
	#endif //ENABLE_EEPROM
#endif

uint16_t debounceCount = 0xFFFF; // overflow counter for button debouncing (via timer0). diminishing counter, init to large value

#ifdef ENABLE_EEPROM
	
	uint8_t ee_check_byte EEMEM = EEPROM_CHECK_BYTE; // check byte to differentiate between blank EEPROM (0xFF's) and a real config
	
	void SaveEepromSettings()
	{
		#ifdef ENABLE_TIMEZONE
			// save timezone
			eeprom_update_word(&ee_tz, tz);
			eeprom_update_byte(&ee_tzdir, tzdir);
		#endif
		
		#ifdef ENABLE_ALARM
			// save alarms states and times
			eeprom_update_byte(&ee_alarm_states, alarm_states);
			for (uint8_t i = 0; i < ALARM_COUNT; i++)
			{
				eeprom_update_word(&ee_alarm_times[i], alarm_times[i]);
			}
		#endif
		
		eeprom_update_byte(&ee_check_byte, EEPROM_CHECK_BYTE);
	}

	void LoadEepromSettings()
	{
		uint8_t tempbyte = 0x00;
		uint16_t tempword = 0x00;
		tempbyte = eeprom_read_byte(&ee_check_byte);
		if (tempbyte == EEPROM_CHECK_BYTE)
		{
			// settings likely valid - read and sanity check as usual
			#ifdef ENABLE_TIMEZONE
				// read timezone - error check
				tempbyte = eeprom_read_byte(&ee_tzdir);
				if (tempbyte == TZDIR_MINUS)
				{
					tzdir = TZDIR_MINUS;
				}
				else
				{
					tzdir = TZDIR_PLUS;
				}
				tempword = eeprom_read_word(&ee_tz);
				if ((tempword <= (MINUTESINADAY/2)) && ((tempword % TZ_INCREMENT) == 0)) // check both maximum value and increment
				{
					tz = tempword;
				}
			#endif //ENABLE_TIMEZONE
		
			#ifdef ENABLE_ALARM
				// read alarmstates
				tempbyte = eeprom_read_byte(&ee_alarm_states);
				// read alarm times
				for (uint8_t i = 0; i < ALARM_COUNT; i++)
				{
					tempword = eeprom_read_word(&ee_alarm_times[i]);
					if ((tempword < MINUTESINADAY) && ((tempword % ALARM_INCREMENT) == 0))
					{
						alarm_times[i] = tempword;
					}
					if (tempbyte & (1<<i))
					{
						alarm_states |= (1<<i);
					}
				}
			#endif //ENABLE_ALARM
		}
		else
		{
			// settings likely not valid (i.e. new flash!) - save to update to currently loaded values
			SaveEepromSettings();
		}
	}

#endif //ENABLE_EEPROM

// starts timer 1 to count up for menu timeout
void StartMenuTimeout()
{
	TCNT1 = 0x0000; // reset counter to zero
	TIMER1_CLOCK_ON();
}

// starts timer0 for a repeating button event
void StartButtonRepeatTimer()
{
	TCNT0 = 0x00;
	TIMER0_CLOCK_ON();
	if (buttonstate == BUTTONSTATE_NOREPEAT)
	{
		debounceCount = BUTTON_WAITCOUNT;
	}
	else // either wait or repeating
	{
		debounceCount = BUTTON_REPEATCOUNT;
	}
	buttonstate = BUTTONSTATE_REPEATING;
}

// sets cathode outputs to specified character, via K155ID1
// note: anodes set in display routine
void SetSegments(unsigned char character)
{
	
	// character is in following (binary) format:
	// enable 0 Lcomma Rcomma bit3 bit2 bit1 bit0		
	
	if (character & 0x01)
	{
		ON(BIT0);
	}
	else
	{
		OFF(BIT0);
	}
	
	if (character & 0x02)
	{
		ON(BIT1);
	}
	else
	{
		OFF(BIT1);
	}
	
	if (character & 0x04)
	{
		ON(BIT2);
	}
	else
	{
		OFF(BIT2);
	}	

	if (character & 0x08)
	{
		ON(BIT3);
	}
	else
	{
		OFF(BIT3);
	}
	
	if (character & 0x10)
	{
		ON(RCOMMA);
	}
	else
	{
		OFF(RCOMMA);
	}	
	
	if (character & 0x20)
	{
		ON(LCOMMA);
	}
	else
	{
		OFF(LCOMMA);
	}	
	
}



#ifdef ENABLE_VALIDITYMODE
	// validitymode - displays rolling commas while GPS fix is invalid
	void DisplayInvalidFix()
	{
		for (uint8_t i = 0; i < NUM_DIGITS; i++)
		{
			characters[i] = DIGIT_BLANK;
		}
		// can use time as GPS is still updating
		characters[second % NUM_DIGITS] = DIGIT_ENABLE | COMMAL | DIGIT_BLANK;
	}
#endif //ENABLE_VALIDITYMODE

// show current time (and any other constant info, e.g. alarm states) on display
void DisplayTime()
{
	#if (NUM_DIGITS >= 4)
	characters[0] = DIGIT_ENABLE | (hour / 10);
	characters[1] = DIGIT_ENABLE | (hour % 10);
	characters[2] = DIGIT_ENABLE | (minute / 10);
	characters[3] = DIGIT_ENABLE | (minute % 10);
	#endif
	#if (NUM_DIGITS >= 6)
		characters[4] = DIGIT_ENABLE | (second / 10);
		characters[5] = DIGIT_ENABLE | (second % 10);		
	#endif
	
	#ifdef ENABLE_ALARM
		for (uint8_t i = 0; i < ALARM_COUNT; i++)
		{
			if (alarm_states & (1<<i))
			{
				characters[i] |= COMMAL;
			}
		}
	#endif
}

#ifdef ENABLE_TIMEZONE
	// displays timezone in first four digits
	void DisplayTimezone()
	{
		characters[0] = DIGIT_ENABLE | (tz / 600);
		characters[1] = DIGIT_ENABLE | ((tz / 60) % 10);
		characters[2] = DIGIT_ENABLE | ((tz % 60) / 10);
		characters[3] = DIGIT_ENABLE | (tz % 10);
		if (tzdir == TZDIR_MINUS)
		{
			characters[0] |= COMMAL;
		}
	}
	
	// increment timezone absolute value by one unit (see config.h) - top out at 720 minutes (i.e. UTC +/- 12)
	void IncTz()
	{
		tz += TZ_INCREMENT;
		if (tz > (MINUTESINADAY/2))
		{
			tz = MINUTESINADAY/2;
		}
	}

	// decrement timezone absolute value by one unit (see config.h) - bottom out at 0 minutes (i.e. UTC + 00)
	void DecTz()
	{
		if (tz <= TZ_INCREMENT)
		{
			tz = 0;
		}
		else
		{
			tz -= TZ_INCREMENT;
		}
	}
	
	// increase tz by TZ_INCREMENT (including negative/positive state)
	void TzUp()
	{
		if (tz == 0x0000)
		{
			tzdir = TZDIR_PLUS;
		}
		// sense of up/down inverted if timezone is (UTC - xx) as opposed to (UTC + xx):
		if (tzdir == TZDIR_PLUS)
		{
			IncTz();
		}
		else
		{
			DecTz();
		}
	}
	
	// decrease tz by TZ_INCREMENT (including negative/positive state)
	void TzDown()
	{
		if (tz == 0x0000)
		{
			tzdir = TZDIR_MINUS;
		}
		// sense of up/down inverted if timezone is (UTC - xx) as opposed to (UTC + xx):
		if (tzdir == TZDIR_MINUS)
		{
			IncTz();
		}
		else
		{
			DecTz();
		}
	}
	
#endif //ENABLE_TIMEZONE


// displays nothing
void DisplayBlank()
{
	for (uint8_t i = 0; i < NUM_DIGITS; i++)
	{
		characters[i] = DIGIT_BLANK;
	}
}

#ifdef ENABLE_ALARM

// displays selected alarm number in digit0
void DisplayAlarmSelection()
{
	characters[0] = DIGIT_ENABLE | (selectedalarm +	1); // alarms count from 1...
	for (uint8_t i = 1; i < NUM_DIGITS; i++)
	{
		characters[i] = DIGIT_BLANK;
	}
}

// displays on/off state of selected alarm in digit1, alongside alarm selection in digit0
void DisplayAlarmState()
{
	DisplayAlarmSelection(); // reuse this code, includes blanking!
	if (alarm_states & (1<<selectedalarm)) // add alarm state to next digit
	{
		characters[1] = DIGIT_ENABLE | 0x01; // show 1
	}
	else
	{
		characters[1] = DIGIT_ENABLE | 0x00; // show 0
	}
}

// displays alarm time in first four digits (4 digit mode) or with other info in 6+ digit mode
void DisplayAlarmTime()
{
	#if NUM_DIGITS >= 6
		DisplayAlarmState(); // reuse alarm state
		characters[2] = DIGIT_ENABLE | (alarm_times[selectedalarm] / 600);
		characters[3] = DIGIT_ENABLE | ((alarm_times[selectedalarm] / 60) % 10);
		characters[4] = DIGIT_ENABLE | ((alarm_times[selectedalarm] % 60) / 10);
		characters[5] = DIGIT_ENABLE | (alarm_times[selectedalarm] % 10);	
	#else
		characters[0] = DIGIT_ENABLE | (alarm_times[selectedalarm] / 600);
		characters[1] = DIGIT_ENABLE | ((alarm_times[selectedalarm] / 60) % 10);
		characters[2] = DIGIT_ENABLE | ((alarm_times[selectedalarm] % 60) / 10);
		characters[3] = DIGIT_ENABLE | (alarm_times[selectedalarm] % 10);
	#endif
	
}

#endif //ENABLE_ALARM

void UpdateDisplay()
{
	switch (currentmode)
	{
	case MODE_SHOWTIME:
		DisplayTime();
		break;
#ifdef ENABLE_VALIDITYMODE
	case MODE_INVALIDFIX:
		DisplayInvalidFix();
		break;
#endif
#ifdef ENABLE_TIMEZONE
	case MODE_SETTIMEZONE:
		DisplayTimezone();
		break;
#endif //ENABLE_TIMEZONE
#ifdef ENABLE_ALARM		
	case MODE_SELECTALARM:
		DisplayAlarmSelection();
		break;
	case MODE_SETALARMSTATE:
		DisplayAlarmState();
		break;
	case MODE_SETALARMTIME:
		DisplayAlarmTime();
		break;
#endif //ENABLE_ALARM
	default:
		DisplayBlank();
		break;
	}
}

// string received from serial - see uart.h
void uartReceived(char data[], unsigned int length)
{
	if (data[3] == 'R') // indicates this is a "$GPRMC..." message; only message from SKM53 with 'R' in this place
	{
			
		// get time from NMEA string
		hour = (data[7] - '0') * 10 + (data[8] - '0');
		minute = (data[9] - '0') * 10 +  (data[10] - '0');
		second = (data[11] - '0') * 10 + (data[12] - '0');
			
		// apply timezone
		unsigned int hoursandminutes = (hour * 60) + minute;
		if (tzdir == TZDIR_MINUS)
		{
			// decrement time by tz
			if (hoursandminutes < tz)
			{
				hoursandminutes += MINUTESINADAY;
			}
			hoursandminutes -= tz;
		}
		else
		{
			// increment time by tz
			hoursandminutes += tz;
			if (hoursandminutes >= MINUTESINADAY)
			{
				hoursandminutes -= MINUTESINADAY;
			}
		}
			
		// update time to reflect new hours and minutes
		hour = hoursandminutes / 60;
		minute = hoursandminutes % 60;
		
		#ifdef ENABLE_VALIDITYMODE
			// detect if fix is valid
			//fixValidity = data[18];
			if ((data[18] != FIX_VALID) && (currentmode == MODE_SHOWTIME))
			{
				currentmode = MODE_INVALIDFIX;
			}
			else if (currentmode == MODE_INVALIDFIX) // fix is valid, mode is not SHOWTIME, and mode is INVALIDFIX:
			{
				currentmode = MODE_SHOWTIME; // gotta get out of invalid mode!
			}
		#endif
		
		#ifdef ENABLE_ALARM
			beeper_state &= ~ALARM_ON; // bitwise switch off alarm
			for (uint8_t i = 0; i < ALARM_COUNT; i++)
			{
				if (alarm_states & (1<<i))
				{
					if (hoursandminutes == alarm_times[i])
					{
						beeper_state |= ALARM_ON; // bitwise switch on alarm
					}
				}
			}
			
			if (!(beeper_state & ALARM_ON)) // if alarm is not on (i.e. no matches in above routine)
			{
				AlarmSoundOff();
				beeper_state = ALARM_OFF; // switch off alarm (and muting) completely, ready for next one!
			}
			
			if (beeper_state == ALARM_ON) // alarm enabled, not muted
			{
				AlarmSoundOn(); // enable audible alarm
			}
			
		#endif
		
		UpdateDisplay(); // no harm in this
			
	}
	else if ((data[5] == '0') && (data[7] == '1'))
	{
		// ack packet - have to ignore or would repeat culling procedure indefinitely!
		
	}
	else if (data[0] == '$')
	{
		// some other NMEA packet - need to cull all but RMC
		uartTransmit("$PMTK314,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0*29", 45);		
	}
	
}	

	

// alarm button interrupt
// note -- actual button press handled when debounce timer returns (see ISR(TIMER0_OVF_vec)...)
ISR(INT0_vect)
{	
	if (BALARM_ISPRESSED())
	{
		// falling edge - button pressed
		debounceCount = BUTTON_BOUNCECOUNT; // reset counter
		TIMER0_CLOCK_ON(); // enable debounce timer
	}
	else
	{
		// rising edge - button released
		TIMER0_CLOCK_NONE(); // disable debounce timer
	}
	buttonstate = BUTTONSTATE_NOREPEAT; // reset repeating mode - this is a release or new press!			
}	



// timezone button interrupt
// note -- actual button press handled when debounce timer returns (see ISR(TIMER0_OVF_vec)...)
ISR(INT1_vect)
{
	if (BZONE_ISPRESSED())
	{
		// falling edge - button pressed
		debounceCount = BUTTON_BOUNCECOUNT; // reset counter
		TIMER0_CLOCK_ON(); // enable debounce timer
	}
	else
	{
		// rising edge - button released
		TIMER0_CLOCK_NONE(); // disable debounce timer
	}		
	buttonstate = BUTTONSTATE_NOREPEAT; // reset repeating mode - this is a release or new press!
}



// timer0 interrupt - debounce timer for buttons
ISR(TIMER0_OVF_vect)
{
	debounceCount--; // diminishing overflow counter: starts at set value, and finishes at 0
	if (debounceCount == 0x0000) // if counter has hit zero
	{
		// ... this is a valid button press
		
		// disable bounce counter
		TIMER0_CLOCK_NONE();
		debounceCount = BUTTON_BOUNCECOUNT;
		
		// reset menu timeout counter
		TCNT1 = 0x0000;
		
		if (beeper_state & ALARM_ON) // if alarm is sounding, hijacks button press to cancel
		{
			beeper_state |= ALARM_MUTE;
			AlarmSoundOff(); // switch off alarm sound
		}
		else
		{	
			
		MakeClick(); // click for button press
		
		if (BALARM_ISPRESSED())
		{
			// alarm button press event
			switch (currentmode)
			{
				case MODE_SHOWTIME:
#ifdef ENABLE_VALIDITYMODE
				case MODE_INVALIDFIX:
#endif //ENABLE_VALIDITYMODE
					// enter alarm setup
					currentmode = MODE_SELECTALARM;
					StartMenuTimeout();
					break;
#ifdef ENABLE_TIMEZONE
				case MODE_SETTIMEZONE:
					// decrease timezone
					TzDown();
					StartButtonRepeatTimer(); // bounceable command
					StartMenuTimeout();
					break;
#endif // ENABLE_TIMEZONE
#ifdef ENABLE_ALARM
				case MODE_SELECTALARM:
					// decrease alarm selection
					if (selectedalarm > 0)
					{
						selectedalarm--;
					}
					StartButtonRepeatTimer(); // bounceable command
					StartMenuTimeout();
					break;
				case MODE_SETALARMSTATE:
					// turn alarm off
					alarm_states &= ~(1<<selectedalarm);
					StartMenuTimeout();
					break;
				case MODE_SETALARMTIME:
					// decrease alarm time
					if (alarm_times[selectedalarm] < ALARM_INCREMENT)
					{
						alarm_times[selectedalarm] = MINUTESINADAY - ALARM_INCREMENT;
					}
					else
					{
						alarm_times[selectedalarm] -= ALARM_INCREMENT;
					}
					StartMenuTimeout();
					StartButtonRepeatTimer(); // bounceable command
					break;
#endif //ENABLE_ALARM
				default:
					currentmode = MODE_SHOWTIME;
					break;
			}
			UpdateDisplay(); // update display in any case!	
		}
		else if (BZONE_ISPRESSED())
		{	
			// timezone button press event
			switch (currentmode)
			{
				case MODE_SHOWTIME:
#ifdef ENABLE_VALIDITYMODE
				case MODE_INVALIDFIX:
#endif // ENABLE_VALIDITYMODE
					// enter timezone setup
					currentmode = MODE_SETTIMEZONE;
					StartMenuTimeout();
					break;
#ifdef ENABLE_TIMEZONE
				case MODE_SETTIMEZONE:
					// increase timezone
					TzUp();
					StartButtonRepeatTimer(); // bounceable command
					StartMenuTimeout();
					break;
#endif // ENABLE_TIMEZONE
#ifdef ENABLE_ALARM
				case MODE_SELECTALARM:
					// increase alarm selection
					selectedalarm++;
					if (selectedalarm >= ALARM_COUNT)
					{
						selectedalarm = ALARM_COUNT - 1;
					}
					StartButtonRepeatTimer(); // bounceable command
					StartMenuTimeout();
					break;
				case MODE_SETALARMSTATE:
					// turn alarm on
					alarm_states |= (1<<selectedalarm);
					StartMenuTimeout();
					break;
				case MODE_SETALARMTIME:
					// increase alarm time
					alarm_times[selectedalarm] += ALARM_INCREMENT;
					alarm_times[selectedalarm] %= MINUTESINADAY;
					StartButtonRepeatTimer(); // bounceable command
					StartMenuTimeout();
					break;
#endif //ENABLE_ALARM
				default:
					currentmode = MODE_SHOWTIME;
					break;
			}
			UpdateDisplay(); // update display in any case!			
		}
		}
	}
}

// timer 1 for menu timeout - save current menu values to eeprom, and go back to time display
// this timer should take c. 4 seconds to overflow (assuming 16MHz clock and longest clock divisor)
ISR(TIMER1_OVF_vect)
{
	// menu timeout
	
	TIMER1_CLOCK_NONE(); // switch off timer1
	TCNT1 = 0x0000; // reset counter
	
	#ifdef ENABLE_BUZZER
		MakeBeep(BEEP_SHORT_COUNT); // beep to indicate menu has exited
	#endif //ENABLE_BUZZER
	
	switch (currentmode)
	{
		case MODE_SETTIMEZONE:
			#ifdef ENABLE_EEPROM
				SaveEepromSettings();
			#endif
			currentmode = MODE_SHOWTIME;
			break;
		case MODE_SELECTALARM:
			currentmode = MODE_SETALARMSTATE;
			StartMenuTimeout();
			break;
		case MODE_SETALARMSTATE:
			if (alarm_states & (1<<selectedalarm))
			{
				currentmode = MODE_SETALARMTIME;
				StartMenuTimeout();
			}
			else
			currentmode = MODE_SHOWTIME;
			break;
		case MODE_SETALARMTIME:
			#ifdef ENABLE_EEPROM
				SaveEepromSettings();
			#endif
			currentmode = MODE_SHOWTIME;
		default:
			currentmode = MODE_SHOWTIME;
			break;
	}
	UpdateDisplay();
		
}



void DigitOn(unsigned char digit)
{
	switch (digit)
	{
		case 0:
			ON(DIGIT0);
			break;
		case 1:
			ON(DIGIT1);
			break;
		case 2:
			ON(DIGIT2);
			break;
		case 3:
			ON(DIGIT3);
			break;
		case 4:
			ON(DIGIT4);
			break;
		case 5:
			ON(DIGIT5);
			break;
	}
}

void DigitOff(unsigned char digit)
{
	switch (digit)
	{
		case 0:
			OFF(DIGIT0);
			break;
		case 1:
			OFF(DIGIT1);
			break;
		case 2:
			OFF(DIGIT2);
			break;
		case 3:
			OFF(DIGIT3);
			break;
		case 4:
			OFF(DIGIT4);
			break;
		case 5:
			OFF(DIGIT5);
			break;
	}
}


// timer 2 interrupt -- AKA 'display loop'
// handles multiplexed digit display, and also alarm/beeps
ISR(TIMER2_OVF_vect)
{
	
	// index for current character position
	static unsigned char currentdigit = 0;
	static unsigned char previousdigit = (NUM_DIGITS - 1);
	
	// set segment states appropriately
	SetSegments(characters[currentdigit]);
	
	// turn current digit on, only if enabled!
	if (characters[currentdigit] & DIGIT_ENABLE)
	{
		DigitOn(currentdigit);
	}
	
	// turn previous digit off
	DigitOff(previousdigit);
			
	// increment index
	previousdigit = currentdigit;
	currentdigit++;
	currentdigit%=NUM_DIGITS;	// wraps around
	
	SoundTick();
	
}


// main function: runs on startup
int main(void)
{
	// initialize ports
	DDRB  = 0b00111111;	
	DDRC  = 0b00111111;
	DDRD  = 0b11110000;
	PORTD = 0b00001100; // button pullups - prevents floating buttons!
	
	// power on delay (allows power supplies to stabilise)
	_delay_ms(POWERONDELAY);
	
	#ifdef ENABLE_EEPROM
		// load settings from eeprom
		LoadEepromSettings();
	#endif
	
	//init int0/1 interrupts for buttons
	EICRA = 0b00000101; // any edge, int0 and int1
	EIMSK = (1<<INT1)|(1<<INT0); // enable int0 and int1
	
	//init timer0 for button debounce
	TCCR0A = 0x00;
	TIMER0_CLOCK_NONE(); // clock initially off
	TIMSK0 |= (1<<TOIE0); // enable OVF interrupt
	
	//init timer1 for menu timeout
	TCCR1A = 0x00;
	TIMER1_CLOCK_NONE();
	TIMSK1 |= (1<<TOIE1);
	
	//init serial for GPS - see uart.h & uart.c
	uartInit();
	
	//init timer2 for segment display
	TCCR2A = 0x00;
	TIMER2_CLOCK_ON(); // normal mode
	TIMSK2 |= (1<<TOIE2); // enable OVF interrupt
		
	sei(); // global enable interrupts
		
    while(1)
    {
		// nothing -- all events occur via interrupts				
    }
	
}