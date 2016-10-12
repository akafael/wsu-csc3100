	ORG	$1000
START:

	LEA ARR,A0		; Getting the address
	
	CLR.W D2			; Clearing

	BSR	PRINT1

	MOVE	A0,A6
	BSR	PRINT2

	MOVE	A0,A6
	ADD	#2,A6
	BSR	PRINT2

	BSR	PRINT3

	MOVE.B	#9,D0
	TRAP	#15

PRINT1:
	CLR.W D7
	MOVE	A0,A6

	LEA	LBRA,A1		
	MOVE.B 	#14,D0
	TRAP 	#15		; Print `[`
PRINT1_LOOP:
	MOVE 	(A6),D1
	MOVE.B	#3,D0
	TRAP	#15		; Print
	
	LEA	CMSP,A1		
	MOVE.B 	#14,D0
	TRAP 	#15		; Print Comma and space
	
	ADDA	 #2,A6		; GOING TO NEXT VALUE
	
	ADD #1,D7
	CMP #9,D7
	BLT PRINT1_LOOP

END_PRINT1:
	MOVE 	(A6),D1
	MOVE.B	#3,D0
	TRAP	#15		; Print the last value

	LEA	RBRA,A1	
	MOVE.B 	#14,D0
	TRAP 	#15		; Print `[`
	
	LEA	ENDL,A1
	MOVE.B 	#14,D0
	TRAP 	#15
	
	CLR.W D7
	RTS
	
PRINT2:
	CLR.W D7
	CLR.W D1
	
PRINT2_LOOP:
	CLR.W D2
	MOVE 	(A6),D0
	
	MOVE	D0,D1
	MOVE.B	#3,D0
	TRAP	#15		; Print Number
	
	LEA	CMSP,A1		
	MOVE.B 	#14,D0
	TRAP 	#15		; Print Comma and space

	ADDA	 #4,A6		; GOING TO NEXT VALUE

	ADD #1,D7
	CMP #4,D7
	BLT PRINT2_LOOP
	
END_PRINT2:
	MOVE 	(A6),D0
	
	MOVE	D0,D1
	MOVE.B	#3,D0
	TRAP	#15		; Print Number

	LEA	ENDL,A1
	MOVE.B 	#14,D0
	TRAP 	#15

	CLR.W D7
	RTS
	

PRINT3:
	CLR.W D7
	MOVE	A0,A6
PRINT3_LOOP:
	CLR.W D2
	MOVE 	(A6),D0
	MOVE 	2(A6),D2
	ADD	D0,D2
	
	MOVE	D2,D1
	MOVE.B	#3,D0
	TRAP	#15		; Print Number
	
	LEA	CMSP,A1		
	MOVE.B 	#14,D0
	TRAP 	#15		; Print Comma and space

	ADDA	 #4,A6		; GOING TO NEXT VALUE

	ADD #1,D7
	CMP #4,D7
	BLT PRINT3_LOOP
END_PRINT3:
	CLR.W D2
	MOVE 	(A6),D0
	MOVE 	2(A6),D2
	ADD	D0,D2
	
	MOVE	D2,D1
	MOVE.B	#3,D0
	TRAP	#15		; Print Last Number

	LEA	ENDL,A1
	MOVE.B 	#14,D0
	TRAP 	#15

	CLR.W D7
	RTS
	
	
* Variables and Strings
	
	ORG	$1200
	
CR       EQU     $0D         
LF       EQU     $0A 

	
ARR	DC.W	5,7,12,3,8,21,11,1,2,16	; Initialize the array

CMSP	DC.B	', ',0		; Comma and space
LBRA	DC.B	'[',0
RBRA	DC.B	']',0
ENDL	DC.B	CR, LF, 0		; Changing line


	END	START



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
