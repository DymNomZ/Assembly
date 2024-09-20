; Filename: EXER22.ASM
; Programmer Name: JOHN DYMIER O. BORGONIA
; Date: SEPTEMBER 20, 2024
 
.MODEL SMALL
.STACK 100h
.DATA

    MAX EQU 1000

    cit_u DB 'Cebu Institute of Technology - University',13,10,'$'
    stud_frm DB 'STUDENT ENROLLMENT FORM',13,10,10,'$'
    enter_prompt DB 'Please enter the following information:',13,10,'$'

    stud_id_num_input DB 'Student ID Number: $'
    stud_id_num DB MAX DUP('$')
    f_name DB MAX DUP('$') 
    m_name DB MAX DUP('$')
    b_name DB MAX DUP('$')
    f_name_input DB 'Enter First Name: $'
    m_name_input DB 'Enter Middle Name: $'
    b_name_input DB 'Enter Family Name: $'
    addrs_input DB 'Address: $'
    addrs DB MAX DUP('$')
    course_input DB 'Course: $'
    course DB MAX DUP('$')
    year_input DB 'Year: $'
    year DB MAX DUP('$')
    bday_month_input DB 'Birthday Month: $'
    bday_month DB MAX DUP('$')
    bday_day_input DB 'Birthday Day: $'
    bday_day DB MAX DUP('$')
    bday_year_input DB 'Birthday Year: $'
    bday_year DB MAX DUP('$')
    email_input DB 'Email Address: $'
    email DB MAX DUP('$')

    summary DB 13,10,10,'SUMMARY',13,10,'$'
    please_chk DB 'Please check if all information are correct.',13,10,10,'$'

    thanks DB 13,10,10,'Thank you for enrolling at CIT-U.',13,10,'$'
    copyright DB 'Copyright 2024',13,10,'$'
    programmer DB 'Programmer: JOHN DYMIER O. BORGONIA$'
 
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, cit_u
    MOV AH, 09h               
    INT 21h

    LEA DX, stud_frm
    MOV AH, 09h               
    INT 21h

    LEA DX, enter_prompt
    MOV AH, 09h               
    INT 21h

    LEA DX, f_name_input
    MOV AH, 09h               
    INT 21h

    LEA DX, f_name
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h
 
    LEA DX, m_name_input
    MOV AH, 09h               
    INT 21h

    LEA DX, m_name
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, b_name_input
    MOV AH, 09h               
    INT 21h

    LEA DX, b_name
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA SI, f_name + 2     
    MOV CL, [f_name + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, f_name + 2     
    MOV AH, 09h               
    INT 21h
 
    mov ah,02h
    mov cl,20h ; Space
    mov dl,cl
    int 21h
 
    LEA SI, m_name + 2     
    MOV CL, [m_name + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, m_name + 2     
    MOV AH, 09h               
    INT 21h
 
    mov ah,02h
    mov cl,20h ; Space
    mov dl,cl
    int 21h
 
    LEA SI, b_name + 2     
    MOV CL, [b_name + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, b_name + 2     
    MOV AH, 09h               
    INT 21h
 
    mov ah,02h
    mov cl,21h ; !
    mov dl,cl
    int 21h

    MOV AX, 4C00h             
    INT 21h
MAIN ENDP
END MAIN