; Filename: EXER39.ASM
; Programmer Name: JOHN DYMIER O. BORGONIA
; Date: OCTOBER 18, 2024
; Description: Create a program that displays a menu for Addition, Subtraction, Multiplication, and Division. 

.model small
.stack 200h
.data

    menu DB 'MATH OPERATIONS',13,10,'$'
    a DB '1. Addition',13,10,'$'
    s DB '2. Subtraction',13,10,'$'
    m DB '3. Multiplication',13,10,'$'
    d DB '4. Division',13,10,'$'

    addition DB 'Addition',13,10,'$'
    subtraction DB 'Subtraction',13,10,'$'
    multiplication DB 'Multiplication',13,10,'$'
    division DB 'Division',13,10,'$'
    
    enter_choice DB 'Enter your choice: $'

    input_f DB 'Enter first number: $'
    input_s DB 'Enter second number: $'

    nl DB 13,10,'$'
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
    mov dx, OFFSET nl
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

    mov dx,OFFSET addition    
    CALL print_string  

    mov dx,OFFSET input_f  
    CALL print_string

    CALL get_num             
    mov first,ax  

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET input_s
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

    mov dx,OFFSET display_sum    
    CALL print_string

    mov ax, ans
    CALL int_to_ascii
    mov dx, OFFSET h_ans
    mov ah, 9
    int 21h
    
    jmp endend

perf_subtraction:

    mov dx,OFFSET subtraction    
    CALL print_string

    mov dx,OFFSET input_f    
    CALL print_string 

    CALL get_num           
    mov first,ax  

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET input_s    
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
    
    jmp endend

perf_multiplication:

    mov dx,OFFSET multiplication    
    CALL print_string

    mov dx,OFFSET input_f    
    CALL print_string    

    CALL get_num             
    mov first,ax 

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET input_s    
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

    mov dx,OFFSET display_prod    
    CALL print_string

    mov ax, ans 
    call int_to_ascii
    mov dx, offset h_ans
    mov ah, 9
    int 21h
    
    jmp endend

program_start:
    mov ax,@data
    mov ds,ax   

loop_start:
    CALL clear_screen 

    mov dx,OFFSET menu 
    CALL print_string   

    mov dx,OFFSET a    
    CALL print_string 

    mov dx,OFFSET s    
    CALL print_string 

    mov dx,OFFSET m    
    CALL print_string 

    mov dx,OFFSET d    
    CALL print_string 

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET enter_choice    
    CALL print_string      

    ; input choice
    CALL get_char

    ; choice paths
    cmp al,'1'  
    je a_a 
    cmp al,'2' 
    je s_s 
    cmp al,'3' 
    je m_m 
    cmp al,'4' 
    je perf_division
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

    mov dx,OFFSET division    
    CALL print_string

    mov dx,OFFSET input_f    
    CALL print_string    

    CALL get_num               
    mov first,AX

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    mov dx,OFFSET input_s    
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
    
    jmp endend

endend:

    mov ah,4ch      
    int 21h   

END program_start