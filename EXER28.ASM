;Filename: EXER28.ASM
;First Semester SY 2024-2025
;Student Name: JOHN DYMIER BORGONIA
;Date: September 29, 2024
; Description : Make a program to input two integers, multiply the two
; integers, and display the product of the two integers.

.model small
.stack 100h
.data
    num1 dw ?
    num2 dw ?
    ans dw ?
    ans1 db 20 DUP ('$')

    input_n1 db 'Enter multiplicand: $'
    input_n2 db 'Enter multiplier: $'
    display_ans db 'Product: $'

.code

int_to_ascii:
    push ax
    push bx
    push cx
    push dx

    mov cx, 0 
    mov bx, 10 

loop1:
    xor dx, dx 
    div bx
    push dx 
    inc cx 
    cmp ax, 0 
    jne loop1

loop2:
    pop dx 
    add dl, '0' 
    mov ah, 02h 
    int 21h
    dec cx 
    cmp cx, 0 
    jne loop2

    pop dx
    pop cx
    pop bx
    pop ax
    ret

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
    MOV AH, 0
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
    SUB AL, '0' ; Convert ASCII to numeric
    MOV AH, 0
    MOV num2, AX

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    ; multiply the integers
    MOV AX, num1
    MOV DX, num2
    MUL DX
    MOV ans, AX

    ; Outputs the answer
    mov dx,OFFSET display_ans   
    mov ah,9                   
    int 21h 

    MOV AX, ans
    CALL int_to_ascii
    MOV DX, OFFSET ans1
    MOV AH, 9
    INT 21H

    ; Exit the program
    MOV AH, 4CH
    INT 21H
END START