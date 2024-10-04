; Exercise No. 6
; JOHN DYMIER O. BORGONIA

.model small
.stack 100h
.data
	text1 db 'Filename: EXER6.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Display I <3 U with blinking heart$'
	text4 db 'Date Created: August 30, 2024$'

.code
start:
	MOV AX, @data
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

	mov ah,09h
	mov bl,0Eh ; YELLOW
	mov cx, 1;
	int 10h

	mov ah,02h
	mov cl,49h ; I
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,84h ; RED
	mov cx, 1;
	int 10h

	mov ah,2
	mov dl,03h ; HEART EMOJI
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,0Eh ; YELLOW
	mov cx, 1;
	int 10h

	mov ah,02h
	mov cl,55h ; U
	mov dl,cl
	int 21h


int 27h ; terminate
end start ; end program
; Exercise No. 6
; JOHN DYMIER O. BORGONIA

.model small
.stack 100h
.data
	text1 db 'Filename: EXER6.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Display I <3 U with blinking heart$'
	text4 db 'Date Created: August 30, 2024$'

.code
start:
	MOV AX, @data
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

	mov ah,09h
	mov bl,0Eh ; YELLOW
	mov cx, 1;
	int 10h

	mov ah,02h
	mov cl,49h ; I
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,84h ; RED
	mov cx, 1;
	int 10h

	mov ah,2
	mov dl,03h ; HEART EMOJI
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,0Eh ; YELLOW
	mov cx, 1;
	int 10h

	mov ah,02h
	mov cl,55h ; U
	mov dl,cl
	int 21h


int 27h ; terminate
end start ; end program
