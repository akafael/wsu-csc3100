*-----------------------------------------------------------
* Program    :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
	ORG	$1000
START:

	LEA ARR,A0		; Getting the address

LOOP_UI:
	
        BSR     PRINTALL
	BSR	PRINTSMALLEST
        BSR     PRINTODD
        BSR     PRINTEVEN

END_LOOP_UI:
	MOVE.B	#9,D0
	TRAP	#15

PRINTALL:
	CLR.W D7
	CLR.W D6
	MOVE	A0,A6

	LEA	LBRA,A1		
	MOVE.B 	#14,D0
	TRAP 	#15		; Print `[`
	
PRINTALL_LOOP:
	ADD #1,D7

	CMP #0,D6
	BEQ PRINTALL_PRINTN

	LEA	CMSP,A1		
	MOVE.B 	#14,D0
	TRAP 	#15		; Print Comma and space

PRINTALL_PRINTN:

	ADD #1,D6
        MOVE  (A6),D1        
	MOVE.B	#3,D0
	TRAP	#15		; Print

PRINTALL_LOOP_NEXT:

	ADDA	 #2,A6		; GOING TO NEXT VALUE	1
	CMP #7,D7
	BLT PRINTALL_LOOP

END_PRINTALL:

	LEA	RBRA,A1	
	MOVE.B 	#14,D0
	TRAP 	#15		; Print `]`
	
	LEA	ENDL,A1
	MOVE.B 	#14,D0
	TRAP 	#15
	
	CLR.W D7
        RTS


PRINTSMALLEST:
	CLR.W D7
	CLR.W D6
	MOVE	A0,A6

	LEA	LBRA,A1		
	MOVE.B 	#14,D0
	TRAP 	#15		; Print `[`

	MOVE	A6,A1		;
	
PRINTSMALLEST_LOOP:
	ADD #1,D7

	MOVE	(A6),D0
	MOVE	(A1),D1

	CMP	D0,D1
	BLT	PRINTSMALLEST_LOOP_NEXT

PRINTSMALLEST_SELECT:
	MOVE	A6,A1

PRINTSMALLEST_LOOP_NEXT:

	ADDA	#2,A6		; GOING TO NEXT VALUE	1
	CMP	#7,D7
	BLT	PRINTSMALLEST_LOOP

END_PRINTSMALLEST:
        MOVE	(A1),D1        
	MOVE.B	#3,D0
	TRAP	#15		; Print

	LEA	RBRA,A1	
	MOVE.B 	#14,D0
	TRAP 	#15		; Print `]`
	
	LEA	ENDL,A1
	MOVE.B 	#14,D0
	TRAP 	#15
	
	CLR.W D7
        RTS

PRINTEVEN:
	CLR.W D7
	CLR.W D6
	MOVE	A0,A6

	LEA	LBRA,A1		
	MOVE.B 	#14,D0
	TRAP 	#15		; Print `[`
	
PRINTEVEN_LOOP:

        MOVE	(A6),D1	
	MOVE	#2,D2		
	DIVU	D2,D1
	SWAP	D1
	CLR	D3
        MOVE.W	D1,D3	
        MOVE.L  D3,D1

	ADD #1,D7
        CMP.L   #0,D1
        BEQ     PRINTEVEN_LOOP_NEXT

	CMP #0,D6
	BEQ PRINTEVEN_PRINTN

	LEA	CMSP,A1		
	MOVE.B 	#14,D0
	TRAP 	#15		; Print Comma and space

PRINTEVEN_PRINTN:

	ADD #1,D6
        MOVE  (A6),D1        
	MOVE.B	#3,D0
	TRAP	#15		; Print

PRINTEVEN_LOOP_NEXT:

	ADDA	 #2,A6		; GOING TO NEXT VALUE	1
	CMP #7,D7
	BLT PRINTEVEN_LOOP

END_PRINTEVEN:

	LEA	RBRA,A1	
	MOVE.B 	#14,D0
	TRAP 	#15		; Print `[`
	
	LEA	ENDL,A1
	MOVE.B 	#14,D0
	TRAP 	#15
	
	CLR.W D7
        RTS
	
PRINTODD:
	CLR.W D7
	CLR.W D6
	MOVE	A0,A6

	LEA	LBRA,A1		
	MOVE.B 	#14,D0
	TRAP 	#15		; Print `[`
	
PRINTODD_LOOP:

        MOVE	(A6),D1	
	MOVE	#2,D2		
	DIVU	D2,D1
	SWAP	D1
	CLR	D3
        MOVE.W	D1,D3	
        MOVE.L  D3,D1

	ADD #1,D7
        CMP.L   #1,D1
        BEQ     PRINTODD_LOOP_NEXT

	CMP #0,D6
	BEQ PRINTODD_PRINTN

	LEA	CMSP,A1		
	MOVE.B 	#14,D0
	TRAP 	#15		; Print Comma and space

PRINTODD_PRINTN:

	ADD #1,D6
        MOVE  (A6),D1        
	MOVE.B	#3,D0
	TRAP	#15		; Print

PRINTODD_LOOP_NEXT:

	ADDA	#2,A6		; GOING TO NEXT VALUE	
	
	CMP #7,D7
	BLT PRINTODD_LOOP

END_PRINTODD:

	LEA	RBRA,A1	
	MOVE.B 	#14,D0
	TRAP 	#15		; Print `[`
	
	LEA	ENDL,A1
	MOVE.B 	#14,D0
	TRAP 	#15
	
	CLR.W D7
        RTS
	
	
* Variables and Strings
	
	ORG	$1200
	
CR       EQU     $0D         
LF       EQU     $0A 

	
ARR	DC.W	6,10,3,7,11,8,15	; Initialize the array

CMSP	DC.B	', ',0		; Comma and space
LBRA	DC.B	'[',0
RBRA	DC.B	']',0
ENDL	DC.B	CR, LF, 0		; Changing line


	END	START



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
