; Name of System: Online Food Order System (Fast Food)
; Description: The program allows users to create accounts and pick an amount of food items to order.
; Programmer: JOHN DYMIER O. BORGONIA
; Date : December 6, 2024

.MODEL SMALL
.STACK 100H
.DATA
    space       DB ' $',0
    newline     DB ' $',13,10
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

    setup_prompt1   DB 13,10,'  ',13,10
                    DB '  Hello there! Welcome to Dymes Foods',13,10
                    DB '  It seems like you are a new user, please sign up for an account below.$',13,10,13,10

    register_header  DB 13,10,13,10,' ---REGISTER---$',13,10
    login_header     DB 13,10,13,10,' ---LOGIN---$',13,10

    register_succ   DB 13,10,' ---User Register was Successful!---$',13,10
    login_succ      DB 13,10,' ---User Login was Successful!---$',13,10

    registerFull    DB 13,10,' We have reached the max number of registered users! We apologize for the inconvenience.$',13,10
    registerAlrExists   DB 13,10,' The username is already in use, please choose another one.$',13,10

    usernamePrompt  DB 13,10,' Enter Username: $'
    passwordPrompt  DB 13,10,' Enter Password: $'

    acc_title   DB ' Welcome to Dymes Fast Food Ordering System!                                  $',13,10
    acc_login   DB ' 1. Login to existing Account                                                 $',13,10
    acc_regis   DB ' 2. Register new Account                                                      $',13,10
    acc_exit    DB ' 3. Exit                                                                      ',13,10
                DB '  Enter your choice: $',13,10

    menu_title  DB ' Welcome to the Main Menu!                                                    $'
    menu_create DB ' 1. Make/Edit order                                                           $'
    menu_review DB ' 2. Review existing order                                                     $'
    menu_delete DB ' 3. Delete existing order                                                     $'
    menu_ex     DB ' 4. Exit                                                                      ',13,10
                DB '  Enter your choice: $',13,10

    menu_error  DB ' ERROR! Invalid choice!                                                        $',13,10
    login_error DB ' ERROR! Account is not recognized!                                             $',13,10

    order_menu  DB '----SELECT FAST FOOD----', 13,10
                DB '  Ice Cream   -  P99.00', 13,10
                DB '  Burger      -  P120.00', 13,10
                DB '  Fr. Chicken -  P70.00', 13,10
                DB '  Taco        -  P60.00', 13,10
                DB '  Pizza       -  P300.00$', 13,10, 13,10

    price_amer  dw 99
    price_espr  dw 120
    price_capp  dw 70 
    price_latt  dw 60
    price_moch  dw 300

    order_amou  DB 13,10,13,10,'  Input number of an item: $'

    curr_order  DB '----YOUR CURRENT ORDER----$'
    curr_amer_prompt   DB 13,10,'  Ice Cream   - $'
    curr_espr_prompt   DB 13,10,'  Burger      - $'
    curr_capp_prompt   DB 13,10,'  Fr. Chicken - $'
    curr_latt_prompt   DB 13,10,'  Taco        - $'
    curr_moch_prompt   DB 13,10,'  Mocha       - $'

    curr_price_prompt  DB ' - P$'

    delete_order_prompt DB ' Are you sure you want to delete your order? Y/N ',13,10
                        DB '  Enter your choice: $',13,10
    deleting_order_prompt   DB 13,10,' ~Deleting Order~$',13,10
    cancel_delete_prompt    DB 13,10,' ~Delete Cancelled~$',13,10
    

    order_A     DB 13,10,'  Ice Cream  : $'
    order_E     DB '  Burger     : $'
    order_C     DB '  Fr.Chicken : $'
    order_L     DB '  Taco       : $'
    order_M     DB '  Pizza      : $'
    order_total DB 13,10,'  Your total is: P$'

    period      DB '.$',13,10,'$'
    ex_point    DB '!$',13,10
    exit_msg    DB 'Thank you for ordering! We hope you enjoy your meal!$'

    acc_exit_prompt DB ' Thank you for using the app!',13,10,' Order again soon!$'

    barrier DB ' | $'

    inputUsername1 DB 50 DUP('$')        ; used for registering acc1
    inputPassword1 DB 50 DUP('$')        ; used for registering acc1

    inputUsername2 DB 50 DUP('$')        ; used for registering acc2
    inputPassword2 DB 50 DUP('$')        ; used for registering acc2

    inputUsername3 DB 50 DUP('$')        ; used for registering acc3
    inputPassword3 DB 50 DUP('$')        ; used for registering acc3

    usercounter dw 1

    emptyStringCompare DB 50 DUP('$')   ; kept empty just to see if compared string is still empty

    loginUsername DB 50 DUP('$')        ; inputted during login, used to compare with inputUsername, also used to note which user is currently being used
    loginPassword DB 50 DUP('$')        ; inputted during login, used to compare with inputPassword, also used to note which user is currently being used

    num_ameri1   dw 0
    num_espre1   dw 0
    num_cappu1   dw 0
    num_latte1   dw 0
    num_mocha1   dw 0

    num_ameri2   dw 0
    num_espre2   dw 0
    num_cappu2   dw 0
    num_latte2   dw 0
    num_mocha2   dw 0

    num_ameri3   dw 0
    num_espre3   dw 0
    num_cappu3   dw 0
    num_latte3   dw 0
    num_mocha3   dw 0

    total_amer1  dw ?
    total_espr1  dw ? 
    total_capp1  dw ? 
    total_latt1  dw ? 
    total_moch1  dw ?

    total_amer2  dw ?
    total_espr2  dw ? 
    total_capp2  dw ? 
    total_latt2  dw ? 
    total_moch2  dw ? 

    total_amer3  dw ?
    total_espr3  dw ? 
    total_capp3  dw ? 
    total_latt3  dw ? 
    total_moch3  dw ? 

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

    CALL CLR_SC

    mov ah, 06h
    mov ch, 0 ; row start
    mov cl, 1 ; col start
    mov dh, 3  ; row end
    mov dl, 78  ; col end
    mov bh, 1Bh ; blue, aqua
    int 10h

    CALL disp_title

    mov ah, 06h
    mov ch, 18 ; row start
    mov cl, 1 ; col start
    mov dh, 19  ; row end
    mov dl, 78  ; col end
    mov bh, 6Eh ; orange, yellow
    int 10h    

    LEA DX, branding
    MOV AH, 09H
    INT 21H

    LEA DX, setup_prompt1
    MOV AH, 09H
    INT 21H

    CALL REGISTER_ACC1

    CALL CLR_SC

ACC_LOOP:
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; Display account menu
    CALL print_acc
    
    ; Await user input
    MOV AH, 01H
    INT 21H

    ; Jumps to option
    CMP AL, '1'
    JZ TYPED_LOGIN
    CMP AL, '2'
    JZ TYPED_REGISTER
    CMP AL, '3'
    JZ typed_ACC_EXIT
    
    ; Invalid choice
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
    mov bl, 0CEh   ; blinking red yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_error
    MOV AH, 09H
    INT 21H
    JMP ACC_LOOP

TYPED_LOGIN:
    JMP ACC1_LOGGING

TYPED_REGISTER:
    JMP ACC_REGISTER

typed_ACC_EXIT:
    JMP ACC_EXITING

ACC1_LOGGING:
    CALL LOGIN_ACC

    mov si, OFFSET loginUsername+2
    mov di, OFFSET inputUsername1+2
    CALL STRING_CHECKER          ; compares registered username and username inputted during login, pushes 1 to AL if same and 0 if not
    cmp AL, 0                   
    je ACC2_LOGGING

    mov si, OFFSET loginPassword+2
    mov di, OFFSET inputPassword1+2
    CALL STRING_CHECKER          ; compares registered password and password inputted during login, pushes 1 to AL if same and 0 if not
    cmp AL, 0
    je INVALID_LOGIN

    LEA DX, login_succ
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    JMP MENU_LOOP               ; if both checks are successful, jumps to main menu screen

ACC2_LOGGING:
    
    mov si, OFFSET loginUsername+2
    mov di, OFFSET inputUsername2+2
    CALL STRING_CHECKER          ; compares registered username and username inputted during login, pushes 1 to AL if same and 0 if not
    cmp AL, 0
    je ACC3_LOGGING

    mov si, OFFSET loginPassword+2
    mov di, OFFSET inputPassword2+2
    CALL STRING_CHECKER          ; compares registered password and password inputted during login, pushes 1 to AL if same and 0 if not
    cmp AL, 0
    je INVALID_LOGIN

    LEA DX, login_succ
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    JMP MENU_LOOP               ; if both checks are successful, jumps to main menu screen

ACC3_LOGGING:
    
    mov si, OFFSET loginUsername+2
    mov di, OFFSET inputUsername3+2
    CALL STRING_CHECKER          ; compares registered username and username inputted during login, pushes 1 to AL if same and 0 if not
    cmp AL, 0
    je INVALID_LOGIN

    mov si, OFFSET loginPassword+2
    mov di, OFFSET inputPassword3+2
    CALL STRING_CHECKER          ; compares registered password and password inputted during login, pushes 1 to AL if same and 0 if not
    cmp AL, 0
    je INVALID_LOGIN

    LEA DX, login_succ
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    JMP MENU_LOOP               ; if both checks are successful, jumps to main menu screen

INVALID_LOGIN:                  ; results if compared strings are not equal
    LEA DX, space
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 0CEh   ; blinking red yellow
    mov cx, 78 
    int 10h

    LEA DX, login_error
    MOV AH, 09H
    INT 21H

    MOV SI, OFFSET loginUsername+2      ; initializes username back to null in case old account exists
    MOV CX, [SI]
    ADD SI, CX
    CALL STRING_CLEAR

    MOV SI, OFFSET loginPassword+2      ; initializes password back to null in case old account exists
    MOV CX, [SI]
    ADD SI, CX
    CALL STRING_CLEAR

    CALL PRINT_LOGIN_ATTEMPT       ;use to see current account and inputted login, not actually implemented

    JMP ACC_LOOP                ; loops back to account menu after displaying error

ACC_REGISTER:
    cmp usercounter, 1            
    jne ACC3_REGISTER_1         ; jumps if greater than 1

    CALL REGISTER_ACC2

    mov si, OFFSET inputUsername1+2
    mov di, OFFSET inputUsername2+2
    CALL STRING_CHECKER          ; checks if newly registered username already exists, jumps to REGISTER_SUCCESSFUL if username is unique
    cmp AL, 0                   
    je REGISTER_SUCCESSFUL

    LEA DX, registerAlrExists
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 
    
    JMP ACC_LOOP

ACC3_REGISTER_1:
    cmp usercounter, 3             ; jumps if max user count has been reached
    je ACC_FULL

    CALL REGISTER_ACC3

    mov si, OFFSET inputUsername1+2
    mov di, OFFSET inputUsername3+2
    CALL STRING_CHECKER          ; checks if newly registered username already exists, jumps to ACC3_REGISTER_2 if username is unique
    cmp AL, 0                   
    je ACC3_REGISTER_2

    LEA DX, registerAlrExists
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 
    
    JMP ACC_LOOP

ACC3_REGISTER_2:
    mov si, OFFSET inputUsername2+2
    mov di, OFFSET inputUsername3+2
    CALL STRING_CHECKER          ; checks if newly registered username already exists, jumps to REGISTER_SUCCESSFUL if username is unique
    cmp AL, 0                   
    je REGISTER_SUCCESSFUL

    LEA DX, registerAlrExists
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 
    
    JMP ACC_LOOP
    
ACC_FULL:
    LEA DX, registerFull
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    JMP ACC_LOOP

REGISTER_SUCCESSFUL:
    LEA DX, register_succ
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    INC usercounter
    
    JMP ACC_LOOP

ACC_EXITING:

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, acc_exit_prompt
    MOV AH, 09H
    INT 21H

    MOV AH, 4CH             ; fully exits the program
    INT 21H


MENU_LOOP:
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; Display main menu
    CALL print_menu
    
    ; Await user input
    MOV AH, 01H
    INT 21H
    
    ; Jumps to option
    CMP AL, '1'
    JZ TYPED_CREATE
    CMP AL, '2'
    JZ TYPED_REVIEW
    CMP AL, '3'
    JZ TYPED_DELETE
    CMP AL, '4'
    JZ typed_EXIT
    
    ; Invalid choice
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
    mov bl, 0CEh   ; blinking red yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_error
    MOV AH, 09H
    INT 21H
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

    mov si, OFFSET loginUsername+2
    mov di, OFFSET inputUsername1+2
    CALL STRING_CHECKER          ; checks if current user is account 1, creates order for acc 1 if yes, jumps to 2 if no
    cmp AL, 0                   
    je CREATE_ORDER2

    CALL INPUT_ORDER_ACC1

    JMP MENU_LOOP

CREATE_ORDER2:
    mov si, OFFSET loginUsername+2
    mov di, OFFSET inputUsername2+2
    CALL STRING_CHECKER          ; checks if current user is account 1, creates order for acc 1 if yes, jumps to 2 if no
    cmp AL, 0                   
    je CREATE_ORDER3

    CALL INPUT_ORDER_ACC2

    JMP MENU_LOOP

CREATE_ORDER3:
    CALL INPUT_ORDER_ACC3

    JMP MENU_LOOP

REVIEW_ORDER:
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    mov si, OFFSET loginUsername+2
    mov di, OFFSET inputUsername1+2
    CALL STRING_CHECKER          ; checks if current user is account 1, reviews order for acc 1 if yes, jumps to 2 if no
    cmp AL, 0                   
    je REVIEW_ORDER2

    CALL REVIEW_ORDER_ACC1

    JMP MENU_LOOP

REVIEW_ORDER2:
    mov si, OFFSET loginUsername+2
    mov di, OFFSET inputUsername2+2
    CALL STRING_CHECKER          ; checks if current user is account 1, reviews order for acc 1 if yes, jumps to 2 if no
    cmp AL, 0                   
    je REVIEW_ORDER3

    CALL REVIEW_ORDER_ACC2

    JMP MENU_LOOP

REVIEW_ORDER3:
    CALL REVIEW_ORDER_ACC3

    JMP MENU_LOOP

DELETE_ORDER:
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, delete_order_prompt
    MOV AH, 09H
    INT 21H

    ; Await user input
    MOV AH, 01H
    INT 21H

    ; Jumps to option
    CMP AL, 'Y'
    JZ typed_YES_DELETE
    CMP AL, 'y'
    JZ typed_YES_DELETE
    CMP AL, 'N'
    JZ typed_CANCEL_DELETE
    CMP AL, 'n'
    JZ typed_CANCEL_DELETE

    ; Invalid choice
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
    mov bl, 0CEh   ; blinking red yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_error
    MOV AH, 09H
    INT 21H
    JMP MENU_LOOP       ; loops back to menu screen if Y, y, N, or n were not inputted

typed_YES_DELETE:
    JMP DELETING_ORDER

typed_CANCEL_DELETE:
    JMP CANCELING_DELETE

DELETING_ORDER:
    LEA DX, deleting_order_prompt
    MOV AH, 09H
    INT 21H

    mov si, OFFSET loginUsername+2
    mov di, OFFSET inputUsername1+2
    CALL STRING_CHECKER          ; checks if current user is account 1, deletes order for acc 1 if yes, jumps to 2 if no
    cmp AL, 0                   
    je DELETING_ORDER2

    CALL reset_all_zero_acc1

    JMP MENU_LOOP

DELETING_ORDER2:
    mov si, OFFSET loginUsername+2
    mov di, OFFSET inputUsername2+2
    CALL STRING_CHECKER          ; checks if current user is account 1, deletes order for acc 1 if yes, jumps to 2 if no
    cmp AL, 0                   
    je DELETING_ORDER3

    CALL reset_all_zero_acc2

    JMP MENU_LOOP

DELETING_ORDER3:
    CALL reset_all_zero_acc3

    JMP MENU_LOOP

CANCELING_DELETE:
    LEA DX, cancel_delete_prompt    
    MOV AH, 09H
    INT 21H

    JMP MENU_LOOP       ; returns back to menu screen without deleting orders

EXITING:

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, exit_msg
    MOV AH, 09H
    INT 21H
    
    JMP ACC_LOOP        ; returns back to account screen

MAIN ENDP

REGISTER_ACC1 PROC          ; registers the first account   ; called the moment the program starts
    LEA DX, register_header
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, usernamePrompt
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, inputUsername1
    MOV AH, 0Ah               ; DOS function to read a string 
    INT 21h 

    LEA DX, newline
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, passwordPrompt
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, inputPassword1
    MOV AH, 0Ah               ; DOS function to read a string 
    INT 21h 

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

REGISTER_ACC2 PROC              ; registers the 2nd account
    LEA DX, register_header
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, usernamePrompt
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, inputUsername2
    MOV AH, 0Ah               ; DOS function to read a string 
    INT 21h 

    LEA DX, newline
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, passwordPrompt
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, inputPassword2
    MOV AH, 0Ah               ; DOS function to read a string 
    INT 21h 

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

REGISTER_ACC3 PROC              ; registers the 2nd account
    LEA DX, register_header
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, usernamePrompt
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, inputUsername3
    MOV AH, 0Ah               ; DOS function to read a string 
    INT 21h 

    LEA DX, newline
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, passwordPrompt
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, inputPassword3
    MOV AH, 0Ah               ; DOS function to read a string 
    INT 21h 

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
    LEA DX, login_header
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, usernamePrompt
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, loginUsername
    MOV AH, 0Ah               ; DOS function to read a string 
    INT 21h 

    LEA DX, newline
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, passwordPrompt
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, loginPassword
    MOV AH, 0Ah               ; DOS function to read a string 
    INT 21h 

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

CLR_SC PROC
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
CLR_SC ENDP

disp_title PROC
    
    LEA DX, header
    MOV AH, 09H
    INT 21H

    RET
disp_title ENDP

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
    
print_num_1:
    POP DX
    ADD DL, '0'  ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP print_num_1
    
    LEA DX, period
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
    
    MOV BX, 10   ; Divisor
    XOR CX, CX   ; Counter for digits
    
DIVIDE_LOOP2:
    XOR DX, DX
    DIV BX
    PUSH DX      ; Push remainder (digit)
    INC CX
    TEST AX, AX
    JNZ DIVIDE_LOOP2
    
print_num_2:
    POP DX
    ADD DL, '0'  ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP print_num_2
    
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DISPLAY_NUM2 ENDP

INPUT_ORDER_ACC1 PROC
    CALL reset_all_zero_acc1     ; resets all orders to 0 first to ensure orders dont add up

    LEA DX, order_menu
    MOV AH, 09H
    INT 21H

    LEA DX, order_amou
    MOV AH, 09H
    INT 21H

    LEA DX, order_A
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM          ; function to input number
    ADD num_ameri1, AX       ; adds inputted number to originally 0

    mov ax, num_ameri1
    mov bx, price_amer
    mul bx                  ; multiplies number of orders to individual price of item
        mov total_amer1, ax

    ADD sum1, ax             ; adds price of order to overall total price
    
    LEA DX, order_E 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_espre1, AX

    mov ax, num_espre1
    mov bx, price_espr
    mul bx
        mov total_espr1, ax

    ADD sum1, ax
    
    LEA DX, order_C 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_cappu1, AX

    mov ax, num_cappu1
    mov bx, price_capp
    mul bx
        mov total_capp1, ax

    ADD sum1, ax
    
    LEA DX, order_L 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_latte1, AX

    mov ax, num_latte1
    mov bx, price_latt
    mul bx
        mov total_latt1, ax

    ADD sum1, ax
    
    LEA DX, order_M 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_mocha1, AX

    mov ax, num_mocha1
    mov bx, price_moch
    mul bx
        mov total_moch1, ax

    ADD sum1, ax
    
    LEA DX, order_total 
    MOV AH, 09H
    INT 21H
    
    MOV AX, sum1                 ; prints overall total price
    CALL DISPLAY_NUM2
    
    RET
INPUT_ORDER_ACC1 ENDP

INPUT_ORDER_ACC2 PROC
    CALL reset_all_zero_acc2     ; resets all orders to 0 first to ensure orders dont add up

    LEA DX, order_menu
    MOV AH, 09H
    INT 21H

    LEA DX, order_amou
    MOV AH, 09H
    INT 21H

    LEA DX, order_A
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM          ; function to input number
    ADD num_ameri2, AX       ; adds inputted number to originally 0

    mov ax, num_ameri2
    mov bx, price_amer
    mul bx                  ; multiplies number of orders to individual price of item
        mov total_amer2, ax

    ADD sum2, ax             ; adds price of order to overall total price
    
    LEA DX, order_E 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_espre2, AX

    mov ax, num_espre2
    mov bx, price_espr
    mul bx
        mov total_espr2, ax

    ADD sum2, ax
    
    LEA DX, order_C 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_cappu2, AX

    mov ax, num_cappu2
    mov bx, price_capp
    mul bx
        mov total_capp2, ax

    ADD sum2, ax
    
    LEA DX, order_L 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_latte2, AX

    mov ax, num_latte2
    mov bx, price_latt
    mul bx
        mov total_latt2, ax

    ADD sum2, ax
    
    LEA DX, order_M 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_mocha2, AX

    mov ax, num_mocha2
    mov bx, price_moch
    mul bx
        mov total_moch2, ax

    ADD sum2, ax
    
    LEA DX, order_total 
    MOV AH, 09H
    INT 21H
    
    MOV AX, sum2                 ; prints overall total price
    CALL DISPLAY_NUM2
    
    RET
INPUT_ORDER_ACC2 ENDP

INPUT_ORDER_ACC3 PROC
    CALL reset_all_zero_acc3     ; resets all orders to 0 first to ensure orders dont add up

    LEA DX, order_menu
    MOV AH, 09H
    INT 21H

    LEA DX, order_amou
    MOV AH, 09H
    INT 21H

    LEA DX, order_A
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM          ; function to input number
    ADD num_ameri3, AX       ; adds inputted number to originally 0

    mov ax, num_ameri3
    mov bx, price_amer
    mul bx                  ; multiplies number of orders to individual price of item
        mov total_amer3, ax

    ADD sum3, ax             ; adds price of order to overall total price
    
    LEA DX, order_E 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_espre3, AX

    mov ax, num_espre3
    mov bx, price_espr
    mul bx
        mov total_espr3, ax

    ADD sum3, ax
    
    LEA DX, order_C 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_cappu3, AX

    mov ax, num_cappu3
    mov bx, price_capp
    mul bx
        mov total_capp3, ax

    ADD sum3, ax
    
    LEA DX, order_L 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_latte3, AX

    mov ax, num_latte3
    mov bx, price_latt
    mul bx
        mov total_latt3, ax

    ADD sum3, ax
    
    LEA DX, order_M 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_mocha3, AX

    mov ax, num_mocha3
    mov bx, price_moch
    mul bx
        mov total_moch3, ax

    ADD sum3, ax
    
    LEA DX, order_total 
    MOV AH, 09H
    INT 21H
    
    MOV AX, sum3                 ; prints overall total price
    CALL DISPLAY_NUM2
    
    RET
INPUT_ORDER_ACC3 ENDP

reset_all_zero_acc1 PROC
    MOV AX, sum1          ; resets to 0
    MOV BX, AX
    SUB sum1, BX

    MOV AX, num_ameri1          ; resets to 0
    MOV BX, AX
    SUB num_ameri1, BX

    MOV AX, total_amer1          ; resets to 0
    MOV BX, AX
    SUB total_amer1, BX

    MOV AX, num_espre1          ; resets to 0
    MOV BX, AX
    SUB num_espre1, BX

    MOV AX, total_espr1          ; resets to 0
    MOV BX, AX
    SUB total_espr1, BX

    MOV AX, num_cappu1          ; resets to 0
    MOV BX, AX
    SUB num_cappu1, BX

    MOV AX, total_capp1          ; resets to 0
    MOV BX, AX
    SUB total_capp1, BX

    MOV AX, num_latte1          ; resets to 0
    MOV BX, AX
    SUB num_latte1, BX

    MOV AX, total_latt1          ; resets to 0
    MOV BX, AX
    SUB total_latt1, BX

    MOV AX, num_mocha1          ; resets to 0
    MOV BX, AX
    SUB num_mocha1, BX

    MOV AX, total_moch1          ; resets to 0
    MOV BX, AX
    SUB total_moch1, BX
    RET
reset_all_zero_acc1 ENDP

reset_all_zero_acc2 PROC
    MOV AX, sum2          ; resets to 0
    MOV BX, AX
    SUB sum2, BX

    MOV AX, num_ameri2          ; resets to 0
    MOV BX, AX
    SUB num_ameri2, BX

    MOV AX, total_amer2          ; resets to 0
    MOV BX, AX
    SUB total_amer2, BX

    MOV AX, num_espre2          ; resets to 0
    MOV BX, AX
    SUB num_espre2, BX

    MOV AX, total_espr2          ; resets to 0
    MOV BX, AX
    SUB total_espr2, BX

    MOV AX, num_cappu2          ; resets to 0
    MOV BX, AX
    SUB num_cappu2, BX

    MOV AX, total_capp2          ; resets to 0
    MOV BX, AX
    SUB total_capp2, BX

    MOV AX, num_latte2          ; resets to 0
    MOV BX, AX
    SUB num_latte2, BX

    MOV AX, total_latt2          ; resets to 0
    MOV BX, AX
    SUB total_latt2, BX

    MOV AX, num_mocha2          ; resets to 0
    MOV BX, AX
    SUB num_mocha2, BX

    MOV AX, total_moch2          ; resets to 0
    MOV BX, AX
    SUB total_moch2, BX
    RET
reset_all_zero_acc2 ENDP

reset_all_zero_acc3 PROC
    MOV AX, sum3          ; resets to 0
    MOV BX, AX
    SUB sum3, BX

    MOV AX, num_ameri3          ; resets to 0
    MOV BX, AX
    SUB num_ameri3, BX

    MOV AX, total_amer3          ; resets to 0
    MOV BX, AX
    SUB total_amer3, BX

    MOV AX, num_espre3          ; resets to 0
    MOV BX, AX
    SUB num_espre3, BX

    MOV AX, total_espr3          ; resets to 0
    MOV BX, AX
    SUB total_espr3, BX

    MOV AX, num_cappu3          ; resets to 0
    MOV BX, AX
    SUB num_cappu3, BX

    MOV AX, total_capp3          ; resets to 0
    MOV BX, AX
    SUB total_capp3, BX

    MOV AX, num_latte3          ; resets to 0
    MOV BX, AX
    SUB num_latte3, BX

    MOV AX, total_latt3          ; resets to 0
    MOV BX, AX
    SUB total_latt3, BX

    MOV AX, num_mocha3          ; resets to 0
    MOV BX, AX
    SUB num_mocha3, BX

    MOV AX, total_moch3          ; resets to 0
    MOV BX, AX
    SUB total_moch3, BX
    RET
reset_all_zero_acc3 ENDP

REVIEW_ORDER_ACC1 PROC
    LEA DX, curr_order
    MOV AH, 09H
    INT 21H

    LEA DX, curr_amer_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_ameri1           ; prints number of orders of the item
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_amer1          ; prints total price of item
    CALL DISPLAY_NUM2

    LEA DX, curr_espr_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_espre1
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_espr1
    CALL DISPLAY_NUM2

    LEA DX, curr_capp_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_cappu1
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_capp1
    CALL DISPLAY_NUM2

    LEA DX, curr_latt_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_latte1
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_latt1
    CALL DISPLAY_NUM2

    LEA DX, curr_moch_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_mocha1
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_moch1
    CALL DISPLAY_NUM2
    
    LEA DX, order_total 
    MOV AH, 09H
    INT 21H
    
    MOV AX, sum1
    CALL DISPLAY_NUM2
    
    RET
REVIEW_ORDER_ACC1 ENDP

REVIEW_ORDER_ACC2 PROC
    LEA DX, curr_order
    MOV AH, 09H
    INT 21H

    LEA DX, curr_amer_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_ameri2           ; prints number of orders of the item
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_amer2          ; prints total price of item
    CALL DISPLAY_NUM2

    LEA DX, curr_espr_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_espre2
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_espr2
    CALL DISPLAY_NUM2

    LEA DX, curr_capp_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_cappu2
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_capp2
    CALL DISPLAY_NUM2

    LEA DX, curr_latt_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_latte2
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_latt2
    CALL DISPLAY_NUM2

    LEA DX, curr_moch_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_mocha2
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_moch2
    CALL DISPLAY_NUM2
    
    LEA DX, order_total 
    MOV AH, 09H
    INT 21H
    
    MOV AX, sum2
    CALL DISPLAY_NUM2
    
    RET
REVIEW_ORDER_ACC2 ENDP

REVIEW_ORDER_ACC3 PROC
    LEA DX, curr_order
    MOV AH, 09H
    INT 21H

    LEA DX, curr_amer_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_ameri3           ; prints number of orders of the item
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_amer3          ; prints total price of item
    CALL DISPLAY_NUM2

    LEA DX, curr_espr_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_espre3
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_espr3
    CALL DISPLAY_NUM2

    LEA DX, curr_capp_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_cappu3
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_capp3
    CALL DISPLAY_NUM2

    LEA DX, curr_latt_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_latte3
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_latt3
    CALL DISPLAY_NUM2

    LEA DX, curr_moch_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, num_mocha3
    CALL DISPLAY_NUM2

    LEA DX, curr_price_prompt
    MOV AH, 09H
    INT 21H

    MOV AX, total_moch3
    CALL DISPLAY_NUM2
    
    LEA DX, order_total 
    MOV AH, 09H
    INT 21H
    
    MOV AX, sum3
    CALL DISPLAY_NUM2
    
    RET
REVIEW_ORDER_ACC3 ENDP

print_acc PROC
    LEA DX, space
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, acc_title
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
    mov bl,  6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, acc_login
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
    mov bl,  6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, acc_regis
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
    mov bl,  6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, acc_exit
    MOV AH, 09H
    INT 21H

    RET
print_acc ENDP

print_menu PROC

    LEA DX, space
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_title
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
    mov bl,  6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_create
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
    mov bl,  6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_review
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
    mov bl,  6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_delete
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
    mov bl,  6Eh ; orange, yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_ex
    MOV AH, 09H
    INT 21H

    RET
print_menu ENDP

STRING_CHECKER proc              ; function to compare two strings
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
STRING_CHECKER endp

STRING_CLEAR PROC
    CLEAR_LOOP:
        mov al, BYTE PTR [SI]

        cmp al, '$'
        JNE NULL_COMPLETE

        lea dx, barrier
        mov ah, 09h
        int 21h
        
        lea dx, BYTE PTR [SI]
        mov ah, 09h
        int 21h

        lea dx, barrier
        mov ah, 09h
        int 21h

        MOV BYTE PTR [SI], '$'
        DEC SI
        LOOP CLEAR_LOOP

    NULL_COMPLETE:
        RET
STRING_CLEAR ENDP

PRINT_LOGIN_ATTEMPT PROC        ; NOT ACTUALLY IMPLEMENTED, ONLY USED TO VISUALLY SEE REGISTERED USERNAME AND PASSWORD, AND LOGIN USERNAME AND PASSWORD FOR ANY COMPARE STRING ERRORS
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

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    lea dx, loginUsername+2
    mov ah, 09h
    int 21h

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    lea dx, inputUsername1+2
    mov ah, 09h
    int 21h

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    lea dx, inputUsername2+2
    mov ah, 09h
    int 21h

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    lea dx, inputUsername3+2
    mov ah, 09h
    int 21h

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    lea dx, loginPassword+2
    mov ah, 09h
    int 21h

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    lea dx, inputPassword1+2
    mov ah, 09h
    int 21h

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    lea dx, inputPassword2+2
    mov ah, 09h
    int 21h

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    lea dx, inputPassword3+2
    mov ah, 09h
    int 21h

;PRINT_LOGIN_ATTEMPT ENDP

END MAIN