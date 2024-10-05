;Filename: EXER32.ASM
;First Semester SY 2024-2025
;Student Name: JOHN DYMIER BORGONIA
;Date Finished: September 29, 2024
;Description: Copy your code from the 2nd Lab Hands-on Exam. Edit your
;code to perform the actual math operations and display the
;results. 

.model small
.stack 200h
.data
    text1 db 'Filename: EXER32.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Fully working Calculator$'
	text4 db 'Date Created: September 29, 2024$'

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
    press_enter DB 13,10,10,'Press ENTER to continue.$'

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

    choice DB 13,10,'$'
    first DW ?
    second DW ?
    ans DW ?
    neg_sign db '-$' 

    h_first DB 20 DUP ('$')
    h_second DB 20 DUP ('$')
    h_ans DB 20 DUP ('$')

    display_sum DB 'Sum: $'
    display_diff DB 'Difference: $'
    display_prod DB 'Product: $'
    display_quo DB 'Quotient: $'

.CODE

int_to_ascii:
    push ax
    push bx
    push cx
    push dx

    mov cx, 0 
    mov bx, 10 

loop1:
    xor dx, dx
    div bx 
    push dx 
    inc cx 
    cmp ax, 0 
    jne loop1

loop2:
    pop dx 
    add dl, '0' 
    mov ah, 02h 
    int 21h
    dec cx 
    cmp cx, 0 
    jne loop2

    pop dx
    pop cx
    pop bx
    pop ax
    ret

clear_screen:
    mov ah, 00h
    mov al, 03h
    int 10h      
    ret

print_string:
    mov ah, 09h
    mov bl, 07h
    int 21h
    ret

newline:
    mov dx, OFFSET choice
    CALL print_string
    RET

get_char:
    mov ah,01h
    int 21h
    ret

get_num:
    mov ah, 01h
    int 21h
    sub al, '0'
    mov ah, 0
    ret

perf_addition:
mov ah, 09h
mov bl, 60h
mov cx, 8                                
int 10h  

    mov dx,OFFSET addition    
    CALL print_string  

    mov dx,OFFSET input_f_addend    
    CALL print_string

    CALL get_num             
    mov first,ax  

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET input_s_addend    
    CALL print_string

    CALL get_num       
    mov second,ax

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx, first
    add dx, second
    mov ans, dx

    mov dx,OFFSET f_addend    
    CALL print_string

    mov ax, first
    CALL int_to_ascii
    mov dx, OFFSET h_first
    mov ah, 9
    int 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET s_addend    
    CALL print_string

    mov ax, second
    CALL int_to_ascii
    mov dx, OFFSET h_second
    mov ah, 9
    int 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET display_sum    
    CALL print_string

    mov ax, ans
    CALL int_to_ascii
    mov dx, OFFSET h_ans
    mov ah, 9
    int 21h

    mov dx, OFFSET press_enter
    CALL print_string

    CALL get_char
    CALL clear_screen
    
    jmp loop_start

perf_subtraction:
mov ah, 09h
mov bl, 20h
mov cx, 11
int 10h  

    mov dx,OFFSET subtraction    
    CALL print_string

    mov dx,OFFSET input_minuend    
    CALL print_string 

    CALL get_num           
    mov first,ax  

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET input_subtrahend    
    CALL print_string   

    CALL get_num             
    mov second,ax  

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx, first
    sub dx, second
    mov ans, dx

    mov dx,OFFSET minuend    
    CALL print_string 

    mov ax, first 
    call int_to_ascii
    mov dx, offset h_first
    mov ah, 9
    int 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET subtrahend    
    CALL print_string

    mov ax, second 
    call int_to_ascii
    mov dx, offset h_second
    mov ah, 9
    int 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET display_diff    
    mov ah,9                   
    int 21h 

    mov ax, ans
    cmp ax, 0
    jge display_diff_normal

    neg ax
    mov ans, ax

    mov dx, OFFSET neg_sign
    CALL print_string

display_diff_normal:
    mov ax, ans 
    call int_to_ascii
    mov dx, offset h_ans
    mov ah, 9
    int 21h
    
    mov dx, OFFSET press_enter
    CALL print_string

    CALL get_char
    CALL clear_screen
    
    jmp loop_start

perf_multiplication:
mov ah, 09h
mov bl, 30h
mov cx, 14                               
int 10h  

    mov dx,OFFSET multiplication    
    CALL print_string

    mov dx,OFFSET input_multiplicand    
    CALL print_string    

    CALL get_num             
    mov first,ax 

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET input_multiplier    
    CALL print_string

    CALL get_num           
    mov second,ax   

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov ax, first
    mov dx, second
    mul dx
    mov ans, ax

    mov dx,OFFSET multiplicand    
    CALL print_string

    mov ax, first 
    call int_to_ascii
    mov dx, offset h_first
    mov ah, 9
    int 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET multiplier    
    CALL print_string

    mov ax, second 
    call int_to_ascii
    mov dx, offset h_second
    mov ah, 9
    int 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET display_prod    
    CALL print_string

    mov ax, ans 
    call int_to_ascii
    mov dx, offset h_ans
    mov ah, 9
    int 21h
    
    mov dx, OFFSET press_enter
    CALL print_string

    CALL get_char
    CALL clear_screen
    
    jmp loop_start

program_start:
    mov ax,@data
    mov ds,ax   

loop_start:
    CALL clear_screen

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
    CALL print_string

    mov dx,OFFSET cret  
    CALL print_string  

    mov dx,OFFSET date 
    CALL print_string   

    mov dx,OFFSET menu 
    CALL print_string   

mov ah, 09h
mov bl, 60h
mov cx, 12                                
int 10h

    mov dx,OFFSET a    
    CALL print_string 

mov ah, 09h
mov bl, 20h
mov cx, 15                               
int 10h

    mov dx,OFFSET s    
    CALL print_string 

mov ah, 09h
mov bl, 30h
mov cx, 18                                
int 10h

    mov dx,OFFSET m    
    CALL print_string 

mov ah, 09h
mov bl, 50h
mov cx, 12                                
int 10h

    mov dx,OFFSET d    
    CALL print_string 

mov ah, 09h
mov bl, 70h
mov cx, 8                                
int 10h  

    mov dx,OFFSET eexit    
    CALL print_string  

    mov dx,OFFSET enter_choice    
    CALL print_string      

    ; input choice
    CALL get_char

    ; choice paths
    cmp al,'a'  
    je a_a 
    cmp al,'s' 
    je s_s 
    cmp al,'m' 
    je m_m 
    cmp al,'d' 
    je perf_division
    cmp al,'e' 
    je perf_exit
    jne invalid_choice

invalid_choice:
    CALL newline
    CALL newline

mov ah, 09h
mov bl, 0CEh
mov cx, 15                                
int 10h  

    mov dx,OFFSET invalid    
    CALL print_string

    mov dx, OFFSET press_enter
    CALL print_string

    CALL get_char
    CALL clear_screen
    
    jmp loop_start 

perf_exit:
    CALL newline
    CALL newline

mov ah, 09h
mov bl, 70h
mov cx, 12                               
int 10h  

    mov dx,OFFSET exit_prog    
    CALL print_string

    mov dx, OFFSET press_enter
    CALL print_string

    CALL get_char
    
    jmp endend

a_a:
    CALL newline
    CALL newline
    jmp perf_addition

s_s:
    CALL newline
    CALL newline
    jmp perf_subtraction

m_m:
    CALL newline
    CALL newline
    jmp perf_multiplication

perf_division:
    CALL newline
    CALL newline

mov ah, 09h
mov bl, 50h
mov cx, 8                                
int 10h  

    mov dx,OFFSET division    
    CALL print_string

    mov dx,OFFSET input_dividend    
    CALL print_string    

    CALL get_num               
    mov first,AX

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET input_divisor    
    CALL print_string   

    CALL get_num                 
    mov second,AX 

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov ax, first
    xor dx, dx
    mov bx, second
    div bx
    mov ans, ax

    mov dx,OFFSET dividend    
    CALL print_string

    mov ax, second 
    call int_to_ascii
    mov dx, offset h_second
    mov ah, 9
    int 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET divisor    
    CALL print_string

    mov ax, second 
    call int_to_ascii
    mov dx, offset h_second
    mov ah, 9
    int 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET display_quo    
    CALL print_string

    mov ax, ans 
    call int_to_ascii
    mov dx, offset h_ans
    mov ah, 9
    int 21h
    
    mov dx, OFFSET press_enter
    CALL print_string

    CALL get_char
    CALL clear_screen
    
    jmp loop_start

endend:

    mov ah,4ch      
    int 21h   


END program_start