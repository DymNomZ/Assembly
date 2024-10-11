;FILENAME: MIDTERM.ASM
;CS243 Lab Hands-On Midterm Exam
;First Semester SY 2024 - 2025
;Student Name: JOHN DYMIER O. BORGONIA
;Date Finished: October 11, 2024
 
.model small
stack 100h
.data
    head1 db ' Online Grocery Order Form$'
    head2 db 0ah,' Programmer: JOHN DYMIER O. BORGONIA$'
    head3 db 0ah,' Date : October 11, 2024$'
    head4 db 0ah,0ah,' Please enter 5 grocery items: $'
 
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
    summary db 0ah,0ah,09h,'     ORDER SUMMARY$'
   
    footer1 db 0ah,0ah,' Thank you for shopping!$'
    footer2 db ' Order again soon.$'
 
.code
start:
    MOV ax, @data
    MOV ds, ax
   
    MOV ax, 3
    INT 10h
 
    ;form header
    MOV ah, 09h
    lea dx, head1
    INT 21h

    MOV ah, 09h
    lea dx, head2
    INT 21h

    MOV ah, 09h
    lea dx, head3
    INT 21h

    MOV ah, 09h
    lea dx, head4
    INT 21h
 
    ;prompts
    MOV ah, 09h
    lea dx, prompt1
    INT 21h
 
    MOV ah, 0ah
    lea dx, input1
    INT 21h
 
    MOV ah, 09h
    lea dx, prompt2
    INT 21h
 
    MOV ah, 0ah
    lea dx, input2
    INT 21h
 
    MOV ah, 09h
    lea dx, prompt3
    INT 21h
 
    MOV ah, 0ah
    lea dx, input3
    INT 21h
 
    MOV ah, 09h
    lea dx, prompt4
    INT 21h
 
    MOV ah, 0ah
    lea dx, input4
    INT 21h
 
    MOV ah, 09h
    lea dx, prompt5
    INT 21h
 
    MOV ah, 0ah
    lea dx, input5
    INT 21h
 
    MOV ah, 06h
    xor cl, cl
    xor ax, ax
 
    MOV ah, 06h
    MOV ch, 11
    MOV cl, 0
    MOV dh, 11
    MOV dl, 36
    MOV bh, 04eh
    INT 10h

    ;codes to color the form
    MOV ah, 06h
    MOV ch, 12
    MOV cl, 0
    MOV dh, 12
    MOV dl, 36
    MOV bh, 70h
    INT 10h
 
    MOV ah, 06h
    MOV ch, 13
    MOV cl, 0
    MOV dh, 13
    MOV dl, 36
    MOV bh, 20h
    INT 10h
 
    MOV ah, 06h
    MOV ch, 14
    MOV cl, 0
    MOV dh, 14
    MOV dl, 36
    MOV bh, 70h
    INT 10h
 
    MOV ah, 06h
    MOV ch, 15
    MOV cl, 0
    MOV dh, 15
    MOV dl, 36
    MOV bh, 20h
    INT 10h
 
    MOV ah, 06h
    MOV ch, 16
    MOV cl, 0
    MOV dh, 16
    MOV dl, 36
    MOV bh, 70h
    INT 10h

    ;handle black sides
    MOV ah, 06h
    MOV ch, 11
    MOV cl, 0
    MOV dh, 16
    MOV dl, 0
    MOV bh, 00h
    INT 10h

    MOV ah, 06h
    MOV ch, 11
    MOV cl, 37
    MOV dh, 16
    MOV dl, 37
    MOV bh, 00h
    INT 10h
 
    ;order again soon
    MOV ah, 06h
    MOV ch, 19
    MOV cl, 1
    MOV dh, 19
    MOV dl, 17
    MOV bh, 0ceH
    INT 10h

    ;summary
    MOV ah, 09h
    lea dx, summary
    INT 21h
   
    ;outputs
    MOV ah, 09h
    lea dx, output1
    INT 21h
 
    xor bx, bx
    MOV bl, input1[1]
    MOV input1[bx +2], '$'
    lea dx, input1 +2
    MOV ah, 09h
    INT 21h
 
    MOV ah, 09h
    lea dx, output2
    INT 21h
 
    xor bx, bx
    MOV bl, input2[1]
    MOV input2[bx +2], '$'
    lea dx, input2 +2
    MOV ah, 09h
    INT 21h
 
    MOV ah, 09h
    lea dx, output3
    INT 21h
 
    xor bx, bx
    MOV bl, input3[1]
    MOV input3[bx +2], '$'
    lea dx, input3 +2
    MOV ah, 09h
    INT 21h
 
    MOV ah, 09h
    lea dx, output4
    INT 21h
 
    xor bx, bx
    MOV bl, input4[1]
    MOV input4[bx +2], '$'
    lea dx, input4 +2
    MOV ah, 09h
    INT 21h
 
    MOV ah, 09h
    lea dx, output5
    INT 21h
 
    xor bx, bx
    MOV bl, input5[1]
    MOV input5[bx +2], '$'
    lea dx, input5 +2
    MOV ah, 09h
    INT 21h
 
    ;footers
    MOV ah, 09h
    lea dx, footer1
    INT 21h
 
    MOV ah, 02h
    MOV cl, 0ah ; nl
    MOV dl, cl
    INT 21h

    MOV ah, 09h
    lea dx, footer2
    INT 21h
 
 
    INT 27h
 
end start