INCLUDE MACROS.ASM

INCLUDE 1vs1\MACROS.ASM

.MODEL small
.STACK
.RADIX 16
.DATA           ;SEGMENTO DE DATOS
include vars\VARS.ASM

.CODE           ;SEGMENTO DE CODIGO
inicio:
    main2 proc
        mSetDataOnDs
        ; mCleanScreen
        ; mPrint datosGenerales
        ; mPrint newLine
        ; mPrint mesaje_presionar_enter_continuar
        ; pauseUntilEnter

        
        mCleanScreen
        MOV RECQTY, 0004
        MOV ACTLINE, 2
        MOV ACTCOLUMN, 1
        MOV FONTCOLOR, 0FH

        MOV MARKCOLUMN, 0
        MOV ACTCOLUMN, 1
            CALL PPRINTMENUGRAFICO
            XOR SI, SI
            MOV BP, BX

            CALL PLOOPMENUGRAFICO
            

        finish:
            mTextMode
            mRetControl
    main2 endp

    PPRINTMENUGRAFICO PROC
        CALL PMOVESTOVIDEOMODE
        mVideoMode
        mDivLine 09, 29
        mDivLine 0BBh, 29
        mPrintTextIntoVideo 00, 0C, mensaje_menu_grafico, 0C, 000F
        mPrintTextIntoVideo 02, 01, opt1_menu_grafico, 0B, 000F
        mPrintTextIntoVideo 03, 01, opt2_menu_grafico, 09, 000F
        mPrintTextIntoVideo 04, 01, opt3_menu_grafico, 0b, 000F
        mPrintTextIntoVideo 05, 01, opt4_menu_grafico, 05, 000F
        mPrintTextIntoVideo 18, 00, opciones_menu_grafico, 27, 000F
        RET
    PPRINTMENUGRAFICO ENDP

    PINICIOJUEGO PROC
        ;INCLUDE 1vs1\MAIN.ASM
        
        INCLUDE mjuego\MAIN.ASM
        
    PINICIOJUEGO ENDP

    PREVIEWNUMBERMARKERDOWN PROC
        PUSH AX
        PUSH BX
        MOV AX, SI
        MOV BL, 15
        DIV BL
        CMP AH, 00
        JNE finish_review_marker_down
        MOV MARKLINE, 1
        MOV ACTLINE, 1
        ADD MARKCOLUMN, 0C
        ADD ACTCOLUMN, 0C

        finish_review_marker_down:
            POP BX
            POP AX
            RET
    PREVIEWNUMBERMARKERDOWN ENDP

    PREVIEWNUMBERMARKERUP PROC
        PUSH AX
        PUSH BX
        MOV AX, SI
        MOV BL, 15
        DIV BL
        CMP AH, 00
        JNE finish_review_marker_up
        MOV MARKLINE, 17
        MOV ACTLINE, 16
        SUB MARKCOLUMN, 0C
        SUB ACTCOLUMN, 0C

        finish_review_marker_up:
            POP BX
            POP AX
            RET
    PREVIEWNUMBERMARKERUP ENDP

    PMARKVALUE PROC
        mPrintTextIntoVideo MARKLINE, MARKCOLUMN, MARKER, 1, FONTCOLOR
        RET
    PMARKVALUE ENDP

    PLOOPMENUGRAFICO  PROC
        PUSH AX
        PUSH DX

        MOV AX, SI
        ADD AX, 2
        MOV MARKLINE, AL
        MOV FONTCOLOR, 0A
        CALL PMARKVALUE
        MOV SI, 0001
        MOV ACTCOLUMN, 01
        MOV ACTLINE, 02
        mKeysSelectMenuGrafico
        
        exit_loop_menu_grafico:

            ; POP DI
            POP DX
            POP AX
            RET
            
    PLOOPMENUGRAFICO  ENDP

    PMOVDATATOES PROC
      PUSH DX

      MOV DX, @DATA
      MOV ES, DX

      POP DX
      RET
    PMOVDATATOES ENDP

    PMOVESTOVIDEOMODE PROC
      PUSH DX

      MOV DX, 0A000h
      MOV ES, DX

      POP DX
      RET
    PMOVESTOVIDEOMODE ENDP

    CALCPIXELLOC  PROC
      PUSH BX
      
      MOV BX, 140
      MOV AX, PIXLINE
      MUL BX

      ADD AX, PIXCOL
      POP BX
      
      RET
    CALCPIXELLOC ENDP

    DRAWSQUARE  PROC
      PUSH BX
      PUSH CX

      MOV BX, AX
      MOV AX, SQCOLOR

      MOV CX, SQWIDTH

      SQnextLine:
        SQnextPixel:
          MOV ES:[BX], AL
          INC BX
          LOOP SQnextPixel

        INC AH
        CMP AH, SQHEIGHT
        JE SQsalida

        MOV CX, SQWIDTH
        SUB BX, CX
        ADD BX, 140
        JMP SQnextLine

      SQsalida:

      POP CX
      POP BX
      RET
    DRAWSQUARE  ENDP
END inicio