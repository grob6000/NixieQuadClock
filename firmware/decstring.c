/*
 * decstring.c
 *
 * Created: 2015-03-30 23:18:29
 *  Author: george
 */ 

#include "decstring.h"

void ByteToDec(unsigned char n, char* s)
{
	s[0] = 0x30 + (n / 100);
	s[1] = 0x30 + (n % 100 / 10);
	s[2] = 0x30 + (n % 10);
}

unsigned char DecToByte(char* s)
{
	unsigned char n = 0;
	
	if ((s[0]>=0x30)&&(s[0]<=0x39))
	{
		n += (s[0] - 0x30) * 100;
	}
	
	if ((s[1]>=0x30)&&(s[1]<=0x39))
	{
		n += (s[1] - 0x30) * 10;
	}
	
	if ((s[2]>=0x30)&&(s[2]<=0x39))
	{
		n += (s[2] - 0x30);
	}
	
	return n;	
}