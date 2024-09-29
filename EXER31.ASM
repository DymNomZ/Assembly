;Filename: EXER31.ASM
;First Semester SY 2024-2025
;Student Name: JOHN DYMIER BORGONIA
;Date: September 29, 2024

.model small
.stack 100
.data
    num db ?

    input db 'Enter an integer: $'

.code
START:
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    mov dx,OFFSET input   
    mov ah,9                   
    int 21h 

    MOV AH, 01H
    INT 21H
    SUB AL, '0' ; Convert ASCII to numeric
    MOV num, AL

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    MOV CL, 1
print_loop:
    MOV AH, 02H
    MOV DL, CL
    ADD DL, '0' ; Convert numeric to ASCII
    INT 21H

    mov ah,02h
    mov ch,0Ah ; NL
    mov dl,ch
    int 21h

    cmp CL, num
    je end_prog

    INC CL
    jmp print_loop

end_prog:
    ; Exit the program
    MOV AH, 4CH
    INT 21H

END START