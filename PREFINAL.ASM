;Filename: PREFINAL.ASM
;CS243 Lab Hands-on Pre-Final Exam
;First Semester SY 2024-2025
;Student Name: JOHN DYMIER O. BORGONIA
;Date Finished: November 15, 2024

.MODEL SMALL
.STACK 100H
.DATA

    space           DB ' $',0
    cit_u           DB ' Cebu Institute of Technology - University$'
    atm             DB ' Automatic Teller Machine$'
    programmer      DB ' Programmer: JOHN DYMIER O. BORGONIA$'
    copyright       DB ' Copyright 2024$'
    
    main_menu       DB 'Main Menu                                                                     $'
    main_menu2      DB '1. balance Inquiry                                                            $'
    main_menu3      DB '2. deposit                                                                    $'
    main_menu4      DB '3. withdrawal                                                                 $'
    main_menu5      DB '4. Exit                                                                       ',13,10
                    DB ' Enter your choice: $',13,10
    
    bal_msg     DB ' balance Inquiry',13,10
                DB ' Your current balance: P$',13,10
    dep_msg     DB ' deposit',13,10
                DB ' Enter deposit amount: P$',13,10
    wd_msg      DB ' withdrawal',13,10
                DB ' Enter withdrawal amount: P$',13,10
    dep_succ    DB ' You deposited P$'
    wd_succ     DB ' You withdrew P$'
    dot_msg     DB '.$',13,10,'$'
    
    err_choice  DB 'ERROR! Invalid choice!                                                        $',13,10
    err_bal     DB 'ERROR! Insufficient balance!                                                  $',13,10
    exit_msg    DB ' Exiting ATM',13,10,' Thank you!$'
    
    balance     DW 0    
    TEMP        DW ?    
    BUFFER      DB 6    
                DB ?
                DB 6 DUP(?)

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    CALL clear_screen

    mov ah, 06h
    xor al, al
    mov bh, 20h    ; Set Color (Green background and black font)
    xor cx, cx     
    mov dx, 184Fh  
    mov ch, 0
    mov cl, 1
    mov dl, 78
    mov dh, 3
    int 10h
    
    CALL show_title
    
menu_loop:
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    CALL display_menu
    
    MOV AH, 01H
    INT 21H
    
    CMP AL, '1'
    JZ balance_inquiry
    CMP AL, '2'
    JZ deposit
    CMP AL, '3'
    JZ withdrawal
    CMP AL, '4'
    JZ exit_program
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 0CEh   
    mov cx, 78     
    int 10h

    LEA DX, err_choice
    MOV AH, 09H
    INT 21H
    JMP menu_loop

balance_inquiry:
    JMP balance_inquiry2

deposit:
    JMP deposit2

withdrawal:
    JMP withdrawal2

exit_program:
    JMP exit_program2

balance_inquiry2:

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, bal_msg
    MOV AH, 09H
    INT 21H
    
    MOV AX, balance
    CALL display_num2
    JMP menu_loop

deposit2:
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, dep_msg
    MOV AH, 09H
    INT 21H
    
    CALL input_num
    ADD balance, AX
    
    LEA DX, dep_succ
    MOV AH, 09H
    INT 21H
    MOV AX, TEMP
    CALL display_num
    JMP menu_loop

withdrawal2:
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, wd_msg
    MOV AH, 09H
    INT 21H
    
    CALL input_num
    MOV BX, AX
    
    MOV AX, balance
    CMP AX, BX
    JB insufficient_balance
    
    SUB balance, BX
    LEA DX, wd_succ
    MOV AH, 09H
    INT 21H
    MOV AX, BX
    CALL display_num
    JMP menu_loop
    
insufficient_balance:

    LEA DX, space
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 0CEh   
    mov cx, 78     
    int 10h

    LEA DX, err_bal
    MOV AH, 09H
    INT 21H
    JMP menu_loop

exit_program2:

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, exit_msg
    MOV AH, 09H
    INT 21H
    
    MOV AH, 4CH
    INT 21H

MAIN ENDP

clear_screen PROC
    MOV AX, 0600H
    MOV BH, 07H
    MOV CX, 0000H
    MOV DX, 184FH
    INT 10H
    
    MOV AH, 02H
    MOV BH, 0
    MOV DX, 0000H
    INT 10H
    RET
clear_screen ENDP

show_title PROC
    
    LEA DX, cit_u
    MOV AH, 09H
    INT 21H
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    LEA DX, atm
    MOV AH, 09H
    INT 21H
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    LEA DX, programmer
    MOV AH, 09H
    INT 21H
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    LEA DX, copyright
    MOV AH, 09H
    INT 21H
    
    RET
show_title ENDP

input_num PROC
    PUSH BX
    PUSH CX
    PUSH DX
    
    XOR BX, BX  
    XOR CX, CX 
    
input_loop:
    MOV AH, 01H
    INT 21H
    
    CMP AL, 13  
    JE finish_input
    
    CMP AL, '0'
    JB input_loop
    CMP AL, '9'
    JA input_loop
    
    SUB AL, '0'  
    MOV CL, AL
    
    MOV AX, BX
    MOV BX, 10
    MUL BX      
    ADD AX, CX  
    MOV BX, AX
    
    JMP input_loop
    
finish_input:
    MOV AX, BX
    MOV TEMP, AX  
    
    POP DX
    POP CX
    POP BX
    RET
input_num ENDP

display_num PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV BX, 10   
    XOR CX, CX   
    
divide_loop:
    XOR DX, DX
    DIV BX
    PUSH DX      
    INC CX
    TEST AX, AX
    JNZ divide_loop
    
display_loop:
    POP DX
    ADD DL, '0'  
    MOV AH, 02H
    INT 21H
    LOOP display_loop
    
    LEA DX, dot_msg
    MOV AH, 09H
    INT 21H
    
    POP DX
    POP CX
    POP BX
    POP AX
    RET
display_num ENDP

display_num2 PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV BX, 10   
    XOR CX, CX   
    
divide_loop2:
    XOR DX, DX
    DIV BX
    PUSH DX      
    INC CX
    TEST AX, AX
    JNZ divide_loop2
    
display_loop2:
    POP DX
    ADD DL, '0'  
    MOV AH, 02H
    INT 21H
    LOOP display_loop2
    
    POP DX
    POP CX
    POP BX
    POP AX
    RET
display_num2 ENDP

display_menu PROC

    LEA DX, space
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 5Ch   ; Set Color (Purple background with red font)
    mov cx, 78     
    int 10h

    LEA DX, main_menu
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 1Dh   ; Set Color (Blue background with purple font)
    mov cx, 78     
    int 10h

    LEA DX, main_menu2
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 1Dh   ; Set Color (Blue background with purple font)
    mov cx, 78     
    int 10h

    LEA DX, main_menu3
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 1Dh   ; Set Color (Blue background with purple font)
    mov cx, 78     
    int 10h

    LEA DX, main_menu4
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 1Dh   ; Set Color (Blue background with purple font)
    mov cx, 78   
    int 10h

    LEA DX, main_menu5
    MOV AH, 09H
    INT 21H

    RET
display_menu ENDP

END MAIN
