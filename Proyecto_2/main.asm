PrintCadena MACRO cadena
    MOV AH, 09h
    LEA DX, cadena
    INT 21h
ENDM




;---------------------------------------------------------

LimpiarConsola MACRO
    MOV AX,03h              ;03H es el codigo de la funcion que limpia la pantalla
    INT 10h                 ;10h es la interrupcion para el video
ENDM

LimpiarComando MACRO
    LOCAL LIMPIAR
    MOV SI, 3  ; Comenzamos desde el tercer carácter de la cadena comando
    LIMPIAR:
        MOV comando[SI], 32  ; Limpia con espacios en blanco
        INC SI
        CMP SI, 10
        JNE LIMPIAR
ENDM

prom MACRO cadena2
    LOCAL COMPARAR_LOOP, NO_IGUALES, SON_IGUALES, FIN_COMPARACION

    mov si, offset comando + 2  ; Puntero a la primera cadena, comenzando desde el tercer byte
    mov di, offset cadena2       ; Puntero a la segunda cadena

    COMPARAR_LOOP:
        mov al, [si]         ; Carga el próximo carácter de la primera cadena en AL
        mov bl, [di]         ; Carga el próximo carácter de la segunda cadena en BL
        cmp al, bl           ; Compara los caracteres
        jne NO_IGUALES       ; Si son diferentes, salta a NO_IGUALES

        ; Si llegamos aquí, los caracteres son iguales
        ; Comprobamos si hemos llegado al final de alguna de las cadenas
        cmp al, '$'            ; Si al es 0, hemos llegado al final de cadena1
        je SON_IGUALES       ; Si sí, las cadenas son iguales
        inc si               ; Avanza al siguiente carácter de cadena1
        inc di               ; Avanza al siguiente carácter de cadena2
        jmp COMPARAR_LOOP    ; Repite el bucle

    NO_IGUALES:
        ; Si llegamos aquí, encontramos caracteres diferentes
        ; Manejar la situación de cadenas no iguales aquí
        ; Por ejemplo, establecer una bandera de no iguales y salir del bucle
        
        ;PrintCadena bandera2
        jmp FIN_COMPARACION

    SON_IGUALES:
        ; Si llegamos aquí, las cadenas son iguales
        ; Manejar la situación de cadenas iguales aquí
        ; Por ejemplo, establecer una bandera de iguales y salir del bucle
        MOV match, 1
        ;PrintCadena prc1
        Promedio
        MOV base, 10000

        ;PrintCadena bandera1

    FIN_COMPARACION:
ENDM

medianaC MACRO cadena2
    LOCAL COMPARAR_LOOP, NO_IGUALES, SON_IGUALES, FIN_COMPARACION
    mov si, offset comando + 2  ; Puntero a la primera cadena, comenzando desde el tercer byte
    mov di, offset cadena2       ; Puntero a la segunda cadena

    COMPARAR_LOOP:
        mov al, [si]         ; Carga el próximo carácter de la primera cadena en AL
        mov bl, [di]         ; Carga el próximo carácter de la segunda cadena en BL
        cmp al, bl           ; Compara los caracteres
        jne NO_IGUALES       ; Si son diferentes, salta a NO_IGUALES

        ; Si llegamos aquí, los caracteres son iguales
        ; Comprobamos si hemos llegado al final de alguna de las cadenas
        cmp al, '$'            ; Si al es 0, hemos llegado al final de cadena1
        je SON_IGUALES       ; Si sí, las cadenas son iguales
        inc si               ; Avanza al siguiente carácter de cadena1
        inc di               ; Avanza al siguiente carácter de cadena2
        jmp COMPARAR_LOOP    ; Repite el bucle

    NO_IGUALES:
        ; Si llegamos aquí, encontramos caracteres diferentes
        ; Manejar la situación de cadenas no iguales aquí
        ; Por ejemplo, establecer una bandera de no iguales y salir del bucle
        
        ;PrintCadena bandera2
        jmp FIN_COMPARACION

    SON_IGUALES:
        ; Si llegamos aquí, las cadenas son iguales
        ; Manejar la situación de cadenas iguales aquí
        ; Por ejemplo, establecer una bandera de iguales y salir del bucle
        MOV match, 1
        ;PrintCadena prc2
        Mediana
        MOV base, 10000

        ;PrintCadena bandera1

    FIN_COMPARACION:
ENDM

modaC MACRO cadena2
    LOCAL COMPARAR_LOOP, NO_IGUALES, SON_IGUALES, FIN_COMPARACION
    mov si, offset comando + 2  ; Puntero a la primera cadena, comenzando desde el tercer byte
    mov di, offset cadena2       ; Puntero a la segunda cadena

    COMPARAR_LOOP:
        mov al, [si]         ; Carga el próximo carácter de la primera cadena en AL
        mov bl, [di]         ; Carga el próximo carácter de la segunda cadena en BL
        cmp al, bl           ; Compara los caracteres
        jne NO_IGUALES       ; Si son diferentes, salta a NO_IGUALES

        ; Si llegamos aquí, los caracteres son iguales
        ; Comprobamos si hemos llegado al final de alguna de las cadenas
        cmp al, '$'            ; Si al es 0, hemos llegado al final de cadena1
        je SON_IGUALES       ; Si sí, las cadenas son iguales
        inc si               ; Avanza al siguiente carácter de cadena1
        inc di               ; Avanza al siguiente carácter de cadena2
        jmp COMPARAR_LOOP    ; Repite el bucle

    NO_IGUALES:
        ; Si llegamos aquí, encontramos caracteres diferentes
        ; Manejar la situación de cadenas no iguales aquí
        ; Por ejemplo, establecer una bandera de no iguales y salir del bucle
        
        ;PrintCadena bandera2
        jmp FIN_COMPARACION

    SON_IGUALES:
        ; Si llegamos aquí, las cadenas son iguales
        ; Manejar la situación de cadenas iguales aquí
        ; Por ejemplo, establecer una bandera de iguales y salir del bucle
        MOV match, 1
        ;PrintCadena prc3
        Moda
        MOV base, 10000

        ;PrintCadena bandera1

    FIN_COMPARACION:
ENDM

max MACRO cadena2
    LOCAL COMPARAR_LOOP, NO_IGUALES, SON_IGUALES, FIN_COMPARACION
    mov si, offset comando + 2  ; Puntero a la primera cadena, comenzando desde el tercer byte
    mov di, offset cadena2       ; Puntero a la segunda cadena

    COMPARAR_LOOP:
        mov al, [si]         ; Carga el próximo carácter de la primera cadena en AL
        mov bl, [di]         ; Carga el próximo carácter de la segunda cadena en BL
        cmp al, bl           ; Compara los caracteres
        jne NO_IGUALES       ; Si son diferentes, salta a NO_IGUALES

        ; Si llegamos aquí, los caracteres son iguales
        ; Comprobamos si hemos llegado al final de alguna de las cadenas
        cmp al, '$'            ; Si al es 0, hemos llegado al final de cadena1
        je SON_IGUALES       ; Si sí, las cadenas son iguales
        inc si               ; Avanza al siguiente carácter de cadena1
        inc di               ; Avanza al siguiente carácter de cadena2
        jmp COMPARAR_LOOP    ; Repite el bucle

    NO_IGUALES:
        ; Si llegamos aquí, encontramos caracteres diferentes
        ; Manejar la situación de cadenas no iguales aquí
        ; Por ejemplo, establecer una bandera de no iguales y salir del bucle
        
        ;PrintCadena bandera2
        jmp FIN_COMPARACION

    SON_IGUALES:
        ; Si llegamos aquí, las cadenas son iguales
        ; Manejar la situación de cadenas iguales aquí
        ; Por ejemplo, establecer una bandera de iguales y salir del bucle
        MOV match, 1
        ;PrintCadena prc4
        Maximo
        MOV base, 10000

        ;PrintCadena bandera1

    FIN_COMPARACION:
ENDM

min MACRO cadena2
    LOCAL COMPARAR_LOOP, NO_IGUALES, SON_IGUALES, FIN_COMPARACION
    mov si, offset comando + 2  ; Puntero a la primera cadena, comenzando desde el tercer byte
    mov di, offset cadena2       ; Puntero a la segunda cadena

    COMPARAR_LOOP:
        mov al, [si]         ; Carga el próximo carácter de la primera cadena en AL
        mov bl, [di]         ; Carga el próximo carácter de la segunda cadena en BL
        cmp al, bl           ; Compara los caracteres
        jne NO_IGUALES       ; Si son diferentes, salta a NO_IGUALES

        ; Si llegamos aquí, los caracteres son iguales
        ; Comprobamos si hemos llegado al final de alguna de las cadenas
        cmp al, '$'            ; Si al es 0, hemos llegado al final de cadena1
        je SON_IGUALES       ; Si sí, las cadenas son iguales
        inc si               ; Avanza al siguiente carácter de cadena1
        inc di               ; Avanza al siguiente carácter de cadena2
        jmp COMPARAR_LOOP    ; Repite el bucle

    NO_IGUALES:
        ; Si llegamos aquí, encontramos caracteres diferentes
        ; Manejar la situación de cadenas no iguales aquí
        ; Por ejemplo, establecer una bandera de no iguales y salir del bucle
        
        ;PrintCadena bandera2
        jmp FIN_COMPARACION

    SON_IGUALES:
        ; Si llegamos aquí, las cadenas son iguales
        ; Manejar la situación de cadenas iguales aquí
        ; Por ejemplo, establecer una bandera de iguales y salir del bucle
        MOV match, 1
        ;PrintCadena prc5
        Minimo
        MOV base, 10000

        ;PrintCadena bandera1

    FIN_COMPARACION:
ENDM

contador MACRO cadena2
    LOCAL COMPARAR_LOOP, NO_IGUALES, SON_IGUALES, FIN_COMPARACION
    mov si, offset comando + 2  ; Puntero a la primera cadena, comenzando desde el tercer byte
    mov di, offset cadena2       ; Puntero a la segunda cadena

    COMPARAR_LOOP:
        mov al, [si]         ; Carga el próximo carácter de la primera cadena en AL
        mov bl, [di]         ; Carga el próximo carácter de la segunda cadena en BL
        cmp al, bl           ; Compara los caracteres
        jne NO_IGUALES       ; Si son diferentes, salta a NO_IGUALES

        ; Si llegamos aquí, los caracteres son iguales
        ; Comprobamos si hemos llegado al final de alguna de las cadenas
        cmp al, '$'            ; Si al es 0, hemos llegado al final de cadena1
        je SON_IGUALES       ; Si sí, las cadenas son iguales
        inc si               ; Avanza al siguiente carácter de cadena1
        inc di               ; Avanza al siguiente carácter de cadena2
        jmp COMPARAR_LOOP    ; Repite el bucle

    NO_IGUALES:
        ; Si llegamos aquí, encontramos caracteres diferentes
        ; Manejar la situación de cadenas no iguales aquí
        ; Por ejemplo, establecer una bandera de no iguales y salir del bucle
        
        ;PrintCadena bandera2
        jmp FIN_COMPARACION

    SON_IGUALES:
        ; Si llegamos aquí, las cadenas son iguales
        ; Manejar la situación de cadenas iguales aquí
        ; Por ejemplo, establecer una bandera de iguales y salir del bucle
        MOV match, 1
        ;PrintCadena prc6
        ContadorDatos
        MOV base, 10000

        ;PrintCadena bandera1

    FIN_COMPARACION:
ENDM

graf_barra_asc MACRO cadena2
    LOCAL COMPARAR_LOOP, NO_IGUALES, SON_IGUALES, FIN_COMPARACION
    mov si, offset comando + 2  ; Puntero a la primera cadena, comenzando desde el tercer byte
    mov di, offset cadena2       ; Puntero a la segunda cadena

    COMPARAR_LOOP:
        mov al, [si]         ; Carga el próximo carácter de la primera cadena en AL
        mov bl, [di]         ; Carga el próximo carácter de la segunda cadena en BL
        cmp al, bl           ; Compara los caracteres
        jne NO_IGUALES       ; Si son diferentes, salta a NO_IGUALES

        ; Si llegamos aquí, los caracteres son iguales
        ; Comprobamos si hemos llegado al final de alguna de las cadenas
        cmp al, '$'            ; Si al es 0, hemos llegado al final de cadena1
        je SON_IGUALES       ; Si sí, las cadenas son iguales
        inc si               ; Avanza al siguiente carácter de cadena1
        inc di               ; Avanza al siguiente carácter de cadena2
        jmp COMPARAR_LOOP    ; Repite el bucle

    NO_IGUALES:
        ; Si llegamos aquí, encontramos caracteres diferentes
        ; Manejar la situación de cadenas no iguales aquí
        ; Por ejemplo, establecer una bandera de no iguales y salir del bucle
        
        ;PrintCadena bandera2
        jmp FIN_COMPARACION

    SON_IGUALES:
        ; Si llegamos aquí, las cadenas son iguales
        ; Manejar la situación de cadenas iguales aquí
        ; Por ejemplo, establecer una bandera de iguales y salir del bucle
        MOV match, 1
        PrintCadena prc7

        ;PrintCadena bandera1

    FIN_COMPARACION:
ENDM

graf_barra_desc MACRO cadena2
    LOCAL COMPARAR_LOOP, NO_IGUALES, SON_IGUALES, FIN_COMPARACION
    mov si, offset comando + 2  ; Puntero a la primera cadena, comenzando desde el tercer byte
    mov di, offset cadena2       ; Puntero a la segunda cadena

    COMPARAR_LOOP:
        mov al, [si]         ; Carga el próximo carácter de la primera cadena en AL
        mov bl, [di]         ; Carga el próximo carácter de la segunda cadena en BL
        cmp al, bl           ; Compara los caracteres
        jne NO_IGUALES       ; Si son diferentes, salta a NO_IGUALES

        ; Si llegamos aquí, los caracteres son iguales
        ; Comprobamos si hemos llegado al final de alguna de las cadenas
        cmp al, '$'            ; Si al es 0, hemos llegado al final de cadena1
        je SON_IGUALES       ; Si sí, las cadenas son iguales
        inc si               ; Avanza al siguiente carácter de cadena1
        inc di               ; Avanza al siguiente carácter de cadena2
        jmp COMPARAR_LOOP    ; Repite el bucle

    NO_IGUALES:
        ; Si llegamos aquí, encontramos caracteres diferentes
        ; Manejar la situación de cadenas no iguales aquí
        ; Por ejemplo, establecer una bandera de no iguales y salir del bucle
        
        ;PrintCadena bandera2
        jmp FIN_COMPARACION

    SON_IGUALES:
        ; Si llegamos aquí, las cadenas son iguales
        ; Manejar la situación de cadenas iguales aquí
        ; Por ejemplo, establecer una bandera de iguales y salir del bucle
        MOV match, 1
        PrintCadena prc8

        ;PrintCadena bandera1

    FIN_COMPARACION:
ENDM

graf_linea MACRO cadena2
    LOCAL COMPARAR_LOOP, NO_IGUALES, SON_IGUALES, FIN_COMPARACION
    mov si, offset comando + 2  ; Puntero a la primera cadena, comenzando desde el tercer byte
    mov di, offset cadena2       ; Puntero a la segunda cadena

    COMPARAR_LOOP:
        mov al, [si]         ; Carga el próximo carácter de la primera cadena en AL
        mov bl, [di]         ; Carga el próximo carácter de la segunda cadena en BL
        cmp al, bl           ; Compara los caracteres
        jne NO_IGUALES       ; Si son diferentes, salta a NO_IGUALES

        ; Si llegamos aquí, los caracteres son iguales
        ; Comprobamos si hemos llegado al final de alguna de las cadenas
        cmp al, '$'            ; Si al es 0, hemos llegado al final de cadena1
        je SON_IGUALES       ; Si sí, las cadenas son iguales
        inc si               ; Avanza al siguiente carácter de cadena1
        inc di               ; Avanza al siguiente carácter de cadena2
        jmp COMPARAR_LOOP    ; Repite el bucle

    NO_IGUALES:
        ; Si llegamos aquí, encontramos caracteres diferentes
        ; Manejar la situación de cadenas no iguales aquí
        ; Por ejemplo, establecer una bandera de no iguales y salir del bucle
        
        ;PrintCadena bandera2
        jmp FIN_COMPARACION

    SON_IGUALES:
        ; Si llegamos aquí, las cadenas son iguales
        ; Manejar la situación de cadenas iguales aquí
        ; Por ejemplo, establecer una bandera de iguales y salir del bucle
        MOV match, 1
        PrintCadena prc9

        ;PrintCadena bandera1

    FIN_COMPARACION:
ENDM

abrir MACRO cadena2
    LOCAL COMPARAR_LOOP, NO_IGUALES, SON_IGUALES, FIN_COMPARACION
    mov si, offset comando + 2  ; Puntero a la primera cadena, comenzando desde el tercer byte
    mov di, offset cadena2       ; Puntero a la segunda cadena

    COMPARAR_LOOP:
        mov al, [si]         ; Carga el próximo carácter de la primera cadena en AL
        mov bl, [di]         ; Carga el próximo carácter de la segunda cadena en BL
        cmp al, bl           ; Compara los caracteres
        jne NO_IGUALES       ; Si son diferentes, salta a NO_IGUALES

        ; Si llegamos aquí, los caracteres son iguales
        ; Comprobamos si hemos llegado al final de alguna de las cadenas
        cmp al, '$'            ; Si al es 0, hemos llegado al final de cadena1
        je SON_IGUALES       ; Si sí, las cadenas son iguales
        inc si               ; Avanza al siguiente carácter de cadena1
        inc di               ; Avanza al siguiente carácter de cadena2
        jmp COMPARAR_LOOP    ; Repite el bucle

    NO_IGUALES:
        ; Si llegamos aquí, encontramos caracteres diferentes
        ; Manejar la situación de cadenas no iguales aquí
        ; Por ejemplo, establecer una bandera de no iguales y salir del bucle
        
        ;PrintCadena bandera2
        jmp FIN_COMPARACION

    SON_IGUALES:
        ; Si llegamos aquí, las cadenas son iguales
        ; Manejar la situación de cadenas iguales aquí
        ; Por ejemplo, establecer una bandera de iguales y salir del bucle
        MOV match, 1
        PrintCadena prc10

        ;PrintCadena bandera1

    FIN_COMPARACION:
ENDM

limpiar MACRO cadena2
    LOCAL COMPARAR_LOOP, NO_IGUALES, SON_IGUALES, FIN_COMPARACION
    mov si, offset comando + 2  ; Puntero a la primera cadena, comenzando desde el tercer byte
    mov di, offset cadena2       ; Puntero a la segunda cadena

    COMPARAR_LOOP:
        mov al, [si]         ; Carga el próximo carácter de la primera cadena en AL
        mov bl, [di]         ; Carga el próximo carácter de la segunda cadena en BL
        cmp al, bl           ; Compara los caracteres
        jne NO_IGUALES       ; Si son diferentes, salta a NO_IGUALES

        ; Si llegamos aquí, los caracteres son iguales
        ; Comprobamos si hemos llegado al final de alguna de las cadenas
        cmp al, '$'            ; Si al es 0, hemos llegado al final de cadena1
        je SON_IGUALES       ; Si sí, las cadenas son iguales
        inc si               ; Avanza al siguiente carácter de cadena1
        inc di               ; Avanza al siguiente carácter de cadena2
        jmp COMPARAR_LOOP    ; Repite el bucle

    NO_IGUALES:
        ; Si llegamos aquí, encontramos caracteres diferentes
        ; Manejar la situación de cadenas no iguales aquí
        ; Por ejemplo, establecer una bandera de no iguales y salir del bucle
        
        ;PrintCadena bandera2
        jmp FIN_COMPARACION

    SON_IGUALES:
        ; Si llegamos aquí, las cadenas son iguales
        ; Manejar la situación de cadenas iguales aquí
        ; Por ejemplo, establecer una bandera de iguales y salir del bucle
        MOV match, 1
        PrintCadena prc11
        LimpiarConsola

        ;PrintCadena bandera1

    FIN_COMPARACION:
ENDM

reporte MACRO cadena2
    LOCAL COMPARAR_LOOP, NO_IGUALES, SON_IGUALES, FIN_COMPARACION
    mov si, offset comando + 2  ; Puntero a la primera cadena, comenzando desde el tercer byte
    mov di, offset cadena2       ; Puntero a la segunda cadena

    COMPARAR_LOOP:
        mov al, [si]         ; Carga el próximo carácter de la primera cadena en AL
        mov bl, [di]         ; Carga el próximo carácter de la segunda cadena en BL
        cmp al, bl           ; Compara los caracteres
        jne NO_IGUALES       ; Si son diferentes, salta a NO_IGUALES

        ; Si llegamos aquí, los caracteres son iguales
        ; Comprobamos si hemos llegado al final de alguna de las cadenas
        cmp al, '$'            ; Si al es 0, hemos llegado al final de cadena1
        je SON_IGUALES       ; Si sí, las cadenas son iguales
        inc si               ; Avanza al siguiente carácter de cadena1
        inc di               ; Avanza al siguiente carácter de cadena2
        jmp COMPARAR_LOOP    ; Repite el bucle

    NO_IGUALES:
        ; Si llegamos aquí, encontramos caracteres diferentes
        ; Manejar la situación de cadenas no iguales aquí
        ; Por ejemplo, establecer una bandera de no iguales y salir del bucle
        
        ;PrintCadena bandera2
        jmp FIN_COMPARACION

    SON_IGUALES:
        ; Si llegamos aquí, las cadenas son iguales
        ; Manejar la situación de cadenas iguales aquí
        ; Por ejemplo, establecer una bandera de iguales y salir del bucle
        MOV match, 1
        PrintCadena prc12

        ;PrintCadena bandera1

    FIN_COMPARACION:
ENDM

info MACRO cadena2
    LOCAL COMPARAR_LOOP, NO_IGUALES, SON_IGUALES, FIN_COMPARACION
    mov si, offset comando + 2  ; Puntero a la primera cadena, comenzando desde el tercer byte
    mov di, offset cadena2       ; Puntero a la segunda cadena

    COMPARAR_LOOP:
        mov al, [si]         ; Carga el próximo carácter de la primera cadena en AL
        mov bl, [di]         ; Carga el próximo carácter de la segunda cadena en BL
        cmp al, bl           ; Compara los caracteres
        jne NO_IGUALES       ; Si son diferentes, salta a NO_IGUALES

        ; Si llegamos aquí, los caracteres son iguales
        ; Comprobamos si hemos llegado al final de alguna de las cadenas
        cmp al, '$'            ; Si al es 0, hemos llegado al final de cadena1
        je SON_IGUALES       ; Si sí, las cadenas son iguales
        inc si               ; Avanza al siguiente carácter de cadena1
        inc di               ; Avanza al siguiente carácter de cadena2
        jmp COMPARAR_LOOP    ; Repite el bucle

    NO_IGUALES:
        ; Si llegamos aquí, encontramos caracteres diferentes
        ; Manejar la situación de cadenas no iguales aquí
        ; Por ejemplo, establecer una bandera de no iguales y salir del bucle
        
        ;PrintCadena bandera2
        jmp FIN_COMPARACION

    SON_IGUALES:
        ; Si llegamos aquí, las cadenas son iguales
        ; Manejar la situación de cadenas iguales aquí
        ; Por ejemplo, establecer una bandera de iguales y salir del bucle
        MOV match, 1
        ;PrintCadena prc13
        PrintCadena salto
        PrintCadena encabezado

        ;PrintCadena bandera1

    FIN_COMPARACION:
ENDM

salir MACRO cadena2
    LOCAL COMPARAR_LOOP, NO_IGUALES, SON_IGUALES, FIN_COMPARACION
    mov si, offset comando + 2  ; Puntero a la primera cadena, comenzando desde el tercer byte
    mov di, offset cadena2       ; Puntero a la segunda cadena

    COMPARAR_LOOP:
        mov al, [si]         ; Carga el próximo carácter de la primera cadena en AL
        mov bl, [di]         ; Carga el próximo carácter de la segunda cadena en BL
        cmp al, bl           ; Compara los caracteres
        jne NO_IGUALES       ; Si son diferentes, salta a NO_IGUALES

        ; Si llegamos aquí, los caracteres son iguales
        ; Comprobamos si hemos llegado al final de alguna de las cadenas
        cmp al, '$'            ; Si al es 0, hemos llegado al final de cadena1
        je SON_IGUALES       ; Si sí, las cadenas son iguales
        inc si               ; Avanza al siguiente carácter de cadena1
        inc di               ; Avanza al siguiente carácter de cadena2
        jmp COMPARAR_LOOP    ; Repite el bucle

    NO_IGUALES:
        ; Si llegamos aquí, encontramos caracteres diferentes
        ; Manejar la situación de cadenas no iguales aquí
        ; Por ejemplo, establecer una bandera de no iguales y salir del bucle
        
        ;PrintCadena bandera2
        jmp FIN_COMPARACION

    SON_IGUALES:
        ; Si llegamos aquí, las cadenas son iguales
        ; Manejar la situación de cadenas iguales aquí
        ; Por ejemplo, establecer una bandera de iguales y salir del bucle
        LimpiarConsola
        MOV match, 1
        PrintCadena prc14
        JMP Exit
        

        ;PrintCadena bandera1

    FIN_COMPARACION:
ENDM


;---------------------------------------------------------


OpenFile MACRO
    LOCAL ErrorToOpen, ExitOpenFile
    MOV AL, 2
    MOV DX, OFFSET filename + 2
    MOV AH, 3Dh
    INT 21h

    JC ErrorToOpen

    MOV handlerFile, AX
    PrintCadena salto
    PrintCadena exitOpenFileMsg
    JMP ExitOpenFile

    ErrorToOpen:
        MOV errorCode, AL
        ADD errorCode, 48

        PrintCadena salto
        MOV warningOpen, 1
        PrintCadena errorOpenFile

        MOV AH, 02h
        MOV DL, errorCode
        INT 21h

    ExitOpenFile:
ENDM

CloseFile MACRO handler
    LOCAL ErrorToClose, ExitCloseFile
    MOV AH, 3Eh
    MOV BX, handler
    INT 21h

    JC ErrorToClose

    PrintCadena salto
    PrintCadena exitCloseFileMsg
    JMP ExitCloseFile

    ErrorToClose:
        MOV errorCode, AL
        ADD errorCode, 48

        PrintCadena salto
        PrintCadena errorCloseFile

        MOV AH, 02h
        MOV DL, errorCode
        INT 21h
    
    ExitCloseFile:
ENDM

ReadCSV MACRO handler, buffer
    LOCAL LeerByte, ErrorReadCSV, ExitReadCSV

    MOV BX, handler
    MOV CX, 1
    MOV DX, OFFSET buffer

    LeerByte:
        MOV AX, 3F00h
        INT 21h

        JC ErrorReadCSV

        INC DX
        MOV SI, DX
        SUB SI, 1

        SUB SI, OFFSET buffer

        CMP buffer[SI], 2Ch
        JNE LeerByte
        
        PUSH BX
        ConvertirNumero
        MOV DX, OFFSET buffer

        PUSH CX
        PUSH DX

        obtenerPosApuntador handler, 1, posApuntador

        POP DX
        POP CX
        POP BX
        MOV AX, posApuntador

        CMP extensionArchivo, AX
        JBE ExitReadCSV
        JMP LeerByte

    ErrorReadCSV:
        MOV errorCode, AL
        ADD errorCode, 48

        PrintCadena salto
        PrintCadena errorReadFile

        MOV AH, 02h
        MOV DL, errorCode
        INT 21h

    ExitReadCSV:
ENDM

ConvertirNumero MACRO
    LOCAL DosDigitosNum, FinConvertirNumero
    XOR AX, AX
    XOR BX, BX

    MOV DI, 0
    CMP SI, 2
    JNE UnDigitoNum

    DosDigitosNum:
        MOV AL, numCSV[DI]
        SUB AL, 48
        MOV BL, 10
        MUL BL
        INC DI

    UnDigitoNum:
        MOV BL, numCSV[DI]
        SUB BL, 48
        ADD AL, BL

    FinConvertirNumero:
        XOR BX, BX
        MOV BX, indexDatos
        MOV bufferDatos[BX], AL
        INC BX
        MOV indexDatos, BX

        MOV BX, numDatos
        INC BX
        MOV numDatos, BX
ENDM

GetSizeFile MACRO handler
    LOCAL ErrorGetSize, ExitGetSize
    obtenerPosApuntador handler, 2, extensionArchivo
    JC ErrorGetSize

    MOV extensionArchivo, AX
    obtenerPosApuntador handler, 0, posApuntador
    JC ErrorGetSize

    PrintCadena salto
    PrintCadena exitSizeFileMsg
    JMP ExitGetSize

    ErrorGetSize:
        MOV errorCode, AL
        ADD errorCode, 48

        PrintCadena salto
        PrintCadena errorSizeFile

        MOV AH, 02h
        MOV DL, errorCode
        INT 21h

    ExitGetSize:
ENDM

obtenerPosApuntador MACRO handler, posActual, bufferPos
    MOV AH, 42h
    MOV AL, posActual
    MOV BX, handler
    MOV CX, 0
    MOV DX, 0
    INT 21h

    MOV bufferPos, AX
ENDM

PedirCadena MACRO buffer
    LEA DX, buffer
    MOV AH, 0Ah
    INT 21h

    XOR BX, BX
    MOV SI, 2
    MOV BL, filename[1]
    ADD SI, BX
    MOV filename[SI], 0
ENDM

OrderData MACRO
    LOCAL for1, for2, Intercambio, terminarFor2
    XOR AX, AX
    XOR CX, CX
    XOR DX, DX

    MOV CX, numDatos
    DEC CX
    MOV DL, 0
    for1:
        PUSH CX

        MOV CX, numDatos
        DEC CX
        SUB CX, DX
        MOV BX, 0
        for2:
            MOV AL, bufferDatos[BX]
            MOV AH, bufferDatos[BX + 1]
            CMP AL, AH
            JA Intercambio
            INC BX
            LOOP for2
            JMP terminarFor2

            Intercambio:
                XCHG AL, AH
                MOV bufferDatos[BX], AL
                MOV bufferDatos[BX + 1], AH
                INC BX

            LOOP for2

        terminarFor2:
            POP CX
            INC DL
            LOOP for1
ENDM

Promedio MACRO
    LOCAL Sumatoria, CicloDecimal, ContinuarProm
    XOR AX, AX
    XOR BX, BX
    XOR CX, CX
    XOR DX, DX

    MOV CX, numDatos
    Sumatoria:
        MOV DL, bufferDatos[BX]
        ADD AX, DX
        INC BX
        MOV DX, 0
        LOOP Sumatoria
    
    MOV DX, 0
    MOV BX, numDatos
    DIV BX
    MOV entero, AX
    MOV decimal, DX
    MOV SI, 0

    CrearCadena entero, cadenaResult

    MOV cadenaResult[SI], 46
    INC SI

    CMP decimal, 0
    JNE CicloDecimal

    MOV cadenaResult[SI], 48
    INC SI
    MOV cadenaResult[SI], 48
    JMP ContinuarProm

    CicloDecimal:
        MOV AX, decimal
        MOV BX, 10
        MOV DX, 0
        MUL BX

        MOV BX, numDatos
        MOV DX, 0
        DIV BX

        MOV decimal, DX
        MOV entero, AX
        CrearCadena entero, cadenaResult
        MOV AL, cantDecimal
        INC AL
        MOV cantDecimal, AL
        CMP AL, 2
        JNE CicloDecimal

    ContinuarProm:
        MOV cantDecimal, 0
        PrintCadena salto
        PrintCadena msgPromedio
        PrintCadena cadenaResult
ENDM

CrearCadena MACRO valor, cadena
    LOCAL CICLO, DIVBASE, SALIRCC, ADDZERO, ADDZERO2

    CICLO:
        MOV DX, 0
        MOV CX, valor
        CMP CX, base
        JB DIVBASE

        MOV BX, base
        MOV AX, valor
        DIV BX
        MOV cadena[SI], AL
        ADD cadena[SI], 48
        INC SI

        MUL BX
        SUB valor, AX

        CMP base, 1
        JE SALIRCC
        
        DIVBASE:
            CMP valor, 0
            JE ADDZERO

            MOV AX, base
            MOV BX, 10
            DIV BX
            MOV base, AX
            JMP CICLO
            
            ADDZERO:
                MOV cadena[SI], 48
                INC SI
    SALIRCC:
ENDM

Maximo MACRO
    XOR AX, AX
    MOV BX, numDatos
    DEC BX
    MOV AL, bufferDatos[BX]
    MOV entero, AX
    MOV SI, 0

    CrearCadena entero, cadenaResult
    MOV cadenaResult[SI], 46
    INC SI
    MOV cadenaResult[SI], 48
    INC SI
    MOV cadenaResult[SI], 48
    INC SI
    MOV cadenaResult[SI], 36

    PrintCadena salto
    PrintCadena msgMaximo
    PrintCadena cadenaResult
ENDM

Minimo MACRO
    XOR AX, AX
    MOV AL, bufferDatos[0]
    MOV entero, AX
    MOV SI, 0

    CrearCadena entero, cadenaResult
    MOV cadenaResult[SI], 46
    INC SI
    MOV cadenaResult[SI], 48
    INC SI
    MOV cadenaResult[SI], 48
    INC SI
    MOV cadenaResult[SI], 36

    PrintCadena salto
    PrintCadena msgMinimo
    PrintCadena cadenaResult
ENDM

Mediana MACRO
    LOCAL CalcPromedio, ExitCalcMediana, CicloDecimal
    XOR AX, AX
    XOR BX, BX
    XOR DX, DX

    MOV AX, numDatos
    MOV BX, 2
    DIV BX

    MOV BX, AX

    CMP DX, 0
    JZ CalcPromedio
    
    XOR DX, DX
    MOV DL, bufferDatos[BX]
    MOV entero, DX
    MOV SI, 0

    CrearCadena entero, cadenaResult

    MOV cadenaResult[SI], 46
    INC SI
    MOV cadenaResult[SI], 48
    INC SI
    MOV cadenaResult[SI], 48
    INC SI
    MOV cadenaResult[SI], 36
    JMP ExitCalcMediana

    CalcPromedio:
        XOR AX, AX
        DEC BX
        ADD AL, bufferDatos[BX]
        ADD AL, bufferDatos[BX + 1]
        MOV DX, 0
        MOV BX, 2
        DIV BX
        MOV entero, AX
        MOV decimal, DX
        MOV SI, 0

        CrearCadena entero, cadenaResult

        MOV cadenaResult[SI], 46
        INC SI

        CMP decimal, 0
        JNE CicloDecimal

        MOV cadenaResult[SI], 48
        INC SI
        MOV cadenaResult[SI], 48
        INC SI
        MOV cadenaResult[SI], 36
        JMP ExitCalcMediana

        CicloDecimal:
            MOV AX, decimal
            MOV BX, 10
            MOV DX, 0
            MUL BX

            MOV BX, 2
            MOV DX, 0
            DIV BX

            MOV decimal, DX
            MOV entero, AX
            CrearCadena entero, cadenaResult
            MOV AL, cantDecimal
            INC AL
            MOV cantDecimal, AL
            CMP AL, 2
            JNE CicloDecimal

    ExitCalcMediana:
        MOV cantDecimal, 0
        PrintCadena salto
        PrintCadena msgMediana
        PrintCadena cadenaResult

ENDM

ContadorDatos MACRO
    XOR AX, AX
    MOV AX, numDatos
    MOV entero, AX
    MOV SI, 0

    CrearCadena entero, cadenaResult

    MOV cadenaResult[SI], 36

    PrintCadena salto
    PrintCadena msgContadorDatos
    PrintCadena cadenaResult
ENDM

BuildTablaFrecuencias MACRO
    LOCAL forDatos, saveFrecuencia, ExitModa
    XOR AX, AX
    XOR BX, BX
    XOR CX, CX
    XOR SI, SI

    MOV CX, numDatos
    MOV AH, bufferDatos[BX]
    forDatos:
        CMP AH, bufferDatos[BX]
        JNE saveFrecuencia

        INC AL
        INC BX
        LOOP forDatos

        MOV tablaFrecuencias[SI], AH
        INC SI
        MOV tablaFrecuencias[SI], AL
        INC SI 

        JMP ExitModa

        saveFrecuencia:
            MOV tablaFrecuencias[SI], AH
            INC SI
            MOV tablaFrecuencias[SI], AL
            INC SI

            MOV AH, numEntradas
            INC AH
            MOV numEntradas, AH

            MOV AH, bufferDatos[BX]
            MOV AL, 0
        
        JMP forDatos

    ExitModa:
ENDM

OrderFrecuencies MACRO
    LOCAL for1, for2, Intercambio, terminarFor2
    XOR AX, AX
    XOR BX, BX
    XOR CX, CX
    XOR DX, DX

    MOV CL, numEntradas
    DEC CX
    MOV DL, 0
    for1:
        PUSH CX

        MOV CL, numEntradas
        DEC CX
        SUB CX, DX
        MOV SI, 0
        for2:
            MOV AH, tablaFrecuencias[SI]
            MOV AL, tablaFrecuencias[SI + 1]
            MOV BH, tablaFrecuencias[SI + 2]
            MOV BL, tablaFrecuencias[SI + 3]

            CMP AL, BL
            JA Intercambio
            ADD SI, 2
            LOOP for2
            JMP terminarFor2

            Intercambio:
                XCHG AX, BX
                MOV tablaFrecuencias[SI], AH
                MOV tablaFrecuencias[SI + 1], AL
                MOV tablaFrecuencias[SI + 2], BH
                MOV tablaFrecuencias[SI + 3], BL
                ADD SI, 2

            LOOP for2
        
        terminarFor2:
            POP CX
            INC DL
            LOOP for1

ENDM

Moda MACRO
    LOCAL CicloModa, ExitCalcModa
    XOR AX, AX
    XOR BX, BX
    MOV AL, numEntradas
    MOV BL, 2
    MUL BL
    MOV DI, AX
    DEC DI

    CicloModa:
        XOR AX, AX
        XOR BX, BX

        MOV AL, tablaFrecuencias[DI] ; ? Frecuencia
        DEC DI
        MOV BL, tablaFrecuencias[DI] ; ? Valor
        DEC DI
        
        PUSH AX
        MOV entero, BX
        MOV SI, 0
        MOV base, 10000
        CrearCadena entero, cadenaResult
        MOV cadenaResult[SI], 36

        PrintCadena salto
        PrintCadena msgModa1
        PrintCadena cadenaResult
        POP AX
        MOV entero, AX
        
        PUSH AX
        MOV SI, 0
        MOV base, 10000

        CrearCadena entero, cadenaResult
        MOV cadenaResult[SI], 36

        PrintCadena salto
        PrintCadena msgModa2
        PrintCadena cadenaResult

        POP AX
        
        CMP AL, tablaFrecuencias[DI]
        JA ExitCalcModa
        JMP CicloModa

    ExitCalcModa:
ENDM

PrintTablaFrecuencias MACRO
    LOCAL tabla, ExitPrintTabla
    PrintCadena salto
    PrintCadena msgEncabezadoTabla
    PrintCadena salto

    XOR AX, AX
    XOR BX, BX
    MOV AL, numEntradas
    MOV CX, AX
    MOV BL, 2
    MUL BL
    MOV DI, AX
    DEC DI

    tabla:
        PUSH CX
        XOR AX, AX
        XOR BX, BX

        MOV AL, tablaFrecuencias[DI]
        DEC DI
        MOV BL, tablaFrecuencias[DI]  
        DEC DI

        PUSH AX
        MOV entero, BX
        MOV SI, 0
        MOV base, 10000
        CrearCadena entero, cadenaResult
        MOV cadenaResult[SI], 36
        PrintCadena espacios
        PrintCadena cadenaResult

        POP AX
        MOV entero, AX
        
        MOV SI, 0
        MOV base, 10000
        CrearCadena entero, cadenaResult
        MOV cadenaResult[SI], 36
        PrintCadena espacios

        MOV AH, 2
        MOV DL, 124
        INT 21h

        PrintCadena espacios
        PrintCadena cadenaResult
        PrintCadena salto

        POP CX
        DEC CX
        CMP CX, 0
        JE ExitPrintTabla
        JMP tabla

    ExitPrintTabla:
ENDM

IngresarComando MACRO comand
    MOV AH, 09h         ; Función de impresión de cadena
    LEA DX, mensajeComando     ; Carga la dirección del mensaje
    INT 21h             ; Llama a la interrupción del DOS

    MOV AH, 0Ah         ; Función de lectura de cadena
    LEA DX, comand      ; Carga la dirección de la cadena
    INT 21h             ; Llama a la interrupción del DOS
    
ENDM

PedirComando MACRO buffer
    XOR DX, DX
    XOR BX, BX

    LEA DX, buffer
    MOV AH, 0Ah
    INT 21h

    MOV SI, 2
    MOV BL, comando[1]
    ADD SI, BX
    MOV comando[SI], '$'
ENDM


; * CODIGO DE EJEMPLO PARA LA LECTURA DE UN CSV
.MODEL small
.STACK 100h
.DATA
    handlerFile         dw ?
    filename            db 30 dup(32)
    bufferDatos         db 300 dup (?)
    errorCode           db ?
    errorOpenFile       db "Ocurrio Un Error Al Abrir El Archivo - ERRCODE: ", "$"
    errorCloseFile      db "Ocurrio Un Error Al Cerrar El Archivo - ERRCODE: ", "$"
    errorReadFile       db "Ocurrio Un Error Al Leer El CSV - ERRCODE: ", "$"
    errorSizeFile       db "Ocurrio Un Error Obteniendo El Size Del Archivo - ERRCODE: ", "$"
    exitOpenFileMsg     db "El Archivo Se Abrio Correctamente", "$"
    exitCloseFileMsg    db "El Archivo Se Cerro Correctamente", "$"
    exitSizeFileMsg     db "Se Obtuvo La Longitud Correctamente", "$"
    msgToRequestFile    db "Ingrese El Nombre Del Archivo CSV: ", "$"
    msgPromedio         db "El Promedio De Los Datos Es: ", "$"
    msgMaximo           db "El Valor Maximo De Los Datos Es: ", "$"
    msgMinimo           db "El Valor Minimo De Los Datos Es: ", "$"
    msgMediana          db "El Valor De la Mediana De Los Datos Es: ", "$"
    msgContadorDatos    db "El Total De Datos Utilizados Ha Sido De: ", "$"
    msgModa1            db "La Moda De Los Datos Es: ", "$"
    msgModa2            db "Con Una Frecuencia De: ", "$"
    msgEncabezadoTabla  db "-> Valor    -> Frecuencia", "$"
    salto               db 10, 13, "$"
    espacios            db 32, 32, 32, 32, 32, "$"
    numCSV              db 3 dup(?)
    cadenaResult        db 6 dup("$")
    tablaFrecuencias    db 100 dup(?)
    numEntradas         db 1
    indexDatos          dw 0
    extensionArchivo    dw 0
    posApuntador        dw 0
    numDatos            dw 0
    base                dw 10000
    entero              dw ?
    decimal             dw ?
    cantDecimal         db 0

    encabezado db "ARQUITECTURA DE COMPUTADORES Y ENSAMBLADORES 1 A",10,13,"PRIMER SEMESTRE 2024",10,13,"Julio Alfredo Fernandez Rodriguez",10,13,"201902416",10,13,"Proyecto 2 Assembler",10,13,"$"

    match db 0

    comand1             db "prom", "$"
    prc1                db "Procesando promedio.....", "$"

    comand2             db "mediana", "$"
    prc2                db "Procesando mediana.....", "$"

    comand3             db "moda", "$"
    prc3                db "Procesando moda.....", "$"
    
    comand4             db "max", "$"
    prc4                db "Procesando max.....", "$"
    
    comand5             db "min", "$"
    prc5                db "Procesando min.....", "$"

    comand6             db "contador", "$"
    prc6                db "Procesando contador.....", "$"

    comand7             db "graf_barra_asc", "$"
    prc7                db "Procesando graf_barra_asc.....", "$"

    comand8             db "graf_barra_desc", "$"
    prc8                db "Procesando graf_barra_desc.....", "$"

    comand9             db "graf_linea", "$"
    prc9                db "Procesando graf_linea.....", "$"

    comand10             db "abrir_nombreArchivo.csv", "$"
    prc10                db "Procesando abrir_nombreArchivo.csv.....", "$"

    comand11             db "limpiar", "$"
    prc11                db "Procesando limpiar.....", "$"

    comand12             db "reporte", "$"
    prc12                db "Procesando reporte.....", "$"

    comand13             db "info", "$"
    prc13                db "Procesando info.....", "$"

    comand14             db "salir", "$"
    prc14                db "Procesando salir.....", "$"

    warning             db "Comando no valido", "$"
    warningOpen         db 0

    mensajeComando      db "Ingrese un comando:", "$"
    comando             db 10 dup(32) ,"$"

.CODE
    MOV AX, @data
    MOV DS, AX

    Main PROC
    Open:
        MOV warningOpen, 0
        LimpiarConsola
        PrintCadena msgToRequestFile
        PedirCadena filename

        ; * Extraer Informacion Del CSV
        OpenFile
        CMP warningOpen,1
        JE Open
        
        GetSizeFile handlerFile
        ReadCSV handlerFile, numCSV
        CloseFile handlerFile

        ;  Ordenar Datos - Ordenamiento Burbuja
        OrderData
        LimpiarConsola

        PrintCadena exitOpenFileMsg


        init:
            MOV match, 0
            PrintCadena salto
            PrintCadena mensajeComando
            PedirComando comando
            PrintCadena salto
            
            prom comand1

            CMP match, 1
            JNE no_prom

            LimpiarComando
            JMP init

        no_prom:
            medianaC comand2
            
            CMP match, 1
            JNE no_mediana

            LimpiarComando
            JMP init

        no_mediana:
            modaC comand3

            CMP match, 1
            JNE no_moda

            LimpiarComando
            JMP init

        no_moda:
            max comand4

            CMP match, 1
            JNE no_max

            LimpiarComando
            JMP init

        no_max:
            min comand5

            CMP match, 1
            JNE no_min

            LimpiarComando
            JMP init

        no_min:
            contador comand6

            CMP match, 1
            JNE no_contador

            LimpiarComando
            JMP init
        
        no_contador:
            graf_barra_asc comand7

            CMP match, 1
            JNE no_graf_barra_asc

            LimpiarComando
            JMP init

        no_graf_barra_asc:
            graf_barra_desc comand8

            CMP match, 1
            JNE no_graf_barra_desc

            LimpiarComando
            JMP init
        
        no_graf_barra_desc:
            graf_linea comand9

            CMP match, 1
            JNE no_graf_linea

            LimpiarComando
            JMP init
        
        no_graf_linea:
            abrir comand10

            CMP match, 1
            JNE no_abrir

            LimpiarComando
            JMP init
        
        no_abrir:
            limpiar comand11

            CMP match, 1
            JNE no_limpiar

            LimpiarComando
            JMP init

        no_limpiar:
            reporte comand12

            CMP match, 1
            JNE no_reporte

            LimpiarComando
            JMP init

        no_reporte:
            info comand13

            CMP match, 1
            JNE no_info

            LimpiarComando
            JMP init
        
        no_info:
            salir comand14

            CMP match, 1
            JNE error


            LimpiarComando
            JMP init

        error:
            PrintCadena salto
            PrintCadena warning
            LimpiarComando
            JMP init

        Exit:
            MOV AX, 4C00h
            INT 21h



        ; ; * Maximo
        ; Maximo
        ; MOV base, 10000

        ; ; * Minimo
        ; Minimo
        ; MOV base, 10000

        ; ; * Mediana
        ; Mediana
        ; MOV base, 10000

        ; ; * Contador De Datos
        ; ContadorDatos
        ; MOV base, 10000

        ; ; * Construir Tabla De Frecuencias
        ; BuildTablaFrecuencias
        ; OrderFrecuencies
        ; MOV base, 10000

        ; ; * Moda
        ; Moda
        ; MOV base, 10000

        ; ; * Print Tabla Frecuencias
        ; PrintTablaFrecuencias
        

    Main ENDP
END
