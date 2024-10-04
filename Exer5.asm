; Exercise No. 5
; JOHN DYMIER O. BORGONIA

.model small
.stack 100h
.data
	text1 db 'Filename: EXER5.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Display red cross with blue background$'
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
	mov bl,11h ; BLUE
	mov cx, 11;
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
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,11h ; BLUE
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
	mov bl,44h ; RED
	mov cx, 3;
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

	mov ah,09h
	mov bl,11h ; BLUE
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
	mov bl,11h ; BLUE
	mov cx, 1;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,44h ; RED
	mov cx, 9;
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

	mov ah,09h
	mov bl,11h ; BLUE
	mov cx, 1;
	int 10h

	mov ah,02h
	mov cl,20h ; space
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,11h ; BLUE
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
	mov bl,44h ; RED
	mov cx, 3;
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

	mov ah,09h
	mov bl,11h ; BLUE
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
	mov bl,11h ; BLUE
	mov cx, 11;
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



int 27h ; terminate
end start ; end program
