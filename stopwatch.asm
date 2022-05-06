ORG C000H
CURAD: EQU FFF7H; Assign CURAD to FFF7H
UPDAD: EQU 06BCH; Assign UPDAD to 06BCH

RESET: LXI H,0000H
REPEAT: SHLD CURAD
CALL UPDAD; Display time present in HL in the address field
MVI A, 00011011B
SIM ; Unmask RST7.5, Reset RST7.5 flip flop
EI ; Enable interrupt system
CALL DELAY ; Generate a delay of 1 second
; -------Delay subroutine start-----------
DELAY: MVI B, 02H
OUTLOOP: LXI D, FFFFH

INLOOP: DCX D
MOV A, D
ORA E
JNZ INLOOP

DCR B
JNZ OUTLOOP
RET
; -------Delay subroutine end-----------
LHLD CURAD
MOV A, L
ADI 01H
DAA ; Increment L value in decimal
CPI 60H
JZ INC_MIN ; If L = 60, jump to INC_MIN

MOV L, A
JMP REPEAT

INC_MIN:

MVI L, 00H
MOV A, H
ADI 01H
DAA ; Make L = 0, and increment H in decimal
CPI 60H
JZ RESET ; If H = 60, jump to RESET