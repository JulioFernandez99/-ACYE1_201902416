mSetDataOnDs macro
    mov DX, @data
    mov DS, DX
    MOV ES, DX
endm

mCleanScreen macro
    PUSH AX

    MOV AH, 00h
    MOV AL, 03h
    INT 10h

    POP AX
endm

mPrint macro var
    PUSH DX
    PUSH AX
    
    MOV DX, OFFSET var
    MOV AH, 09
    INT 21

    POP AX
    POP DX
endm

pauseUntilEnter macro
    LOCAL until_press_enter
    PUSH AX

    until_press_enter:
        MOV AH,08h
        INT 21h
        CMP AL, 000DH
        JNE until_press_enter
    POP AX
endm

mGetKey macro
    MOV AH,01h
    INT 21h
endm

mTextMode macro
    mov AX, 03
    int 10
endm

mRetControl macro
        MOV AL, 0       ;mensaje de retorno
        MOV AH, 04Ch    ; devuelve el control al sistema
        INT 21
endm

; ----------------------------------------------------------------------------------------

mVideoMode macro
    mov AX, 13
    int 10
endm

mDivLine macro line, color
    PUSH AX

    ; INICIA EN 0 EL CONTADOR
    MOV PIXLINE, line
    MOV PIXCOL, 0

    CALL CALCPIXELLOCJUEGO   ;SALIDA EN AX
    
    MOV BH, 00
    MOV BL, color
    MOV SQCOLOR, BX
    MOV SQHEIGHT, 4
    MOV SQWIDTH, 140
    CALL DRAWSQUAREJUEGO

    POP AX
endm

mPrintTextIntoVideo MACRO row, column, text, chars, color
    ;AH         13h
    ;AL         Subservice (0-3)
    ;BH         Display page number
    ;BL         Attribute (Subservices 0 and 1)
    ;CX         Length of string
    ;DH         Row position where string is to be written
    ;DL         Column position where string is to be written
    ;ES:BP      Pointer to string to write
    mPushRegisters
    CALL PMOVDATATOESJUEGO

    MOV AH, 13
    MOV AL, 0
    MOV CX, chars
    MOV DH, row
    MOV DL, column
    LEA BX, text
    MOV BP, BX
    MOV BX, color
    INT 10

    CALL PMOVESTOVIDEOMODEJUEGO
    mPopRegisters
ENDM

mPushRegisters macro
    push ax
    push bx
    push cx
    push dx

    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
endm

mPopRegisters macro
    pop ax
    pop bx
    pop cx
    pop dx
endm

