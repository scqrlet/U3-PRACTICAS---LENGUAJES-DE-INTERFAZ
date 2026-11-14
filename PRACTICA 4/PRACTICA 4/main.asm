; Materia: Lenguajes de Interfaz
; Nombre: Lugo Martinez Jennifer Scarlet
; Horario: 10:00-11:00 AM 
; Docente: Dr. José Luis Medina Jiménez
; Practica: PRACTICA 4 - PASO DE PARAMETROS POR PILA Y MULTIPLICACION DE VALORES
; Descripcion: En esta practica se aprendio a enviar parametros mediante la pila
; acceder a ellos usando EBP y realizar una multiplicacion dentro de un procedimiento

INCLUDE Irvine32.inc

.data

.code

main PROC
    mov ebx, 10 ; Guardamos el valor 10 en EBX
    push 1 ; Enviamos el primer parametro a la pila
    push 2 ; Enviamos el segundo parametro a la pila

    call sumarPila ; Llama al procedimiento y guarda la direccion de retorno
    nop 

    exit 

main ENDP

sumarPila PROC
    push ebp ; Guarda el valor anterior de EBP en la pila
    mov ebp, esp ; Establece EBP como referencia para acceder a los parametros

    push ebx ; Guarda el valor actual de EBX para no modificarlo
    mov eax, [ebp+8] ; Obtiene el valor 2 enviado como parametro
    mov ebx, [ebp+12] ; Obtiene el valor 1 enviado como parametro

    imul eax, ebx ; Multiplica ambos valores y guarda el resultado en EAX
    pop ebx ; Recupera el valor original de EBX
    pop ebp ; Recupera el valor original de EBP

    ret 8 ; Retorna al programa principal y elimina los 2 parametros de la pila

sumarPila ENDP

END main
