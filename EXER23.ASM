; Filename: EXER23.ASM
; Programmer Name: JOHN DYMIER O. BORGONIA
; Date: SEPTEMBER 21, 2024


.MODEL small
.STACK 100h
.DATA

    text1 db 'Filename: EXER23.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Automated Teller Machine$'
	text4 db 'Date Created: September 21, 2024$'

    cit_u DB 'Cebu Institute of Technology - University',13,10,'$'
    atm DB 'Automated Teller Machine',13,10,10,'$'
    main_menu DB 'Main Menu',13,10,'$'
    word_1 DB '1 Balance Inquiry$'
    word_2 DB '2 Withdrawal$'
    word_3 DB '3 Deposit$'
    word_4 DB '4 Transfer$'
    word_5 DB '5 Bills Payment$'
    word_6 DB '6 Change Pin$'
    word_7 DB '7 Exit$'
    
    entered_num db ?
    enter_prompt DB 13,10,'Enter number of your choice: $'

    chosen DB 13,10,10,'You have chosen $'

    thanks DB 'Thank you for banking with us!',13,10,'$'
    copyright DB 'Copyright 2024',13,10,'$'
    programmer DB 'Programmer: JOHN DYMIER O. BORGONIA$'

    yes_msg LABEL BYTE
        DB 13,10,'Yes, you have entered letter A.$'
    no_msg LABEL BYTE
        DB 13,10,'No, you have not entered letter A. You entered character $'

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

    LEA DX, cit_u
    MOV AH, 09h               
    INT 21h

    LEA DX, atm
    MOV AH, 09h               
    INT 21h     

    LEA DX, main_menu
    MOV AH, 09h               
    INT 21h

    LEA DX, word_1
    MOV AH, 09h               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, word_2
    MOV AH, 09h               
    INT 21h  

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h   

    LEA DX, word_3
    MOV AH, 09h               
    INT 21h 

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, word_4
    MOV AH, 09h               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, word_5
    MOV AH, 09h               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h     

    LEA DX, word_6
    MOV AH, 09h               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h   

    LEA DX, word_7
    MOV AH, 09h               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h                    

    mov dx,OFFSET enter_prompt    
    mov ah,9                   
    int 21h                     

    mov ah,1                    
    int 21h                     
    mov entered_num,al

    cmp entered_num,'1'            
    je one

    cmp entered_num,'2'              
    je two   

    cmp entered_num,'3'                
    je three 
    jmp cont       

one:
    mov dx,OFFSET chosen    
    mov ah,9                   
    int 21h   

    mov ah,02h
    mov cl,31h ; 1
    mov dl,cl
    int 21h  

    mov ah,02h
    mov cl,20h ; space
    mov dl,cl
    int 21h  

    LEA SI, word_1 + 2     
    MOV CL, [word_1 + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, word_1 + 2     
    MOV AH, 09h               
    INT 21h  

    jmp done

two:
    mov dx,OFFSET chosen    
    mov ah,9                   
    int 21h 

    mov ah,02h
    mov cl,32h ; 2
    mov dl,cl
    int 21h  

    mov ah,02h
    mov cl,20h ; space
    mov dl,cl
    int 21h    

    LEA SI, word_2 + 2     
    MOV CL, [word_2 + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, word_2 + 2     
    MOV AH, 09h               
    INT 21h 

    jmp done

three:
    mov dx,OFFSET chosen    
    mov ah,9                   
    int 21h   

    mov ah,02h
    mov cl,33h ; 3
    mov dl,cl
    int 21h  

    mov ah,02h
    mov cl,20h ; space
    mov dl,cl
    int 21h  

    LEA SI, word_3 + 2     
    MOV CL, [word_3 + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, word_3 + 2     
    MOV AH, 09h               
    INT 21h 

    jmp done

cont:

    cmp entered_num,'4'                
    je four 

    cmp entered_num,'5'                
    je five 

    cmp entered_num,'6'                
    je six 

    cmp entered_num,'7'                
    jmp seven 
 
four:
    mov dx,OFFSET chosen    
    mov ah,9                   
    int 21h  

    mov ah,02h
    mov cl,34h ; 4
    mov dl,cl
    int 21h  

    mov ah,02h
    mov cl,20h ; space
    mov dl,cl
    int 21h   

    LEA SI, word_4 + 2     
    MOV CL, [word_4 + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, word_4 + 2     
    MOV AH, 09h               
    INT 21h 

    jmp done

five:
    mov dx,OFFSET chosen    
    mov ah,9                   
    int 21h   

    mov ah,02h
    mov cl,35h ; 5
    mov dl,cl
    int 21h  

    mov ah,02h
    mov cl,20h ; space
    mov dl,cl
    int 21h  

    LEA SI, word_5 + 2     
    MOV CL, [word_5 + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, word_5 + 2     
    MOV AH, 09h               
    INT 21h 

    jmp done

six:
    mov dx,OFFSET chosen    
    mov ah,9                   
    int 21h   

    mov ah,02h
    mov cl,36h ; 6
    mov dl,cl
    int 21h  

    mov ah,02h
    mov cl,20h ; space
    mov dl,cl
    int 21h  

    LEA SI, word_6 + 2     
    MOV CL, [word_6 + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, word_6 + 2     
    MOV AH, 09h               
    INT 21h 

    jmp done

seven:
    mov dx,OFFSET chosen    
    mov ah,9                   
    int 21h   

    mov ah,02h
    mov cl,37h ; 7
    mov dl,cl
    int 21h  

    mov ah,02h
    mov cl,20h ; space
    mov dl,cl
    int 21h  

    LEA SI, word_7 + 2     
    MOV CL, [word_7 + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, word_7 + 2     
    MOV AH, 09h               
    INT 21h 

    jmp done

done:
    mov ah,02h
    mov cl,2Eh ; .
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, thanks
    MOV AH, 09h               
    INT 21h

    LEA DX, copyright
    MOV AH, 09h               
    INT 21h

    LEA DX, programmer
    MOV AH, 09h               
    INT 21h       

    mov ah,4ch      
    int 21h         
END ProgramStart