; Exercise No. 8
; Displaying strings of text
; Name: John Dymier O. Borgonia
; Date: August 30, 2024
; Experiment: Display strings of text

.model small
stack 100h
.data
	text1 db 'Filename: EXER8.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Display string variables$'
	text4 db 'Date Created: August 30, 2024$'

	msg1 db 'John Dymier O. Borgonia$'
	msg2 db 'Bachelor of Science in Computer Science 2nd Year$'
	msg3 db 'College of Computer Studies$'
	msg4 db 'Cebu Institute of Technology - University$'

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
	mov dx,offset msg1
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 20h
	mov cl,0Ah
	mov dl,cl
	int 21h

	mov ah, 9
	mov dx,offset msg2
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 9
	mov dx,offset msg3
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 9
	mov dx,offset msg4
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h


.exit
end
