; Materia: Lenguajes de Interfaz
; Nombre: Lugo Martinez Jennifer Scarlet
; Horario: 10:00-11:00 AM 
; Docente: Dr. José Luis Medina Jiménez
; Practica: PRACTICA 1 - CALL Y RET
; Descripcion: ; Descripcion: En esta practica se aprendio el uso de procedimientos mediante las instrucciones
; CALL y RET para reutilizar codigo y controlar el flujo de ejecucion del programa

INCLUDE Irvine32.inc

.data

mensajeInicio BYTE "Inicio de programa",0
mensajeProcedimiento BYTE "Estoy dentro del procedimiento",0
mensajeFin BYTE "Fin del programa",0

.code
main PROC
    mov edx, OFFSET mensajeInicio ; Copiamos en EDX la direccion del mensaje inicial
    call WriteString ; Imprime el mensaje en pantalla
    call Crlf ; Realiza un salto de linea

    ; Primera llamada al procedimiento
    call mensajeAviso ; Transfiere la ejecucion al procedimiento mensajeAviso

    mov eax, 10 ; Guardamos el valor 10 en EAX

    ; Segunda llamada al procedimiento
    call mensajeAviso ; Vuelve a ejecutar las instrucciones del procedimiento

    mov eax, 20 ; Guardamos el valor 20 en EAX

    mov edx, OFFSET mensajeFin ; Copiamos la direccion del mensaje final
    call WriteString ; Imprime el mensaje en pantalla
    call Crlf ; Realiza un salto de linea

    exit 
main ENDP

mensajeAviso PROC
    mov edx, OFFSET mensajeProcedimiento ; Copiamos la direccion del mensaje del procedimiento
    call WriteString ; Imprime el mensaje en pantalla
    call Crlf ; Realiza un salto de linea

    ret ; Recupera la direccion de retorno y continua en la instruccion siguiente al CALL

mensajeAviso ENDP
END main