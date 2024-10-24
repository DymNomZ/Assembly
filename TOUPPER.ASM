; Filename: TOUPPER.ASM
; Programmer Name: JOHN DYMIER O. BORGONIA
; Program Description: To convert lowercase letters to corresponding uppercase letters.
; Date Created: OCTOBER 25, 2024

.MODEL SMALL
.STACK 100H

.DATA

    text1 db 'Filename: TOUPPER.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: To convert lowercase letters to corresponding uppercase letters.$'
	text4 db 'Date Created: October 25, 2024$'

    name_prompt DB 'Please type your name: ', 0
    out_msg DB 'Your name in capitals is: ', 0
    in_name DB 31 DUP (?)

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

    PutStr name_prompt ; request character string
    GetStr in_name, 31 ; read input character string
    nwln

    PutStr out_msg ; nwln

    mov BX, OFFSET in_name ; BX = address of in_name

process_char:
    mov AL, [BX] ; move the char. to AL
    cmp AL, 0 ; if it is the NULL character
    je done ; conversion done

    cmp AL, 'a' ; if (char < 'a')
    jl not_lower_case ; not a lowercase letter
    cmp AL, 'z' ; if (char > 'z')
    jg not_lower_case ; not a lowercase letter

lower_case:
    add AL, 'A' - 'a' ; convert to uppercase

not_lower_case:
    PutCh AL ; write the character
    inc BX ; BX points to next char.
    jmp process_char ; go back to process next char.

done:
    .EXIT

main ENDP
END