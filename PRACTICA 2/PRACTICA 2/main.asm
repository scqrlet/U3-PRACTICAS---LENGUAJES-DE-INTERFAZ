; Materia: Lenguajes de Interfaz
; Nombre: Lugo Martinez Jennifer Scarlet
; Horario: 10:00-11:00 AM 
; Docente: Dr. José Luis Medina Jiménez
; Practica: PRACTICA 2 - CALL y ESP
; Descripcion: En esta practica se observo como la instruccion CALL almacena direcciones 
; de retorno en la pila y como estas pueden visualizarse mediante el registro ESP

INCLUDE Irvine32.inc

.data

.code
main PROC
    mov eax, [esp] ; Copiamos en EAX el valor almacenado en la cima de la pila
    call WriteHex ; Muestra el valor en formato hexadecimal
    call Crlf ; Realiza un salto de linea
    call procUno ; Llama al primer procedimiento
    exit 

main ENDP

procUno PROC
    mov eax, [esp] ; Copiamos en EAX la direccion de retorno almacenada por CALL
    call WriteHex ; Muestra la direccion en hexadecimal
    call Crlf ; Realiza un salto de linea
    call procDos ; Llama al segundo procedimiento

    ret ; Regresa a la instruccion siguiente desde donde fue llamado

procUno ENDP

procDos PROC
    mov eax, [esp] ; Copiamos en EAX la direccion de retorno correspondiente a procDos
    call WriteHex ; Muestra la direccion en hexadecimal
    call Crlf ; Realiza un salto de linea

    ret ; Regresa al procedimiento que realizo la llamada

procDos ENDP

END main