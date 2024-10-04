; Exercise No. 9
; August 2024 Calendar
; Name: John Dymier O. Borgonia
; Date: October 4, 2024
; Experiment: Display strings of text

.model small
.stack 100h
.data
    text1 db 'Filename: EXER9.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Display August 2024 Calendar$'
	text4 db 'Date Created: October 4, 2024$'

	line   db '|---------------------------------------------------------------------|$'
	august db '|                             AUGUST 2024                             |$'
    gap    db '|         |         |         |         |         |         |         |$'

    days   db '|   MON   |   TUE   |   WED   |   THU   |   FRI   |   SAT   |   SUN   |$'

    week1  db '|       29|       30|       31|        1|        2|        3|        4|$'
    week2  db '|        5|        6|        7|        8|        9|       10|       11|$'
    week3  db '|       12|       13|       14|       15|       16|       17|       18|$'
    week4  db '|       19|       20|       21|       22|       23|       24|       25|$'
    week5  db '|       26|       27|       28|       29|       30|       31|        1|$'


.code
.startup

main1:
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

	mov ah, 9
	mov dx,offset line
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h
    
    mov ah, 9
	mov dx,offset august
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset line
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset days
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset line
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset week1
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset gap
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset gap
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset line
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset week2
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset gap
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset gap
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset line
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset week3
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset gap
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset gap
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset line
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset week4
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset gap
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset gap
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset line
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset week5
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset gap
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset gap
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

    mov ah, 9
	mov dx,offset line
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

.exit
end
