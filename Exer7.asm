; Exercise No. 7
; JOHN DYMIER O. BORGONIA

.model small
.stack 100h
.data
	text1 db 'Filename: EXER7.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Display character with blinking parts$'
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

	; CREEPER FROM MINECRAFT
	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 16;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 16;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h




	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 2;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,04h ; RED
	mov cx, 4;
	int 10h

	mov ah,2
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,2
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,2
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,2
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 4;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,04h ; RED
	mov cx, 4;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 2;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 2;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,84h ; RED
	mov cx, 4;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,2Ah ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 4;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,84h ; RED
	mov cx, 4;
	int 10h

	mov ah,02h
	mov cl,2Ah ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 2;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h



	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 6;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,84h ; RED
	mov cx, 4;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 6;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h




	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 4;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,84h ; RED
	mov cx, 8;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 4;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 4;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,84h ; RED
	mov cx, 8;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 4;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h




	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 4;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,84h ; RED
	mov cx, 2;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 4;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,84h ; RED
	mov cx, 2;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,22h ; LIGHT GREEN
	mov cx, 4;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h


int 27h ; terminate
end start ; end program
