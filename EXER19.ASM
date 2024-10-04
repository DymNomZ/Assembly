; Filename: EXER19.ASM
; Programmer Name: JOHN DYMIER O. BORGONIA
; Date: SEPTEMBER 20, 2024


.MODEL small

.STACK 200h

.DATA
    text1 db 'Filename: EXER19.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Get and display three characters in different lines.$'
	text4 db 'Date Created: September 20, 2024$'

    first_char db ?
    second_char db ?
    third_char db ?

    first_input_msg db 'Enter first character: $'
    second_input_msg db 'Enter second character: $'
    third_input_msg db 'Enter third character: $'
    first_output_msg db 0dh,0ah,'The first character is $'
    second_output_msg db 0dh,0ah,'The second character is $'
    third_output_msg db 0dh,0ah,'The third character is $'

.CODE
Main:
    mov ax, @data
    mov ds, ax

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

    mov dx,offset first_input_msg
    mov ah,09h
    int 21h

    mov ah,01h          
    int 21h             
    mov first_char,al    

    mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov dx,offset second_input_msg
    mov ah,09h
    int 21h

    mov ah,01h          
    int 21h             
    mov second_char,al    

    mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov dx,offset third_input_msg
    mov ah,09h
    int 21h

    mov ah,01h          
    int 21h             
    mov third_char,al   

    mov dx,offset first_output_msg
    mov ah,09h
    int 21h

    mov dl, first_char   
    mov ah,02h          
    int 21h

    mov ah,02h
	mov cl,2Eh ; .
	mov dl,cl
	int 21h

    mov dx,offset second_output_msg
    mov ah,09h
    int 21h

    mov dl, second_char   
    mov ah,02h          
    int 21h

    mov ah,02h
	mov cl,2Eh ; .
	mov dl,cl
	int 21h

    mov dx,offset third_output_msg
    mov ah,09h
    int 21h

    mov dl, third_char   
    mov ah,02h          
    int 21h

    mov ah,02h
	mov cl,2Eh ; .
	mov dl,cl
	int 21h

    mov ax,4C00h        
    int 21h

END Main