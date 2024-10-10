;FILENAME: MIDTERM.ASM
;CS243 Lab Hands-On Midterm Exam
;First Semester SY 2024 - 2025
;Student Name: JOHN DYMIER O. BORGONIA
;Date Finished: October 11, 2024
 
.model small
stack 100h
.data
    header db     ' Online Grocery Order Form'
           db 0ah,' Programmer: JOHN DYMIER O. BORGONIA'
           db 0ah,' Date : October 11, 2024'
           db 0ah,0ah,' Please enter 5 grocery items: $'
 
    prompt1 db 0ah,' Item No. 1: $'
    prompt2 db 0ah,' Item No. 2: $'
    prompt3 db 0ah,' Item No. 3: $'
    prompt4 db 0ah,' Item No. 4: $'
    prompt5 db 0ah,' Item No. 5: $'
 
    input1 db 50,?, 50 dup(' ')
    input2 db 50,?, 50 dup(' ')
    input3 db 50,?, 50 dup(' ')
    input4 db 50,?, 50 dup(' ')
    input5 db 50,?, 50 dup(' ')
 
    border db 0ah,' _______________________ $'
   
    output1 db 0ah,' Item No. 1:   ',179,'$'
    output2 db 0ah,' Item No. 2:   ',179,'$'
    output3 db 0ah,' Item No. 3:   ',179,'$'
    output4 db 0ah,' Item No. 4:   ',179,'$'
    output5 db 0ah,' Item No. 5:   ',179,'$'
    summary db 0ah,0ah,09h,'      ORDER SUMMARY$'
   
    footer1 db 0ah,0ah,' Thank you for shopping!$'
    footer2 db ' Order again soon.$'
 
.code
start:
    mov ax, @data
    mov ds, ax
   
    mov ax, 3
    int 10h
 
    ;header
    mov ah, 09h
    lea dx, header
    int 21h
 
    ;prompt1
    mov ah, 09h
    lea dx, prompt1
    int 21h
 
    mov ah, 0ah
    lea dx, input1
    int 21h
 
    ;prompt2
    mov ah, 09h
    lea dx, prompt2
    int 21h
 
    mov ah, 0ah
    lea dx, input2
    int 21h
 
    ;prompt3
    mov ah, 09h
    lea dx, prompt3
    int 21h
 
    mov ah, 0ah
    lea dx, input3
    int 21h
 
    ;prompt4
    mov ah, 09h
    lea dx, prompt4
    int 21h
 
    mov ah, 0ah
    lea dx, input4
    int 21h
 
    ;prompt5
    mov ah, 09h
    lea dx, prompt5
    int 21h
 
    mov ah, 0ah
    lea dx, input5
    int 21h
 
    ;color
    mov ah, 06h
    xor cl, cl
    xor ax, ax
 
    ;order summary
    mov ah, 06h
    mov ch, 11
    mov cl, 0
    mov dh, 11
    mov dl, 36
    mov bh, 04eh
    int 10h
 
    ;order1
    mov ah, 06h
    mov ch, 12
    mov cl, 0
    mov dh, 12
    mov dl, 36
    mov bh, 70h
    int 10h
 
    ;order2
    mov ah, 06h
    mov ch, 13
    mov cl, 0
    mov dh, 13
    mov dl, 36
    mov bh, 30h
    int 10h
 
    ;order3
    mov ah, 06h
    mov ch, 14
    mov cl, 0
    mov dh, 14
    mov dl, 36
    mov bh, 70h
    int 10h
 
    ;order4
    mov ah, 06h
    mov ch, 15
    mov cl, 0
    mov dh, 15
    mov dl, 36
    mov bh, 30h
    int 10h
 
    ;order5
    mov ah, 06h
    mov ch, 16
    mov cl, 0
    mov dh, 16
    mov dl, 36
    mov bh, 70h
    int 10h
 
    ;BORDER THING1
    mov ah, 06h
    mov ch, 11
    mov cl, 0
    mov dh, 16
    mov dl, 0
    mov bh, 70h
    int 10h
 
    ;BORDER THING1
    mov ah, 06h
    mov ch, 11
    mov cl, 37
    mov dh, 16
    mov dl, 37
    mov bh, 70h
    int 10h
 
    ;FOOTER
    mov ah, 06h
    mov ch, 19
    mov cl, 1
    mov dh, 19
    mov dl, 17
    mov bh, 0ceH
    int 10h
 
 
    ;summary
    mov ah, 09h
    lea dx, summary
    int 21h
   
    ;output1
    mov ah, 09h
    lea dx, output1
    int 21h
 
    xor bx, bx
    mov bl, input1[1]
    mov input1[bx +2], '$'
    lea dx, input1 +2
    mov ah, 09h
    int 21h
 
    ;output2
    mov ah, 09h
    lea dx, output2
    int 21h
 
    xor bx, bx
    mov bl, input2[1]
    mov input2[bx +2], '$'
    lea dx, input2 +2
    mov ah, 09h
    int 21h
 
    ;output3
    mov ah, 09h
    lea dx, output3
    int 21h
 
    xor bx, bx
    mov bl, input3[1]
    mov input3[bx +2], '$'
    lea dx, input3 +2
    mov ah, 09h
    int 21h
 
    ;output4
    mov ah, 09h
    lea dx, output4
    int 21h
 
    xor bx, bx
    mov bl, input4[1]
    mov input4[bx +2], '$'
    lea dx, input4 +2
    mov ah, 09h
    int 21h
 
    ;output5
    mov ah, 09h
    lea dx, output5
    int 21h
 
    xor bx, bx
    mov bl, input5[1]
    mov input5[bx +2], '$'
    lea dx, input5 +2
    mov ah, 09h
    int 21h
 
    ;footer1
    mov ah, 09h
    lea dx, footer1
    int 21h
 
    mov ah, 02h
    mov cl, 0ah
    mov dl, cl
    int 21h
    ;footer2
    mov ah, 09h
    lea dx, footer2
    int 21h
 
 
    int 27h
 
end start