; Filename: Demo.asm
; Displaying single characters, numbers, and symbols
; Name: John Dymier O. Borgonia
; Date: August 30, 2024

.model small
.code
.stack 100
start:

	mov ah, 02h
	mov cl, 48h ; H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 45h
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 4Ch
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 4Ch
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 4Fh
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 57h ; W
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 4Fh
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 52h
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 4Ch
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 44h
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 21h
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 54h ; T
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 48h
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 41h
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 4Eh
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 4Bh
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 59h ; Y
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 4Fh
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 55h
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 21h
	mov dl, cl
	int 21h

int 27h ; terminate
end start ; end program