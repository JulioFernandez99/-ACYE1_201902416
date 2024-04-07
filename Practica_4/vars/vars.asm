;_______________________________________1 vs.1_______________________________________



;CONTROL DEL TURNO DEL JUGADOR
turno_jugador db 01
ganador db 00
is_celda_invalida db 00

;CORDENADAS DONDE SE COLOCARA LAS OBJETOS
wallRead db 00
posXRead dw 00
posYRead dw 00
indiceTablero db 00, '$'

; COORDENADAS QUE SE INGRESAN POR TEXTO
coordenada_x db 00
coordenada_y db 00

;COORDENADAS CURSOR
coordenada_c_fila db 00
coordenada_c_columna db 00

coordenada_limpiar_fila db 00

; MENSAJES
mensaje_ingresar_coor db 'INGRESAR COORDENADAS: '
mensaje_celda_invalida db 'La celda ingresada esta ocupada'
mensaje_ganado_j1 db 'Ha ganado el jugador 1 jugando con X', '$'
mensaje_ganado_j2 db 'Ha ganado el jugador 2 jugando con O', '$'

;ENTRADA DE TEXTO
bufferEntrada db 255 dup('$')

;PAREDES TOTITO
empty_block db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
wall_one    db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 01, 01, 01, 01, 01, 01
            db     00, 00, 01, 01, 01, 01, 01, 01
            db     00, 00, 01, 01, 01, 01, 01, 01
            db     00, 00, 01, 01, 01, 01, 01, 01
            db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
wall_two    db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     01, 01, 01, 01, 01, 01, 00, 00
            db     01, 01, 01, 01, 01, 01, 00, 00
            db     01, 01, 01, 01, 01, 01, 00, 00
            db     01, 01, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
wall_three  db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
wall_four   db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     01, 01, 01, 01, 01, 01, 01, 01
            db     01, 01, 01, 01, 01, 01, 01, 01
            db     01, 01, 01, 01, 01, 01, 01, 01
            db     01, 01, 01, 01, 01, 01, 01, 01
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
wall_five   db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     01, 01, 01, 01, 01, 01, 01, 01
            db     01, 01, 01, 01, 01, 01, 01, 01
            db     01, 01, 01, 01, 01, 01, 01, 01
            db     01, 01, 01, 01, 01, 01, 01, 01
            db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
wall_six    db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
            db     01, 01, 01, 01, 01, 01, 01, 01
            db     01, 01, 01, 01, 01, 01, 01, 01
            db     01, 01, 01, 01, 01, 01, 01, 01
            db     01, 01, 01, 01, 01, 01, 01, 01
            db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
wall_ten    db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 01, 01
            db     00, 00, 01, 01, 01, 01, 01, 01
            db     00, 00, 01, 01, 01, 01, 01, 01
            db     00, 00, 01, 01, 01, 01, 01, 01
            db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
wall_eleven db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
            db     01, 01, 01, 01, 01, 01, 01, 01
            db     01, 01, 01, 01, 01, 01, 01, 01
            db     01, 01, 01, 01, 01, 01, 01, 01
            db     01, 01, 01, 01, 01, 01, 01, 01
            db     00, 00, 00, 00, 00, 00, 00, 00
            db     00, 00, 00, 00, 00, 00, 00, 00
wall_twelve db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
            db     01, 01, 01, 01, 01, 01, 00, 00
            db     01, 01, 01, 01, 01, 01, 00, 00
            db     01, 01, 01, 01, 01, 01, 00, 00
            db     01, 01, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
            db     00, 00, 01, 01, 01, 01, 00, 00
wall_fourteen   db     00, 00, 01, 01, 01, 01, 00, 00
                db     00, 00, 01, 01, 01, 01, 00, 00
                db     00, 00, 01, 01, 01, 01, 01, 01
                db     00, 00, 01, 01, 01, 01, 01, 01
                db     00, 00, 01, 01, 01, 01, 01, 01
                db     00, 00, 01, 01, 01, 01, 01, 01
                db     00, 00, 00, 00, 00, 00, 00, 00
                db     00, 00, 00, 00, 00, 00, 00, 00
wall_fifteen    db     00, 00, 01, 01, 01, 01, 00, 00
                db     00, 00, 01, 01, 01, 01, 00, 00
                db     01, 01, 01, 01, 01, 01, 00, 00
                db     01, 01, 01, 01, 01, 01, 00, 00
                db     01, 01, 01, 01, 01, 01, 00, 00
                db     01, 01, 01, 01, 01, 01, 00, 00
                db     00, 00, 00, 00, 00, 00, 00, 00
                db     00, 00, 00, 00, 00, 00, 00, 00


;FIGURA X
barrax_uno      db     01, 01, 00, 00, 00, 00, 00, 00
                db     00, 01, 01, 00, 00, 00, 00, 00
                db     00, 00, 01, 01, 00, 00, 00, 00
                db     00, 00, 00, 01, 01, 00, 00, 00
                db     00, 00, 00, 00, 01, 01, 00, 00
                db     00, 00, 00, 00, 00, 01, 01, 00
                db     00, 00, 00, 00, 00, 00, 01, 01
                db     00, 00, 00, 00, 00, 00, 00, 01

barrax_dos      db     00, 00, 00, 00, 00, 00, 01, 01
                db     00, 00, 00, 00, 00, 01, 01, 00
                db     00, 00, 00, 00, 01, 01, 00, 00
                db     00, 00, 00, 01, 01, 00, 00, 00
                db     00, 00, 01, 01, 00, 00, 00, 00
                db     00, 01, 01, 00, 00, 00, 00, 00
                db     01, 01, 00, 00, 00, 00, 00, 00
                db     01, 00, 00, 00, 00, 00, 00, 00

;FIGURA O
barrao_uno      db     01, 01, 01, 01, 01, 01, 01, 01
                db     01, 00, 00, 00, 00, 00, 00, 00
                db     01, 00, 00, 00, 00, 00, 00, 00
                db     01, 00, 00, 00, 00, 00, 00, 00
                db     01, 00, 00, 00, 00, 00, 00, 00
                db     01, 00, 00, 00, 00, 00, 00, 00
                db     01, 00, 00, 00, 00, 00, 00, 00
                db     01, 00, 00, 00, 00, 00, 00, 00

barrao_dos      db     01, 00, 00, 00, 00, 00, 00, 00
                db     01, 00, 00, 00, 00, 00, 00, 00
                db     01, 00, 00, 00, 00, 00, 00, 00
                db     01, 00, 00, 00, 00, 00, 00, 00
                db     01, 00, 00, 00, 00, 00, 00, 00
                db     01, 00, 00, 00, 00, 00, 00, 00
                db     01, 00, 00, 00, 00, 00, 00, 00
                db     01, 01, 01, 01, 01, 01, 01, 01

barrao_tres     db     01, 01, 01, 01, 01, 01, 01, 01
                db     00, 00, 00, 00, 00, 00, 00, 01
                db     00, 00, 00, 00, 00, 00, 00, 01
                db     00, 00, 00, 00, 00, 00, 00, 01
                db     00, 00, 00, 00, 00, 00, 00, 01
                db     00, 00, 00, 00, 00, 00, 00, 01
                db     00, 00, 00, 00, 00, 00, 00, 01
                db     00, 00, 00, 00, 00, 00, 00, 01

barrao_cuatro   db     00, 00, 00, 00, 00, 00, 00, 01
                db     00, 00, 00, 00, 00, 00, 00, 01
                db     00, 00, 00, 00, 00, 00, 00, 01
                db     00, 00, 00, 00, 00, 00, 00, 01
                db     00, 00, 00, 00, 00, 00, 00, 01
                db     00, 00, 00, 00, 00, 00, 00, 01
                db     00, 00, 00, 00, 00, 00, 00, 01
                db     01, 01, 01, 01, 01, 01, 01, 01

object_map db 09 dup (0)   ;3x3

;SEPARADORES
separate db '-----------------------------------------------'
separateTwo db '==============================================='


;__________________________________________Menu principal__________________________________________



; CHAR ESPECIALES
newLine db 0ah, 0dh, '$'

; DATOS PARA IMPRIMIR EN CONSOLA
datosGenerales  db 0ah,0dh, 'Universidad de San Carlos de Guatemala', 0ah,0dh, 'Facultad de Ingenieria', 0ah,0dh, 'Escuela de Ciencias y Sistemas', 0ah,0dh, 'Arquitectura de Computadores y Ensambladores 1', 0ah,0dh, 'Seccion A', 0ah,0dh, 'Julio Alfredo Fernandez Rodriguez', 0ah,0dh, '201902416', 0ah,0dh, '$'


rotuloAnimacion db 'Bienvenido a las animaciones',0ah,0dh,'$'

;MENSAJES DE CONFIRMACION O ESPERA
mesaje_presionar_enter_continuar       db   '   Presionar ENTER para continuar ','$'
; MENU's


mensaje_menu_grafico       db 'MENU GRAFICO'
opciones_menu_grafico       db ' ESC:SALIR            ENTER:SELECCIONAR'
opt1_menu_grafico db 'Nuevo Juego'
opt2_menu_grafico db 'Animacion'
opt3_menu_grafico db 'Informacion'
opt4_menu_grafico db 'Salir'

; MENSAJES MENUS
mensaje_inicio_juego db   'Iniciando Juego...','$'

enterOption  db 0ah,0dh, '   Ingresar opcion: ', '$'
enterValue  db 0ah,0dh, '   Ingresar valor: ', '$'

; PARA EL MENU GRAFICO
ACTLINE     DB  ?
ACTCOLUMN   DB  ?
FONTCOLOR   DW  ?
MARKLINE    DB  ?
MARKCOLUMN  DB  ?
MARKER      DB  ">"
PIXLINE     DW  ?
PIXCOL      DW  ?
; para pintar un cuadrado en el lienzo
SQCOLOR     DW  ?
SQHEIGHT    DB  ?
SQWIDTH     DW  ?
RECQTY      DW  0000
SPACE      DB  " "


;_________________________________________________________Menu de juego_______________________________________________________
mensaje_menu_juego db 'MENU JUEGO'
opciones_menu_juego db ' ESC:SALIR            ENTER:SELECCIONAR'
opt1_menu_juego db '1 VS CPU'
opt2_menu_juego db '1 VS 1'
opt3_menu_juego db 'Reportes'
opt4_menu_juego db 'Regresar'

rotulo1VSC db '1 VS CPU',0ah,0dh,'$'
rotulo1VS1 db '1 VS 1',0ah,0dh,'$'
rotuloReportes db 'Reportes',0ah,0dh,'$'
rotuloRegresar db 'Regresar',0ah,0dh,'$'