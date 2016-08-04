@NTHTHA012 JCBBLA001
	.syntax unified
	.cpu cortex-m0
	.thumb
	.global _start

vectors:
	.word 0x20002000
	.word _start + 1

_start:
	@ enable peripheral
	LDR R1, CLCK
	LDR R2, [R1, #0x14]
	LDR R3, CLCK1
	ORRS R2, R2, R3
	STR R2, [R4, #0x14]

	@ configure relevant pins to be outputs
	LDR R1, LEDS
	LDR R2, [R1]
	LDR R3, LDS
	ORRS R2, R2, R3
	STR R1, [R1]
	
all_off:
	@ turn all LEDs off
	MOVS R4, #0
	STR R4, [R1, #0x14]

display_AA:
	@ display the pattern 0xAA on the LEDs
	MOVS R4, #0xAA
	STR R4, [R1, #0x14]
	
all_on:
	@ turn all LEDs on
	MOVS R4, #0xFF
	STR R4, [R1, #0x14]
   
display_55:
	@ display the pattern 0x55 on the LEDs
	MOVS R4, #0x55
	STR R4, [R1, #0x14]
	
bonus:
	@ If push button SW1 is held down, change the
	@ LED pattern to 0x0A.
	@ Or else, do not alter it.

end: B all_off
	

	.align
@LEDs and ports activation
CLCK: .word 0x40021000
CLCK1: .word 0x060000
LEDS: .word 0x48000400
LDS: .word 0x5555


   

