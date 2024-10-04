.model small
.stack 100
.data
	text1 db 'Filename: EXER11.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: ATM Display$'
	text4 db 'Date Created: September 6, 2024$'

    horiB   db "________________________________________________________________________ $"
    vertiB  db "|                                                                       |$"
    bank    db "|                   Dear Customer, Welcome to Bank Dimes                |$"
    
    b0      db "| _________________________                 ___________________________ |$"
    butn1   db "||    <  Withdrawal        |               |          Payment      >   ||$"
    b1      db "||_________________________|               |___________________________||$"
    butn2   db "||    <  Balance Inqry     |               |      Recent Transctns >   ||$"
    butn3   db "||    <  Transfer          |               |  Credit Card Opertns  >   ||$"
    butn4   db "||    <  Change PIN        |               |          Deposit      >   ||$"

.code

start:

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


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


	lea dx, horiB

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


	lea dx, vertiB

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


	lea dx, bank

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


	lea dx, vertiB

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


	lea dx, b0

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


	lea dx, butn1

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


	lea dx, b1

	mov ah, 09

	int 21h


    mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


	lea dx, b0

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


	lea dx, butn2

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


	lea dx, b1

	mov ah, 09

	int 21h


    mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


    lea dx, b0

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


	lea dx, butn3

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


	lea dx, b1

	mov ah, 09

	int 21h


    mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


    lea dx, b0

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


	lea dx, butn4

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


	lea dx, b1

	mov ah, 09

	int 21h


    mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


	lea dx, vertiB

	mov ah, 09

	int 21h


    mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 73                                

int 10h


	lea dx, horiB

	mov ah, 09

	int 21h


    mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


int 27h   ; terminate
end start ; end program