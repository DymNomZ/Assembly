; Exercise No. 4
; JOHN DYMIER O. BORGONIA

.model small
.stack 100h
.data
	text1 db 'Filename: EXER4.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Display text with color$'
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

	mov ah, 09h
	mov bl,27h ; COLOR
	mov cx, 7;
	int 10h

	mov ah,02h
	mov cl,43h ; C
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,6Fh ; o
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,6Ch ; l
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,6Ch ; l
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,65h ; e
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,67h ; g
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,65h ; e
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 09h
	mov bl,17h ; COLOR
	mov cx, 2;
	int 10h

	mov ah,02h
	mov cl,6Fh ; o
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,66h ; f
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 09h
	mov bl,30h ; COLOR
	mov cx, 8;
	int 10h

	mov ah,02h
	mov cl,43h ; C
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,6Fh ; o
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,6Dh ; m
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,70h ; p
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,75h ; u
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,74h ; t
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,65h ; e
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,72h ; r
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 09h
	mov bl,40h ; COLOR
	mov cx, 7;
	int 10h

	mov ah,02h
	mov cl,53h ; S
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,74h ; t
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,75h ; u
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,64h ; d
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,69h ; i
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,65h ; e
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,73h ; s
	mov dl,cl
	int 21h


int 27h ; terminate
end start ; end program
