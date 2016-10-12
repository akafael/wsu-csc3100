*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $400
START:                  ; first instruction of program
    

* Put program code here
	LEA     T,A0
	LEA     J,A1
	MOVE.B  #1,D0
	MOVE.B  #5,D1
	MOVE.B  #7,D2
	
NEXT:
    ADD.B   D0,D2
    MOVE.B  (A0),D3
    MOVE.B  (A1),D4
    MOVE.B  D4,D5
    CMP     D5,D3
    BNE     ELSE
    SUB.B   D2,D3
    MULU    #4,D3
    MOVE    D3,(A1)
    BRA     END_LOOP

ELSE
    SUB     D3,D4
    MOVE    D4,(A1)
    
END_LOOP
    ADDA    #2,A0
    ADDA    #2,A1
    ADD     #1,D0
    CMP     #9,D0
    BNE     NEXT
    MOVE.B  #4,D0
    TRAP    #15

    SIMHALT             ; halt simulator

       ORG  $500

* Put variables and constants here
T   DC.W	6,2,5,4,9,7,3,1,0
J   DC.W	5,7,1,9,2,5,6,6,1


    END    $400        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
