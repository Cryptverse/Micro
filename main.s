@JCBBLA001 NTHTHA012
	.syntax unified
	.cpu cortex-m0
	.thumb
	.global _start

vectors:
	.word 0x20002000
	.word _start + 1

_start:
	@ enable peripheral
	@ configure relevant pins to be outputs
	
all_off:
	@ turn all LEDs off

display_AA:
	@ display the pattern 0xAA on the LEDs
	
all_on:
	@ turn all LEDs on
   
display_55:
	@ display the pattern 0x55 on the LEDs
	
bonus:
	@ If push button SW1 is held down, change the
	@ LED pattern to 0x0A.
	@ Or else, do not alter it.

end: B all_off

   

