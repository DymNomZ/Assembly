;Filename: EXAM30.ASM
;First Semester SY 2024-2025
;Student Name: JOHN DYMIER BORGONIA
;Date: September 29, 2024

.model small
.stack 100
.data
    num1 db ?
    num2 db ?

    input_n1 db 'Enter first number: $'
    input_n2 db 'Enter second number: $'
    larger db 'Larger: $'
    is_equal db 'They are equal $'

.code
START:
    ; Initialize data segment
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

    MOV AL, num1
    MOV AH, num2

    cmp AL, AH
    je perf_equal
    jg g_num1
    jl g_num2

perf_equal:
    mov dx,OFFSET is_equal   
    mov ah,9                   
    int 21h 

    jmp end_prog

g_num1:
    mov dx,OFFSET larger   
    mov ah,9                   
    int 21h 

    MOV AH, 02H
    MOV DL, num1
    ADD DL, '0' ; Convert numeric to ASCII
    INT 21H

    jmp end_prog

g_num2:
    mov dx,OFFSET larger   
    mov ah,9                   
    int 21h 

    MOV AH, 02H
    MOV DL, num2
    ADD DL, '0' ; Convert numeric to ASCII
    INT 21H

    jmp end_prog

end_prog:
    ; Exit the program
    MOV AH, 4CH
    INT 21H

END START