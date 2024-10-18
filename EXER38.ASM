; Filename: EXER38.ASM
; Programmer Name: JOHN DYMIER O. BORGONIA
; Date: OCTOBER 18, 2024
; Description: Create a program that inputs a number. 
; Display the following messages depending on the value of the number entered:
; “The number is equal to 5.”
; “The number is less than 5.”
; “The number is greater than 5.”

.model small
.stack 100
.data
    text1 db 'Filename: EXER38.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Input an integer and check if it is greater, less than, or equal to 5$'
	text4 db 'Date Created: October 18, 2024$'

    num1 db ?

    input_n1 db 'Enter first number: $'
    larger db 'The number is greater than 5.$'
    smaller db 'The number is less than 5.$'
    is_equal db 'The number is equal to 5.$'

.code
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
    MOV num1, AL

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    MOV AL, num1
    MOV AH, 5

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

    jmp end_prog

g_num2:
    mov dx,OFFSET smaller   
    mov ah,9                   
    int 21h 

    jmp end_prog

end_prog:
    ; Exit the program
    MOV AH, 4CH
    INT 21H

END START