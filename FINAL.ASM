; Filename: FINAL.ASM
; CS243 Lab Hands-on Final Exam
; First Semester SY 2024-2025
; Student Name: JOHN DYMIER O. BORGONIA
; Date Finished: December 13, 2023

.model small
.stack 100h
.data  
    header  db 0ah, "Cebu Institute of Technology - University", 0ah
            db "College of Computer Studies", 0ah
            db "FAVORITE CLASSMATE VOTING SYSTEM", 0ah
            db "Programmer: JOHN DYMIER O. BORGONIA", "$"

    menu_choices db 0ah,0ah,'MAIN MENU'
               db 0ah,'1. Vote'
               db 0ah,'2. View'
               db 0ah,'3. Update'
               db 0ah,'4. Delete'
               db 0ah,'5. Exit'
               db 0ah,'Enter choice: $'

    choice     db ?

    vote    db 0ah, 0ah, 'Vote', '$'
    view    db 0ah, 0ah, 'View', '$'
    update  db 0ah, 0ah, 'Update', 0ah, '$'
    delete  db 0ah, 0ah, 'Delete', 0ah, '$'

    index_prompt db 'Enter the index of the item to modify: $'
    index        db ?
 
    candidate_name_prompt db 0ah,'Enter candidate name: $'
    vote_rating_prompt db 0ah,'Enter vote rating (0-100): $'
    no_record_prompt db 0ah,'No record found.$'
 
    candidate_ctr db 1

    input1 db 50, ?, 50 dup(' ')
    input2 db 50, ?, 50 dup(' ')
    input3 db 50, ?, 50 dup(' ')
    input4 db 50, ?, 50 dup(' ')
    input5 db 50, ?, 50 dup(' ')
    blank_input db 50, ?, 50 dup(' ')

    rating1 db 50, ?, 50 dup(' ')
    rating2 db 50, ?, 50 dup(' ')
    rating3 db 50, ?, 50 dup(' ')
    rating4 db 50, ?, 50 dup(' ')
    rating5 db 50, ?, 50 dup(' ')
    blank_rating db 50, ?, 50 dup(' ')
 
    dash db ' - $'
 
    output1 db 0ah,'1. $'
    output2 db 0ah,'2. $'
    output3 db 0ah,'3. $'
    output4 db 0ah,'4. $'
    output5 db 0ah,'5. $'

    delete_prompt db 0ah, 'Record deleted.$'
    key_prompt db 0ah, 0ah, 'Press any key to go back to Main Menu...$'

    footer db 0ah,0ah,'Exiting...'
           db 0ah,'Thank you for using Favorite Classmate Voting'
           db 0ah,'System.',0ah,'$'
 
.code
start:
    mov ax, @data
    mov ds, ax
 
    mov ax, 3
    int 10h
 
MAIN_MENU:
    call CLEAR_SCREEN

    call MENU_COLORS

    lea dx, header
    mov ah, 9
    int 21h

    lea dx, menu_choices
    mov ah, 9
    int 21h

    mov ah, 1               
    int 21h                     
    mov choice, al

    cmp choice, '1' 
    je VOTE_CREATE
    cmp choice, '2'
    je VOTE_VIEW
    cmp choice, '3'
    je VOTE_UPDATE
    cmp choice, '4'
    je VOTE_DELETE
    cmp choice, '5'
    je VOTE_EXIT
    jmp MAIN_MENU

VOTE_CREATE:
    call CLEAR_SCREEN
    call CREATE_FUNCTION
    call CREATE_VOTE
    jmp MAIN_MENU

NO_RECORD:
    lea dx, no_record_prompt
    mov ah, 9
    int 21h

    call WAIT_FOR_INPUT
    jmp MAIN_MENU

VOTE_VIEW:
    call CLEAR_SCREEN
    call VIEW_FUNCTION

    cmp candidate_ctr, 1
    je NO_RECORD

    call VIEW_VOTE
    jmp MAIN_MENU

VOTE_UPDATE:
    call CLEAR_SCREEN

    call UPDATE_FUNCTION
    call UPDATE_VOTE
    jmp MAIN_MENU

VOTE_DELETE:
    call CLEAR_SCREEN
    call DELETE_FUNCTION

    call DELETE_VOTE
    jmp MAIN_MENU

VOTE_EXIT:
    call EXIT_PROGRAM

CREATE_VOTE:
    
    cmp candidate_ctr, 1 
    je ENTER1
    cmp candidate_ctr, 2
    je ENTER2
    cmp candidate_ctr, 3
    je ENTER3
    cmp candidate_ctr, 4
    je ENTER4
    cmp candidate_ctr, 5
    je ENTER5
    
    jmp MAIN_MENU

    ret

ENTER1:
    call ENTER1_FUNCTION    
    call WAIT_FOR_INPUT
    ret
ENTER2:
    call ENTER2_FUNCTION
    call WAIT_FOR_INPUT
    ret
ENTER3:
    call ENTER3_FUNCTION   
    call WAIT_FOR_INPUT
    ret
ENTER4:
    call ENTER4_FUNCTION   
    call WAIT_FOR_INPUT
    ret
ENTER5:
    call ENTER5_FUNCTION  
    call WAIT_FOR_INPUT
    ret

UPDATE_VOTE:
    lea dx, index_prompt
    mov ah, 9
    int 21h

    mov ah, 1               
    int 21h                     
    mov index, al

    cmp index, '1'
    je UPDATE1
    cmp index, '2'
    je UPDATE2
    cmp index, '3'
    je UPDATE3
    cmp index, '4'
    je UPDATE4
    cmp index, '5'
    je UPDATE5
    
    jmp MAIN_MENU
    ret

UPDATE1:
    call UPDATE1_FUNCTION    
    call WAIT_FOR_INPUT
    ret
UPDATE2:
    call UPDATE2_FUNCTION
    call WAIT_FOR_INPUT
    ret
UPDATE3:
    call UPDATE3_FUNCTION   
    call WAIT_FOR_INPUT
    ret
UPDATE4:
    call UPDATE4_FUNCTION   
    call WAIT_FOR_INPUT
    ret
UPDATE5:
    call UPDATE5_FUNCTION  
    call WAIT_FOR_INPUT
    ret

VIEW_VOTE:
    lea dx, output1
    mov ah, 9
    int 21h
 
    xor bx, bx
    mov bl, input1[1]
    mov input1[bx+2], '$'
    lea dx, input1 + 2
    mov ah, 09h
    int 21h

    lea dx, dash
    mov ah, 09h
    int 21h

    xor bx, bx
    mov bl, rating1[1]
    mov rating1[bx+2], '$'
    lea dx, rating1 + 2
    mov ah, 09h
    int 21h

    lea dx, output2
    mov ah, 9
    int 21h
 
    xor bx, bx
    mov bl, input2[1]
    mov input2[bx+2], '$'
    lea dx, input2 + 2
    mov ah, 09h
    int 21h
    
    lea dx, dash
    mov ah, 09h
    int 21h
    
    xor bx, bx
    mov bl, rating2[1]
    mov rating2[bx+2], '$'
    lea dx, rating2 + 2
    mov ah, 09h
    int 21h

    lea dx, output3
    mov ah, 9
    int 21h
 
    xor bx, bx
    mov bl, input3[1]
    mov input3[bx+2], '$'
    lea dx, input3 + 2
    mov ah, 09h
    int 21h

    lea dx, dash
    mov ah, 09h
    int 21h
    
    xor bx, bx
    mov bl, rating3[1]
    mov rating3[bx+2], '$'
    lea dx, rating3 + 2
    mov ah, 09h
    int 21h

    lea dx, output4
    mov ah, 9
    int 21h
 
    xor bx, bx
    mov bl, input4[1]
    mov input4[bx+2], '$'
    lea dx, input4 + 2
    mov ah, 09h
    int 21h

    lea dx, dash
    mov ah, 09h
    int 21h
    
    xor bx, bx
    mov bl, rating4[1]
    mov rating4[bx+2], '$'
    lea dx, rating4 + 2
    mov ah, 09h
    int 21h

    lea dx, output5
    mov ah, 9
    int 21h
 
    xor bx, bx
    mov bl, input5[1]
    mov input5[bx+2], '$'
    lea dx, input5 + 2
    mov ah, 09h
    int 21h

    lea dx, dash
    mov ah, 09h
    int 21h
    
    xor bx, bx
    mov bl, rating5[1]
    mov rating5[bx+2], '$'
    lea dx, rating5 + 2
    mov ah, 09h
    int 21h

    call WAIT_FOR_INPUT
    ret

DELETE_VOTE:
    lea dx, index_prompt
    mov ah, 9
    int 21h

    ; Get item index to delete
    mov ah, 1
    int 21h
    mov index, al

    ; Based on index, CLEAR the corresponding input
    cmp index, '1'
    je CLEAR_VOTE1
    cmp index, '2'
    je CLEAR_VOTE2
    cmp index, '3'
    je CLEAR_VOTE3
    cmp index, '4'
    je CLEAR_VOTE4
    cmp index, '5'
    je CLEAR_VOTE5

    ret

CLEAR_VOTE1:
    call CLEAR1_FUNCTION
    lea dx, delete_prompt
    mov ah, 9
    int 21h
    call WAIT_FOR_INPUT
    ret

CLEAR_VOTE2:
    call CLEAR2_FUNCTION
    lea dx, delete_prompt
    mov ah, 9
    int 21h
    call WAIT_FOR_INPUT
    ret

CLEAR_VOTE3:
    call CLEAR3_FUNCTION
    lea dx, delete_prompt
    mov ah, 9
    int 21h
    call WAIT_FOR_INPUT
    ret

CLEAR_VOTE4:
    call CLEAR4_FUNCTION
    lea dx, delete_prompt
    mov ah, 9
    int 21h
    call WAIT_FOR_INPUT
    ret

CLEAR_VOTE5:
    call CLEAR5_FUNCTION
    lea dx, delete_prompt
    mov ah, 9
    int 21h
    call WAIT_FOR_INPUT
    ret

EXIT_PROGRAM:
    lea dx, footer
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h

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

ENTER1_FUNCTION:
    lea dx, candidate_name_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, input1
    int 21h

    lea dx, vote_rating_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, rating1
    int 21h

    inc byte ptr [candidate_ctr]

    ret

ENTER2_FUNCTION:
    lea dx, candidate_name_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, input2
    int 21h

    lea dx, vote_rating_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, rating2
    int 21h

    inc byte ptr [candidate_ctr]

    ret

ENTER3_FUNCTION:
    lea dx, candidate_name_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, input3
    int 21h

    lea dx, vote_rating_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, rating3
    int 21h

    inc byte ptr [candidate_ctr]

    ret

ENTER4_FUNCTION:
    lea dx, candidate_name_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, input4
    int 21h

    lea dx, vote_rating_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, rating4
    int 21h
    inc byte ptr [candidate_ctr]

    ret

ENTER5_FUNCTION:
    lea dx, candidate_name_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, input5
    int 21h

    lea dx, vote_rating_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, rating5
    int 21h

    inc byte ptr [candidate_ctr]

    ret

UPDATE1_FUNCTION:
    lea dx, candidate_name_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, input1
    int 21h

    lea dx, vote_rating_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, rating1
    int 21h

    ret

UPDATE2_FUNCTION:
    lea dx, candidate_name_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, input2
    int 21h

    lea dx, vote_rating_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, rating2
    int 21h

    ret

UPDATE3_FUNCTION:
    lea dx, candidate_name_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, input3
    int 21h

    lea dx, vote_rating_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, rating3
    int 21h

    ret

UPDATE4_FUNCTION:
    lea dx, candidate_name_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, input4
    int 21h

    lea dx, vote_rating_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, rating4
    int 21h

    ret

UPDATE5_FUNCTION:
    lea dx, candidate_name_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, input5
    int 21h

    lea dx, vote_rating_prompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, rating5
    int 21h

    ret

CLEAR1_FUNCTION:
    ; CLEAR input1 buffer
    lea di, input1 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, input2 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
    lea di, rating1 + 2          
    lea si, rating2 + 2          
    mov cx, 50                  
    call COPY

    lea di, input2 + 2          
    lea si, input3 + 2          
    mov cx, 50                  
    call COPY
    lea di, rating2 + 2          
    lea si, rating3 + 2          
    mov cx, 50                  
    call COPY
    
    lea di, input3 + 2          
    lea si, input4 + 2          
    mov cx, 50                  
    call COPY
    lea di, rating3 + 2          
    lea si, rating4 + 2          
    mov cx, 50                  
    call COPY

    lea di, input4 + 2          
    lea si, input5 + 2          
    mov cx, 50                  
    call COPY
    lea di, rating4 + 2          
    lea si, rating5 + 2          
    mov cx, 50                  
    call COPY

    call CLEAR5_FUNCTION

    ret

CLEAR2_FUNCTION:

    lea di, input2 + 2          
    lea si, input3 + 2          
    mov cx, 50                  
    call COPY
    lea di, rating2 + 2          
    lea si, rating3 + 2          
    mov cx, 50                  
    call COPY
    
    lea di, input3 + 2          
    lea si, input4 + 2          
    mov cx, 50                  
    call COPY
    lea di, rating3 + 2          
    lea si, rating4 + 2          
    mov cx, 50                  
    call COPY

    lea di, input4 + 2          
    lea si, input5 + 2          
    mov cx, 50                  
    call COPY
    lea di, rating4 + 2          
    lea si, rating5 + 2          
    mov cx, 50                  
    call COPY

    call CLEAR5_FUNCTION

    ret

CLEAR3_FUNCTION:

    lea di, input3 + 2          
    lea si, input4 + 2          
    mov cx, 50                  
    call COPY
    lea di, rating3 + 2          
    lea si, rating4 + 2          
    mov cx, 50                  
    call COPY

    lea di, input4 + 2          
    lea si, input5 + 2          
    mov cx, 50                  
    call COPY
    lea di, rating4 + 2          
    lea si, rating5 + 2          
    mov cx, 50                  
    call COPY

    call CLEAR5_FUNCTION

    ret

CLEAR4_FUNCTION:

    lea di, input4 + 2          
    lea si, input5 + 2          
    mov cx, 50                  
    call COPY
    lea di, rating4 + 2          
    lea si, rating5 + 2          
    mov cx, 50                  
    call COPY

    call CLEAR5_FUNCTION

    ret

CLEAR5_FUNCTION:

    lea di, input5 + 2          
    lea si, blank_input + 2          
    mov cx, 50                  
    call COPY
    lea di, rating5 + 2          
    lea si, blank_rating + 2          
    mov cx, 50                  
    call COPY

    ret

COPY:
    COPY_LOOP:
        mov al, [si-1]                ; Load byte from input2
        mov [di-1], al                ; Store byte to input1
        inc si                      ; Move to next byte in input2
        inc di                      ; Move to next byte in input1
    loop COPY_LOOP              ; Repeat until all 50 bytes are copied
ret

WAIT_FOR_INPUT:
    ; _FUNCTIONtion to wait for a key press
    lea dx, key_prompt
    mov ah, 9
    int 21h 

    mov ah, 1            ; DOS _FUNCTIONtion 0: Wait for a key press
    int 21h              ; Call DOS interrupt
    ret                  ; Return from the _FUNCTIONtion

MENU_COLORS:
    ; vote
    mov ah, 06h
    mov ch, 7 ; row start
    mov cl, 3 ; col start
    mov dh, 7  ; row end
    mov dl, 6  ; col end
    mov bh, 60h ; yellow, black
    int 10h

    ; view
    mov ah, 06h
    mov ch, 8 ; row start
    mov cl, 3 ; col start
    mov dh, 8  ; row end
    mov dl, 6  ; col end
    mov bh, 47h ; red, white
    int 10h

    ; update
    mov ah, 06h
    mov ch, 9 ; row start
    mov cl, 3 ; col start
    mov dh, 9  ; row end
    mov dl, 8  ; col end
    mov bh, 20h ; green, black
    int 10h

    ; delete
    mov ah, 06h
    mov ch, 10 ; row start
    mov cl, 3 ; col start
    mov dh, 10  ; row end
    mov dl, 8  ; col end
    mov bh, 17h ; blue, white
    int 10h

    ret

CREATE_FUNCTION:

    lea dx, header
    mov ah, 9
    int 21h

    ; vote
    mov ah, 06h
    mov ch, 6 ; row start
    mov cl, 0 ; col start
    mov dh, 6  ; row end
    mov dl, 3  ; col end
    mov bh, 60h ; yellow, black
    int 10h

    lea dx, vote
    mov ah, 9
    int 21h

    ret

VIEW_FUNCTION:

    lea dx, header
    mov ah, 9
    int 21h

    ; vote
    mov ah, 06h
    mov ch, 6 ; row start
    mov cl, 0 ; col start
    mov dh, 6  ; row end
    mov dl, 3  ; col end
    mov bh, 47h ; red, white
    int 10h

    lea dx, view
    mov ah, 9
    int 21h

    ret

UPDATE_FUNCTION:

    lea dx, header
    mov ah, 9
    int 21h

    ; vote
    mov ah, 06h
    mov ch, 6 ; row start
    mov cl, 0 ; col start
    mov dh, 6  ; row end
    mov dl, 5  ; col end
    mov bh, 20h ; green, black
    int 10h

    lea dx, update
    mov ah, 9
    int 21h

    ret

DELETE_FUNCTION:

    lea dx, header
    mov ah, 9
    int 21h

    ; vote
    mov ah, 06h
    mov ch, 6 ; row start
    mov cl, 0 ; col start
    mov dh, 6  ; row end
    mov dl, 5  ; col end
    mov bh, 17h ; blue, white
    int 10h

    lea dx, delete
    mov ah, 9
    int 21h

    ret

end start