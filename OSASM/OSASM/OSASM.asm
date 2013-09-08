/*
 * OSASM.asm
 *
 *  Created: 9/26/2012 8:08:06 AM
 *   Author: Casey
 */ 

.NOLIST
.INCLUDE	"m32def.inc"
.LIST

.EQU		LEDDR	=	DDRC
.EQU		LED		=	PORTC

.DEF		rmp		=	R16		; multipupose register

.dseg							; data segment: user RAM
.org		0x0060				; start of data memory

			SPP0:		.byte 2
			SPHP0:		.byte 1
			SPLP0:		.byte 1

			SPHP1:		.byte 1
			SPLP1:		.byte 1

			SPHP2:		.byte 1
			SPLP2:		.byte 1

			SPHP3:		.byte 1
			SPLP3:		.byte 1

			CPROCESS:	.byte 1

.cseg							; program segment: flash ROM
.org		0x0000				; vector table address (ref pg4)
	rjmp	INIT				; reset vector

.org		0x000E				; vector table address (ref pg4)
	rjmp	OC1AISR				; OC1 ISR vector jump

.org		0x002A				; first address in program memory

; Pads the stack for current process so that
; when it is first called the pops will not
; go above the new program counter
PADSTACK:
	
	ldi		r17,	0x00
	ldi		rmp,	0x00
	
	PADLOOP:
			push	rmp
			inc		r17
			cpi		r17,	33
			brne	PADLOOP	
				
	ret							; END PADSTACK
	
INIT:							; Initialization code

	; initialize stack for process 1
	ldi		rmp,	0x01
	out		SPH,	rmp
	sts		SPHP1,	rmp
	ldi		rmp,	0xFF
	out		SPL,	rmp
	sts		SPLP1,	rmp

	; Store address for process 1
	ldi		rmp,	LOW(P1)
	push	rmp
	ldi		rmp,	HIGH(P1)
	push	rmp
	
	; Pad the stack
	ldi		r17,	0x00
	ldi		rmp,	0x00
	
	PADLOOP1:
			push	rmp
			inc		r17
			cpi		r17,	33
			brne	PADLOOP1
	; End Pad the stack

	; Store new SP
	in		rmp,	SPH
	sts		SPHP1,	rmp
	in		rmp,	SPL
	sts		SPLP1,	rmp

	; initialize stack for process 2
	ldi		rmp,	0x02
	out		SPH,	rmp
	sts		SPHP2,	rmp
	ldi		rmp,	0x7F
	out		SPL,	rmp
	sts		SPLP2,	rmp

	; Store address for process 2
	ldi		rmp,	LOW(P2)
	push	rmp
	ldi		rmp,	HIGH(P2)
	push	rmp
	
	; Pad the stack
	ldi		r17,	0x00
	ldi		rmp,	0x00
	
	PADLOOP2:
			push	rmp
			inc		r17
			cpi		r17,	33
			brne	PADLOOP2
	; End Pad the stack

	; Store new SP
	in		rmp,	SPH
	sts		SPHP2,	rmp
	in		rmp,	SPL
	sts		SPLP2,	rmp

	; initialize stack for process 3
	ldi		rmp,	0x02
	out		SPH,	rmp
	sts		SPHP3,	rmp
	ldi		rmp,	0xFF
	out		SPL,	rmp
	sts		SPLP3,	rmp

	; Store address for process 3
	ldi		rmp,	LOW(P3)
	push	rmp
	ldi		rmp,	HIGH(P3)
	push	rmp

	; Pad the stack
	ldi		r17,	0x00
	ldi		rmp,	0x00
	
	PADLOOP3:
			push	rmp
			inc		r17
			cpi		r17,	33
			brne	PADLOOP3
	; End Pad the stack

	; Store new SP
	in		rmp,	SPH
	sts		SPHP3,	rmp
	in		rmp,	SPL
	sts		SPLP3,	rmp

	; initialize stack for process 0
	ldi		rmp,	0x01
	out		SPH,	rmp
	sts		SPHP0,	rmp
	ldi		rmp,	0x7F
	out		SPL,	rmp
	sts		SPLP0,	rmp

	; set starting process
	ldi		rmp,	0
	sts		CPROCESS,	rmp

	; LEDs all outputs
	ldi		rmp,	0xFF
	out		LEDDR,	rmp
	
	; Turn off all LEDs
	ldi		rmp,	0x00
	out		LED,	rmp	

	; Load 0x04E2 into compare register
	ldi		rmp,	0x04
	out		OCR1AH,	rmp
	ldi		rmp,	0xE2
	out		OCR1AL,	rmp

	; Enable OCR1A Interrupts
	in		rmp,	TIMSK
	ori		rmp,	1 << OCIE1A
	out		TIMSK,	rmp

	; Start counting at 0
	ldi		rmp,	0x00
	out		TCNT1H,	rmp
	out		TCNT1L,	rmp

	; Set Timmer 1 for CTC with prescaler of 256
	in		rmp,	TCCR1B
	ori		rmp,	(1 << WGM12) | (1 << CS12)
	out		TCCR1B,	rmp

	; Global Interrupts
	sei

	jmp		P0


OC1AISR:					; ISR code

	push	r0
	in		r0,		SREG
	push	r0
	push	r1
	push	r2
	push	r3
	push	r4
	push	r5
	push	r6
	push	r7
	push	r8
	push	r9
	push	r10
	push	r11
	push	r12
	push	r13
	push	r14
	push	r15
	push	r16
	push	r17
	push	r18
	push	r19
	push	r20
	push	r21
	push	r22
	push	r23
	push	r24
	push	r25
	push	r26
	push	r27
	push	r28
	push	r29
	push	r30
	push	r31

	; Increment Process Couter to determine next process
	lds		rmp,	CPROCESS	
	inc		rmp
	sts		CPROCESS,	rmp

	; Determine new process
	
	; Process 0?
	cpi		rmp,	0
	breq	top0
	
	; Process 1?
	cpi		rmp,	1
	breq	top1
	
	; Process 2?
	cpi		rmp,	2
	breq	top2
	
	; Process 3?
	cpi		rmp,	3
	breq	top3
	
	; Something broke
	jmp		fail
	
	; Store P3 stack and load P0
	TOP0:
		in		rmp,	SPH
		sts		SPHP3,	rmp
		in		rmp,	SPL
		sts		SPLP3,	rmp

		lds		rmp,	SPHP0
		out		SPH,	rmp
		lds		rmp,	SPLP0
		out		SPL,	rmp

		rjmp	nextProcess
	
	; Store P0 stack and load P1
	TOP1:
	
		in		rmp,	SPH
		sts		SPHP0,	rmp
		in		rmp,	SPL
		sts		SPLP0,	rmp

		lds		rmp,	SPHP1
		out		SPH,	rmp
		lds		rmp,	SPLP1
		out		SPL,	rmp

		rjmp	nextProcess

	; Store P1 stack and load P2
	TOP2:

		in		rmp,	SPH
		sts		SPHP1,	rmp
		in		rmp,	SPL
		sts		SPLP1,	rmp

		lds		rmp,	SPHP2
		out		SPH,	rmp
		lds		rmp,	SPLP2
		out		SPL,	rmp

		rjmp	nextProcess
	
	; Store P2 stack and load P3
	; Also set CPROCESS to 0xFF so next time it
	;	wraps around to 0
	TOP3:
		
		in		rmp,	SPH
		sts		SPHP2,	rmp
		in		rmp,	SPL
		sts		SPLP2,	rmp

		lds		rmp,	SPHP3
		out		SPH,	rmp
		lds		rmp,	SPLP3
		out		SPL,	rmp

		ldi		rmp,	0xFF
		sts		CPROCESS,	rmp

		rjmp	nextProcess
	
	
	NEXTPROCESS:
	
		pop		r31
		pop		r30
		pop		r29
		pop		r28
		pop		r27
		pop		r26
		pop		r25
		pop		r24
		pop		r23
		pop		r22
		pop		r21
		pop		r20
		pop		r19
		pop		r18
		pop		r17
		pop		r16
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		r7
		pop		r6
		pop		r5
		pop		r4
		pop		r3
		pop		r2
		pop		r1
		pop		r0
		out		SREG,	r0
		pop		r0
	RETI	



P0:							; P0 code

	; Display the current process number to LEDs
	ldi		rmp,	0x00
	out		LED,	rmp
	rjmp	P0


P1:							; P1 code

	; Display current process number to LEDs
	ldi		rmp,	0x01
	out		LED,	rmp
	rjmp	P1

P2:							; P2 code

	; Display current process number on LEDs
	ldi		rmp,	0x02
	out		LED,	rmp
	rjmp	P2

P3:							; P3 code
	
	; Display current process number on LEDs
	ldi		rmp,	0x03
	out		LED,	rmp
	rjmp	P3

FAIL:
	rjmp	fail