; Materia: Lenguajes de Interfaz
; Nombre: Lugo Martinez Jennifer Scarlet
; Horario: 10:00-11:00 AM 
; Docente: Dr. José Luis Medina Jiménez
; Practica: PRACTICA 5 - MACROS
; Descripcion: En esta practica se aprendio a crear y utilizar macros para reutilizar instrucciones y simplificar tareas

INCLUDE Irvine32.inc

MostrarMensaje MACRO texto
    mov edx, OFFSET texto ; Copia la direccion del mensaje en EDX
    call WriteString ; Muestra el mensaje en pantalla
    call Crlf ; Realiza un salto de linea

ENDM

Multi MACRO num1, num2
    mov eax, num1 ; Copia el primer numero en EAX
    imul eax, num2 ; Multiplica EAX por el segundo numero
    call WriteInt ; Muestra el resultado en pantalla
    call Crlf ; Realiza un salto de linea

ENDM

.data

    mensajeBienvenida BYTE "Bienvenido al programa utilizando macros", 0
    mensajeFin BYTE "Adios", 0

.code

main PROC
    MostrarMensaje mensajeBienvenida ; Muestra el mensaje de bienvenida
    MostrarMensaje mensajeFin ; Muestra el mensaje de despedida

    Multi 4, 5 ; Multiplica 4 por 5 y muestra el resultado

main ENDP

END main