;Filename: EXAM29.ASM
;First Semester SY 2024-2025
;Student Name: JOHN DYMIER BORGONIA
;Date: September 29, 2024

.model small
.stack 100
.data
    num1 dw ?
    num2 dw ?
    ans dw ?
    rem dw ?

    input_n1 db 'Enter first number: $'
    input_n2 db 'Enter second number: $'
    display_ans db 'Quotient: $'
    display_rem db 'Remainder: $'

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
    SUB AX, '0' ; Convert ASCII to numeric
    MOV num1, AX

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
    SUB AX, '0' ; Convert ASCII to numeric
    MOV num2, AX

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    ; divide the integers
    MOV DX, 0 ; Clear the high byte of the product
    MOV AX, num1
    DIV num2
    MOV ans, AX
    MOV rem, DX

    ; Outputs the answer
    mov dx,OFFSET display_ans   
    mov ah,9                   
    int 21h 

    MOV AH, 02H
    MOV DX, ans
    ADD DX, '0' ; Convert numeric to ASCII
    INT 21H

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    ; Outputs the remainder
    mov dx,OFFSET display_rem   
    mov ah,9                   
    int 21h 

    MOV AH, 02H
    MOV DX, rem
    ADD DX, '0' ; Convert numeric to ASCII
    INT 21H

    ; Exit the program
    MOV AH, 4CH
    INT 21H
END START