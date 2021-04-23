EESchema Schematic File Version 4
LIBS:nixieclockboard-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "NIXIEBOARD"
Date "2017-10-03"
Rev "03"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 3100 1750 0    60   ~ 0
OPERATING FREQ 20-30kHz\nSUBSTITUTE R205 & C203 AS REQUIRED
Text Notes 1600 5600 0    60   ~ 0
ADJUSTMENT:\nThe nixie segments require high voltage to start glowing (for these tubes at least\n160V) and less voltage to run at the correct current (hence the anode resistors).\nThe ideal operating voltage is the minimum required such that all segments\nin all tubes strike reliably.\nWhen operating, enable test mode by holding down the timezone button\nwhile switching on power. This cycles through all the segments in all the\ntubes to assist with adjustment. Adjust Vout down until a segment begins\nto only partially glow, then up a little until the troublesome segment glows reliably.
Text Notes 1650 6300 0    60   ~ 0
FOR 12V INPUT, OUTPUT ADJUSTABLE BETWEEN c. 100V and 200V\n1. CENTER POT BEFORE ASSEMBLY (500ohm pins 1-2 or 2-3)\n2. ADJUST UNDER TEST TO Vout = 170-180V
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
L Device:CP1 C9
U 1 1 4DE4DB6D
P 1950 3000
AR Path="/4DE4DB6D" Ref="C9"  Part="1" 
AR Path="/4DE4A3C9/4DE4DB6D" Ref="C9"  Part="1" 
F 0 "C9" H 2000 3100 50  0000 L CNN
F 1 "10u" H 2000 2900 50  0000 L CNN
F 2 "" H 1950 3000 60  0001 C CNN
F 3 "" H 1950 3000 60  0001 C CNN
	1    1950 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 4DE4C610
P 2500 3800
AR Path="/4DE4C610" Ref="C10"  Part="1" 
AR Path="/4DE4A3C9/4DE4C610" Ref="C10"  Part="1" 
F 0 "C10" H 2550 3900 50  0000 L CNN
F 1 "100p" H 2550 3700 50  0000 L CNN
F 2 "" H 2500 3800 60  0001 C CNN
F 3 "" H 2500 3800 60  0001 C CNN
	1    2500 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R37
U 1 1 4DE4C60C
P 2500 3200
AR Path="/4DE4C60C" Ref="R37"  Part="1" 
AR Path="/4DE4A3C9/4DE4C60C" Ref="R37"  Part="1" 
F 0 "R37" V 2580 3200 50  0000 C CNN
F 1 "2k2" V 2500 3200 50  0000 C CNN
F 2 "" H 2500 3200 60  0001 C CNN
F 3 "" H 2500 3200 60  0001 C CNN
	1    2500 3200
	1    0    0    -1  
$EndComp
$Comp
L nixieclockboard-rescue:MOSFET_N Q16
U 1 1 4DE4C5DB
P 3050 2900
F 0 "Q16" H 3060 3070 60  0000 R CNN
F 1 "IRF740" H 3060 2750 60  0000 R CNN
F 2 "" H 3050 2900 60  0001 C CNN
F 3 "" H 3050 2900 60  0001 C CNN
	1    3050 2900
	-1   0    0    -1  
$EndComp
Text HLabel 1300 1800 1    60   Input ~ 0
VOUT
$Comp
L nixieclockboard-rescue:DIODE D2
U 1 1 4DE4C58A
P 2450 2050
F 0 "D2" H 2450 2150 40  0000 C CNN
F 1 "UF4004" H 2450 1950 40  0000 C CNN
F 2 "" H 2450 2050 60  0001 C CNN
F 3 "" H 2450 2050 60  0001 C CNN
	1    2450 2050
	-1   0    0    1   
$EndComp
$Comp
L nixieclockboard-rescue:INDUCTOR L1
U 1 1 4DE4C57D
P 4350 2050
F 0 "L1" V 4300 2050 40  0000 C CNN
F 1 "100uH" V 4450 2050 40  0000 C CNN
F 2 "" H 4350 2050 60  0001 C CNN
F 3 "" H 4350 2050 60  0001 C CNN
	1    4350 2050
	0    1    1    0   
$EndComp
$Comp
L Device:CP1 C8
U 1 1 4DE4C547
P 6150 2850
AR Path="/4DE4C547" Ref="C8"  Part="1" 
AR Path="/4DE4A3C9/4DE4C547" Ref="C8"  Part="1" 
F 0 "C8" H 6200 2950 50  0000 L CNN
F 1 "330u" H 6200 2750 50  0000 L CNN
F 2 "" H 6150 2850 60  0001 C CNN
F 3 "" H 6150 2850 60  0001 C CNN
	1    6150 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 4DE4C52B
P 5050 4000
AR Path="/4DE4C52B" Ref="C11"  Part="1" 
AR Path="/4DE4A3C9/4DE4C52B" Ref="C11"  Part="1" 
F 0 "C11" H 5100 4100 50  0000 L CNN
F 1 "2n2" H 5100 3900 50  0000 L CNN
F 2 "" H 5050 4000 60  0001 C CNN
F 3 "" H 5050 4000 60  0001 C CNN
	1    5050 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R38
U 1 1 4DE4C4E1
P 1300 4050
AR Path="/4DE4C4E1" Ref="R38"  Part="1" 
AR Path="/4DE4A3C9/4DE4C4E1" Ref="R38"  Part="1" 
F 0 "R38" V 1380 4050 50  0000 C CNN
F 1 "470" V 1300 4050 50  0000 C CNN
F 2 "" H 1300 4050 60  0001 C CNN
F 3 "" H 1300 4050 60  0001 C CNN
	1    1300 4050
	1    0    0    -1  
$EndComp
$Comp
L nixieclockboard-rescue:POT RV1
U 1 1 4DE4C4DD
P 1300 3450
AR Path="/4DE4C4DD" Ref="RV1"  Part="1" 
AR Path="/4DE4A3C9/4DE4C4DD" Ref="RV1"  Part="1" 
F 0 "RV1" V 1200 3450 50  0000 C CNN
F 1 "1k" V 1300 3450 50  0000 C CNN
F 2 "" H 1300 3450 60  0001 C CNN
F 3 "" H 1300 3450 60  0001 C CNN
	1    1300 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R35
U 1 1 4DE4C4D7
P 1300 2850
AR Path="/4DE4C4D7" Ref="R35"  Part="1" 
AR Path="/4DE4A3C9/4DE4C4D7" Ref="R35"  Part="1" 
F 0 "R35" V 1380 2850 50  0000 C CNN
F 1 "220k" V 1300 2850 50  0000 C CNN
F 2 "" H 1300 2850 60  0001 C CNN
F 3 "" H 1300 2850 60  0001 C CNN
	1    1300 2850
	1    0    0    -1  
$EndComp
$Comp
L nixieclockboard-rescue:NPN Q17
U 1 1 4DE4C4AF
P 5650 3900
F 0 "Q17" H 5650 3750 50  0000 R CNN
F 1 "BC547" H 5650 4050 50  0000 R CNN
F 2 "" H 5650 3900 60  0001 C CNN
F 3 "" H 5650 3900 60  0001 C CNN
	1    5650 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R34
U 1 1 4DE4C492
P 5750 2450
AR Path="/4DE4C492" Ref="R34"  Part="1" 
AR Path="/4DE4A3C9/4DE4C492" Ref="R34"  Part="1" 
F 0 "R34" V 5830 2450 50  0000 C CNN
F 1 "56k" V 5750 2450 50  0000 C CNN
F 2 "" H 5750 2450 60  0001 C CNN
F 3 "" H 5750 2450 60  0001 C CNN
	1    5750 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R36
U 1 1 4DE4C448
P 5450 3100
AR Path="/4DE4C448" Ref="R36"  Part="1" 
AR Path="/4DE4A3C9/4DE4C448" Ref="R36"  Part="1" 
F 0 "R36" V 5530 3100 50  0000 C CNN
F 1 "10k" V 5450 3100 50  0000 C CNN
F 2 "" H 5450 3100 60  0001 C CNN
F 3 "" H 5450 3100 60  0001 C CNN
	1    5450 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R33
U 1 1 4DE4C442
P 5450 2450
AR Path="/4DE4C442" Ref="R33"  Part="1" 
AR Path="/4DE4A3C9/4DE4C442" Ref="R33"  Part="1" 
F 0 "R33" V 5530 2450 50  0000 C CNN
F 1 "1k" V 5450 2450 50  0000 C CNN
F 2 "" H 5450 2450 60  0001 C CNN
F 3 "" H 5450 2450 60  0001 C CNN
	1    5450 2450
	1    0    0    -1  
$EndComp
$Comp
L nixieclockboard-rescue:555 U3
U 1 1 4DE4C405
P 3750 3200
F 0 "U3" H 4350 3850 60  0000 C CNN
F 1 "555" H 4350 3250 60  0000 C CNN
F 2 "" H 3750 3200 60  0001 C CNN
F 3 "" H 3750 3200 60  0001 C CNN
	1    3750 3200
	1    0    0    -1  
$EndComp
Text HLabel 5150 1850 1    60   Input ~ 0
VIN
Text GLabel 1150 4350 0    60   Input ~ 0
GND
Connection ~ 1950 4350
Wire Wire Line
	1950 3150 1950 4350
Wire Wire Line
	2500 3350 2500 3650
Wire Wire Line
	2500 2500 2500 3050
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
	6150 2050 6150 2700
Wire Wire Line
	5050 3850 5050 2900
Connection ~ 5750 3000
Wire Wire Line
	4900 3000 5750 3000
Wire Wire Line
	1300 3600 1300 3900
Connection ~ 3500 4350
Wire Wire Line
	5750 4350 5750 4100
Wire Wire Line
	5750 2600 5750 3700
Connection ~ 5450 2050
Wire Wire Line
	5750 2050 5750 2300
Wire Wire Line
	3750 2800 3600 2800
Wire Wire Line
	3600 2800 3600 3550
Wire Wire Line
	3600 3550 5450 3550
Wire Wire Line
	5450 3550 5450 3250
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
	5450 2600 5450 2950
Wire Wire Line
	5450 2050 5450 2300
Connection ~ 5150 2050
Wire Wire Line
	3750 2900 3250 2900
Wire Wire Line
	3500 2700 3500 4350
Wire Wire Line
	1300 4200 1300 4350
Connection ~ 1300 4350
Wire Wire Line
	1300 3000 1300 3300
Wire Wire Line
	1450 3450 1750 3450
Wire Wire Line
	1750 3450 1750 3900
Wire Wire Line
	5050 2900 4900 2900
Connection ~ 5050 3550
Wire Wire Line
	5050 4150 5050 4350
Connection ~ 5050 4350
Wire Wire Line
	6150 3000 6150 4350
Connection ~ 5750 4350
Wire Wire Line
	6150 4350 1150 4350
Wire Wire Line
	6150 2050 4650 2050
Wire Wire Line
	2650 2050 4050 2050
Wire Wire Line
	1300 1800 1300 2700
Connection ~ 1300 2050
Wire Wire Line
	2950 3100 2950 4350
Connection ~ 2950 4350
Wire Wire Line
	2500 3950 2500 4350
Connection ~ 2500 4350
Connection ~ 1950 2050
Wire Wire Line
	1950 2050 1950 2850
Text Notes 9100 1150 0    60   ~ 0
REVISION NOTES 03 2017-10-03\n(A) UPDATED SYMBOLS TO NEW LIBRARY
$EndSCHEMATC
