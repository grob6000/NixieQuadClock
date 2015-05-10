/*
	VFD Tube Clock
	Version:	1.0
	Author:		George Robinson
	Contact:	grobinson6000@gmail.com
	File:		uart.h
	Descrip.:	Parameters for UART control
*/


#ifndef UART_H_
#define UART_H_

// user settings
#define UART_BAUD 9600 // baud rate (pick something standard!)
#define UART_APPENDCR 1 // 1 = append CR character, 0 = do not append CR character
#define UART_APPENDLF 1 // 1 = append LF character, 0 = do not append LF character
#define UART_MAXLENGTH 64 // sets uart buffer size (minimise to save memory

// fixed settings
#define UART_LF 0x0A // ASCII LF (Line Feed) character
#define UART_CR 0x0D // ASCII CR (Carriage Return) character

// transmitter idle state (used for polling to prevent overwrite)
#define UART_T_IDLE 0x00 // idle - no transmission in progress
#define UART_T_TRANSMIT 0x01 // currently transmitting

// derived settings
#define UART_UBBR ((unsigned int)((F_CPU/16/UART_BAUD)-1)) // register value determined from baud rate and cpu frequency

// prototypes
void uartInit(); // initialises uart (note, global init (sei();) is required in user code after this routine)
void uartTransmit(char data[], unsigned int length); // transmits the specified string
void uartReceived(char data[], unsigned int length); // function to be placed in user code - called when a complete message is avaliable to be read

#endif /* UART_H_ */