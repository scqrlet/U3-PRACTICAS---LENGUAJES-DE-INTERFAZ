; Materia: Lenguajes de Interfaz
; Nombre: Lugo Martinez Jennifer Scarlet
; Horario: 10:00-11:00 AM 
; Docente: Dr. José Luis Medina Jiménez
; Practica: PRACTICA 3 - VALIDACION CADENA VACIA
; Descripcion: En esta practica se aprendio a verificar si una cadena ingresada
; por el usuario esta vacia comparando su primer caracter con el terminador nulo

INCLUDE Irvine32.inc

.data

cadena BYTE 50 DUP(0) ; Reserva 50 bytes para almacenar la cadena
msgPedir BYTE "Ingresa una cadena (Presiona Enter para dejarla vacia): ", 0
msgVacia BYTE "La cadena esta vacia", 0
msgNoVacia BYTE "La cadena no esta vacia", 0

.code
main PROC

    mov edx, OFFSET msgPedir ; Copiamos la direccion del mensaje de solicitud
    call WriteString ; Muestra el mensaje en pantalla

    mov edx, OFFSET cadena ; Direccion donde se almacenara la cadena
    mov ecx, SIZEOF cadena ; Tamaño maximo permitido
    call ReadString ; Lee la entrada del usuario

    cmp BYTE PTR [cadena], 0 ; Compara el primer caracter con 0
    je EsVacia ; Si es igual a 0, la cadena esta vacia

NoEsVacia:
    mov edx, OFFSET msgNoVacia ; Copiamos la direccion del mensaje correspondiente
    call WriteString ; Muestra el mensaje en pantalla
    call Crlf ; Realiza un salto de linea
    jmp Fin ; Salta al final del programa

EsVacia:
    mov edx, OFFSET msgVacia ; Copiamos la direccion del mensaje correspondiente
    call WriteString ; Muestra el mensaje en pantalla
    call Crlf ; Realiza un salto de linea

Fin:
    exit 

main ENDP

END main