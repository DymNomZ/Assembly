; Filename: ADDIGITS.ASM
; Programmer Name: JOHN DYMIER O. BORGONIA
; Program Description: To find the sum of individual digits of a given number. Shows character to binary conversion of digits.
; Date Created: OCTOBER 25, 2024

.MODEL SMALL
.STACK 100H

.DATA

    text1 db 'Filename: ADDIGITS.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: To find the sum of individual digits of a given number. Shows character to binary conversion of digits.$'
	text4 db 'Date Created: October 25, 2024$'

    number_prompt DB 'Please type a number (<11 digits): ', 0
    out_msg DB 'The sum of individual digits is: ', 0
    number 11 DUP (?)

.CODE
INCLUDE io.mac

main PROC
    .STARTUP

Main:
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

    PutStr number_prompt ; request an input number
    GetStr number, 11 ; read input number as a string
    nwln

    mov BX, OFFSET number ; BX = address of number

repeat_add:
    sub DX, DX ; DX = 0 --- DL keeps the sum

    mov AL, [BX] ; move the digit to AL
    cmp AL, 0 ; if it is the NULL character
    je done ; sum is done

    and AL, OFH ; mask off the upper 4 bits
    add DL, AL ; add the digit to sum
    inc BX ; increment BX to point to next digit
    jmp repeat_add ; and jump back

done:
    PutStr out_msg ; write sum
    PutInt DX
    nwln

    .EXIT

main ENDP
END