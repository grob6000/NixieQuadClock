/*
	VFD Tube Clock
	Version:	1.0
	Author:		George Robinson
	Contact:	grobinson6000@gmail.com
	File:		uart.c
	Descrip.:	UART control code (for CR/LF terminated messages)
*/

#include <avr/io.h>
#include <avr/interrupt.h>
#include "uart.h"

char uart_rdata[UART_MAXLENGTH + UART_APPENDCR + UART_APPENDLF];
char uart_rdata_out[UART_MAXLENGTH + UART_APPENDCR + UART_APPENDLF];
char uart_tdata[UART_MAXLENGTH + UART_APPENDCR + UART_APPENDLF];
unsigned int uart_rindex = 0;
unsigned int uart_tindex = 0;
unsigned int uart_tlength = 0;
unsigned char uart_istransmitting = UART_T_IDLE;

void uartInit()
{
	//DDRD |= (1<<0)|(1<<1);
	//PORTD |= (1<<0)|(1<<1);
	
	// set baud rate
	UBRR0H = (unsigned char)(UART_UBBR>>8);
	UBRR0L = (unsigned char)UART_UBBR;
	
	UCSR0A = 0x00;
	UCSR0B = (1<<RXCIE0)|(1<<RXEN0)|(1<<TXEN0)|(1<<TXCIE0);
	UCSR0C = (1<<UCSZ01)|(1<<UCSZ00);
	
}

void uartTransmit(char data[], unsigned int length)
{
	
	if (uart_istransmitting == UART_T_IDLE) // make sure transmission is not in progress
	{
		
		// set transmit mode
		uart_istransmitting = UART_T_TRANSMIT;
	
		// make sure we don't overrun transmit buffer!
		if (length > UART_MAXLENGTH)
		{
			length = UART_MAXLENGTH;
		}		
	
		// manage appending CR and or LF
		#if ((UART_APPENDCR==1)&&(UART_APPENDLF==1)) // append CR+LF
			uart_tdata[length] = UART_CR;
			uart_tdata[length+1] = UART_LF;
		#elif ((UART_APPENDCR==1)&&(UART_APPENDLF==0)) // append CR
			uart_tdata[length] = UART_CR;
		#elif ((UART_APPENDCR==0)&&(UART_APPENDLF==1)) // append LF
			uart_tdata[length] = UART_LF;
		#else
		// no appending
		#endif	
	
		// copy data into transmit buffer (note that CR/LF already in buffer)
		int n;
		for (n=0; n < length; n++)
		{
			uart_tdata[n] = data[n];
		}
	
		// init send index and length
		uart_tindex = 0x0000;
		uart_tlength = length + (UART_APPENDCR + UART_APPENDLF); // includes CR and or LF
	
		// send first byte (subsequent bytes sent by interrupt)
		UDR0 = uart_tdata[uart_tindex];
	
	}	
	
}

ISR(USART_RX_vect)
{
	// read byte into buffer
	uart_rdata[uart_rindex] = UDR0;
	
	// manage terminating on CR and or LF
	#if ((UART_APPENDCR==1)&&(UART_APPENDLF==1)) // CR+LF
	if ((uart_rdata[uart_rindex - 1] == UART_CR)&&(uart_rdata[uart_rindex] = UART_LF))
	#elif ((UART_APPENDCR==1)&&(UART_APPENDLF==0)) // append CR
	if (uart_rdata[uart_rindex - 1] == UART_CR)
	#elif ((UART_APPENDCR==0)&&(UART_APPENDLF==1)) // append LF
	if (uart_rdata[uart_rindex] = UART_LF)
	#else
	if (uart_rindex == UART_MAXLENGTH - 1) // terminate on full buffer
	#endif
	{
		int n;
		for (n=0; n <= uart_rindex - (UART_APPENDCR + UART_APPENDLF); n++)
		{
			uart_rdata_out[n] = uart_rdata[n];
		}
		uartReceived(uart_rdata_out, uart_rindex + 1 - (UART_APPENDCR + UART_APPENDLF));
		uart_rindex = 0x0000; // reset index
	}
	else
	{
		// increment index ready for next byte
		uart_rindex++;
	}				
				
}

ISR(USART_TX_vect)
{
	// finished sending byte
	uart_tindex++;
	if (uart_tindex >= uart_tlength)
	{
		// transmission complete - reset flag
		uart_istransmitting = UART_T_IDLE;
	} else {
		// send next byte
		UDR0 = uart_tdata[uart_tindex];
	}
	
}