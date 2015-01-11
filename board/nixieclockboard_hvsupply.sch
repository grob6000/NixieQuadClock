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
LIBS:special
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
LIBS:kicad_george
LIBS:nixieclockboard-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 8
Title ""
Date "11 jan 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 3100 1750 0    60   ~ 0
OPERATING FREQ 20-30kHz\nSUBSTITUTE R205 & C203 AS REQUIRED
Text Notes 1700 4950 0    60   ~ 0
ADJUSTMENT:\nThe nixie segments require high voltage to start glowing (for these tubes at least\n160V) and less voltage to run at the correct current (hence the anode resistors).\nThe ideal operating voltage is the minimum required such that all segments\nin all tubes strike reliably.\nWhen operating, enable test mode by holding down the timezone button\nwhile switching on power. This cycles through all the segments in all the\ntubes to assist with adjustment. Adjust Vout down until a segment begins\nto only partially glow, then up a little until the troublesome segment glows reliably.
Text Notes 1700 4600 0    60   ~ 0
FOR 12V INPUT, OUTPUT ADJUSTABLE BETWEEN c. 100V and 200V\n1. CENTER POT BEFORE ASSEMBLY (500ohm pins 1-2 or 2-3)\n2. ADJUST UNDER TEST TO Vout = 170-180V
Connection ~ 1950 4350
Wire Wire Line
	1950 3200 1950 4350
Wire Wire Line
	2500 3450 2500 3550
Wire Wire Line
	2500 2950 2500 2500
Connection ~ 2950 2500
Wire Wire Line
	2500 2500 2950 2500
Connection ~ 2950 2050
Wire Wire Line
	2950 2700 2950 2050
Wire Wire Line
	1300 2050 2250 2050
Wire Wire Line
	5450 3900 1750 3900
Connection ~ 5750 2050
Wire Wire Line
	6150 2650 6150 2050
Wire Wire Line
	5050 3850 5050 2900
Connection ~ 5750 3000
Wire Wire Line
	4900 3000 5750 3000
Wire Wire Line
	1300 3800 1300 3700
Connection ~ 3500 4350
Wire Wire Line
	5750 4350 5750 4100
Wire Wire Line
	5750 3700 5750 2700
Connection ~ 5450 2050
Wire Wire Line
	5750 2050 5750 2200
Wire Wire Line
	3750 2800 3600 2800
Wire Wire Line
	3600 2800 3600 3550
Wire Wire Line
	3600 3550 5450 3550
Wire Wire Line
	5450 3550 5450 3400
Connection ~ 5450 2800
Wire Wire Line
	4900 2800 5450 2800
Connection ~ 5150 2700
Wire Wire Line
	3750 3000 3700 3000
Wire Wire Line
	3700 3000 3700 3300
Wire Wire Line
	3700 3300 5150 3300
Wire Wire Line
	5150 3300 5150 1850
Wire Wire Line
	3750 2700 3500 2700
Wire Wire Line
	5150 2700 4900 2700
Wire Wire Line
	5450 2700 5450 2900
Wire Wire Line
	5450 2050 5450 2200
Connection ~ 5150 2050
Wire Wire Line
	3750 2900 3250 2900
Wire Wire Line
	3500 2700 3500 4350
Wire Wire Line
	1300 4350 1300 4300
Connection ~ 1300 4350
Wire Wire Line
	1300 3200 1300 3100
Wire Wire Line
	1450 3450 1750 3450
Wire Wire Line
	1750 3450 1750 3900
Wire Wire Line
	5050 2900 4900 2900
Connection ~ 5050 3550
Wire Wire Line
	5050 4250 5050 4350
Connection ~ 5050 4350
Wire Wire Line
	6150 3050 6150 4350
Connection ~ 5750 4350
Wire Wire Line
	6150 4350 1150 4350
Wire Wire Line
	6150 2050 4650 2050
Wire Wire Line
	2650 2050 4050 2050
Wire Wire Line
	1300 1800 1300 2600
Connection ~ 1300 2050
Wire Wire Line
	2950 3100 2950 4350
Connection ~ 2950 4350
Wire Wire Line
	2500 3950 2500 4350
Connection ~ 2500 4350
Wire Wire Line
	1950 2800 1950 2050
Connection ~ 1950 2050
Text Label 1300 3750 0    60   ~ 0
RVN
Text Label 1300 3150 0    60   ~ 0
RVP
Text Label 5250 2800 0    60   ~ 0
DIS
Text Label 5750 3500 0    60   ~ 0
NPNC
Text Label 3400 2900 1    60   ~ 0
OSC
Text Label 4250 3550 0    60   ~ 0
TRG
Text Label 3750 3900 0    60   ~ 0
FB
Text Label 2500 3500 0    60   ~ 0
RCFIL
Text Label 3250 2050 0    60   ~ 0
VPUMP
$Comp
L CP1 C?
U 1 1 4DE4DB6D
P 1950 3000
F 0 "C?" H 2000 3100 50  0000 L CNN
F 1 "10u" H 2000 2900 50  0000 L CNN
F 2 "" H 1950 3000 60  0001 C CNN
F 3 "" H 1950 3000 60  0001 C CNN
	1    1950 3000
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 4DE4C610
P 2500 3750
F 0 "C?" H 2550 3850 50  0000 L CNN
F 1 "100p" H 2550 3650 50  0000 L CNN
F 2 "" H 2500 3750 60  0001 C CNN
F 3 "" H 2500 3750 60  0001 C CNN
	1    2500 3750
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 4DE4C60C
P 2500 3200
F 0 "R?" V 2580 3200 50  0000 C CNN
F 1 "2k2" V 2500 3200 50  0000 C CNN
F 2 "" H 2500 3200 60  0001 C CNN
F 3 "" H 2500 3200 60  0001 C CNN
	1    2500 3200
	1    0    0    -1  
$EndComp
$Comp
L MOSFET_N Q?
U 1 1 4DE4C5DB
P 3050 2900
F 0 "Q?" H 3060 3070 60  0000 R CNN
F 1 "IRF740" H 3060 2750 60  0000 R CNN
F 2 "" H 3050 2900 60  0001 C CNN
F 3 "" H 3050 2900 60  0001 C CNN
	1    3050 2900
	-1   0    0    -1  
$EndComp
Text HLabel 1300 1800 1    60   Input ~ 0
VOUT
$Comp
L DIODE D?
U 1 1 4DE4C58A
P 2450 2050
F 0 "D?" H 2450 2150 40  0000 C CNN
F 1 "UF4004" H 2450 1950 40  0000 C CNN
F 2 "" H 2450 2050 60  0001 C CNN
F 3 "" H 2450 2050 60  0001 C CNN
	1    2450 2050
	-1   0    0    1   
$EndComp
$Comp
L INDUCTOR L?
U 1 1 4DE4C57D
P 4350 2050
F 0 "L?" V 4300 2050 40  0000 C CNN
F 1 "100uH" V 4450 2050 40  0000 C CNN
F 2 "" H 4350 2050 60  0001 C CNN
F 3 "" H 4350 2050 60  0001 C CNN
	1    4350 2050
	0    1    1    0   
$EndComp
$Comp
L CP1 C?
U 1 1 4DE4C547
P 6150 2850
F 0 "C?" H 6200 2950 50  0000 L CNN
F 1 "330u" H 6200 2750 50  0000 L CNN
F 2 "" H 6150 2850 60  0001 C CNN
F 3 "" H 6150 2850 60  0001 C CNN
	1    6150 2850
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 4DE4C52B
P 5050 4050
F 0 "C?" H 5100 4150 50  0000 L CNN
F 1 "2n2" H 5100 3950 50  0000 L CNN
F 2 "" H 5050 4050 60  0001 C CNN
F 3 "" H 5050 4050 60  0001 C CNN
	1    5050 4050
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 4DE4C4E1
P 1300 4050
F 0 "R?" V 1380 4050 50  0000 C CNN
F 1 "470" V 1300 4050 50  0000 C CNN
F 2 "" H 1300 4050 60  0001 C CNN
F 3 "" H 1300 4050 60  0001 C CNN
	1    1300 4050
	1    0    0    -1  
$EndComp
$Comp
L POT RV?
U 1 1 4DE4C4DD
P 1300 3450
F 0 "RV?" H 1300 3350 50  0000 C CNN
F 1 "1k" H 1300 3450 50  0000 C CNN
F 2 "" H 1300 3450 60  0001 C CNN
F 3 "" H 1300 3450 60  0001 C CNN
	1    1300 3450
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 4DE4C4D7
P 1300 2850
F 0 "R?" V 1380 2850 50  0000 C CNN
F 1 "220k" V 1300 2850 50  0000 C CNN
F 2 "" H 1300 2850 60  0001 C CNN
F 3 "" H 1300 2850 60  0001 C CNN
	1    1300 2850
	1    0    0    -1  
$EndComp
$Comp
L NPN Q?
U 1 1 4DE4C4AF
P 5650 3900
F 0 "Q?" H 5650 3750 50  0000 R CNN
F 1 "BC547" H 5650 4050 50  0000 R CNN
F 2 "" H 5650 3900 60  0001 C CNN
F 3 "" H 5650 3900 60  0001 C CNN
	1    5650 3900
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 4DE4C492
P 5750 2450
F 0 "R?" V 5830 2450 50  0000 C CNN
F 1 "56k" V 5750 2450 50  0000 C CNN
F 2 "" H 5750 2450 60  0001 C CNN
F 3 "" H 5750 2450 60  0001 C CNN
	1    5750 2450
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 4DE4C448
P 5450 3150
F 0 "R?" V 5530 3150 50  0000 C CNN
F 1 "10k" V 5450 3150 50  0000 C CNN
F 2 "" H 5450 3150 60  0001 C CNN
F 3 "" H 5450 3150 60  0001 C CNN
	1    5450 3150
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 4DE4C442
P 5450 2450
F 0 "R?" V 5530 2450 50  0000 C CNN
F 1 "1k" V 5450 2450 50  0000 C CNN
F 2 "" H 5450 2450 60  0001 C CNN
F 3 "" H 5450 2450 60  0001 C CNN
	1    5450 2450
	1    0    0    -1  
$EndComp
$Comp
L 555 U?
U 1 1 4DE4C405
P 3750 3200
F 0 "U?" H 4350 3850 60  0000 C CNN
F 1 "555" H 4350 3250 60  0000 C CNN
F 2 "" H 3750 3200 60  0001 C CNN
F 3 "" H 3750 3200 60  0001 C CNN
	1    3750 3200
	1    0    0    -1  
$EndComp
Text GLabel 1150 4350 0    60   Input ~ 0
GND
Text HLabel 5150 1850 1    60   Input ~ 0
VIN
$EndSCHEMATC
