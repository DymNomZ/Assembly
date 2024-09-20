; Filename: EXER20.ASM
; Programmer Name: JOHN DYMIER O. BORGONIA
; Date: SEPTEMBER 20, 2024


.MODEL small
.STACK 100h
.DATA

    entered_char db ?
    enter_prompt DB 'Enter a character: $'
    yes_msg LABEL BYTE
        DB 13,10,'Yes, you have entered letter A.$'
    no_msg LABEL BYTE
        DB 13,10,'No, you have not entered letter A. You entered character $'

.CODE
ProgramStart:
    mov ax,@data
    mov ds,ax                   

    mov dx,OFFSET enter_prompt    
    mov ah,9                   
    int 21h                     

    mov ah,1                    
    int 21h                     
    mov entered_char,al

    cmp entered_char,'a'                
    jz is_a          

    cmp al,'A'              
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

    mov dl, entered_char   
    mov ah,02h          
    int 21h

    mov ah,02h
	mov cl,2Eh ; .
	mov dl,cl
	int 21h         

    mov ah,4ch      
    int 21h         
END ProgramStart