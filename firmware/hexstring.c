/*
 * hexstring.c
 *
 * Created: 2015-03-30 23:09:01
 *  Author: george
 */ 

#include "hexstring.h"

// converts 2 digits of hex string to a byte
unsigned char HexToByte(char* s)
{
	return HexToNibble(s[0]) * 0x10 + HexToNibble(s[1]);
}

// converts a single hex char into a nibble
unsigned char HexToNibble(char c)
{
	unsigned char n = 0x00;
	if ((c>=0x30)&&(c<=0x39))
	{
		n = c - 0x30;
	}
	else if ((c>=0x41)&&(c<=0x46))
	{
		n = c - 0x37;
	}
	return n; // default value of 0 may be returned if hex digit was invalid
}

// turns a byte into a two-character hex string
void ByteToHex(unsigned char n, char* s)
{
	s[0] = (n / 0x10) + 0x30;
	if (s[0] > 0x39)
	{
		s[0] += 0x07;
	}
	s[1] = (n % 0x10) + 0x30;
	if (s[1] > 0x39)
	{
		s[1] += 0x07;
	}
}