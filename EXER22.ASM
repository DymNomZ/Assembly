; Filename: EXER22.ASM
; Programmer Name: JOHN DYMIER O. BORGONIA
; Date: SEPTEMBER 20, 2024
 
.MODEL SMALL
.STACK 100h
.DATA

    text1 db 'Filename: EXER22.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Student Enrollment Form$'
	text4 db 'Date Created: September 20, 2024$'

    cit_u DB 'Cebu Institute of Technology - University',13,10,'$'
    stud_frm DB 'STUDENT ENROLLMENT FORM',13,10,10,'$'
    enter_prompt DB 'Please enter the following information:',13,10,'$'

    stud_id_num_input DB 'Student ID Number: $'
    stud_id_num DB 50,0,51 DUP('$')
    f_name DB 50,0,51 DUP('$') 
    m_name DB 50,0,51 DUP('$')
    b_name DB 50,0,51 DUP('$')
    f_name_input DB 'Enter First Name: $'
    m_name_input DB 'Enter Middle Name: $'
    b_name_input DB 'Enter Family Name: $'
    addrs_input DB 'Address: $'
    addrs DB 100,0,101 DUP('$')
    course_input DB 'Course: $'
    course DB 50,0,51 DUP('$')
    year_input DB 'Year: $'
    year DB 50,0,51 DUP('$')
    bday_month_input DB 'Birthday Month: $'
    bday_month DB 50,0,51 DUP('$')
    bday_day_input DB 'Birthday Day: $'
    bday_day DB 50,0,51 DUP('$')
    bday_year_input DB 'Birthday Year: $'
    bday_year DB 50,0,51 DUP('$')
    email_input DB 'Email Address: $'
    email DB 50,0,51 DUP('$')

    summary DB 13,10,'SUMMARY',13,10,'$'
    please_chk DB 'Please check if all information are correct.',13,10,10,'$'

    id_num DB 'ID Number: $'
    full_name DB 'Full Name: $'
    course_year DB 'Course & Year: $'
    bday DB 'Birthday: $'

    thanks DB 13,10,'Thank you for enrolling at CIT-U.',13,10,'$'
    copyright DB 'Copyright 2024',13,10,'$'
    programmer DB 'Programmer: JOHN DYMIER O. BORGONIA$'
 
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    mov ah, 9
	mov dx,offset text1
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 9
	mov dx,offset text2
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 9
	mov dx,offset text3
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah, 9
	mov dx,offset text4
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h

	mov ah,02h
	mov cl,0Ah ; NL
	mov dl,cl
	int 21h        

    LEA DX, cit_u
    MOV AH, 09h               
    INT 21h

    LEA DX, stud_frm
    MOV AH, 09h               
    INT 21h

    LEA DX, enter_prompt
    MOV AH, 09h               
    INT 21h

    LEA DX, stud_id_num_input
    MOV AH, 09h               
    INT 21h

    LEA DX, stud_id_num
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

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

    LEA DX, addrs_input
    MOV AH, 09h               
    INT 21h

    LEA DX, addrs
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, course_input
    MOV AH, 09h               
    INT 21h

    LEA DX, course
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, year_input
    MOV AH, 09h               
    INT 21h

    LEA DX, year
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, bday_month_input
    MOV AH, 09h               
    INT 21h

    LEA DX, bday_month
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, bday_day_input
    MOV AH, 09h               
    INT 21h

    LEA DX, bday_day
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, bday_year_input
    MOV AH, 09h               
    INT 21h

    LEA DX, bday_year
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, email_input
    MOV AH, 09h               
    INT 21h

    LEA DX, email
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, summary
    MOV AH, 09h               
    INT 21h

    LEA DX, please_chk
    MOV AH, 09h               
    INT 21h

    LEA DX, id_num
    MOV AH, 09h               
    INT 21h

    LEA SI, stud_id_num + 2     
    MOV CL, [stud_id_num + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, stud_id_num + 2     
    MOV AH, 09h               
    INT 21h
 
    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, full_name
    MOV AH, 09h               
    INT 21h

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
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, addrs_input
    MOV AH, 09h               
    INT 21h

    LEA SI, addrs + 2     
    MOV CL, [addrs + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, addrs + 2     
    MOV AH, 09h               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, course_year
    MOV AH, 09h               
    INT 21h

    LEA SI, course + 2     
    MOV CL, [course + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, course + 2     
    MOV AH, 09h               
    INT 21h

    mov ah,02h
    mov cl,20h ; Space
    mov dl,cl
    int 21h

    LEA SI, year + 2     
    MOV CL, [year + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, year + 2     
    MOV AH, 09h               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, bday
    MOV AH, 09h               
    INT 21h

    LEA SI, bday_month + 2     
    MOV CL, [bday_month + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, bday_month + 2     
    MOV AH, 09h               
    INT 21h

    mov ah,02h
    mov cl,20h ; Space
    mov dl,cl
    int 21h

    LEA SI, bday_day + 2     
    MOV CL, [bday_day + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, bday_day + 2     
    MOV AH, 09h               
    INT 21h

    mov ah,02h
    mov cl,2Ch ; ,
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,20h ; Space
    mov dl,cl
    int 21h

    LEA SI, bday_year + 2     
    MOV CL, [bday_year + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, bday_year + 2     
    MOV AH, 09h               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, email_input
    MOV AH, 09h               
    INT 21h

    LEA SI, email + 2     
    MOV CL, [email + 1]   
    MOV CH, 0
    ADD SI, CX                
    MOV BYTE PTR [SI], '$'   
    LEA DX, email + 2     
    MOV AH, 09h               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, thanks
    MOV AH, 09h               
    INT 21h

    LEA DX, copyright
    MOV AH, 09h               
    INT 21h

    LEA DX, programmer
    MOV AH, 09h               
    INT 21h

    MOV AX, 4C00h             
    INT 21h
MAIN ENDP
END MAIN