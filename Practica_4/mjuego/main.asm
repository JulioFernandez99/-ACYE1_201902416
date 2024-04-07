

.code
    mainMenuJuego proc
        mSetDataOnDs
        
        mCleanScreen
        MOV RECQTY, 0004
        MOV ACTLINE, 2
        MOV ACTCOLUMN, 1
        MOV FONTCOLOR, 0FH

        MOV MARKCOLUMN, 0
        MOV ACTCOLUMN, 1
            CALL PPRINTMENUGRAFICOJUEGO
            XOR SI, SI
            MOV BP, BX

            CALL PLOOPMENUGRAFICOJUEGO
            

        finishJuego:
            mTextMode
            mRetControl
    mainMenuJuego endp

    PPRINTMENUGRAFICOJUEGO PROC
        CALL PMOVESTOVIDEOMODE
        mVideoMode
        mDivLine 09, 29
        mDivLine 0BBh, 29
        mPrintTextIntoVideo 00, 0C, mensaje_menu_juego, 0A, 000F
        mPrintTextIntoVideo 02, 01, opt1_menu_juego, 08, 000F
        mPrintTextIntoVideo 03, 01, opt2_menu_juego, 06, 000F
        mPrintTextIntoVideo 04, 01, opt3_menu_juego, 08, 000F
        mPrintTextIntoVideo 05, 01, opt4_menu_juego, 08, 000F
        mPrintTextIntoVideo 18, 00, opciones_menu_juego, 27, 000F
        RET
    PPRINTMENUGRAFICOJUEGO ENDP

    PINICIOJUEGOMENU PROC
        ;INCLUDE 1vs1\main.asm
        mCleanScreen
        mPrint newLine
        mPrint mensaje_inicio_juego
        mPrint newLine
        mPrint mesaje_presionar_enter_continuar
        pauseUntilEnter
        JMP mainMenuJuego
    PINICIOJUEGOMENU ENDP

    PJUGOUNOVUNO PROC
        INCLUDE 1vs1\main.asm
        ; mCleanScreen
        ; mPrint newLine
        ; mPrint mensaje_inicio_juego
        ; mPrint newLine
        ; mPrint mesaje_presionar_enter_continuar
        ; pauseUntilEnter
        ; JMP mainMenuJuego
    PJUGOUNOVUNO ENDP


    PREVIEWNUMBERMARKERDOWNJUEGO PROC
        PUSH AX
        PUSH BX
        MOV AX, SI
        MOV BL, 15
        DIV BL
        CMP AH, 00
        JNE finish_review_marker_down_juego
        MOV MARKLINE, 1
        MOV ACTLINE, 1
        ADD MARKCOLUMN, 0C
        ADD ACTCOLUMN, 0C

        finish_review_marker_down_juego:
            POP BX
            POP AX
            RET
    PREVIEWNUMBERMARKERDOWNJUEGO ENDP

    PREVIEWNUMBERMARKERUPJUEGO PROC
        PUSH AX
        PUSH BX
        MOV AX, SI
        MOV BL, 15
        DIV BL
        CMP AH, 00
        JNE finish_review_marker_up_juego
        MOV MARKLINE, 17
        MOV ACTLINE, 16
        SUB MARKCOLUMN, 0C
        SUB ACTCOLUMN, 0C

        finish_review_marker_up_juego:
            POP BX
            POP AX
            RET
    PREVIEWNUMBERMARKERUPJUEGO ENDP

    PMARKVALUEJUEGO PROC
        mPrintTextIntoVideo MARKLINE, MARKCOLUMN, MARKER, 1, FONTCOLOR
        RET
    PMARKVALUEJUEGO ENDP

    PLOOPMENUGRAFICOJUEGO  PROC
        PUSH AX
        PUSH DX

        MOV AX, SI
        ADD AX, 2
        MOV MARKLINE, AL
        MOV FONTCOLOR, 0A
        CALL PMARKVALUEJUEGO
        MOV SI, 0001
        MOV ACTCOLUMN, 01
        MOV ACTLINE, 02
        mKeysSelectMenuGraficoJuego
        
        exit_loop_menu_grafico_juego:

            ; POP DI
            POP DX
            POP AX
            RET
            
    PLOOPMENUGRAFICOJUEGO  ENDP

    PMOVDATATOESJUEGO PROC
      PUSH DX

      MOV DX, @DATA
      MOV ES, DX

      POP DX
      RET
    PMOVDATATOESJUEGO ENDP

    PMOVESTOVIDEOMODEJUEGO PROC
      PUSH DX

      MOV DX, 0A000h
      MOV ES, DX

      POP DX
      RET
    PMOVESTOVIDEOMODEJUEGO ENDP

    CALCPIXELLOCJUEGO  PROC
      PUSH BX
      
      MOV BX, 140
      MOV AX, PIXLINE
      MUL BX

      ADD AX, PIXCOL
      POP BX
      
      RET
    CALCPIXELLOCJUEGO ENDP

    DRAWSQUAREJUEGO  PROC
      PUSH BX
      PUSH CX

      MOV BX, AX
      MOV AX, SQCOLOR

      MOV CX, SQWIDTH

      SQnextLineJuego:
        SQnextPixelJuego:
          MOV ES:[BX], AL
          INC BX
          LOOP SQnextPixelJuego

        INC AH
        CMP AH, SQHEIGHT
        JE SQsalidaJuego

        MOV CX, SQWIDTH
        SUB BX, CX
        ADD BX, 140
        JMP SQnextLineJuego

      SQsalidaJuego:

      POP CX
      POP BX
      RET
    DRAWSQUAREJuego  ENDP
