;Filename: EXER29.ASM
;First Semester SY 2024-2025
;Student Name: JOHN DYMIER BORGONIA
;Date: September 29, 2024

.model small
.stack 100h
.data
    num1 dw ?
    num2 dw ?
    ans dw ?
    ans1 db 20 DUP ('$')

    input_n1 db 'Enter dividend: $'
    input_n2 db 'Enter divisor: $'
    display_ans db 'Quotient: $'

.code

int_to_ascii:
    push ax
    push bx
    push cx
    push dx

    mov cx, 0 ; Counter for digits
    mov bx, 10 ; Base for decimal conversion

loop1:
    xor dx, dx ; Clear DX for division
    div bx ; Divide AX by 10
    push dx ; Push remainder onto stack
    inc cx ; Increment digit count
    cmp ax, 0 ; Check if quotient is zero
    jne loop1

loop2:
    pop dx ; Pop remainder from stack
    add dl, '0' ; Convert to ASCII character
    mov ah, 02h ; Function to print a character
    int 21h
    dec cx ; Decrement digit count
    cmp cx, 0 ; Check if all digits are printed
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

    ; divide the integers

    mov ax, num1
    xor dx, dx
    mov bx, num2
    div bx
    mov ans, ax

    ; Outputs the answer
    mov dx,OFFSET display_ans   
    mov ah,9                   
    int 21h 

    MOV AX, ans
    CALL int_to_ascii
    MOV DX, OFFSET ans1
    MOV AH, 9
    INT 21H

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    ; Exit the program
    MOV AH, 4CH
    INT 21H
END START