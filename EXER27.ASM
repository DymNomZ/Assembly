;Filename: EXER27.ASM
;First Semester SY 2024-2025
;Student Name: JOHN DYMIER BORGONIA
;Date: September 29, 2024
; Description: This program inputs two integers, subtracts the second integer 
; from the first, and displays the difference with handling for negative results.

.model small
.stack 100
.data
    text1 db 'Filename: EXER27.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Input two integers, subtract, and display their difference$'
	text4 db 'Date Created: September 29, 2024$'

    num1 dw ?
    num2 dw ?
    ans dw ?

    diffBuffer db 20 DUP ('$')
    negative db '-$'  

    input_n1 db 'Enter subtrahend: $'
    input_n2 db 'Enter minuend: $'
    display_ans db 'Difference: $'

.code

int_to_ascii:
    push ax             ; Save AX on the stack
    push bx             ; Save BX (used for division by 10)
    push cx             ; Save CX (used as a digit counter)
    push dx             ; Save DX (since we use DX in division)

    mov cx, 0           ; Initialize the digit counter to 0
    mov bx, 10          ; Set BX to 10 because 10 is for decimal division

loop1:
    xor dx, dx          ; Clear DX (DX:AX is the dividend for division)
    div bx              ; Divide AX by 10, quotient in AX, remainder in DX
    push dx             ; Push the remainder (digit) onto the stack
    inc cx              ; Increment the digit count
    cmp ax, 0           ; Check if the quotient is zero
    jne loop1           ; If not zero, continue dividing

loop2:
    pop dx              ; Pop a digit (remainder) from the stack
    add dl, '0'         ; Convert the remainder (digit) into ASCII character
    mov ah, 02h         ; DOS interrupt 21h, function 02h to print a character
    int 21h             ; Call DOS to print the character in DL
    dec cx              ; Decrement the digit counter
    cmp cx, 0           ; Check if all digits have been printed
    jne loop2           ; If not, continue printing

    pop dx              ; Restore DX from the stack
    pop cx              ; Restore CX
    pop bx              ; Restore BX
    pop ax              ; Restore AX
    ret                 ; Return from the subroutine

START:
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    mov ah, 9
	mov dx,offset text1
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 9
	mov dx,offset text2
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 9
	mov dx,offset text3
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 9
	mov dx,offset text4
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h    

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

    ; Outputs the answer
    mov dx,OFFSET display_ans   
    mov ah,9                   
    int 21h 

    ; subtract the integers
    MOV AX, num1
    SUB AX, num2
    MOV ans, AX

    ; this is to check if the result is negative
    CMP AX, 0
    JGE display_result

    ; Result is negative, update the diff to its absolute value
    NEG AX
    MOV ans, AX

    ; Display the negative sign before the result
    mov dx,OFFSET negative   
    mov ah,9                   
    int 21h 

display_result:
    ; Convert and display the result
    mov ax, ans         
    call int_to_ascii  

    ; Exit the program
    MOV AH, 4CH
    INT 21H
END START