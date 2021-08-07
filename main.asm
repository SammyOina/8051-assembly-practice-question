;====================================================================
;
; Created:   Tue Aug 3 2021
; Processor: 80C31
; Compiler:  ASEM-51 (Proteus)
;====================================================================

$NOMOD51
$INCLUDE (8051.MCU)

;====================================================================
; DEFINITIONS
;====================================================================

;====================================================================
; VARIABLES
;====================================================================
LED1		BIT		P1.0
LED2		BIT		P1.1
LED3		BIT		P1.2
;====================================================================
; RESET and INTERRUPT VECTORS
;====================================================================

      ; Reset Vector
      org   0000h
      jmp   START

;====================================================================
; CODE SEGMENT
;====================================================================

START:	CLR LED1
	CLR LED2
	CLR LED3
	MOV R4, #5D
	MOV R5, #10D
	MOV R6, #13D
LOOP:	ACALL DELAY
CHECKLED1:	 DJNZ R4, CHECKLED2
	CPL LED1
	MOV R4, #5D
CHECKLED2: DJNZ R5, CHECKLED3
	CPL LED2
	MOV R5, #10D
CHECKLED3: DJNZ R6, LOOP
	CPL LED3
	MOV R6, #13D
        SJMP LOOP
	
	       
DELAY: 
	       MOV R7, #2D
WAIT3:    MOV TMOD, #10H
		MOV TL1,#0FDH
		MOV TH1, #04BH
		SETB TR1
BACK: JNB TF1,BACK
	       CLR TR1
	       CLR TF1
	       DJNZ R7, WAIT3
	       RET
   
END
;====================================================================
