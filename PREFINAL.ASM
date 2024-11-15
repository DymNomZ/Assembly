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
    main_menu2      DB '1. Balance Inquiry                                                            $'
    main_menu3      DB '2. Deposit                                                                    $'
    main_menu4      DB '3. Withdrawal                                                                 $'
    main_menu5      DB '4. Exit                                                                       ',13,10
                    DB ' Enter your choice: $',13,10
    
    bal_msg     DB ' Balance Inquiry',13,10
                DB ' Your current balance: P$',13,10
    dep_msg     DB ' Deposit',13,10
                DB ' Enter deposit amount: P$',13,10
    wd_msg      DB ' Withdrawal',13,10
                DB ' Enter withdrawal amount: P$',13,10
    dep_succ    DB ' You deposited P$'
    wd_succ     DB ' You withdrew P$'
    dot_msg     DB '.$',13,10,'$'
    
    err_choice  DB 'ERROR! Invalid choice!                                                        $',13,10
    err_bal     DB 'ERROR! Insufficient balance!                                                  $',13,10
    exit_msg    DB ' Exiting ATM',13,10,' Thank you!$'
    
    BALANCE     DW 0    
    TEMP        DW ?    
    BUFFER      DB 6    
                DB ?
                DB 6 DUP(?)

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    CALL CLEAR_SCREEN

    mov ah, 06h
    xor al, al
    mov bh, 20h    ; Set Color (Green background and black font)
    xor cx, cx     ; Upper left corner CH=row, CL=column
    mov dx, 184Fh  ; lower right corner DH=row, DL=column 
    mov ch, 0
    mov cl, 1
    mov dl, 78
    mov dh, 3
    int 10h
    
    CALL SHOW_TITLE
    
MENU_LOOP:
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

    CALL DISPLAY_MENU
    
    MOV AH, 01H
    INT 21H
    
    CMP AL, '1'
    JZ BALANCE_INQUIRY
    CMP AL, '2'
    JZ DEPOSIT
    CMP AL, '3'
    JZ WITHDRAWAL
    CMP AL, '4'
    JZ EXIT_PROGRAM
    
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
    JMP MENU_LOOP

BALANCE_INQUIRY:
    JMP BALANCE_INQUIRY2

DEPOSIT:
    JMP DEPOSIT2

WITHDRAWAL:
    JMP WITHDRAWAL2

EXIT_PROGRAM:
    JMP EXIT_PROGRAM2

BALANCE_INQUIRY2:

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, bal_msg
    MOV AH, 09H
    INT 21H
    
    MOV AX, BALANCE
    CALL DISPLAY_NUM2
    JMP MENU_LOOP

DEPOSIT2:
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, dep_msg
    MOV AH, 09H
    INT 21H
    
    CALL INPUT_NUM
    ADD BALANCE, AX
    
    LEA DX, dep_succ
    MOV AH, 09H
    INT 21H
    MOV AX, TEMP
    CALL DISPLAY_NUM
    JMP MENU_LOOP

WITHDRAWAL2:
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, wd_msg
    MOV AH, 09H
    INT 21H
    
    CALL INPUT_NUM
    MOV BX, AX
    
    MOV AX, BALANCE
    CMP AX, BX
    JB INSUFF_BALANCE
    
    SUB BALANCE, BX
    LEA DX, wd_succ
    MOV AH, 09H
    INT 21H
    MOV AX, BX
    CALL DISPLAY_NUM
    JMP MENU_LOOP
    
INSUFF_BALANCE:

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
    JMP MENU_LOOP

EXIT_PROGRAM2:

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

CLEAR_SCREEN PROC
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
CLEAR_SCREEN ENDP

SHOW_TITLE PROC
    
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
SHOW_TITLE ENDP

INPUT_NUM PROC
    PUSH BX
    PUSH CX
    PUSH DX
    
    XOR BX, BX  
    XOR CX, CX 
    
INPUT_LOOP:
    MOV AH, 01H
    INT 21H
    
    CMP AL, 13  
    JE INPUT_DONE
    
    CMP AL, '0'
    JB INPUT_LOOP
    CMP AL, '9'
    JA INPUT_LOOP
    
    SUB AL, '0'  
    MOV CL, AL
    
    MOV AX, BX
    MOV BX, 10
    MUL BX      
    ADD AX, CX  
    MOV BX, AX
    
    JMP INPUT_LOOP
    
INPUT_DONE:
    MOV AX, BX
    MOV TEMP, AX  
    
    POP DX
    POP CX
    POP BX
    RET
INPUT_NUM ENDP

DISPLAY_NUM PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV BX, 10   
    XOR CX, CX   
    
DIVIDE_LOOP:
    XOR DX, DX
    DIV BX
    PUSH DX      
    INC CX
    TEST AX, AX
    JNZ DIVIDE_LOOP
    
DISPLAY_LOOP:
    POP DX
    ADD DL, '0'  
    MOV AH, 02H
    INT 21H
    LOOP DISPLAY_LOOP
    
    LEA DX, dot_msg
    MOV AH, 09H
    INT 21H
    
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DISPLAY_NUM ENDP

DISPLAY_NUM2 PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV BX, 10   
    XOR CX, CX   
    
DIVIDE_LOOP2:
    XOR DX, DX
    DIV BX
    PUSH DX      
    INC CX
    TEST AX, AX
    JNZ DIVIDE_LOOP2
    
DISPLAY_LOOP2:
    POP DX
    ADD DL, '0'  
    MOV AH, 02H
    INT 21H
    LOOP DISPLAY_LOOP2
    
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DISPLAY_NUM2 ENDP

DISPLAY_MENU PROC

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
DISPLAY_MENU ENDP

END MAIN
