/*
 * hexstring.h
 *
 * Created: 2015-03-30 23:07:08
 *  Author: george
 */ 

#ifndef HEXSTRING_H_
#define HEXSTRING_H_

void ByteToHex(unsigned char n, char* s);
unsigned char HexToByte(char* s);
unsigned char HexToNibble(char c);

#endif /* HEXSTRING_H_ */