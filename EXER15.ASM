; Filename: EXER15.ASM

; Programmer Name: JOHN DYMIER O. BORGONIA

; Date: SEPTEMBER 20, 2024

; Description: This assembly language program will continuously get

; character input and display back input until Enter key is pressed.


.MODEL small

.STACK 200h

.DATA
    text1 db 'Filename: EXER15.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Continuously get character input and display back character input until Enter key is pressed.$'
	text4 db 'Date Created: September 20, 2024$'

.CODE

ProgramStart:

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

    EchoLoop:

        mov ah,1        ; DOS keyboard input function

        int 21h         ; get the next key

        cmp al,13       ; was the key the Enter key?

        jz EchoDone     ; yes, so we're done echoing

        mov dl,al       ; put the character into DL

        mov ah,2        ; DOS display output function

        int 21h         ; display the character

        jmp EchoLoop    ; echo the next character

    EchoDone:

        mov ah,4ch      ; DOS terminate program function

        int 21h         ; terminate the program

END ProgramStart