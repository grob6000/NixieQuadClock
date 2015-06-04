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
#define REG_BIT0 D
#define BIT_BIT0 7
#define REG_BIT1 D
#define BIT_BIT1 6
#define REG_BIT2 D
#define BIT_BIT2 5
#define REG_BIT3 D
#define BIT_BIT3 4
#define REG_LCOMMA B
#define BIT_LCOMMA 1
#define REG_RCOMMA B
#define BIT_RCOMMA 0

// pins - digits
#define REG_DIGIT0 C
#define BIT_DIGIT0 0
#define REG_DIGIT1 C
#define BIT_DIGIT1 1
#define REG_DIGIT2 C
#define BIT_DIGIT2 2
#define REG_DIGIT3 C
#define BIT_DIGIT3 3
#define REG_DIGIT4 C
#define BIT_DIGIT4 4
#define REG_DIGIT5 C
#define BIT_DIGIT5 5

// pins - sounder/buzzer
#define REG_BUZZ B
#define BIT_BUZZ 2

// pins - buttons
#define REG_BUTTONA D
#define BIT_BUTTONA 2
#define REG_BUTTONB D
#define BIT_BUTTONB 3

// intermediate macros to reference PORT, DDR, PIN by single letter register reference
// note two stages are required, such that R is expanded in DDR(R) - preprocesser does not prescan with concatenations!
#define CC_DDR(R) DDR ## R
#define CC_PORT(R) PORT ## R
#define CC_PIN(R) PIN ## R
#define DDR(R) CC_DDR(R)
#define PORT(R) CC_PORT(R)
#define PIN(R) CC_PIN(R)

// handy functions to switch on/off pins by name "P"
// e.g. ON(LCOMMA) --> PORT_LCOMMA |= (1 << BIT_LCOMMA)
#define ON(P) PORT(REG_ ## P) |= (1 << BIT_ ## P)
#define OFF(P) PORT(REG_ ## P) &= ~(1 << BIT_ ## P)
#define TOGGLE(P) PORT(REG_ ## P) ^= (1 << BIT_ ## P)
#define ISHIGH(P) PIN(REG_ ## P) & (1 << BIT_ ## P)
#define ISLOW(P) !(PIN(REG_ ## P) & (1 << BIT_ ## P))
#define OUTPUT(P) DDR(REG_ ## P) |= (1 << BIT_ ## P)
#define INPUT(P) DDR(REG_ ## P) &= ~(1 << BIT_ ## P)

/* how these work:
 *    ON(DIGIT0) expands first to PORT(REG_DIGIT0) |= (1 << BIT_DIGIT0)
 *    PORT(REG_DIGIT0) is then prescanned to PORT(C) (as it contains no ## or #)
 *    PORT(C) expands to CC_PORT(C)
 *    CC_PORT(C) expands happily to PORTC (no prescan required)
 */
#endif /* PINS_H_ */