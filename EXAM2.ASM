;Filename: EXAM2.ASM
;CS243 Lab Hands-on Exam No. 2
;First Semester SY 2024-2025
;Student Name: JOHN DYMIER BORGONIA
;Date Finished: September 28, 2024

.model small
.stack 100
.data
    text1 db 'Filename: EXAM2.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Calculator.$'
	text4 db 'Date Created: September 28, 2024$'

    calc DB 'THE CALCULATOR ',13,10,'$'
    cret DB 'Created by: JOHN DYMIER O. BORGONIA',13,10,'$'
    date DB 'Date: September 24, 2024',13,10,'$'
    menu DB 10,'Main Menu',13,10,'$'
    a DB 'a - Addition',13,10,'$'
    s DB 's - Subtraction',13,10,'$'
    m DB 'm - Multiplication',13,10,'$'
    d DB 'd - Division',13,10,'$'
    addition DB 'Addition',13,10,'$'
    subtraction DB 'Subtraction',13,10,'$'
    multiplication DB 'Multiplication',13,10,'$'
    division DB 'Division',13,10,'$'
    eexit DB 'e - Exit',13,10,'$'
    enter_choice DB 'Enter your choice: $'

    input_f_addend DB 'Enter first addend: $'
    input_s_addend DB 'Enter second addend: $'
    f_addend DB 'First addend is: $'
    s_addend DB 'Second addend is: $'

    input_minuend DB 'Enter minuend: $'
    input_subtrahend DB 'Enter subtrahend: $'
    minuend DB 'Minuend is: $'
    subtrahend DB 'Subtrahend is: $'

    input_multiplicand DB 'Enter multiplicand: $'
    input_multiplier DB 'Enter multiplier: $'
    multiplicand DB 'Multiplicand is: $'
    multiplier DB 'Multiplier is: $'

    input_dividend DB 'Enter dividend: $'
    input_divisor DB 'Enter divisor: $'
    dividend DB 'Dividend is: $'
    divisor DB 'Divisor is: $'

    exit_prog DB 'Exit Program$'
    invalid DB 'INVALID CHOICE!$'
    thanks DB 13,10,10,'Thank you.$'

    choice DB ?
    first DB ?
    second DB ?

.CODE
program_start:
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

    mov dx,OFFSET calc    
    mov ah,9                   
    int 21h    

    mov dx,OFFSET cret    
    mov ah,9                   
    int 21h 

    mov dx,OFFSET date    
    mov ah,9                   
    int 21h    

    mov dx,OFFSET menu    
    mov ah,9                   
    int 21h 

mov ah, 09h
mov bl, 60h
mov cx, 12                                
int 10h

    mov dx,OFFSET a    
    mov ah,9                   
    int 21h 

mov ah, 09h
mov bl, 20h
mov cx, 15                               
int 10h

    mov dx,OFFSET s    
    mov ah,9                   
    int 21h 

mov ah, 09h
mov bl, 30h
mov cx, 18                                
int 10h

    mov dx,OFFSET m    
    mov ah,9                   
    int 21h 

mov ah, 09h
mov bl, 50h
mov cx, 12                                
int 10h

    mov dx,OFFSET d    
    mov ah,9                   
    int 21h    

mov ah, 09h
mov bl, 70h
mov cx, 8                                
int 10h  

    mov dx,OFFSET eexit    
    mov ah,9                   
    int 21h    

    mov dx,OFFSET enter_choice    
    mov ah,9                   
    int 21h       

    mov ah,1                    
    int 21h                     
    mov choice,al

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    cmp choice,'a'                
    je perf_addition

    cmp choice,'s'
    je perf_subtraction
    jmp cont

perf_addition:
mov ah, 09h
mov bl, 60h
mov cx, 8                                
int 10h  

    mov dx,OFFSET addition    
    mov ah,9                   
    int 21h     

    mov dx,OFFSET input_f_addend    
    mov ah,9                   
    int 21h     

    mov ah,1                    
    int 21h                     
    mov first,al   

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET input_s_addend    
    mov ah,9                   
    int 21h 

    mov ah,1                    
    int 21h                     
    mov second,al

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET f_addend    
    mov ah,9                   
    int 21h 

    mov dl, first   
    mov ah,02h          
    int 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET s_addend    
    mov ah,9                   
    int 21h 

    mov dl, second   
    mov ah,02h          
    int 21h
    
    jmp end_program

perf_subtraction:
mov ah, 09h
mov bl, 20h
mov cx, 11
int 10h  

    mov dx,OFFSET subtraction    
    mov ah,9                   
    int 21h  

    mov dx,OFFSET input_minuend    
    mov ah,9                   
    int 21h     

    mov ah,1                    
    int 21h                     
    mov first,al   

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET input_subtrahend    
    mov ah,9                   
    int 21h     

    mov ah,1                    
    int 21h                     
    mov second,al   

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET minuend    
    mov ah,9                   
    int 21h 

    mov dl, first   
    mov ah,02h          
    int 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET subtrahend    
    mov ah,9                   
    int 21h 

    mov dl, second   
    mov ah,02h          
    int 21h
    
    jmp end_program

cont:
    cmp choice,'m'                
    je perf_multiplication

    cmp choice,'d'
    je perf_division
    jmp cont2

perf_multiplication:
mov ah, 09h
mov bl, 30h
mov cx, 14                               
int 10h  

    mov dx,OFFSET multiplication    
    mov ah,9                   
    int 21h  

    mov dx,OFFSET input_multiplicand    
    mov ah,9                   
    int 21h     

    mov ah,1                    
    int 21h                     
    mov first,al   

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET input_multiplier    
    mov ah,9                   
    int 21h     

    mov ah,1                    
    int 21h                     
    mov second,al   

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET multiplicand    
    mov ah,9                   
    int 21h 

    mov dl, first   
    mov ah,02h          
    int 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET multiplier    
    mov ah,9                   
    int 21h 

    mov dl, second   
    mov ah,02h          
    int 21h
    
    jmp end_program

perf_division:
mov ah, 09h
mov bl, 50h
mov cx, 8                                
int 10h  

    mov dx,OFFSET division    
    mov ah,9                   
    int 21h  

    mov dx,OFFSET input_dividend    
    mov ah,9                   
    int 21h     

    mov ah,1                    
    int 21h                     
    mov first,al   

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET input_divisor    
    mov ah,9                   
    int 21h     

    mov ah,1                    
    int 21h                     
    mov second,al   

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET dividend    
    mov ah,9                   
    int 21h 

    mov dl, first   
    mov ah,02h          
    int 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET divisor    
    mov ah,9                   
    int 21h 

    mov dl, second   
    mov ah,02h          
    int 21h
    
    jmp end_program

cont2:
    cmp choice,'e'                
    je perf_exit 
    jnz invalid_choice

invalid_choice:
mov ah, 09h
mov bl, 0CEh
mov cx, 15                                
int 10h  

    mov dx,OFFSET invalid    
    mov ah,9                   
    int 21h  

    jmp end_program   

perf_exit:
mov ah, 09h
mov bl, 70h
mov cx, 12                               
int 10h  

    mov dx,OFFSET exit_prog    
    mov ah,9                   
    int 21h  

    jmp end_program

end_program:

    mov dx,OFFSET thanks    
    mov ah,9                   
    int 21h  

    mov ah,4ch      
    int 21h   


END program_start