; Filename: HEX2CHAR.ASM
; Programmer Name: JOHN DYMIER O. BORGONIA
; Program Description: To print the hex equivalent of ASCII character code. Demonstrates the use of xlat instruction.
; Date Created: OCTOBER 25, 2024

.MODEL SMALL
.STACK 100H

.DATA

    text1 db 'Filename: HEX2CHAR.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: To print the hex equivalent of ASCII character code. Demonstrates the use of xlat instruction.$'
	text4 db 'Date Created: October 25, 2024$'

    char_prompt DB 'Please input a character: ', 0
    out_msg1 DB 'The ASCII code of ''', 0
    out_msg2 DB '"" in hex is ', 0
    query_msg DB 'Do you want to quit (Y/N): ', 0
    translation_table DB '0123456789ABCDEF', 0

.CODE
.486

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

read_char:
    PutStr char_prompt ; request a char input
    GetCh AL ; read input character
    PutStr out_msg1
    PutCh AL
    PutStr out_msg2

    mov AH, AL ; save input character in AH
    mov BX, OFFSET translation_table ; BX = translation table
    shr AL, 4 ; move upper 4 bits to lower half
    xlatb AL ; replace AL with hex digit
    PutCh AL ; write the first hex digit

    mov AL, AH ; restore input character to AL
    and AL, OFH ; mask off upper 4 bits
    xlatb AL ; replace AL with hex digit
    PutCh AL ; write the second hex digit

    nwln
    PutStr query_msg ; query user whether to terminate
    GetCh AL ; read response
    nwln

    cmp AL, 'Y' ; if response is not 'Y',
    jne read_char ; read another character
    done:
        .EXIT ; otherwise, terminate program

main ENDP
END