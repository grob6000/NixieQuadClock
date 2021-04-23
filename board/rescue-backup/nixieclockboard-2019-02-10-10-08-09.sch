EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:nixieclockboard-cache
EELAYER 25 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 2
Title "NIXIEBOARD"
Date "2017-10-03"
Rev "03"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MOSFET_N Q1
U 1 1 4DF56A57
P 5600 2550
F 0 "Q1" H 5610 2720 60  0000 R CNN
F 1 "2N7000" H 5610 2400 60  0000 R CNN
F 2 "" H 5600 2550 60  0001 C CNN
F 3 "" H 5600 2550 60  0001 C CNN
	1    5600 2550
	1    0    0    -1  
$EndComp
Text Label 4900 2550 2    60   ~ 0
BUZZ
Text Label 3450 1700 0    60   ~ 0
BUZZ
Text GLabel 12300 2800 0    60   Input ~ 0
HV
Text Label 7700 9700 1    60   ~ 0
CRB
Text Label 5950 9700 1    60   ~ 0
CLB
$Comp
L R R19
U 1 1 4DE8A7CD
P 5650 9700
F 0 "R19" V 5730 9700 50  0000 C CNN
F 1 "100k" V 5650 9700 50  0000 C CNN
F 2 "" H 5650 9700 60  0001 C CNN
F 3 "" H 5650 9700 60  0001 C CNN
	1    5650 9700
	0    1    1    0   
$EndComp
$Comp
L R R20
U 1 1 4DE8A82F
P 7400 9700
F 0 "R20" V 7480 9700 50  0000 C CNN
F 1 "100k" V 7400 9700 50  0000 C CNN
F 2 "" H 7400 9700 60  0001 C CNN
F 3 "" H 7400 9700 60  0001 C CNN
	1    7400 9700
	0    1    1    0   
$EndComp
$Comp
L NPN Q15
U 1 1 4DE8A830
P 7950 9700
F 0 "Q15" H 7950 9550 50  0000 R CNN
F 1 "MPSA42" H 7950 9850 50  0000 R CNN
F 2 "" H 7950 9700 60  0001 C CNN
F 3 "" H 7950 9700 60  0001 C CNN
	1    7950 9700
	1    0    0    -1  
$EndComp
$Comp
L R R18
U 1 1 4DE8A82E
P 8050 9150
F 0 "R18" V 8130 9150 50  0000 C CNN
F 1 "10k" V 8050 9150 50  0000 C CNN
F 2 "" H 8050 9150 60  0001 C CNN
F 3 "" H 8050 9150 60  0001 C CNN
	1    8050 9150
	1    0    0    -1  
$EndComp
Text Label 6950 9700 2    60   ~ 0
RCOMMA
Text Label 5200 9700 2    60   ~ 0
LCOMMA
$Comp
L R R17
U 1 1 4DE8A7D4
P 6300 9150
F 0 "R17" V 6380 9150 50  0000 C CNN
F 1 "10k" V 6300 9150 50  0000 C CNN
F 2 "" H 6300 9150 60  0001 C CNN
F 3 "" H 6300 9150 60  0001 C CNN
	1    6300 9150
	1    0    0    -1  
$EndComp
$Comp
L NPN Q14
U 1 1 4DE8A7B0
P 6200 9700
F 0 "Q14" H 6200 9550 50  0000 R CNN
F 1 "MPSA42" H 6200 9850 50  0000 R CNN
F 2 "" H 6200 9700 60  0001 C CNN
F 3 "" H 6200 9700 60  0001 C CNN
	1    6200 9700
	1    0    0    -1  
$EndComp
Text Label 11200 2650 0    60   ~ 0
VSUP
Text Label 2200 9600 2    60   ~ 0
VCC
Text Label 12300 3050 2    60   ~ 0
VSUP
$Sheet
S 12500 2600 1600 700 
U 4DE4A3C9
F0 "HVSupply" 60
F1 "nixieclockboard_hvsupply.sch" 60
F2 "VOUT" I L 12500 2800 60 
F3 "VIN" I L 12500 3050 60 
$EndSheet
Text Label 1950 5950 0    60   ~ 0
X2
Text Label 1250 5950 2    60   ~ 0
X1
Text Label 3450 1500 0    60   ~ 0
LCOMMA
Text Label 3450 1600 0    60   ~ 0
RCOMMA
Text Label 3450 1800 0    60   ~ 0
MOSI
Text Label 3450 1900 0    60   ~ 0
MISO
Text Label 3450 2000 0    60   ~ 0
SCK
Text Label 3450 3300 0    60   ~ 0
BALARM
Text Label 3450 3400 0    60   ~ 0
BZONE
Text Label 3450 2850 0    60   ~ 0
SCL
Text Label 3450 2750 0    60   ~ 0
SDA
Text Label 3450 2350 0    60   ~ 0
S0
Text Label 3450 2450 0    60   ~ 0
S1
Text Label 3450 2550 0    60   ~ 0
S2
Text Label 3450 2650 0    60   ~ 0
S3
Text Label 3450 3800 0    60   ~ 0
BIT0
Text Label 3450 3700 0    60   ~ 0
BIT1
Text Label 3450 3600 0    60   ~ 0
BIT2
Text Label 3450 3500 0    60   ~ 0
BIT3
Text Label 2950 6000 2    60   ~ 0
MISO
Text Label 2950 6100 2    60   ~ 0
SCK
Text Label 3850 6100 0    60   ~ 0
MOSI
Text Label 3700 3200 2    60   ~ 0
TXD
Text Label 3700 3100 2    60   ~ 0
RXD
Text Label 2950 6200 2    60   ~ 0
RESET
$Comp
L C C7
U 1 1 4DE41AB5
P 1950 6200
F 0 "C7" H 2000 6300 50  0000 L CNN
F 1 "22p" H 2000 6100 50  0000 L CNN
F 2 "" H 1950 6200 60  0001 C CNN
F 3 "" H 1950 6200 60  0001 C CNN
	1    1950 6200
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 4DE41AB3
P 1250 6200
F 0 "C6" H 1300 6300 50  0000 L CNN
F 1 "22p" H 1300 6100 50  0000 L CNN
F 2 "" H 1250 6200 60  0001 C CNN
F 3 "" H 1250 6200 60  0001 C CNN
	1    1250 6200
	-1   0    0    -1  
$EndComp
$Comp
L CRYSTAL X1
U 1 1 4DE41AA7
P 1600 5950
F 0 "X1" H 1600 6100 60  0000 C CNN
F 1 "18.432MHz" H 1600 5800 60  0000 C CNN
F 2 "" H 1600 5950 60  0001 C CNN
F 3 "" H 1600 5950 60  0001 C CNN
	1    1600 5950
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 4DE41A65
P 4150 2600
F 0 "R1" V 4230 2600 50  0000 C CNN
F 1 "4k7" V 4150 2600 50  0000 C CNN
F 2 "" H 4150 2600 60  0001 C CNN
F 3 "" H 4150 2600 60  0001 C CNN
	1    4150 2600
	1    0    0    -1  
$EndComp
Text Label 2200 9800 2    60   ~ 0
BIT2
Text Label 2200 9700 2    60   ~ 0
BIT1
Text Label 2200 9400 2    60   ~ 0
BIT0
Text Label 2200 9500 2    60   ~ 0
BIT3
$Comp
L K155ID1 U2
U 1 1 4DE38AD2
P 2500 10300
F 0 "U2" H 3100 11600 60  0000 C CNN
F 1 "K155ID1" H 3100 10550 60  0000 C CNN
F 2 "" H 2500 10300 60  0001 C CNN
F 3 "" H 2500 10300 60  0001 C CNN
	1    2500 10300
	1    0    0    -1  
$EndComp
$Comp
L ZENER D1
U 1 1 4DE38254
P 2550 8800
F 0 "D1" H 2550 8900 50  0000 C CNN
F 1 "30V" H 2550 8700 40  0000 C CNN
F 2 "" H 2550 8800 60  0001 C CNN
F 3 "" H 2550 8800 60  0001 C CNN
	1    2550 8800
	-1   0    0    1   
$EndComp
$Comp
L ATMEGA328P-A IC1
U 1 1 54AF6B09
P 2350 2600
F 0 "IC1" H 1600 3850 40  0000 L BNN
F 1 "ATMEGA328P-A" H 2750 1200 40  0000 L BNN
F 2 "TQFP32" H 2350 2600 30  0000 C CIN
F 3 "" H 2350 2600 60  0000 C CNN
	1    2350 2600
	1    0    0    -1  
$EndComp
Text Label 3450 2950 0    60   ~ 0
RESET
Text Label 3450 2100 0    60   ~ 0
X1
Text Label 3450 2200 0    60   ~ 0
X2
$Comp
L CONN_2 P1
U 1 1 54AF9004
P 10550 2750
F 0 "P1" V 10500 2750 40  0000 C CNN
F 1 "PWR" V 10600 2750 40  0000 C CNN
F 2 "" H 10550 2750 60  0000 C CNN
F 3 "" H 10550 2750 60  0000 C CNN
	1    10550 2750
	-1   0    0    1   
$EndComp
$Comp
L CONN_4 P5
U 1 1 54AF95C7
P 5500 4600
F 0 "P5" V 5450 4600 50  0000 C CNN
F 1 "BTN" V 5550 4600 50  0000 C CNN
F 2 "" H 5500 4600 60  0000 C CNN
F 3 "" H 5500 4600 60  0000 C CNN
	1    5500 4600
	1    0    0    -1  
$EndComp
Text Label 4750 4550 2    60   ~ 0
BALARM
Text Label 4750 4650 2    60   ~ 0
BZONE
Text Label 4750 4450 2    60   ~ 0
GND
Text Label 4750 4750 2    60   ~ 0
VCC
Text Notes 4650 4250 0    60   ~ 0
CONTROL
Text Label 5100 1700 0    60   ~ 0
VSUP
$Comp
L CONN_2 P2
U 1 1 54AFA8EB
P 6450 2150
F 0 "P2" V 6400 2150 40  0000 C CNN
F 1 "BUZZ" V 6500 2150 40  0000 C CNN
F 2 "" H 6450 2150 60  0000 C CNN
F 3 "" H 6450 2150 60  0000 C CNN
	1    6450 2150
	1    0    0    1   
$EndComp
$Comp
L JUMPER3 JP1
U 1 1 54AFAA5F
P 5700 1700
F 0 "JP1" H 5750 1600 40  0000 L CNN
F 1 "VBUZZ" H 5700 1800 40  0000 C CNN
F 2 "~" H 5700 1700 60  0000 C CNN
F 3 "~" H 5700 1700 60  0000 C CNN
	1    5700 1700
	1    0    0    -1  
$EndComp
Text Label 6200 1700 0    60   ~ 0
VCC
$Comp
L C C3
U 1 1 54AFAFFF
P 5100 5050
F 0 "C3" H 5100 5150 40  0000 L CNN
F 1 "0u1" H 5106 4965 40  0000 L CNN
F 2 "~" H 5138 4900 30  0000 C CNN
F 3 "~" H 5100 5050 60  0000 C CNN
	1    5100 5050
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 54AFB4E0
P 4900 5050
F 0 "C2" H 4900 5150 40  0000 L CNN
F 1 "0u1" H 4906 4965 40  0000 L CNN
F 2 "~" H 4938 4900 30  0000 C CNN
F 3 "~" H 4900 5050 60  0000 C CNN
	1    4900 5050
	1    0    0    -1  
$EndComp
Text Label 4600 5450 2    60   ~ 0
GND
Text Label 950  1500 2    60   ~ 0
VCC
Text Label 4150 2150 0    60   ~ 0
VCC
$Comp
L AVRISP6 P6
U 1 1 54AF9698
P 3400 6250
F 0 "P6" H 3400 6600 60  0000 C CNN
F 1 "ISP" H 3400 6200 60  0000 C CNN
F 2 "" H 3400 6250 60  0000 C CNN
F 3 "" H 3400 6250 60  0000 C CNN
	1    3400 6250
	1    0    0    -1  
$EndComp
Text Label 3850 6000 0    60   ~ 0
VCC
Text Label 3850 6200 0    60   ~ 0
GND
Text Label 1300 4000 3    60   ~ 0
GND
Text Label 1000 6500 0    60   ~ 0
GND
$Comp
L LM1117 U1
U 1 1 54AFBE54
P 12600 4550
F 0 "U1" H 12600 4950 60  0000 C CNN
F 1 "LM1117" H 12600 4800 60  0000 C CNN
F 2 "" H 12600 4550 60  0000 C CNN
F 3 "" H 12600 4550 60  0000 C CNN
	1    12600 4550
	0    -1   -1   0   
$EndComp
Text Label 6300 10250 1    60   ~ 0
GND
Text Label 8050 10250 1    60   ~ 0
GND
$Comp
L R R4
U 1 1 54B264B4
P 13750 4550
F 0 "R4" V 13830 4550 40  0000 C CNN
F 1 "120" V 13757 4551 40  0000 C CNN
F 2 "~" V 13680 4550 30  0000 C CNN
F 3 "~" H 13750 4550 30  0000 C CNN
	1    13750 4550
	0    -1   -1   0   
$EndComp
$Comp
L R R6
U 1 1 54B2663D
P 14100 5000
F 0 "R6" V 14180 5000 40  0000 C CNN
F 1 "360" V 14107 5001 40  0000 C CNN
F 2 "~" V 14030 5000 30  0000 C CNN
F 3 "~" H 14100 5000 30  0000 C CNN
	1    14100 5000
	-1   0    0    1   
$EndComp
Text Label 13300 4450 0    60   ~ 0
VSUP
Text Label 13300 4550 0    60   ~ 0
VCC
Text Label 13300 4650 0    60   ~ 0
ADJ
$Comp
L CP1 C4
U 1 1 54B275D6
P 13050 5200
F 0 "C4" H 13100 5300 50  0000 L CNN
F 1 "10u" H 13100 5100 50  0000 L CNN
F 2 "~" H 13050 5200 60  0000 C CNN
F 3 "~" H 13050 5200 60  0000 C CNN
	1    13050 5200
	1    0    0    -1  
$EndComp
$Comp
L CP1 C5
U 1 1 54B279C4
P 13350 5200
F 0 "C5" H 13400 5300 50  0000 L CNN
F 1 "10u" H 13400 5100 50  0000 L CNN
F 2 "~" H 13350 5200 60  0000 C CNN
F 3 "~" H 13350 5200 60  0000 C CNN
	1    13350 5200
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 54B28167
P 1050 1850
F 0 "C1" H 1050 1950 40  0000 L CNN
F 1 "0u1" H 1056 1765 40  0000 L CNN
F 2 "~" H 1088 1700 30  0000 C CNN
F 3 "~" H 1050 1850 60  0000 C CNN
	1    1050 1850
	1    0    0    -1  
$EndComp
Text Label 1200 2300 0    60   ~ 0
GND
Text Notes 10550 2450 0    60   ~ 0
POWER INPUT
Text Notes 12300 4300 0    60   ~ 0
5V REGULATOR
Text Notes 5650 8600 0    60   ~ 0
COMMA CATHODE DRIVERS
Text Notes 5100 1450 0    60   ~ 0
BUZZER
Text Notes 3000 5750 0    60   ~ 0
PROGRAMMER / SPI
Text Notes 1200 5700 0    60   ~ 0
OSCIALLTOR
Text Notes 2050 1200 0    60   ~ 0
MICROCONTROLLER
Text Notes 2200 4400 0    60   ~ 0
GPS/SERIAL INTERFACE
Text Notes 2550 8550 0    60   ~ 0
NIXIE CATHODE DRIVER
Text Notes 10550 8300 0    60   ~ 0
ANODE DRIVERS
Text Notes 12400 2400 0    60   ~ 0
HV SUPPLY
$Comp
L R R9
U 1 1 54B2949C
P 6950 6550
F 0 "R9" V 7030 6550 40  0000 C CNN
F 1 "R" V 6957 6551 40  0000 C CNN
F 2 "~" V 6880 6550 30  0000 C CNN
F 3 "~" H 6950 6550 30  0000 C CNN
	1    6950 6550
	1    0    0    -1  
$EndComp
Text Label 1200 2850 2    60   ~ 0
ADC6
Text Label 1200 2950 2    60   ~ 0
ADC7
Text Notes 6050 5350 0    60   ~ 0
GENERIC ANALOG
Text Label 6750 6100 2    60   ~ 0
ADC7
$Comp
L R R7
U 1 1 54B29A75
P 6950 5750
F 0 "R7" V 7030 5750 40  0000 C CNN
F 1 "R" V 6957 5751 40  0000 C CNN
F 2 "~" V 6880 5750 30  0000 C CNN
F 3 "~" H 6950 5750 30  0000 C CNN
	1    6950 5750
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 54B2A0F1
P 7550 6650
F 0 "R10" V 7630 6650 40  0000 C CNN
F 1 "R" V 7557 6651 40  0000 C CNN
F 2 "~" V 7480 6650 30  0000 C CNN
F 3 "~" H 7550 6650 30  0000 C CNN
	1    7550 6650
	1    0    0    -1  
$EndComp
Text Label 7350 6300 2    60   ~ 0
ADC6
Text Label 7700 7050 0    60   ~ 0
GND
$Comp
L R R8
U 1 1 54B2A0FE
P 7550 5750
F 0 "R8" V 7630 5750 40  0000 C CNN
F 1 "R" V 7557 5751 40  0000 C CNN
F 2 "~" V 7480 5750 30  0000 C CNN
F 3 "~" H 7550 5750 30  0000 C CNN
	1    7550 5750
	1    0    0    -1  
$EndComp
Text Label 7700 5400 0    60   ~ 0
VCC
$Comp
L JUMPER3 JP2
U 1 1 54B2A726
P 7850 3600
F 0 "JP2" H 7900 3500 40  0000 L CNN
F 1 "S4/SDA" H 7850 3700 40  0000 C CNN
F 2 "~" H 7850 3600 60  0000 C CNN
F 3 "~" H 7850 3600 60  0000 C CNN
	1    7850 3600
	0    1    1    0   
$EndComp
Text Label 7550 3600 2    60   ~ 0
S4
Text Label 7850 3150 1    60   ~ 0
SDA
Text Label 7850 4050 3    60   ~ 0
RXD
$Comp
L JUMPER3 JP3
U 1 1 54B2AF55
P 8500 3600
F 0 "JP3" H 8550 3500 40  0000 L CNN
F 1 "S5/SCL" H 8500 3700 40  0000 C CNN
F 2 "~" H 8500 3600 60  0000 C CNN
F 3 "~" H 8500 3600 60  0000 C CNN
	1    8500 3600
	0    1    1    0   
$EndComp
Text Label 8200 3600 2    60   ~ 0
S5
Text Label 8500 3150 1    60   ~ 0
SCL
Text Label 8500 4050 3    60   ~ 0
TXD
$Comp
L R R2
U 1 1 54B2B176
P 7600 2900
F 0 "R2" V 7680 2900 40  0000 C CNN
F 1 "10k" V 7607 2901 40  0000 C CNN
F 2 "~" V 7530 2900 30  0000 C CNN
F 3 "~" H 7600 2900 30  0000 C CNN
	1    7600 2900
	1    0    0    -1  
$EndComp
Text Label 7450 2500 2    60   ~ 0
VCC
$Comp
L R R3
U 1 1 54B2B427
P 8250 2900
F 0 "R3" V 8330 2900 40  0000 C CNN
F 1 "10k" V 8257 2901 40  0000 C CNN
F 2 "~" V 8180 2900 30  0000 C CNN
F 3 "~" H 8250 2900 30  0000 C CNN
	1    8250 2900
	1    0    0    -1  
$EndComp
Text Notes 7500 2200 0    60   ~ 0
CONFIG JUMPERS\n(6 DIGITS) || (I2C) || (SERIAL)
$Comp
L NPN Q8
U 1 1 54B2F1C1
P 9550 9500
F 0 "Q8" H 9550 9350 50  0000 R CNN
F 1 "MPSA42" H 9550 9650 50  0000 R CNN
F 2 "~" H 9550 9500 60  0000 C CNN
F 3 "~" H 9550 9500 60  0000 C CNN
	1    9550 9500
	1    0    0    -1  
$EndComp
$Comp
L PNP Q2
U 1 1 54B2F308
P 9950 9200
F 0 "Q2" H 9950 9050 60  0000 R CNN
F 1 "MPSA92" V 9950 8900 60  0000 R CNN
F 2 "~" H 9950 9200 60  0000 C CNN
F 3 "~" H 9950 9200 60  0000 C CNN
	1    9950 9200
	1    0    0    1   
$EndComp
$Comp
L R R11
U 1 1 54B2F317
P 9650 8850
F 0 "R11" V 9730 8850 40  0000 C CNN
F 1 "100k" V 9657 8851 40  0000 C CNN
F 2 "~" V 9580 8850 30  0000 C CNN
F 3 "~" H 9650 8850 30  0000 C CNN
	1    9650 8850
	1    0    0    -1  
$EndComp
$Comp
L R R27
U 1 1 54B2F33A
P 9650 10200
F 0 "R27" V 9730 10200 40  0000 C CNN
F 1 "10k" V 9657 10201 40  0000 C CNN
F 2 "~" V 9580 10200 30  0000 C CNN
F 3 "~" H 9650 10200 30  0000 C CNN
	1    9650 10200
	-1   0    0    1   
$EndComp
Text Label 9350 10550 2    60   ~ 0
GND
Text Label 9250 8450 2    60   ~ 0
HV
Text Label 9250 9500 2    60   ~ 0
S0
$Comp
L R R21
U 1 1 54B30295
P 10050 9800
F 0 "R21" V 10130 9800 40  0000 C CNN
F 1 "R" V 10057 9801 40  0000 C CNN
F 2 "~" V 9980 9800 30  0000 C CNN
F 3 "~" H 10050 9800 30  0000 C CNN
	1    10050 9800
	1    0    0    -1  
$EndComp
Text Label 10050 10150 3    60   ~ 0
A0
Text Label 9650 9200 2    60   ~ 0
PNPB0
Text Label 9650 9850 2    60   ~ 0
NPNB0
$Comp
L NPN Q9
U 1 1 54B31A25
P 10650 9500
F 0 "Q9" H 10650 9350 50  0000 R CNN
F 1 "MPSA42" H 10650 9650 50  0000 R CNN
F 2 "~" H 10650 9500 60  0000 C CNN
F 3 "~" H 10650 9500 60  0000 C CNN
	1    10650 9500
	1    0    0    -1  
$EndComp
$Comp
L PNP Q3
U 1 1 54B31A2B
P 11050 9200
F 0 "Q3" H 11050 9050 60  0000 R CNN
F 1 "MPSA92" V 11050 8900 60  0000 R CNN
F 2 "~" H 11050 9200 60  0000 C CNN
F 3 "~" H 11050 9200 60  0000 C CNN
	1    11050 9200
	1    0    0    1   
$EndComp
$Comp
L R R12
U 1 1 54B31A31
P 10750 8850
F 0 "R12" V 10830 8850 40  0000 C CNN
F 1 "100k" V 10757 8851 40  0000 C CNN
F 2 "~" V 10680 8850 30  0000 C CNN
F 3 "~" H 10750 8850 30  0000 C CNN
	1    10750 8850
	1    0    0    -1  
$EndComp
$Comp
L R R28
U 1 1 54B31A37
P 10750 10200
F 0 "R28" V 10830 10200 40  0000 C CNN
F 1 "10k" V 10757 10201 40  0000 C CNN
F 2 "~" V 10680 10200 30  0000 C CNN
F 3 "~" H 10750 10200 30  0000 C CNN
	1    10750 10200
	-1   0    0    1   
$EndComp
Text Label 10350 9500 2    60   ~ 0
S1
$Comp
L R R22
U 1 1 54B31A46
P 11150 9800
F 0 "R22" V 11230 9800 40  0000 C CNN
F 1 "R" V 11157 9801 40  0000 C CNN
F 2 "~" V 11080 9800 30  0000 C CNN
F 3 "~" H 11150 9800 30  0000 C CNN
	1    11150 9800
	1    0    0    -1  
$EndComp
Text Label 11150 10150 3    60   ~ 0
A1
Text Label 10750 9200 2    60   ~ 0
PNPB1
Text Label 10750 9850 2    60   ~ 0
NPNB1
$Comp
L NPN Q10
U 1 1 54B31C73
P 11750 9500
F 0 "Q10" H 11750 9350 50  0000 R CNN
F 1 "MPSA42" H 11750 9650 50  0000 R CNN
F 2 "~" H 11750 9500 60  0000 C CNN
F 3 "~" H 11750 9500 60  0000 C CNN
	1    11750 9500
	1    0    0    -1  
$EndComp
$Comp
L PNP Q4
U 1 1 54B31C79
P 12150 9200
F 0 "Q4" H 12150 9050 60  0000 R CNN
F 1 "MPSA92" V 12150 8900 60  0000 R CNN
F 2 "~" H 12150 9200 60  0000 C CNN
F 3 "~" H 12150 9200 60  0000 C CNN
	1    12150 9200
	1    0    0    1   
$EndComp
$Comp
L R R13
U 1 1 54B31C7F
P 11850 8850
F 0 "R13" V 11930 8850 40  0000 C CNN
F 1 "100k" V 11857 8851 40  0000 C CNN
F 2 "~" V 11780 8850 30  0000 C CNN
F 3 "~" H 11850 8850 30  0000 C CNN
	1    11850 8850
	1    0    0    -1  
$EndComp
$Comp
L R R29
U 1 1 54B31C85
P 11850 10200
F 0 "R29" V 11930 10200 40  0000 C CNN
F 1 "10k" V 11857 10201 40  0000 C CNN
F 2 "~" V 11780 10200 30  0000 C CNN
F 3 "~" H 11850 10200 30  0000 C CNN
	1    11850 10200
	-1   0    0    1   
$EndComp
Text Label 11450 9500 2    60   ~ 0
S2
$Comp
L R R23
U 1 1 54B31C95
P 12250 9800
F 0 "R23" V 12330 9800 40  0000 C CNN
F 1 "R" V 12257 9801 40  0000 C CNN
F 2 "~" V 12180 9800 30  0000 C CNN
F 3 "~" H 12250 9800 30  0000 C CNN
	1    12250 9800
	1    0    0    -1  
$EndComp
Text Label 12250 10150 3    60   ~ 0
A2
Text Label 11850 9200 2    60   ~ 0
PNPB2
Text Label 11850 9850 2    60   ~ 0
NPNB2
$Comp
L NPN Q11
U 1 1 54B31CA0
P 12850 9500
F 0 "Q11" H 12850 9350 50  0000 R CNN
F 1 "MPSA42" H 12850 9650 50  0000 R CNN
F 2 "~" H 12850 9500 60  0000 C CNN
F 3 "~" H 12850 9500 60  0000 C CNN
	1    12850 9500
	1    0    0    -1  
$EndComp
$Comp
L PNP Q5
U 1 1 54B31CA6
P 13250 9200
F 0 "Q5" H 13250 9050 60  0000 R CNN
F 1 "MPSA92" V 13250 8900 60  0000 R CNN
F 2 "~" H 13250 9200 60  0000 C CNN
F 3 "~" H 13250 9200 60  0000 C CNN
	1    13250 9200
	1    0    0    1   
$EndComp
$Comp
L R R14
U 1 1 54B31CAC
P 12950 8850
F 0 "R14" V 13030 8850 40  0000 C CNN
F 1 "100k" V 12957 8851 40  0000 C CNN
F 2 "~" V 12880 8850 30  0000 C CNN
F 3 "~" H 12950 8850 30  0000 C CNN
	1    12950 8850
	1    0    0    -1  
$EndComp
$Comp
L R R30
U 1 1 54B31CB2
P 12950 10200
F 0 "R30" V 13030 10200 40  0000 C CNN
F 1 "10k" V 12957 10201 40  0000 C CNN
F 2 "~" V 12880 10200 30  0000 C CNN
F 3 "~" H 12950 10200 30  0000 C CNN
	1    12950 10200
	-1   0    0    1   
$EndComp
Text Label 12550 9500 2    60   ~ 0
S3
$Comp
L R R24
U 1 1 54B31CC1
P 13350 9800
F 0 "R24" V 13430 9800 40  0000 C CNN
F 1 "R" V 13357 9801 40  0000 C CNN
F 2 "~" V 13280 9800 30  0000 C CNN
F 3 "~" H 13350 9800 30  0000 C CNN
	1    13350 9800
	1    0    0    -1  
$EndComp
Text Label 13350 10150 3    60   ~ 0
A3
Text Label 12950 9200 2    60   ~ 0
PNPB3
Text Label 12950 9850 2    60   ~ 0
NPNB3
$Comp
L NPN Q12
U 1 1 54B32026
P 13950 9500
F 0 "Q12" H 13950 9350 50  0000 R CNN
F 1 "MPSA42" H 13950 9650 50  0000 R CNN
F 2 "~" H 13950 9500 60  0000 C CNN
F 3 "~" H 13950 9500 60  0000 C CNN
	1    13950 9500
	1    0    0    -1  
$EndComp
$Comp
L PNP Q6
U 1 1 54B3202C
P 14350 9200
F 0 "Q6" H 14350 9050 60  0000 R CNN
F 1 "MPSA92" V 14350 8900 60  0000 R CNN
F 2 "~" H 14350 9200 60  0000 C CNN
F 3 "~" H 14350 9200 60  0000 C CNN
	1    14350 9200
	1    0    0    1   
$EndComp
$Comp
L R R15
U 1 1 54B32032
P 14050 8850
F 0 "R15" V 14130 8850 40  0000 C CNN
F 1 "100k" V 14057 8851 40  0000 C CNN
F 2 "~" V 13980 8850 30  0000 C CNN
F 3 "~" H 14050 8850 30  0000 C CNN
	1    14050 8850
	1    0    0    -1  
$EndComp
$Comp
L R R31
U 1 1 54B32038
P 14050 10200
F 0 "R31" V 14130 10200 40  0000 C CNN
F 1 "10k" V 14057 10201 40  0000 C CNN
F 2 "~" V 13980 10200 30  0000 C CNN
F 3 "~" H 14050 10200 30  0000 C CNN
	1    14050 10200
	-1   0    0    1   
$EndComp
Text Label 13650 9500 2    60   ~ 0
S4
$Comp
L R R25
U 1 1 54B32047
P 14450 9800
F 0 "R25" V 14530 9800 40  0000 C CNN
F 1 "R" V 14457 9801 40  0000 C CNN
F 2 "~" V 14380 9800 30  0000 C CNN
F 3 "~" H 14450 9800 30  0000 C CNN
	1    14450 9800
	1    0    0    -1  
$EndComp
Text Label 14450 10150 3    60   ~ 0
A4
Text Label 14050 9200 2    60   ~ 0
PNPB4
Text Label 14050 9850 2    60   ~ 0
NPNB4
$Comp
L NPN Q13
U 1 1 54B32052
P 15050 9500
F 0 "Q13" H 15050 9350 50  0000 R CNN
F 1 "MPSA42" H 15050 9650 50  0000 R CNN
F 2 "~" H 15050 9500 60  0000 C CNN
F 3 "~" H 15050 9500 60  0000 C CNN
	1    15050 9500
	1    0    0    -1  
$EndComp
$Comp
L PNP Q7
U 1 1 54B32058
P 15450 9200
F 0 "Q7" H 15450 9050 60  0000 R CNN
F 1 "MPSA92" V 15450 8900 60  0000 R CNN
F 2 "~" H 15450 9200 60  0000 C CNN
F 3 "~" H 15450 9200 60  0000 C CNN
	1    15450 9200
	1    0    0    1   
$EndComp
$Comp
L R R16
U 1 1 54B3205E
P 15150 8850
F 0 "R16" V 15230 8850 40  0000 C CNN
F 1 "100k" V 15157 8851 40  0000 C CNN
F 2 "~" V 15080 8850 30  0000 C CNN
F 3 "~" H 15150 8850 30  0000 C CNN
	1    15150 8850
	1    0    0    -1  
$EndComp
$Comp
L R R32
U 1 1 54B32064
P 15150 10200
F 0 "R32" V 15230 10200 40  0000 C CNN
F 1 "10k" V 15157 10201 40  0000 C CNN
F 2 "~" V 15080 10200 30  0000 C CNN
F 3 "~" H 15150 10200 30  0000 C CNN
	1    15150 10200
	-1   0    0    1   
$EndComp
Text Label 14750 9500 2    60   ~ 0
S5
$Comp
L R R26
U 1 1 54B32073
P 15550 9800
F 0 "R26" V 15630 9800 40  0000 C CNN
F 1 "R" V 15557 9801 40  0000 C CNN
F 2 "~" V 15480 9800 30  0000 C CNN
F 3 "~" H 15550 9800 30  0000 C CNN
	1    15550 9800
	1    0    0    -1  
$EndComp
Text Label 15550 10150 3    60   ~ 0
A5
Text Label 15150 9200 2    60   ~ 0
PNPB5
Text Label 15150 9850 2    60   ~ 0
NPNB5
$Comp
L CONN_6 P10
U 1 1 54B328DB
P 10050 7100
F 0 "P10" V 10000 7100 60  0000 C CNN
F 1 "ANODE" V 10100 7100 60  0000 C CNN
F 2 "" H 10050 7100 60  0000 C CNN
F 3 "" H 10050 7100 60  0000 C CNN
	1    10050 7100
	1    0    0    -1  
$EndComp
Text Label 9500 6850 2    60   ~ 0
A0
Text Label 9500 6950 2    60   ~ 0
A1
Text Label 9500 7050 2    60   ~ 0
A2
Text Label 9500 7150 2    60   ~ 0
A3
Text Label 9500 7250 2    60   ~ 0
A4
Text Label 9500 7350 2    60   ~ 0
A5
$Comp
L CONN_12 P9
U 1 1 54B330E5
P 10950 6800
F 0 "P9" V 10900 6800 60  0000 C CNN
F 1 "D0" V 11000 6800 60  0000 C CNN
F 2 "" H 10950 6800 60  0000 C CNN
F 3 "" H 10950 6800 60  0000 C CNN
	1    10950 6800
	1    0    0    -1  
$EndComp
Text Label 10450 6250 2    60   ~ 0
C0
Text Label 10450 6350 2    60   ~ 0
C1
Text Label 10450 6450 2    60   ~ 0
C2
Text Label 10450 6550 2    60   ~ 0
C3
Text Label 10450 6650 2    60   ~ 0
C4
Text Label 10450 6750 2    60   ~ 0
C5
Text Label 10450 6850 2    60   ~ 0
C6
Text Label 10450 6950 2    60   ~ 0
C7
Text Label 10450 7050 2    60   ~ 0
C8
Text Label 10450 7150 2    60   ~ 0
C9
Text Label 10450 7250 2    60   ~ 0
CL
Text Label 10450 7350 2    60   ~ 0
CR
Text Notes 10350 5950 0    60   ~ 0
TUBE HEADERS
Text Label 2200 9200 2    60   ~ 0
C8
Text Label 2200 9300 2    60   ~ 0
C9
Text Label 2200 9900 2    60   ~ 0
C2
Text Label 3950 9600 0    60   ~ 0
GND
Text Label 3950 9500 0    60   ~ 0
C4
Text Label 3950 9400 0    60   ~ 0
C5
Text Label 3950 9300 0    60   ~ 0
C1
Text Label 3950 9200 0    60   ~ 0
C0
Text Label 3950 9700 0    60   ~ 0
C6
Text Label 3950 9800 0    60   ~ 0
C7
Text Label 3950 9900 0    60   ~ 0
C3
Text Label 3000 8800 0    60   ~ 0
GND
Text Label 11200 2850 0    60   ~ 0
GND
Text Label 4900 3400 2    60   ~ 0
GND
Text Label 6150 8750 2    60   ~ 0
CL
Text Label 7900 8750 2    60   ~ 0
CR
Text GLabel 12550 5600 0    60   Input ~ 0
GND
Text Label 13600 5600 0    60   ~ 0
GND
Text Label 6300 9450 0    60   ~ 0
CLC
Text Label 8050 9450 0    60   ~ 0
CRC
Text Label 10050 9500 2    60   ~ 0
AE0
Text Label 11150 9500 2    60   ~ 0
AE1
Text Label 12250 9500 2    60   ~ 0
AE2
Text Label 13350 9500 2    60   ~ 0
AE3
Text Label 14450 9500 2    60   ~ 0
AE4
Text Label 15550 9500 2    60   ~ 0
AE5
$Comp
L CONN_2 P7
U 1 1 54BF4AA2
P 3100 4650
F 0 "P7" V 3050 4650 40  0000 C CNN
F 1 "SERIAL" V 3150 4650 40  0000 C CNN
F 2 "" H 3100 4650 60  0000 C CNN
F 3 "" H 3100 4650 60  0000 C CNN
	1    3100 4650
	1    0    0    -1  
$EndComp
Text Label 2550 4750 2    60   ~ 0
TXD
Text Label 2550 4550 2    60   ~ 0
RXD
$Comp
L CONN_2 P8
U 1 1 54BF4CEC
P 3100 5050
F 0 "P8" V 3050 5050 40  0000 C CNN
F 1 "I2C" V 3150 5050 40  0000 C CNN
F 2 "" H 3100 5050 60  0000 C CNN
F 3 "" H 3100 5050 60  0000 C CNN
	1    3100 5050
	1    0    0    -1  
$EndComp
Text Label 2550 4950 2    60   ~ 0
SDA
Text Label 2550 5150 2    60   ~ 0
SCL
$Comp
L CONN_2 P4
U 1 1 54BF50DA
P 15300 4550
F 0 "P4" V 15250 4550 40  0000 C CNN
F 1 "5V" V 15350 4550 40  0000 C CNN
F 2 "" H 15300 4550 60  0000 C CNN
F 3 "" H 15300 4550 60  0000 C CNN
	1    15300 4550
	1    0    0    -1  
$EndComp
Text Label 14700 4450 2    60   ~ 0
GND
Text Label 14700 4650 2    60   ~ 0
VCC
$Comp
L CONN_2 P11
U 1 1 54BF53A3
P 15300 5050
F 0 "P11" V 15250 5050 40  0000 C CNN
F 1 "5V" V 15350 5050 40  0000 C CNN
F 2 "" H 15300 5050 60  0000 C CNN
F 3 "" H 15300 5050 60  0000 C CNN
	1    15300 5050
	1    0    0    -1  
$EndComp
Text Label 14700 4950 2    60   ~ 0
GND
Text Label 14700 5150 2    60   ~ 0
VCC
$Comp
L CONN_2 P12
U 1 1 54BF53B3
P 15300 5550
F 0 "P12" V 15250 5550 40  0000 C CNN
F 1 "5V" V 15350 5550 40  0000 C CNN
F 2 "" H 15300 5550 60  0000 C CNN
F 3 "" H 15300 5550 60  0000 C CNN
	1    15300 5550
	1    0    0    -1  
$EndComp
Text Label 14700 5450 2    60   ~ 0
GND
Text Label 14700 5650 2    60   ~ 0
VCC
Text Notes 14600 4250 0    60   ~ 0
POWER OUTPUT
$Comp
L CONN_2 P13
U 1 1 54BF544D
P 8450 6200
F 0 "P13" V 8400 6200 40  0000 C CNN
F 1 "ADC" V 8500 6200 40  0000 C CNN
F 2 "" H 8450 6200 60  0000 C CNN
F 3 "" H 8450 6200 60  0000 C CNN
	1    8450 6200
	1    0    0    1   
$EndComp
Text Label 5700 1950 2    60   ~ 0
BUZ+
Text Label 5700 2250 2    60   ~ 0
BUZ-
$Comp
L R R5
U 1 1 54EC1E92
P 5100 2950
F 0 "R5" V 5180 2950 40  0000 C CNN
F 1 "10k" V 5107 2951 40  0000 C CNN
F 2 "~" V 5030 2950 30  0000 C CNN
F 3 "~" H 5100 2950 30  0000 C CNN
	1    5100 2950
	1    0    0    -1  
$EndComp
Text Notes 14050 850  0    60   ~ 0
REVISION NOTES V2 2015-03-19\n(A) R21-R26 WERE 8K2
Text Notes 9850 9850 0    60   ~ 0
(A)
Text Notes 14050 1300 0    60   ~ 0
REVISION NOTES V2.1 2015-04-05\n(B) BIT0-3 LABELS INVERTED.\n         CIRCUIT UNCHANGED.
Text Notes 3700 3650 0    60   ~ 0
(B)
Text Notes 1800 9600 0    60   ~ 0
(B)
Wire Wire Line
	5700 2250 5700 2350
Wire Wire Line
	3000 8800 2750 8800
Wire Wire Line
	3350 1700 3450 1700
Wire Wire Line
	5200 9700 5500 9700
Wire Wire Line
	5800 9700 6000 9700
Wire Wire Line
	6300 9900 6300 10250
Wire Wire Line
	12500 3050 12300 3050
Wire Wire Line
	3450 1600 3350 1600
Wire Wire Line
	3450 2000 3350 2000
Wire Wire Line
	3450 1800 3350 1800
Wire Wire Line
	3050 6000 2950 6000
Wire Wire Line
	3350 3400 3450 3400
Wire Wire Line
	3450 2850 3350 2850
Wire Wire Line
	3350 2750 3450 2750
Wire Wire Line
	3350 2550 3450 2550
Wire Wire Line
	3350 2350 3450 2350
Wire Wire Line
	3450 2650 3350 2650
Wire Wire Line
	3450 2450 3350 2450
Wire Wire Line
	3450 3600 3350 3600
Wire Wire Line
	3450 3800 3350 3800
Wire Wire Line
	1250 1800 1450 1800
Wire Wire Line
	4150 2150 4150 2450
Wire Wire Line
	2500 9400 2200 9400
Wire Wire Line
	2500 9700 2200 9700
Wire Wire Line
	2200 9900 2500 9900
Wire Wire Line
	2500 9200 2200 9200
Wire Wire Line
	2200 9800 2500 9800
Wire Wire Line
	2200 9500 2500 9500
Wire Wire Line
	4150 2750 4150 2950
Wire Wire Line
	3350 3500 3450 3500
Wire Wire Line
	3350 3700 3450 3700
Wire Wire Line
	3450 3300 3350 3300
Wire Wire Line
	2950 6100 3050 6100
Wire Wire Line
	3350 1900 3450 1900
Wire Wire Line
	3350 1500 3450 1500
Wire Wire Line
	12500 2800 12300 2800
Wire Wire Line
	6300 9300 6300 9500
Wire Wire Line
	6150 8750 6300 8750
Wire Wire Line
	6300 8750 6300 9000
Wire Wire Line
	8050 8750 8050 9000
Wire Wire Line
	8050 8750 7900 8750
Wire Wire Line
	8050 9300 8050 9500
Wire Wire Line
	8050 10250 8050 9900
Wire Wire Line
	7550 9700 7750 9700
Wire Wire Line
	6950 9700 7250 9700
Wire Wire Line
	4900 2550 5400 2550
Wire Wire Line
	2350 8800 2250 8800
Wire Wire Line
	2250 8800 2250 9200
Connection ~ 2250 9200
Wire Wire Line
	5700 3400 4900 3400
Wire Wire Line
	5700 2750 5700 3400
Wire Wire Line
	4150 2950 3350 2950
Wire Wire Line
	950  1500 1450 1500
Wire Wire Line
	1450 1600 1250 1600
Connection ~ 1250 1600
Connection ~ 1250 1500
Wire Wire Line
	1250 2100 1450 2100
Connection ~ 1250 1800
Wire Wire Line
	3350 2100 3450 2100
Wire Wire Line
	3350 2200 3450 2200
Wire Wire Line
	1450 3600 1300 3600
Wire Wire Line
	1450 3700 1300 3700
Connection ~ 1300 3700
Wire Wire Line
	1450 3800 1300 3800
Connection ~ 1300 3800
Wire Wire Line
	4750 4550 5150 4550
Wire Wire Line
	4750 4650 5150 4650
Wire Wire Line
	4750 4450 5150 4450
Wire Wire Line
	4750 4750 5150 4750
Wire Wire Line
	5450 1700 5100 1700
Wire Wire Line
	5950 1700 6200 1700
Wire Wire Line
	5700 1800 5700 2050
Wire Wire Line
	5100 4650 5100 4900
Connection ~ 5100 4650
Wire Wire Line
	4900 4550 4900 4900
Connection ~ 4900 4550
Wire Wire Line
	5100 5200 5100 5450
Wire Wire Line
	5100 5450 4600 5450
Wire Wire Line
	4900 5200 4900 5450
Connection ~ 4900 5450
Wire Wire Line
	1250 2100 1250 1500
Wire Wire Line
	3700 3100 3350 3100
Wire Wire Line
	3350 3200 3700 3200
Wire Wire Line
	3850 6200 3750 6200
Wire Wire Line
	3750 6100 3850 6100
Wire Wire Line
	3850 6000 3750 6000
Wire Wire Line
	2950 6200 3050 6200
Wire Wire Line
	1950 6500 1000 6500
Connection ~ 1250 6500
Wire Wire Line
	1300 5950 1250 5950
Wire Wire Line
	1250 5950 1250 6050
Wire Wire Line
	1900 5950 1950 5950
Wire Wire Line
	1950 5950 1950 6050
Wire Wire Line
	1250 6350 1250 6500
Wire Wire Line
	1950 6350 1950 6500
Wire Wire Line
	5700 2050 6100 2050
Wire Wire Line
	5700 2250 6100 2250
Wire Wire Line
	14100 4550 14100 4850
Wire Wire Line
	12900 4650 14100 4650
Wire Wire Line
	12900 4550 13600 4550
Wire Wire Line
	13900 4550 14100 4550
Connection ~ 14100 4650
Wire Wire Line
	14100 5150 14100 5600
Wire Wire Line
	14100 5600 12550 5600
Wire Wire Line
	13300 4450 12900 4450
Wire Wire Line
	13350 4550 13350 5050
Connection ~ 13350 4550
Wire Wire Line
	13050 4450 13050 5050
Connection ~ 13050 4450
Wire Wire Line
	13050 5350 13050 5600
Connection ~ 13050 5600
Wire Wire Line
	13350 5350 13350 5600
Connection ~ 13350 5600
Wire Wire Line
	1050 1500 1050 1700
Connection ~ 1050 1500
Wire Wire Line
	1050 2000 1050 2300
Wire Wire Line
	1050 2300 1200 2300
Wire Wire Line
	11200 2650 10900 2650
Wire Wire Line
	10900 2850 11200 2850
Wire Wire Line
	1450 2850 1200 2850
Wire Wire Line
	1200 2950 1450 2950
Wire Wire Line
	1300 3600 1300 4000
Wire Wire Line
	6750 6100 8100 6100
Connection ~ 6950 6100
Wire Wire Line
	6950 5400 6950 5600
Wire Wire Line
	7350 6300 8100 6300
Wire Wire Line
	7550 5900 7550 6500
Wire Wire Line
	7550 6800 7550 7050
Wire Wire Line
	6950 7050 7700 7050
Connection ~ 7550 6300
Wire Wire Line
	7550 5400 7550 5600
Connection ~ 7550 7050
Connection ~ 7550 5400
Wire Wire Line
	7750 3600 7550 3600
Wire Wire Line
	7850 3350 7850 3150
Wire Wire Line
	7850 3850 7850 4050
Wire Wire Line
	8400 3600 8200 3600
Wire Wire Line
	8500 3350 8500 3150
Wire Wire Line
	8500 3850 8500 4050
Wire Wire Line
	7600 3050 7600 3250
Wire Wire Line
	7600 3250 7850 3250
Connection ~ 7850 3250
Wire Wire Line
	7600 2500 7600 2750
Wire Wire Line
	7450 2500 8250 2500
Wire Wire Line
	8250 3250 8500 3250
Wire Wire Line
	8250 3050 8250 3250
Connection ~ 8500 3250
Wire Wire Line
	8250 2500 8250 2750
Connection ~ 7600 2500
Wire Wire Line
	10050 9000 10050 8450
Wire Wire Line
	9650 8450 9650 8700
Connection ~ 9650 8450
Wire Wire Line
	9650 9000 9650 9300
Wire Wire Line
	9650 9200 9750 9200
Connection ~ 9650 9200
Wire Wire Line
	9650 9700 9650 10050
Wire Wire Line
	9650 10350 9650 10550
Wire Wire Line
	15150 10550 9350 10550
Wire Wire Line
	9250 8450 15550 8450
Wire Wire Line
	9350 9500 9250 9500
Wire Wire Line
	10050 9950 10050 10150
Wire Wire Line
	10050 9400 10050 9650
Wire Wire Line
	11150 8450 11150 9000
Wire Wire Line
	10750 8450 10750 8700
Wire Wire Line
	10750 9000 10750 9300
Wire Wire Line
	10750 9200 10850 9200
Connection ~ 10750 9200
Wire Wire Line
	10750 9700 10750 10050
Wire Wire Line
	10750 10350 10750 10550
Wire Wire Line
	10450 9500 10350 9500
Wire Wire Line
	11150 9950 11150 10150
Wire Wire Line
	11150 9400 11150 9650
Connection ~ 10050 8450
Connection ~ 10750 8450
Connection ~ 9650 10550
Wire Wire Line
	12250 9000 12250 8450
Wire Wire Line
	11850 8450 11850 8700
Wire Wire Line
	11850 9000 11850 9300
Wire Wire Line
	11850 9200 11950 9200
Connection ~ 11850 9200
Wire Wire Line
	11850 9700 11850 10050
Wire Wire Line
	11850 10350 11850 10550
Wire Wire Line
	11550 9500 11450 9500
Wire Wire Line
	12250 9950 12250 10150
Wire Wire Line
	12250 9400 12250 9650
Wire Wire Line
	13350 8450 13350 9000
Wire Wire Line
	12950 8450 12950 8700
Wire Wire Line
	12950 9000 12950 9300
Wire Wire Line
	12950 9200 13050 9200
Connection ~ 12950 9200
Wire Wire Line
	12950 9700 12950 10050
Wire Wire Line
	12950 10350 12950 10550
Wire Wire Line
	12650 9500 12550 9500
Wire Wire Line
	13350 9950 13350 10150
Wire Wire Line
	13350 9400 13350 9650
Connection ~ 11150 8450
Connection ~ 12950 8450
Connection ~ 12250 8450
Connection ~ 11850 8450
Connection ~ 10750 10550
Connection ~ 11850 10550
Wire Wire Line
	14450 9000 14450 8450
Wire Wire Line
	14050 8450 14050 8700
Wire Wire Line
	14050 9000 14050 9300
Wire Wire Line
	14050 9200 14150 9200
Connection ~ 14050 9200
Wire Wire Line
	14050 9700 14050 10050
Wire Wire Line
	14050 10350 14050 10550
Wire Wire Line
	13750 9500 13650 9500
Wire Wire Line
	14450 9950 14450 10150
Wire Wire Line
	14450 9400 14450 9650
Wire Wire Line
	15550 8450 15550 9000
Wire Wire Line
	15150 8450 15150 8700
Wire Wire Line
	15150 9000 15150 9300
Wire Wire Line
	15150 9200 15250 9200
Connection ~ 15150 9200
Wire Wire Line
	15150 9700 15150 10050
Wire Wire Line
	15150 10350 15150 10550
Wire Wire Line
	14850 9500 14750 9500
Wire Wire Line
	15550 9950 15550 10150
Wire Wire Line
	15550 9400 15550 9650
Connection ~ 13350 8450
Connection ~ 12950 10550
Connection ~ 14050 10550
Connection ~ 15150 8450
Connection ~ 14450 8450
Connection ~ 14050 8450
Wire Wire Line
	9700 6850 9500 6850
Wire Wire Line
	9700 6950 9500 6950
Wire Wire Line
	9700 7050 9500 7050
Wire Wire Line
	9700 7150 9500 7150
Wire Wire Line
	9700 7250 9500 7250
Wire Wire Line
	9700 7350 9500 7350
Wire Wire Line
	10600 6250 10450 6250
Wire Wire Line
	10600 6350 10450 6350
Wire Wire Line
	10600 6450 10450 6450
Wire Wire Line
	10450 6550 10600 6550
Wire Wire Line
	10600 6650 10450 6650
Wire Wire Line
	10450 6750 10600 6750
Wire Wire Line
	10600 6850 10450 6850
Wire Wire Line
	10450 6950 10600 6950
Wire Wire Line
	10600 7050 10450 7050
Wire Wire Line
	10450 7150 10600 7150
Wire Wire Line
	10600 7250 10450 7250
Wire Wire Line
	10450 7350 10600 7350
Wire Wire Line
	2200 9300 2500 9300
Wire Wire Line
	2200 9600 2500 9600
Wire Wire Line
	3700 9600 3950 9600
Wire Wire Line
	3700 9500 3950 9500
Wire Wire Line
	3700 9400 3950 9400
Wire Wire Line
	3700 9300 3950 9300
Wire Wire Line
	3700 9200 3950 9200
Wire Wire Line
	3700 9700 3950 9700
Wire Wire Line
	3700 9800 3950 9800
Wire Wire Line
	3700 9900 3950 9900
Wire Wire Line
	6950 6700 6950 7050
Wire Wire Line
	2750 4550 2550 4550
Wire Wire Line
	2750 4750 2550 4750
Wire Wire Line
	2750 4950 2550 4950
Wire Wire Line
	2750 5150 2550 5150
Wire Wire Line
	14950 4450 14700 4450
Wire Wire Line
	14700 4650 14950 4650
Wire Wire Line
	14950 4950 14700 4950
Wire Wire Line
	14700 5150 14950 5150
Wire Wire Line
	14950 5450 14700 5450
Wire Wire Line
	14700 5650 14950 5650
Wire Wire Line
	6950 5400 7700 5400
Wire Wire Line
	6950 5900 6950 6400
Wire Wire Line
	5100 2550 5100 2800
Connection ~ 5100 2550
Wire Wire Line
	5100 3100 5100 3400
Connection ~ 5100 3400
Text Notes 14050 1600 0    60   ~ 0
REVISION NOTES 03 2017-10-03\n(C) UPDATE TO NEW SYMBOL LIBRARIES
$EndSCHEMATC
