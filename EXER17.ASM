; Filename: EXER17.ASM

; Programmer Name: JOHN DYMIER O. BORGONIA

; Date: SEPTEMBER 20, 2024

; Description: This assembly language program will get string input and

; display back string.


.MODEL small

.STACK 100h

.DATA

    text1 db 'Filename: EXER17.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Get string input and display back string.$'
	text4 db 'Date Created: September 20, 2024$'

MAXIMUM_STRING_LENGTH EQU 1000

StringInput DB MAXIMUM_STRING_LENGTH DUP (?)

InputPrompt DB 'Enter text: $'


.CODE

ProgramStart:

    mov ax,@data

    mov ds,ax       ; set DS to point to the data segment

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


    mov dx,OFFSET InputPrompt

    mov ah,9

    int 21h


    mov ah,3fh      ; DOS read from handle function

    mov bx,0        ; standard input handle

    mov cx,MAXIMUM_STRING_LENGTH    ; read up to maximum number of characters


    mov dx,OFFSET StringInput   ; store the string here

    int 21h                     ; get the string

    and ax,ax                   ; were any character read?

    jz Done                     ; no, so you're done

    mov cx,ax                   ; put string length in CX where

                                ; you can use it as a counter


    push cx                     ; save the string length

    mov bx,OFFSET StringInput


    pop cx                      ; get back the string length

    mov ah,40h                  ; DOS write from handle function

    mov bx,1                    ; standard output handle

    mov dx,OFFSET StringInput   ; prepare to print the string

    int 21h                     ; print the string


Done:

    mov ah,4ch                  ; DOS terminate program function

    int 21h                     ; terminate the program

END ProgramStart