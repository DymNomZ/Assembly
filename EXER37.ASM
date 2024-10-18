; Filename: EXER37.ASM
; Programmer Name: JOHN DYMIER O. BORGONIA
; Date: OCTOBER 18, 2024
; Description: Create a program that inputs a character. 
; If the character  is the capital letter A, display message “You entered A.”, 
; else display “You entered not A.”

.MODEL small
.STACK 100h
.DATA

    text1 db 'Filename: EXER37.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Check if inputted character is A.$'
	text4 db 'Date Created: October 18, 2024$'

    entered_char db ?
    enter_prompt DB 'Enter a character: $'
    yes_msg LABEL BYTE
        DB 13,10,'You entered A.$'
    no_msg LABEL BYTE
        DB 13,10,'You entered not A.$'

.CODE
ProgramStart:
    mov ax,@data
    mov ds,ax           

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

    mov dx,OFFSET enter_prompt    
    mov ah,9                   
    int 21h                     

    mov ah,1                    
    int 21h                     
    mov entered_char,al

    cmp entered_char,'a'                
    jz is_a          

    cmp entered_char,'A'              
    jnz is_not_a           


is_a:
    mov dx,OFFSET yes_msg  
    jmp display_yes     

is_not_a:
    mov dx,OFFSET no_msg  
    jmp display_no 

display_yes:
    mov ah,9        
    int 21h     

    mov ah,4ch      
    int 21h        

display_no:
    mov ah,9        
    int 21h    

    mov ah,4ch      
    int 21h         
END ProgramStart