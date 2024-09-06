; Exercise No. 5
; JOHN DYMIER O. BORGONIA

.model small
.code
.stack 100
start:

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
