; Filename: EXER16.ASM

; Programmer Name: JOHN DYMIER O. BORGONIA

; Date: SEPTEMBER 20, 2024

; Description: This assembly language program will get character input and

; and determine if input is 'y' or 'Y' to display good morning message

; else display good afternoon message.


.MODEL small

.STACK 100h

.DATA

    text1 db 'Filename: EXER16.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Display good morning message or good afternoon message if it is past noon.$'
	text4 db 'Date Created: September 20, 2024$'

    TimePrompt DB 'Is it after 12 noon (Y/N) ?$'

    GoodMorningMessage LABEL BYTE

        DB 13,10,'Good morning, world!',13,10,'$'
    
    GoodAfternoonMessage LABEL BYTE
        DB 13,10,'Good afternoon, world!',13,10,'$'


.CODE

ProgramStart:

    mov ax,@data

    mov ds,ax                   ; set DS to point to data segment

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

    mov dx,OFFSET TimePrompt    ; point to the time prompt

    mov ah,9                    ; DOS print string function

    int 21h                     ; display time prompt


    mov ah,1                    ; DOS get character function

    int 21h                     ; get single character response


    cmp al,'y'                  ; typed lowercase 'y' for after noon?

    jz IsAfternoon          ; jz = jump if zero. Yes, it's afternoon

    cmp al,'Y'              ; types uppercase 'Y' for afternoon?

    jnz isMorning           ; no, it's before noon


IsAfternoon:
    mov dx,OFFSET GoodAfternoonMessage  ; point to the afternoon greeting


    jmp DisplayGreeting     ; point to the afternoon greeting


isMorning:
    mov dx,OFFSET GoodMorningMessage    ; point to before noon greeting


DisplayGreeting:

    mov ah,9        ; DOS print string function

    int 21h         ; display the greeting


    mov ah,4ch      ; DOS terminate program function

    int 21h         ; terminate program

END ProgramStart