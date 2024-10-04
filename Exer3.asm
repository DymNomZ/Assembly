; Exercise No. 3
; JOHN DYMIER O. BORGONIA

.model small
.stack 100h
.data
	text1 db 'Filename: EXER3.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Displays characters$'
	text4 db 'Date Created: August 30, 2024$'

.code
start:
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

	mov ah,02h
	mov cl,30h ; 0
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,31h ; 1
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,32h ; 2
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,33h ; 3
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,34h ; 4
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,35h ; 5
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,36h ; 6
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,37h ; 7
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,38h ; 8
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,39h ; 9
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,21h ; !
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,2Ah ; *
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,23h ; #
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,24h ; $
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,25h ; %
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,5Eh ; ^
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,26h ; &
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,2Ah ; *
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,28h ; (
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,29h ; )
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,2dh ; -
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,5Fh ; _
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,2Bh ; +
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,3Dh ; =
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,7Bh ; {
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,7Dh ; }
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,5Bh ; [
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,5Dh ; ]
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,3Ch ; <
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,20h ;
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,3Fh ; ?
	mov dl,cl
	int 21h



int 27h ; terminate
end start ; end program
