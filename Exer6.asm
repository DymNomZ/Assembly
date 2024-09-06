; Exercise No. 6
; JOHN DYMIER O. BORGONIA

.model small
.code
.stack 100
start:

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
