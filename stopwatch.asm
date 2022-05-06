ORG C000H
CURAD: EQU FFF7H; Assign CURAD to FFF7H
UPDAD: EQU 06BCH; Assign UPDAD to 06BCH

RESET: LXI H,0000H
REPEAT: SHLD CURAD
CALL UPDAD; Display time present in HL in the address field
MVI A, 00011011B
SIM ; Unmask RST7.5, Reset RST7.5 flip flop
EI ; Enable interrupt system
