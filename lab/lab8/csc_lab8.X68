*-----------------------------------------------------------
* Program    :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
	ORG	$1000
START:

	LEA ARR,A0		; Getting the address
	
	CLR.W D2			; Clearing

LOOP_UI:
        LEA	MSG1,A1	
	MOVE.B 	#14,D0
	TRAP 	#15         ;Print msg1
	
	CLR     D1
	MOVE.B  #4,D0
	TRAP    #15
	
	CMP.L   #1,D1
        BEQ     PRINTODD
        
        CMP.L   #2,D1
        BEQ     PRINTEVEN

        LEA	MSG2,A1	
	MOVE.B 	#14,D0
	TRAP 	#15         ;Print msg2

	LEA	ENDL,A1
	MOVE.B 	#14,D0
	TRAP 	#15
        
        BRA     LOOP_UI


END_LOOP_UI:
	MOVE.B	#9,D0
	TRAP	#15


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
	CMP #10,D7
	BLT PRINTEVEN_LOOP

END_PRINTEVEN:

	LEA	RBRA,A1	
	MOVE.B 	#14,D0
	TRAP 	#15		; Print `[`
	
	LEA	ENDL,A1
	MOVE.B 	#14,D0
	TRAP 	#15
	
	CLR.W D7
        BRA     LOOP_UI
	
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
	
	CMP #10,D7
	BLT PRINTODD_LOOP

END_PRINTODD:

	LEA	RBRA,A1	
	MOVE.B 	#14,D0
	TRAP 	#15		; Print `[`
	
	LEA	ENDL,A1
	MOVE.B 	#14,D0
	TRAP 	#15
	
	CLR.W D7
        BRA     LOOP_UI
	
	
* Variables and Strings
	
	ORG	$1200
	
CR       EQU     $0D         
LF       EQU     $0A 

	
ARR	DC.W	5,7,12,3,8,21,11,1,2,16	; Initialize the array

MSG1    DC.B    'Enter a number (1 or 2)',0
MSG2    DC.B    'So close, try again',0

CMSP	DC.B	', ',0		; Comma and space
LBRA	DC.B	'[',0
RBRA	DC.B	']',0
ENDL	DC.B	CR, LF, 0		; Changing line


	END	START



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
