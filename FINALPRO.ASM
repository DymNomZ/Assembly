; Name of System: Online Food Order System (Fast Food)
; Description: The program allows users to create accounts and pick an amount of food items to order.
; Programmer: JOHN DYMIER O. BORGONIA
; Date : December 6, 2024

.MODEL SMALL
.STACK 100H
.DATA
    space       DB ' $',0
    newline     DB 13,10,'$'
    dash        DB ' - P$'
    barrier     DB ' | $'
    period      DB '.$',13,10,'$'
    exit_point  DB '!$',13,10
    header      DB '  Cebu Institute of Technology - University', 13,10
                DB '  Online Fast Food Order System',13,10
                DB '  Programmer: JOHN DYMIER O. BORGONIA',13,10
                DB '  Copyright 2024',13,10,10, '$'

    ;burger ascii art with program name :D
    branding        DB '                                __________________  ',13,10
                    DB '                               /__________________\ ',13,10
                    DB '                              {__.--;--.__.--;--.__}',13,10
                    DB '                              :MM\__/MMMMMMMMMMMMMM:',13,10
                    DB '                              :MMMMMMMMMMMMMM\__/MM:',13,10
                    DB '                               \__________________/ ',13,10
                    DB '  ________                                ___________               .___      ',13,10
                    DB '  \______ \ ___.__. _____   ____   ______ \_   _____/___   ____   __| _/______',13,10
                    DB '   | |   \ <   |  |/     \_/ __ \ /  ___/  |  ____)/  _ \ /  _ \ / __ |/  ___/',13,10
                    DB '   | |____\ \___  |  Y Y  \  ___/ \___ \   |    | (  <_> |  <_> ) /_/ |\___ \ ',13,10
                    DB '  /_______  / ____|__|_|  /\___  >____  >  \__  |  \____/ \____/\____ /____  >',13,10
                    DB '          \/\/          \/     \/     \/       \/                    \/    \/ $',13,10,13,10

    setup           DB 13,10,'  ',13,10
                    DB '  Hello there! Welcome to Dymes Foods',13,10
                    DB '  It seems like you are a new user, please sign up for an account below.$',13,10,13,10

    register_header  DB '                               ---REGISTER---$',13,10
    login_header     DB '                               ---LOGIN---$',13,10

    enter_username  DB 13,10,'                     Enter Username: $'
    enter_password  DB 13,10,'                     Enter Password: $'

    register_succ   DB 13,10,'           User Register was Successful! (Press any key to continue)$',13,10
    login_succ      DB 13,10,'                         User Login was Successful!$',13,10

    max_register      DB 13,10,' We have reached the max number of registered users! We apologize for the inconvenience.$',13,10
    username_exists   DB 13,10,' The username is already in use, please choose another one.$',13,10

    landing_header   DB ' Welcome to Dymes Fast Food Ordering System!                                  $',13,10
    landing_login    DB ' 1. Login to existing Account                                                 $',13,10
    landing_register DB ' 2. Register new Account                                                      $',13,10
    landing_exit     DB ' 3. Exit                                                                      ',13,10
                     DB ' Enter your choice: $',13,10

    menu_title     DB ' Welcome to the Main Menu!                                                    $'
    menue_makeedit DB ' 1. Make/Edit order                                                           $'
    menu_review    DB ' 2. Review existing order                                                     $'
    menu_delete    DB ' 3. Delete existing order                                                     $'
    menu_exit      DB ' 4. Exit                                                                      ',13,10
                   DB '  Enter your choice: $',13,10

    menu_error  DB ' ERROR! Invalid choice! (Press any key to continue)                            $',13,10
    login_error DB ' ERROR! Account is not recognized! (Press any key to continue)                 $',13,10

    order_pizzaenu  DB '----SELECT FAST FOOD----', 13,10
                DB '  Ice Cream   -  P99.00', 13,10
                DB '  Burger      -  P120.00', 13,10
                DB '  Fr. Chicken -  P70.00', 13,10
                DB '  Taco        -  P60.00', 13,10
                DB '  Pizza       -  P300.00$', 13,10, 13,10

    ice_cream_price  dw 99
    burger_price     dw 120
    chicken_price    dw 70 
    taco_price       dw 60
    pizza_price      dw 300

    item_amount  DB 13,10,13,10,'  Input number of an item: $'

    curr_order       DB '----YOUR CURRENT ORDER----$'
    curr_ice_cream   DB 13,10,'  Ice Cream   - $'
    curr_burger      DB 13,10,'  Burger      - $'
    curr_chicken     DB 13,10,'  Fr. Chicken - $'
    curr_taco        DB 13,10,'  Taco        - $'
    curr_pizza       DB 13,10,'  pizza       - $'

    order_ice_cream    DB 13,10,'  Ice Cream  : $'
    order_burger       DB '  Burger     : $'
    order_chicken      DB '  Fr.Chicken : $'
    order_taco         DB '  Taco       : $'
    order_pizza        DB '  Pizza      : $'
    order_total        DB 13,10,'  Your total is: P$'

    delete_order_prompt DB ' Are you sure you want to delete your order?',13,10
                        DB ' [YES (Y) / NO (N)]: $',13,10

    deleted_order_msg          DB 13,10,' ---Deleted Order---$',13,10
    cancel_delete_order_msg    DB 13,10,' ---Delete Cancelled---$',13,10

    exit_msg    DB 'Thank you for ordering! We hope you enjoy your meal!$'
    landing_exit_prompt DB ' Thank you for using the app!',13,10,' Order again soon!$'

    num_users dw 1

    def_empty_string DB 50 DUP('$')   ; debug purposes

    ;inputted values will be compared to the appropriate username and password variables to determine which account is in use
    login_username_input DB 50 DUP('$')
    login_password_input DB 50 DUP('$')

    ; variables for different users
    username1 DB 50 DUP('$')
    password1 DB 50 DUP('$')

    username2 DB 50 DUP('$')
    password2 DB 50 DUP('$')

    username3 DB 50 DUP('$')
    password3 DB 50 DUP('$')

    ; food variables for different users
    num_ice_cream1   dw 0
    num_burger1   dw 0
    num_chicken1   dw 0
    num_taco1   dw 0
    num_pizza1   dw 0

    num_ice_cream2   dw 0
    num_burger2   dw 0
    num_chicken2   dw 0
    num_taco2   dw 0
    num_pizza2   dw 0

    num_ice_cream3   dw 0
    num_burger3   dw 0
    num_chicken3   dw 0
    num_taco3   dw 0
    num_pizza3   dw 0

    total_ice_cream1  dw ?
    total_burger1  dw ? 
    total_chicken1  dw ? 
    total_taco1  dw ? 
    total_pizza1  dw ?

    total_ice_cream2  dw ?
    total_burger2  dw ? 
    total_chicken2  dw ? 
    total_taco2  dw ? 
    total_pizza2  dw ? 

    total_ice_cream3  dw ?
    total_burger3  dw ? 
    total_chicken3  dw ? 
    total_taco3  dw ? 
    total_pizza3  dw ? 

    sum1         dw 0
    sum2         dw 0
    sum3         dw 0

    edit_order_temp dw 0

    curr_bal    DW 0    ; Current balance
    TEMP        DW ?    ; Temp num
    BUFFER      DB 6    ; Buffer for number input
                DB ?
                DB 6 DUP(?)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    CALL CLEAR_SCREEN

    ; header colors
    mov ah, 06h
    mov ch, 0 ; row start
    mov cl, 1 ; col start
    mov dh, 3  ; row end
    mov dl, 78  ; col end
    mov bh, 2Eh ; green and yellow
    int 10h

    CALL DISPLAY_HEADER
 
    CALL BRANDING_COLORS

    LEA DX, branding
    CALL DISPLAY_STRING

    ; setup message colors
    mov ah, 06h
    mov ch, 18 ; row start
    mov cl, 1 ; col start
    mov dh, 24  ; row end
    mov dl, 78  ; col end
    mov bh, 2Eh ; green and yellow
    int 10h   

    LEA DX, setup
    CALL DISPLAY_STRING

    CALL PUT_NEWLINE
    CALL PUT_NEWLINE
    CALL REGISTER_ACC1

    CALL CLEAR_SCREEN

ACC_LOOP:

    CALL CLEAR_SCREEN
    CALL COLOR_SCREEN

    ; Display account menu
    CALL DISPLAY_ACC
    
    ; Await user input
    MOV AH, 01H
    INT 21H

    ; Jumps to option
    CMP AL, '1'
    JZ PROC_LOGIN
    CMP AL, '2'
    JZ PROC_REGISTER
    CMP AL, '3'
    JZ PROC_EXIT
    
    ; Invalid choice
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    CALL DISPLAY_STRING

    CALL BLINKING_FUNC

    LEA DX, menu_error
    CALL DISPLAY_STRING

    CALL WAIT_USER_INPUT

    JMP ACC_LOOP

PROC_LOGIN:
    JMP ACC1_LOGGING

PROC_REGISTER:
    JMP LANDING_REGISTERING

PROC_EXIT:
    JMP LANDING_EXITING

ACC1_LOGGING:
    CALL LOGIN_ACC

    mov si, OFFSET login_username_input+2
    mov di, OFFSET username1+2

    ; compares registered username and username inputted during login
    CALL STRING_CHECKER          
    cmp AL, 0                   
    je ACC2_LOGGING

    mov si, OFFSET login_password_input+2
    mov di, OFFSET password1+2
    CALL STRING_CHECKER          
    cmp AL, 0
    je INVALID_LOGIN

    ; display menu when checks are successful
    JMP MENU_LOOP

ACC2_LOGGING:
    
    mov si, OFFSET login_username_input+2
    mov di, OFFSET username2+2
    CALL STRING_CHECKER          
    cmp AL, 0
    je ACC3_LOGGING

    mov si, OFFSET login_password_input+2
    mov di, OFFSET password2+2
    CALL STRING_CHECKER          
    cmp AL, 0
    je INVALID_LOGIN

    JMP MENU_LOOP               

ACC3_LOGGING:
    
    mov si, OFFSET login_username_input+2
    mov di, OFFSET username3+2
    CALL STRING_CHECKER         
    cmp AL, 0
    je INVALID_LOGIN

    mov si, OFFSET login_password_input+2
    mov di, OFFSET password3+2
    CALL STRING_CHECKER          
    cmp AL, 0
    je INVALID_LOGIN

    JMP MENU_LOOP               

INVALID_LOGIN:
    LEA DX, space
    CALL DISPLAY_STRING

    CALL BLINKING_FUNC

    LEA DX, login_error
    CALL DISPLAY_STRING

    ; initialize username and passwords back to null
    MOV SI, OFFSET login_username_input+2
    MOV CX, [SI]
    ADD SI, CX
    CALL STRING_CLEAR

    MOV SI, OFFSET login_password_input+2
    MOV CX, [SI]
    ADD SI, CX
    CALL STRING_CLEAR

    CALL WAIT_USER_INPUT

    JMP ACC_LOOP

LANDING_REGISTERING:
    cmp num_users, 1            
    jne ACC3_REGISTER_1

    CALL REGISTER_ACC2

    mov si, OFFSET username1+2
    mov di, OFFSET username2+2

    ; check if inputted username already exists
    CALL STRING_CHECKER
    cmp AL, 0                   
    je REGISTER_SUCCESSFUL

    LEA DX, username_exists
    CALL DISPLAY_STRING
    
    JMP ACC_LOOP

ACC3_REGISTER_1:
    ; check if max number of users have been reached
    cmp num_users, 3
    je ACC_FULL

    CALL REGISTER_ACC3

    mov si, OFFSET username1+2
    mov di, OFFSET username3+2
    CALL STRING_CHECKER          
    cmp AL, 0                   
    je ACC3_REGISTER_2

    LEA DX, username_exists
    CALL DISPLAY_STRING
    
    JMP ACC_LOOP

ACC3_REGISTER_2:
    mov si, OFFSET username2+2
    mov di, OFFSET username3+2
    CALL STRING_CHECKER
    cmp AL, 0                   
    je REGISTER_SUCCESSFUL

    LEA DX, username_exists
    CALL DISPLAY_STRING
    
    JMP ACC_LOOP
    
ACC_FULL:
    LEA DX, max_register
    CALL DISPLAY_STRING

    JMP ACC_LOOP

REGISTER_SUCCESSFUL:
    LEA DX, register_succ
    CALL DISPLAY_STRING

    INC num_users

    CALL WAIT_USER_INPUT
    
    JMP ACC_LOOP

LANDING_EXITING:

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, landing_exit_prompt
    CALL DISPLAY_STRING

    ; end program
    MOV AH, 4CH
    INT 21H


MENU_LOOP:

    CALL CLEAR_SCREEN
    CALL COLOR_SCREEN

    LEA DX, login_succ
    CALL DISPLAY_STRING

    CALL PUT_NEWLINE

    CALL DISPLAY_MENU
    
    CALL WAIT_USER_INPUT
    
    CMP AL, '1'
    JZ TYPED_CREATE
    CMP AL, '2'
    JZ TYPED_REVIEW
    CMP AL, '3'
    JZ TYPED_DELETE
    CMP AL, '4'
    JZ typed_EXIT
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    CALL DISPLAY_STRING

    CALL BLINKING_FUNC

    LEA DX, menu_error
    CALL DISPLAY_STRING
    JMP MENU_LOOP

TYPED_CREATE:
    JMP CREATE_ORDER

TYPED_REVIEW:
    JMP REVIEW_ORDER

TYPED_DELETE:
    JMP DELETE_ORDER

typed_EXIT:
    JMP EXITING

CREATE_ORDER:

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    mov si, OFFSET login_username_input+2
    mov di, OFFSET username1+2
    CALL STRING_CHECKER
    cmp AL, 0                   
    je CREATE_ORDER2

    CALL INPUT_order_ice_creamCC1

    JMP MENU_LOOP

CREATE_ORDER2:
    mov si, OFFSET login_username_input+2
    mov di, OFFSET username2+2
    CALL STRING_CHECKER
    cmp AL, 0                   
    je CREATE_ORDER3

    CALL INPUT_order_ice_creamCC2

    JMP MENU_LOOP

CREATE_ORDER3:
    CALL INPUT_order_ice_creamCC3

    JMP MENU_LOOP

REVIEW_ORDER:
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    mov si, OFFSET login_username_input+2
    mov di, OFFSET username1+2
    CALL STRING_CHECKER
    cmp AL, 0                   
    je REVIEW_ORDER2

    CALL REVIEW_order_ice_creamCC1

    JMP MENU_LOOP

REVIEW_ORDER2:
    mov si, OFFSET login_username_input+2
    mov di, OFFSET username2+2
    CALL STRING_CHECKER
    cmp AL, 0                   
    je REVIEW_ORDER3

    CALL REVIEW_order_ice_creamCC2

    JMP MENU_LOOP

REVIEW_ORDER3:
    CALL REVIEW_order_ice_creamCC3

    JMP MENU_LOOP

DELETE_ORDER:
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, delete_order_prompt
    CALL DISPLAY_STRING

    CALL WAIT_USER_INPUT

    CMP AL, 'Y'
    JZ CONFIRM_DELETE
    CMP AL, 'y'
    JZ CONFIRM_DELETE
    CMP AL, 'N'
    JZ CANCEL_DELETE
    CMP AL, 'n'
    JZ CANCEL_DELETE

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    CALL DISPLAY_STRING

    CALL BLINKING_FUNC

    LEA DX, menu_error
    CALL DISPLAY_STRING

    ; if either option is selected go back to the menu screen
    JMP MENU_LOOP

CONFIRM_DELETE:
    JMP DELETING_ORDER

CANCEL_DELETE:
    JMP CANCELING_DELETE

DELETING_ORDER:
    LEA DX, deleted_order_msg
    CALL DISPLAY_STRING

    mov si, OFFSET login_username_input+2
    mov di, OFFSET username1+2
    CALL STRING_CHECKER
    cmp AL, 0                   
    je DELETING_ORDER2

    CALL RESET_ACC_1

    JMP MENU_LOOP

DELETING_ORDER2:
    mov si, OFFSET login_username_input+2
    mov di, OFFSET username2+2
    CALL STRING_CHECKER
    cmp AL, 0                   
    je DELETING_ORDER3

    CALL RESET_ACC_2

    JMP MENU_LOOP

DELETING_ORDER3:
    CALL RESET_ACC_3

    JMP MENU_LOOP

CANCELING_DELETE:
    LEA DX, cancel_delete_order_msg    
    CALL DISPLAY_STRING

    JMP MENU_LOOP

EXITING:

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, exit_msg
    CALL DISPLAY_STRING
    
    JMP ACC_LOOP

MAIN ENDP

DISPLAY_STRING PROC
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 
    RET
DISPLAY_STRING ENDP

READ_STRING PROC
    MOV AH, 0Ah               ; DOS function to read a string 
    INT 21h
    RET
READ_STRING ENDP

BLINKING_FUNC PROC
    mov ah, 09h
    mov bh, 0
    mov bl, 0CEh   ; blinking red yellow
    mov cx, 78 
    int 10h
    RET
BLINKING_FUNC ENDP

DEF_COLOR PROC
    mov ah, 09h
    mov bh, 0
    mov bl, 2Eh   ; green and yellow
    mov cx, 78 
    int 10h
    RET
DEF_COLOR ENDP

COLOR_SCREEN PROC
    mov ah, 06h
    mov ch, 0 ; row start
    mov cl, 1 ; col start
    mov dh, 24  ; row end
    mov dl, 78  ; col end
    mov bh, 2Eh ; green and yellow
    int 10h   
    RET
COLOR_SCREEN ENDP

PUT_NEWLINE PROC
    LEA DX, newline
    CALL DISPLAY_STRING
    RET
PUT_NEWLINE ENDP

WAIT_USER_INPUT PROC
    ; Wait for user input
    MOV AH, 01H
    INT 21H
    RET
WAIT_USER_INPUT ENDP

; account register functions
; this one is called when the program starts
REGISTER_ACC1 PROC          

    CALL PUT_NEWLINE

    LEA DX, register_header
    CALL DISPLAY_STRING

    LEA DX, enter_username
    CALL DISPLAY_STRING

    LEA DX, username1
    CALL READ_STRING

    LEA DX, enter_password
    CALL DISPLAY_STRING

    LEA DX, password1
    CALL READ_STRING

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

    RET
REGISTER_ACC1 ENDP

REGISTER_ACC2 PROC

    CALL PUT_NEWLINE

    LEA DX, register_header
    CALL DISPLAY_STRING

    LEA DX, enter_username
    CALL DISPLAY_STRING

    LEA DX, username2
    CALL READ_STRING

    LEA DX, enter_password
    CALL DISPLAY_STRING

    LEA DX, password2
    CALL READ_STRING

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

    RET
REGISTER_ACC2 ENDP

REGISTER_ACC3 PROC

    CALL PUT_NEWLINE

    LEA DX, register_header
    CALL DISPLAY_STRING

    LEA DX, enter_username
    CALL DISPLAY_STRING

    LEA DX, username3
    CALL READ_STRING

    LEA DX, enter_password
    CALL DISPLAY_STRING

    LEA DX, password3
    CALL READ_STRING

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

    RET
REGISTER_ACC3 ENDP

LOGIN_ACC PROC

    CALL PUT_NEWLINE

    LEA DX, login_header
    CALL DISPLAY_STRING

    LEA DX, enter_username
    CALL DISPLAY_STRING

    LEA DX, login_username_input
    CALL READ_STRING

    LEA DX, enter_password
    CALL DISPLAY_STRING

    LEA DX, login_password_input
    CALL READ_STRING

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

    RET
LOGIN_ACC ENDP

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

DISPLAY_HEADER PROC
    
    LEA DX, header
    CALL DISPLAY_STRING

    RET
DISPLAY_HEADER ENDP

INPUT_NUM PROC
    PUSH BX
    PUSH CX
    PUSH DX
    
    XOR BX, BX  ; Clear BX for result
    XOR CX, CX  ; Clear counter
    
INPUT_LOOP:
    MOV AH, 01H
    INT 21H
    
    CMP AL, 13  ; Check for Enter key
    JE INPUT_DONE
    
    CMP AL, '0'
    JB INPUT_LOOP
    CMP AL, '9'
    JA INPUT_LOOP
    
    SUB AL, '0'  ; Convert ASCII to number
    MOV CL, AL
    
    MOV AX, BX
    MOV BX, 10
    MUL BX      ; Multiply current result by 10
    ADD AX, CX  ; Add new digit
    MOV BX, AX
    
    JMP INPUT_LOOP
    
INPUT_DONE:
    MOV AX, BX
    MOV TEMP, AX  ; Store input in TEMP
    
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
    
    MOV BX, 10   ; Divisor
    XOR CX, CX   ; Counter for digits
    
DIVIDE_LOOP:
    XOR DX, DX
    DIV BX
    PUSH DX      ; Push remainder (digit)
    INC CX
    TEST AX, AX
    JNZ DIVIDE_LOOP
    
DISPLAY_NUM_1:
    POP DX
    ADD DL, '0'  ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP DISPLAY_NUM_1
    
    LEA DX, period
    CALL DISPLAY_STRING
    
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
    
    MOV BX, 10   ; Divisor
    XOR CX, CX   ; Counter for digits
    
DIVIDE_LOOP2:
    XOR DX, DX
    DIV BX
    PUSH DX      ; Push remainder (digit)
    INC CX
    TEST AX, AX
    JNZ DIVIDE_LOOP2
    
DISPLAY_NUM_2:
    POP DX
    ADD DL, '0'  ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP DISPLAY_NUM_2
    
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DISPLAY_NUM2 ENDP

INPUT_order_ice_creamCC1 PROC
    CALL RESET_ACC_1

    LEA DX, order_pizzaenu
    CALL DISPLAY_STRING

    LEA DX, item_amount
    CALL DISPLAY_STRING

    LEA DX, order_ice_cream
    CALL DISPLAY_STRING

    CALL INPUT_NUM 
    ADD num_ice_cream1, AX       ; default value to 0

    mov ax, num_ice_cream1
    mov bx, ice_cream_price
    mul bx                  
    mov total_ice_cream1, ax

    ADD sum1, ax 
    
    LEA DX, order_burger 
    CALL DISPLAY_STRING

    CALL INPUT_NUM
    ADD num_burger1, AX

    mov ax, num_burger1
    mov bx, burger_price
    mul bx
    mov total_burger1, ax

    ADD sum1, ax
    
    LEA DX, order_chicken 
    CALL DISPLAY_STRING

    CALL INPUT_NUM
    ADD num_chicken1, AX

    mov ax, num_chicken1
    mov bx, chicken_price
    mul bx
    mov total_chicken1, ax

    ADD sum1, ax
    
    LEA DX, order_taco 
    CALL DISPLAY_STRING

    CALL INPUT_NUM
    ADD num_taco1, AX

    mov ax, num_taco1
    mov bx, taco_price
    mul bx
    mov total_taco1, ax

    ADD sum1, ax
    
    LEA DX, order_pizza 
    CALL DISPLAY_STRING

    CALL INPUT_NUM
    ADD num_pizza1, AX

    mov ax, num_pizza1
    mov bx, pizza_price
    mul bx
    mov total_pizza1, ax

    ADD sum1, ax
    
    LEA DX, order_total 
    CALL DISPLAY_STRING
    
    MOV AX, sum1
    CALL DISPLAY_NUM2

    CALL WAIT_USER_INPUT
    
    RET
INPUT_order_ice_creamCC1 ENDP

INPUT_order_ice_creamCC2 PROC
    CALL RESET_ACC_2

    LEA DX, order_pizzaenu
    CALL DISPLAY_STRING

    LEA DX, item_amount
    CALL DISPLAY_STRING

    LEA DX, order_ice_cream
    CALL DISPLAY_STRING

    CALL INPUT_NUM
    ADD num_ice_cream2, AX

    mov ax, num_ice_cream2
    mov bx, ice_cream_price
    mul bx                 
    mov total_ice_cream2, ax

    ADD sum2, ax             
    
    LEA DX, order_burger 
    CALL DISPLAY_STRING

    CALL INPUT_NUM
    ADD num_burger2, AX

    mov ax, num_burger2
    mov bx, burger_price
    mul bx
    mov total_burger2, ax

    ADD sum2, ax
    
    LEA DX, order_chicken 
    CALL DISPLAY_STRING

    CALL INPUT_NUM
    ADD num_chicken2, AX

    mov ax, num_chicken2
    mov bx, chicken_price
    mul bx
    mov total_chicken2, ax

    ADD sum2, ax
    
    LEA DX, order_taco 
    CALL DISPLAY_STRING

    CALL INPUT_NUM
    ADD num_taco2, AX

    mov ax, num_taco2
    mov bx, taco_price
    mul bx
    mov total_taco2, ax

    ADD sum2, ax
    
    LEA DX, order_pizza 
    CALL DISPLAY_STRING

    CALL INPUT_NUM
    ADD num_pizza2, AX

    mov ax, num_pizza2
    mov bx, pizza_price
    mul bx
    mov total_pizza2, ax

    ADD sum2, ax
    
    LEA DX, order_total 
    CALL DISPLAY_STRING
    
    MOV AX, sum2
    CALL DISPLAY_NUM2

    CALL WAIT_USER_INPUT
    
    RET
INPUT_order_ice_creamCC2 ENDP

INPUT_order_ice_creamCC3 PROC
    CALL RESET_ACC_3

    LEA DX, order_pizzaenu
    CALL DISPLAY_STRING

    LEA DX, item_amount
    CALL DISPLAY_STRING

    LEA DX, order_ice_cream
    CALL DISPLAY_STRING

    CALL INPUT_NUM
    ADD num_ice_cream3, AX

    mov ax, num_ice_cream3
    mov bx, ice_cream_price
    mul bx                  
    mov total_ice_cream3, ax

    ADD sum3, ax
    
    LEA DX, order_burger 
    CALL DISPLAY_STRING

    CALL INPUT_NUM
    ADD num_burger3, AX

    mov ax, num_burger3
    mov bx, burger_price
    mul bx
    mov total_burger3, ax

    ADD sum3, ax
    
    LEA DX, order_chicken 
    CALL DISPLAY_STRING

    CALL INPUT_NUM
    ADD num_chicken3, AX

    mov ax, num_chicken3
    mov bx, chicken_price
    mul bx
    mov total_chicken3, ax

    ADD sum3, ax
    
    LEA DX, order_taco 
    CALL DISPLAY_STRING

    CALL INPUT_NUM
    ADD num_taco3, AX

    mov ax, num_taco3
    mov bx, taco_price
    mul bx
    mov total_taco3, ax

    ADD sum3, ax
    
    LEA DX, order_pizza 
    CALL DISPLAY_STRING

    CALL INPUT_NUM
    ADD num_pizza3, AX

    mov ax, num_pizza3
    mov bx, pizza_price
    mul bx
    mov total_pizza3, ax

    ADD sum3, ax
    
    LEA DX, order_total 
    CALL DISPLAY_STRING
    
    MOV AX, sum3 
    CALL DISPLAY_NUM2

    CALL WAIT_USER_INPUT
    
    RET
INPUT_order_ice_creamCC3 ENDP

; the reset functions reset everything back to 0
RESET_ACC_1 PROC
    MOV AX, sum1          
    MOV BX, AX
    SUB sum1, BX

    MOV AX, num_ice_cream1          
    MOV BX, AX
    SUB num_ice_cream1, BX

    MOV AX, total_ice_cream1          
    MOV BX, AX
    SUB total_ice_cream1, BX

    MOV AX, num_burger1          
    MOV BX, AX
    SUB num_burger1, BX

    MOV AX, total_burger1          
    MOV BX, AX
    SUB total_burger1, BX

    MOV AX, num_chicken1          
    MOV BX, AX
    SUB num_chicken1, BX

    MOV AX, total_chicken1          
    MOV BX, AX
    SUB total_chicken1, BX

    MOV AX, num_taco1          
    MOV BX, AX
    SUB num_taco1, BX

    MOV AX, total_taco1          
    MOV BX, AX
    SUB total_taco1, BX

    MOV AX, num_pizza1          
    MOV BX, AX
    SUB num_pizza1, BX

    MOV AX, total_pizza1          
    MOV BX, AX
    SUB total_pizza1, BX
    RET
RESET_ACC_1 ENDP

RESET_ACC_2 PROC
    MOV AX, sum2          
    MOV BX, AX
    SUB sum2, BX

    MOV AX, num_ice_cream2          
    MOV BX, AX
    SUB num_ice_cream2, BX

    MOV AX, total_ice_cream2          
    MOV BX, AX
    SUB total_ice_cream2, BX

    MOV AX, num_burger2          
    MOV BX, AX
    SUB num_burger2, BX

    MOV AX, total_burger2          
    MOV BX, AX
    SUB total_burger2, BX

    MOV AX, num_chicken2          
    MOV BX, AX
    SUB num_chicken2, BX

    MOV AX, total_chicken2          
    MOV BX, AX
    SUB total_chicken2, BX

    MOV AX, num_taco2          
    MOV BX, AX
    SUB num_taco2, BX

    MOV AX, total_taco2          
    MOV BX, AX
    SUB total_taco2, BX

    MOV AX, num_pizza2          
    MOV BX, AX
    SUB num_pizza2, BX

    MOV AX, total_pizza2          
    MOV BX, AX
    SUB total_pizza2, BX
    RET
RESET_ACC_2 ENDP

RESET_ACC_3 PROC
    MOV AX, sum3          
    MOV BX, AX
    SUB sum3, BX

    MOV AX, num_ice_cream3          
    MOV BX, AX
    SUB num_ice_cream3, BX

    MOV AX, total_ice_cream3          
    MOV BX, AX
    SUB total_ice_cream3, BX

    MOV AX, num_burger3          
    MOV BX, AX
    SUB num_burger3, BX

    MOV AX, total_burger3          
    MOV BX, AX
    SUB total_burger3, BX

    MOV AX, num_chicken3          
    MOV BX, AX
    SUB num_chicken3, BX

    MOV AX, total_chicken3          
    MOV BX, AX
    SUB total_chicken3, BX

    MOV AX, num_taco3          
    MOV BX, AX
    SUB num_taco3, BX

    MOV AX, total_taco3          
    MOV BX, AX
    SUB total_taco3, BX

    MOV AX, num_pizza3          
    MOV BX, AX
    SUB num_pizza3, BX

    MOV AX, total_pizza3          
    MOV BX, AX
    SUB total_pizza3, BX
    RET
RESET_ACC_3 ENDP

REVIEW_order_ice_creamCC1 PROC
    LEA DX, curr_order
    CALL DISPLAY_STRING

    LEA DX, curr_ice_cream
    CALL DISPLAY_STRING

    MOV AX, num_ice_cream1   
    CALL DISPLAY_NUM2

    LEA DX, dash
    CALL DISPLAY_STRING

    MOV AX, total_ice_cream1    
    CALL DISPLAY_NUM2

    LEA DX, curr_burger
    CALL DISPLAY_STRING

    MOV AX, num_burger1
    CALL DISPLAY_NUM2

    LEA DX, dash
    CALL DISPLAY_STRING

    MOV AX, total_burger1
    CALL DISPLAY_NUM2

    LEA DX, curr_chicken
    CALL DISPLAY_STRING

    MOV AX, num_chicken1
    CALL DISPLAY_NUM2

    LEA DX, dash
    CALL DISPLAY_STRING

    MOV AX, total_chicken1
    CALL DISPLAY_NUM2

    LEA DX, curr_taco
    CALL DISPLAY_STRING

    MOV AX, num_taco1
    CALL DISPLAY_NUM2

    LEA DX, dash
    CALL DISPLAY_STRING

    MOV AX, total_taco1
    CALL DISPLAY_NUM2

    LEA DX, curr_pizza
    CALL DISPLAY_STRING

    MOV AX, num_pizza1
    CALL DISPLAY_NUM2

    LEA DX, dash
    CALL DISPLAY_STRING

    MOV AX, total_pizza1
    CALL DISPLAY_NUM2
    
    LEA DX, order_total 
    CALL DISPLAY_STRING
    
    MOV AX, sum1
    CALL DISPLAY_NUM2

    CALL WAIT_USER_INPUT
    
    RET
REVIEW_order_ice_creamCC1 ENDP

REVIEW_order_ice_creamCC2 PROC
    LEA DX, curr_order
    CALL DISPLAY_STRING

    LEA DX, curr_ice_cream
    CALL DISPLAY_STRING

    MOV AX, num_ice_cream2     
    CALL DISPLAY_NUM2

    LEA DX, dash
    CALL DISPLAY_STRING

    MOV AX, total_ice_cream2    
    CALL DISPLAY_NUM2

    LEA DX, curr_burger
    CALL DISPLAY_STRING

    MOV AX, num_burger2
    CALL DISPLAY_NUM2

    LEA DX, dash
    CALL DISPLAY_STRING

    MOV AX, total_burger2
    CALL DISPLAY_NUM2

    LEA DX, curr_chicken
    CALL DISPLAY_STRING

    MOV AX, num_chicken2
    CALL DISPLAY_NUM2

    LEA DX, dash
    CALL DISPLAY_STRING

    MOV AX, total_chicken2
    CALL DISPLAY_NUM2

    LEA DX, curr_taco
    CALL DISPLAY_STRING

    MOV AX, num_taco2
    CALL DISPLAY_NUM2

    LEA DX, dash
    CALL DISPLAY_STRING

    MOV AX, total_taco2
    CALL DISPLAY_NUM2

    LEA DX, curr_pizza
    CALL DISPLAY_STRING

    MOV AX, num_pizza2
    CALL DISPLAY_NUM2

    LEA DX, dash
    CALL DISPLAY_STRING

    MOV AX, total_pizza2
    CALL DISPLAY_NUM2
    
    LEA DX, order_total 
    CALL DISPLAY_STRING
    
    MOV AX, sum2
    CALL DISPLAY_NUM2

    CALL WAIT_USER_INPUT
    
    RET
REVIEW_order_ice_creamCC2 ENDP

REVIEW_order_ice_creamCC3 PROC
    LEA DX, curr_order
    CALL DISPLAY_STRING

    LEA DX, curr_ice_cream
    CALL DISPLAY_STRING

    MOV AX, num_ice_cream3         
    CALL DISPLAY_NUM2

    LEA DX, dash
    CALL DISPLAY_STRING

    MOV AX, total_ice_cream3         
    CALL DISPLAY_NUM2

    LEA DX, curr_burger
    CALL DISPLAY_STRING

    MOV AX, num_burger3
    CALL DISPLAY_NUM2

    LEA DX, dash
    CALL DISPLAY_STRING

    MOV AX, total_burger3
    CALL DISPLAY_NUM2

    LEA DX, curr_chicken
    CALL DISPLAY_STRING

    MOV AX, num_chicken3
    CALL DISPLAY_NUM2

    LEA DX, dash
    CALL DISPLAY_STRING

    MOV AX, total_chicken3
    CALL DISPLAY_NUM2

    LEA DX, curr_taco
    CALL DISPLAY_STRING

    MOV AX, num_taco3
    CALL DISPLAY_NUM2

    LEA DX, dash
    CALL DISPLAY_STRING

    MOV AX, total_taco3
    CALL DISPLAY_NUM2

    LEA DX, curr_pizza
    CALL DISPLAY_STRING

    MOV AX, num_pizza3
    CALL DISPLAY_NUM2

    LEA DX, dash
    CALL DISPLAY_STRING

    MOV AX, total_pizza3
    CALL DISPLAY_NUM2
    
    LEA DX, order_total 
    CALL DISPLAY_STRING
    
    MOV AX, sum3
    CALL DISPLAY_NUM2

    CALL WAIT_USER_INPUT
    
    RET
REVIEW_order_ice_creamCC3 ENDP

DISPLAY_ACC PROC

    CALL COLOR_SCREEN
    LEA DX, space
    CALL DISPLAY_STRING

    LEA DX, landing_header
    CALL DISPLAY_STRING

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    CALL DISPLAY_STRING

    LEA DX, landing_login
    CALL DISPLAY_STRING

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    CALL DISPLAY_STRING

    LEA DX, landing_register
    CALL DISPLAY_STRING

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    CALL DISPLAY_STRING

    LEA DX, landing_exit
    CALL DISPLAY_STRING

    RET
DISPLAY_ACC ENDP

DISPLAY_MENU PROC

    LEA DX, space
    CALL DISPLAY_STRING

    CALL DEF_COLOR

    LEA DX, menu_title
    CALL DISPLAY_STRING

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    CALL DISPLAY_STRING

    CALL DEF_COLOR

    LEA DX, menue_makeedit
    CALL DISPLAY_STRING

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    CALL DISPLAY_STRING

    CALL DEF_COLOR

    LEA DX, menu_review
    CALL DISPLAY_STRING

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    CALL DISPLAY_STRING

    CALL DEF_COLOR

    LEA DX, menu_delete
    CALL DISPLAY_STRING

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    CALL DISPLAY_STRING

    CALL DEF_COLOR

    LEA DX, menu_exit
    CALL DISPLAY_STRING

    RET
DISPLAY_MENU ENDP

BRANDING_COLORS PROC
    ; branding colors

    ; burger colors
    ; top bun
    mov ah, 06h
    mov ch, 4 ; row start
    mov cl, 1 ; col start
    mov dh, 6  ; row end
    mov dl, 78  ; col end
    mov bh, 06h ; orange
    int 10h   

    ; lettuce
    mov ah, 06h
    mov ch, 7 ; row start
    mov cl, 1 ; col start
    mov dh, 7  ; row end
    mov dl, 78  ; col end
    mov bh, 02h ; green
    int 10h   

    ; meat and onions
    ; first row
    mov ah, 06h
    mov ch, 8 ; row start
    mov cl, 1 ; col start
    mov dh, 8  ; row end
    mov dl, 32  ; col end
    mov bh, 04h ; red
    int 10h   

    mov ah, 06h
    mov ch, 8 ; row start
    mov cl, 33 ; col start
    mov dh, 8  ; row end
    mov dl, 36  ; col end
    mov bh, 05h ; yellow
    int 10h  

    mov ah, 06h
    mov ch, 8 ; row start
    mov cl, 37 ; col start
    mov dh, 8  ; row end
    mov dl, 78  ; col end
    mov bh, 04h ; red
    int 10h   

    ; second row
    mov ah, 06h
    mov ch, 9 ; row start
    mov cl, 1 ; col start
    mov dh, 9  ; row end
    mov dl, 44  ; col end
    mov bh, 04h ; red
    int 10h   

    mov ah, 06h
    mov ch, 9 ; row start
    mov cl, 45 ; col start
    mov dh, 9  ; row end
    mov dl, 48  ; col end
    mov bh, 05h ; yellow
    int 10h  

    mov ah, 06h
    mov ch, 9 ; row start
    mov cl, 49 ; col start
    mov dh, 9  ; row end
    mov dl, 78  ; col end
    mov bh, 04h ; red
    int 10h   

    ; bottom bun
    mov ah, 06h
    mov ch, 10 ; row start
    mov cl, 1 ; col start
    mov dh, 10  ; row end
    mov dl, 78  ; col end
    mov bh, 06h ; orange
    int 10h   

    ; dymes foods colors
    ; dymes
    mov ah, 06h
    mov ch, 11 ; row start
    mov cl, 1 ; col start
    mov dh, 17  ; row end
    mov dl, 40  ; col end
    mov bh, 02h ; green
    int 10h   

    ; foods
    mov ah, 06h
    mov ch, 11 ; row start
    mov cl, 41 ; col start
    mov dh, 17  ; row end
    mov dl, 78  ; col end
    mov bh, 06h ; green
    int 10h   

BRANDING_COLORS ENDP

; function to compare two strings
STRING_CHECKER PROC
    CMP BYTE PTR [SI], '$'
    JE EQUAL 
    LOOP_COMPARE:
        mov al, BYTE PTR [SI]
        mov bl, BYTE PTR [DI]
        cmp al, bl
        JNE NOT_EQUAL 
        INC SI
        INC DI
        CMP BYTE PTR [SI], '$'
        JNE LOOP_COMPARE
    EQUAL:
        MOV AL, 1               ; moves 1 to AL if both strings are the same
        ret
    NOT_EQUAL:
        MOV AL, 0               ; moves 0 to AL if both strings are different
        ret
STRING_CHECKER ENDP

STRING_CLEAR PROC
    CLEAR_LOOP:
        mov al, BYTE PTR [SI]

        cmp al, '$'
        JNE NULL_COMPLETE

        lea dx, barrier
        CALL DISPLAY_STRING
        
        lea dx, BYTE PTR [SI]
        CALL DISPLAY_STRING

        lea dx, barrier
        CALL DISPLAY_STRING

        MOV BYTE PTR [SI], '$'
        DEC SI
        LOOP CLEAR_LOOP

    NULL_COMPLETE:
        RET
STRING_CLEAR ENDP

END MAIN