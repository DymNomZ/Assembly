.model small

.stack 100

.data

linedef db "______________________________________________________$"
mtable  db "| MULTIPLICATION TABLE                               |$"
created db "| Created by: JOHN DYMIER BORGONIA                   |$"
date    db "| Date: 09/06/2024                                   |$"
rowdef  db "|                                                    |$"
line0   db "------------------------------------------------------$"
row0    db "| x | 1 |  2 |  3 |  4 |  5 |  6 |  7 |  8 |  9 | 10 |$"
line1   db "------------------------------------------------------$"
row1    db "| 1 | 1 |  2 |  3 |  4 |  5 |  6 |  7 |  8 |  9 | 10 |$"
line2   db "------------------------------------------------------$"
row2    db "| 2 | 2 |  4 |  6 |  8 | 10 | 12 | 14 | 16 | 18 | 20 |$"
line3   db "------------------------------------------------------$"
row3    db "| 3 | 3 |  6 |  9 | 12 | 15 | 18 | 21 | 24 | 27 | 30 |$"
line4   db "------------------------------------------------------$"
row4    db "| 4 | 4 |  8 | 12 | 16 | 20 | 24 | 28 | 32 | 36 | 40 |$"
line5   db "------------------------------------------------------$"
row5    db "| 5 | 5 | 10 | 15 | 20 | 25 | 30 | 35 | 40 | 45 | 50 |$"
line6   db "------------------------------------------------------$"
row6    db "| 6 | 6 | 12 | 18 | 24 | 30 | 36 | 42 | 48 | 54 | 60 |$"
line7   db "------------------------------------------------------$"
row7    db "| 7 | 7 | 14 | 21 | 28 | 35 | 42 | 49 | 56 | 63 | 70 |$"
line8   db "------------------------------------------------------$"
row8    db "| 8 | 8 | 16 | 24 | 32 | 40 | 48 | 56 | 64 | 72 | 80 |$"
line9   db "------------------------------------------------------$"
row9    db "| 9 | 9 | 18 | 27 | 36 | 45 | 54 | 63 | 72 | 81 | 90 |$"
line10  db "------------------------------------------------------$"
row10   db "|10 |10 | 20 | 30 | 40 | 50 | 60 | 70 | 80 | 90 |100 |$"
line11  db "------------------------------------------------------$"

.code

start:

	mov ax, @data

	mov ds, ax


	lea dx, linedef

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, mtable

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, created

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, date

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, rowdef

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 54                                

int 10h

	lea dx, line0

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h

mov ah, 09h

mov bl, 20h

mov cx, 54                                

int 10h

	lea dx, row0

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 54                               

int 10h

	lea dx, line1

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h
mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, row1

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h

mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, line2

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h
mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, row2

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h

mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, line3

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h
mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, row3

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h

mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, line4

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h
mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, row4

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h

mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, line5

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h
mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, row5

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h

mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, line6

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h
mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, row6

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, line7

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h
mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, row7

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h

mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, line8

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h
mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, row8

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, line9

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h
mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, row9

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h

mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, line10

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h
mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, row10

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h

mov ah, 09h

mov bl, 20h

mov cx, 5                                

int 10h

	lea dx, line11

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h

int 27h

end start
 