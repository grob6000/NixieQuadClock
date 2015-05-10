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
#include "uart.h" // parameters and config for uart connection
//#include "config.h" // configurable parameters for this code
#include "nixieclock.h" // other parameters and defines for this code
#include "hexstring.h"
#include "decstring.h"

// configuration
#define NUM_DIGITS 4 // number of digits provided
#define ALARM_COUNT 4 // number of alarms enabled, maximum 8
#define ENABLE_TIMEZONE // turns timezone correction on and off (used for GPS / UTC time sources)
#define ENABLE_VALIDITYMODE // turns on masking mode when GPS is invalid
//#define ENABLE_TESTMODE // allows startup test mode
#define ENABLE_EEPROM // implements saving setting to eeprom
#define ENABLE_ALARM // implements alarm clock
#define ALARM_INCREMENT 5 // alarm setting increment, minutes
#define TZ_INCREMENT 30 // timezone setting increment, minutes
#define BUTTON_DEBOUNCE_MS 50 // debounce delay, in ms
#define BUTTON_REPEATEDELAY_MS 1000 // delay between first press and repeating, in ms
#define BUTTON_REPEATPERIOD_MS 125 // period of repeating, in ms
#define POWERONDELAY 200 // delay at startup to allow power/etc. to settle

#define BUTTON_BOUNCECOUNT (F_CPU/256/TIMER0_DIV*BUTTON_DEBOUNCE_MS/1000) // sets sensitivity of button debounce | larger value --> larger delay | please reference to F_CPU
#define BUTTON_REPEAT_DELAY (F_CPU/256/TIMER0_DIV*BUTTON_REPEAT_DELAY/1000) // sets the repeat delay of +/- buttons | please reference to F_CPU
#define BUTTON_REPEAT_PERIOD (F_CPU/256/TIMER0_DIV*BUTTON_REPEATPERIOD_MS/1000) // sets the repeat speed of the +/- buttons | please reference to F_CPU

// number masking
#define DIGIT_ENABLE 0x40
#define DIGIT_OFF 0x00
#define DIGIT_BLANK 0x0F

// clock divisor for display timer
#define TIMER2_CLOCK_NONE() TCCR2B&=~0b00000111 // no clock
#define TIMER2_CLOCK_ON() TCCR2B|=0b00000101 // f_cpu/128
#define TIMER2_DIV 256 // used for calculating delays, please set accordingly

// handy functions to switch on/off pins by name "P"
// e.g. ON(LCOMMA) --> PORT_LCOMMA |= (1 << BIT_LCOMMA)
#define ON(P) PORT_ ## P |= (1 << BIT_ ## P)
#define OFF(P) PORT_ ## P &= ~(1 << BIT_ ## P)
#define TOGGLE(P) PORT_ ## P ^= (1 << BIT_ ## P)

// pins - segments
// see board V2.1 note (B): pins inverted
#define PORT_BIT0 PORTD
#define BIT_BIT0 7
#define PORT_BIT1 PORTD
#define BIT_BIT1 6
#define PORT_BIT2 PORTD
#define BIT_BIT2 5
#define PORT_BIT3 PORTD
#define BIT_BIT3 4
#define PORT_LCOMMA PORTB
#define BIT_LCOMMA 1
#define PORT_RCOMMA PORTB
#define BIT_RCOMMA 0

// pins - digits
#define PORT_DIGIT0 PORTC
#define BIT_DIGIT0 0
#define PORT_DIGIT1 PORTC
#define BIT_DIGIT1 1
#define PORT_DIGIT2 PORTC
#define BIT_DIGIT2 2
#define PORT_DIGIT3 PORTC
#define BIT_DIGIT3 3
#define PORT_DIGIT4 PORTC
#define BIT_DIGIT4 4
#define PORT_DIGIT5 PORTC
#define BIT_DIGIT5 5

// pins - i/o
#define PORT_BUZZ PORTB
#define BIT_BUZZ 2
#define PORT_BUTTONA PORTD
#define BIT_BUTTONA 2
#define PORT_BUTTONB PORTD
#define PIN_BUTTONB 3
	
// buffer to hold current characters (nixie format)
uint8_t characters[NUM_DIGITS] = { 0x00 };
	
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

uint8_t currentmode = MODE_SHOWTIME;

uint8_t fixValidity = '?';

#ifdef ENABLE_ALARM
	uint8_t alarm_states = 0x00; // bits used to hold current alarm on/off states: up to 8.
	uint16_t alarm_times[ALARM_COUNT] = { 0x0000 };
	uint8_t selectedalarm = 0;
	#ifdef ENABLE_EEPROM
		uint8_t ee_alarm_states EEMEM = 0x00;
		uint16_t ee_alarm_times[ALARM_COUNT] EEMEM = {0x00};
	#endif //ENABLE_EEPROM
#endif

uint16_t debounceCount = 0xFFFF; // overflow counter for button debouncing (via timer0). diminishing counter, init to large value

#ifdef ENABLE_EEPROM
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
	}

	void LoadEepromSettings()
	{
		uint8_t tempbyte = 0x00;
		uint8_t tempword = 0x00;
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

#endif //ENABLE_EEPROM

void StartMenuTimeout()
{
	TCNT1 = 0x0000; // reset counter to zero
	TIMER1_CLOCK_ON();
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



void DisplayTime()
{
	// validitymode
	#ifdef ENABLE_VALIDITYMODE
	if (fixValidity != FIX_VALID)
	{
		// rolling commas!
		for (uint8_t i = 0; i < NUM_DIGITS; i++)
		{
			characters[i] = DIGIT_BLANK;
		}
		characters[second % NUM_DIGITS] = DIGIT_ENABLE | COMMAL | DIGIT_BLANK;		
	}
	else
	#endif //ENABLE_VALIDITYMODE
	{
		// set display to current time
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
	
		for (uint8_t i = 0; i < ALARM_COUNT; i++)
		{
			if (alarm_states & (1<<i))
			{
				characters[i] |= COMMAL;
			}
		}
	}
}

#ifdef ENABLE_TIMEZONE
	void DisplayTimezone()
	{
		// displays timezone in first four digits
		characters[0] = DIGIT_ENABLE | (tz / 600);
		characters[1] = DIGIT_ENABLE | ((tz / 60) % 10);
		characters[2] = DIGIT_ENABLE | ((tz % 60) / 10);
		characters[3] = DIGIT_ENABLE | (tz % 10);
		if (tzdir == TZDIR_MINUS)
		{
			characters[0] |= COMMAL;
		}
	}
	
	// increment timezone absolute value by one unit (see config.h)
	// top out at 720 minutes (i.e. UTC +/- 12)
	void IncTz()
	{
		tz += TZ_INCREMENT;
		if (tz > (MINUTESINADAY/2))
		{
			tz = MINUTESINADAY/2;
		}
	}

	// decrement timezone absolute value by one unit (see config.h)
	// bottom out at 0 minutes (i.e. UTC + 00)
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


void DisplayBlank()
{
	// displays nothing
	for (uint8_t i = 0; i < NUM_DIGITS; i++)
	{
		characters[i] = DIGIT_BLANK;
	}
}

void DisplayAlarmSelection()
{
	// displays selected alarm number in digit0
	characters[0] = DIGIT_ENABLE | selectedalarm;
	for (uint8_t i = 1; i < NUM_DIGITS; i++)
	{
		characters[i] = DIGIT_BLANK;
	}
}

void DisplayAlarmState()
{
	// displays on/off state of selected alarm in digit 2
	characters[0] = DIGIT_ENABLE | selectedalarm;
	if (alarm_states & (1<<selectedalarm))
	{
		characters[1] = DIGIT_ENABLE | 0x01; // show 1
	}
	else
	{
		characters[1] = DIGIT_ENABLE | 0x00; // show 0
	}
	for (uint8_t i = 2; i < NUM_DIGITS; i++)
	{
		characters[i] = DIGIT_BLANK;
	}	
}

void DisplayAlarmTime()
{
	// displays alarm time in first four digits
	characters[0] = DIGIT_ENABLE | (alarm_times[selectedalarm] / 600);
	characters[1] = DIGIT_ENABLE | ((alarm_times[selectedalarm] / 60) % 10);
	characters[2] = DIGIT_ENABLE | ((alarm_times[selectedalarm] % 60) / 10);
	characters[3] = DIGIT_ENABLE | (alarm_times[selectedalarm] % 10);	
	
}

void UpdateDisplay()
{
	switch (currentmode)
	{
	case MODE_SHOWTIME:
		DisplayTime();
		break;
	case MODE_SETTIMEZONE:
		DisplayTimezone();
		break;
	case MODE_SELECTALARM:
		DisplayAlarmSelection();
		break;
	case MODE_SETALARMSTATE:
		DisplayAlarmState();
		break;
	case MODE_SETALARMTIME:
		DisplayAlarmTime();
		break;
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
			
		// detect if fix is valid
		fixValidity = data[18];
		
		/*	
		//sound alarm if minutes line up and alarm is set
		if ((hoursandminutes == alarm1time)&&(alarm1state == ALARM_SET))
		{
			// slow beeper for alarm 1
			alarmbeep = ALARMBEEP_A1;
		}
		else if ((hoursandminutes == alarm2time)&&(alarm2state == ALARM_SET))
		{
			// fast beeper for alarm 2
			alarmbeep = ALARMBEEP_A2;
		}
		else
		{
			alarmbeep = ALARMBEEP_OFF;
			alarmmute = ALARM_UNMUTE; // if there is no alarm, make sure the mute is disabled!
		}
		*/
			
		if (currentmode == MODE_SHOWTIME)
		{
			// set display to current time
			DisplayTime();
		}
			
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
	} else {
		// rising edge - button released
		TIMER0_CLOCK_NONE(); // disable debounce timer
		debounceCount = BUTTON_BOUNCECOUNT; // reset counter
	}		
	
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
	} else {
		// rising edge - button released
		TIMER0_CLOCK_NONE(); // disable debounce timer
		debounceCount = BUTTON_BOUNCECOUNT; // reset counter
	}		
	
}



// timer0 interrupt - debounce timer for buttons
ISR(TIMER0_OVF_vect)
{
	debounceCount--; // diminishing overflow counter: starts at set value, and finishes at 0
	if (debounceCount == 0x0000) // if counter has hit zero
	{
		// ... this is a valid button press
		
		// reset menu timeout counter & disable bounce counter
		TCNT1 = 0x0000;
		TIMER0_CLOCK_NONE();
		debounceCount = BUTTON_BOUNCECOUNT;
		
		if (BALARM_ISPRESSED())
		{
			// alarm button press event
			switch (currentmode)
			{
				case MODE_SHOWTIME:
					// enter alarm setup
					currentmode = MODE_SELECTALARM;
					StartMenuTimeout();
					break;
				case MODE_SETTIMEZONE:
					// decrease timezone
					TzDown();
					StartMenuTimeout();
					break;
				case MODE_SELECTALARM:
					// decrease alarm selection
					if (selectedalarm > 0x00)
					{
						selectedalarm--;
					}
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
					break;
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
					// enter timezone setup
					currentmode = MODE_SETTIMEZONE;
					break;
				case MODE_SETTIMEZONE:
					// increase timezone
					TzUp();
					StartMenuTimeout();
					break;
				case MODE_SELECTALARM:
					// increase alarm selection
					if (selectedalarm < ALARM_COUNT)
					{
						selectedalarm++;
					}
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
					StartMenuTimeout();
					break;
				default:
					currentmode = MODE_SHOWTIME;
					break;
			}
			UpdateDisplay(); // update display in any case!			
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