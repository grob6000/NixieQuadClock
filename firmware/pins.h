/*
 * pins.h - defines pins used everywhere else in the code
 *
 * Created: 2015-06-02 18:08:45
 *  Author: george
 */ 


#ifndef PINS_H_
#define PINS_H_

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

// handy functions to switch on/off pins by name "P"
// e.g. ON(LCOMMA) --> PORT_LCOMMA |= (1 << BIT_LCOMMA)
#define ON(P) PORT_ ## P |= (1 << BIT_ ## P)
#define OFF(P) PORT_ ## P &= ~(1 << BIT_ ## P)
#define TOGGLE(P) PORT_ ## P ^= (1 << BIT_ ## P)

#endif /* PINS_H_ */