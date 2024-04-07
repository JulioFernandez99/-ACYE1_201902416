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

mKeysSelectMenuGrafico macro
    LOCAL until_select_option, exit, down_opt, up_opt, select_option
    LOCAL opt_inicio_juego, opt_datos
    PUSH AX

    until_select_option:
        MOV AH,08h
        INT 21
        CMP AL, 000DH
        JE select_option
        CMP AL, 48
        JE up_opt
        CMP AL, 50
        JE down_opt
        CMP AL, 1BH
        JE exit
        JMP until_select_option
    down_opt:
        CMP SI, RECQTY
        JE until_select_option

        mPrintTextIntoVideo MARKLINE, MARKCOLUMN, SPACE, 1, 00
        INC SI
        INC ACTLINE
        CALL PREVIEWNUMBERMARKERDOWNJUEGO
        INC MARKLINE
        MOV FONTCOLOR, 0A
        CALL PMARKVALUEJUEGO
        JMP until_select_option
    up_opt:
        CMP SI, 0001
        JE until_select_option

        mPrintTextIntoVideo MARKLINE, MARKCOLUMN, SPACE, 1, 00
        DEC SI
        DEC ACTLINE
        CALL PREVIEWNUMBERMARKERUPJUEGO
        DEC MARKLINE
        MOV FONTCOLOR, 0A
        CALL PMARKVALUE
        JMP PMARKVALUEJUEGO
    select_option:
        CMP ACTLINE, 02
        JE opt_uno_vs_cpu
        CMP ACTLINE, 03
        JE opt_uno_vs_uno
        CMP ACTLINE, 04
        JE opt_reportes
        CMP ACTLINE, 05
        JE opt_regresar
        JMP until_select_option
    opt_uno_vs_cpu:
        mTextMode
        CALL PINICIOJUEGOMENU
        CALL PPRINTMENUGRAFICO
        CALL PMARKVALUE
        JMP until_select_option

      
    opt_uno_vs_uno:
        mTextMode
        mCleanScreen
        mPrint rotulo1VS1
        mPrint newLine
        mPrint mesaje_presionar_enter_continuar
        pauseUntilEnter
        CALL PPRINTMENUGRAFICOJUEGO
        CALL PMARKVALUEJUEGO
        JMP until_select_option
    opt_reportes:
        mTextMode
        mCleanScreen
        mPrint rotuloReportes
        mPrint newLine
        mPrint mesaje_presionar_enter_continuar
        pauseUntilEnter
        CALL PPRINTMENUGRAFICOJUEGO
        CALL PMARKVALUEJUEGO
        JMP until_select_option
    opt_regresar:
        JMP until_select_option
        JMP inicio
        
endm