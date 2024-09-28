;Filename: EXAM26.ASM
;First Semester SY 2024-2025
;Student Name: JOHN DYMIER BORGONIA
;Date: September 29, 2024

.model small
.stack 100
.data
    num1 db ?
    num2 db ?
    sum db ?

    input_n1 db 'Enter first number: $'
    input_n2 db 'Enter second number: $'
    display_sum db 'Sum: $'

.code
START:
    MOV AX, @DATA
    MOV DS, AX

    ; Input the first integer
    mov dx,OFFSET input_n1    
    mov ah,9                   
    int 21h 

    MOV AH, 01H
    INT 21H
    SUB AL, '0' ; Convert ASCII to numeric
    MOV num1, AL

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    ; Input the second integer
    mov dx,OFFSET input_n2    
    mov ah,9                   
    int 21h 

    MOV AH, 01H
    INT 21H
    SUB AL, '0' ; Convert ASCII to numeric
    MOV num2, AL

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    ; Add the integers
    MOV AL, num1
    ADD AL, num2
    MOV sum, AL

    ; Output the sum
    mov dx,OFFSET display_sum    
    mov ah,9                   
    int 21h 

    MOV AH, 02H
    MOV DL, sum
    ADD DL, '0' ; Convert numeric to ASCII
    INT 21H

    ; Exit the program
    MOV AH, 4CH
    INT 21H
END START