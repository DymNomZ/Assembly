; Filename: EXAM3.ASM
; CS243 Lab Hands-on Exam No. 3
; First Semester SY 2024-2025
; Student Name: JOHN DYMIER O. BORGONIA
; Date Finished: October 4, 2024

.model small
.stack 100h
.data

    text1 db 'Filename: EXAM3.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: Voter Registration Form.$'
	text4 db 'Date Created: October 4, 2024$'

    voter_regis_form db "VOTER'S REGISTRATION FORM", 13,10, '$'
    created_by db 'Created by: JOHN DYMIER O. BORGONIA', 13, 10, '$'
    date db 'Date: OCTOBER 4, 2024', 13, 10, '$'

    f_name_input db 13, 10,'First Name: $'
    m_name_input db 13, 10,'Middle Name: $'
    l_name_input db 13, 10,'Family Name: $'
    gender_input db 13, 10,'Gender: $'

    bday db 13,10,'Birthday$'
    bday_month_input db 13,10,' Month: $'
    bday_day_input db 13,10,' Day: $'
    bday_year_input db 13,10,' Year: $'
    
    addrs_input db 13,10,'Address$'

    house_input db 13,10,' House Number: $'
    street_input db 13,10,' Street: $'
    brgy_input db 13,10,' Barangay: $'
    city_input db 13,10,' City: $'
    province_input db 13,10,' Province: $'

    school_name_input db 13,10,'  Name of School: $'
    school_year_input db 13,10,'  Year Graduated: $'

    education_input db 13,10,'Educational Background$'
    elem_input db 13,10,' Elementary$'
    junior_input db 13,10,' Junior High School$'
    senior_input db 13,10,' Senior High School$'
    college_input db 13,10,' College$'
    course_input db 13,10,'  Course: $'

    course db 50,0,51 dup ('$')

    f_name db 50,0,51 dup('$')
    m_name db 50,0,51 dup('$')
    l_name db 50,0,51 dup('$')
    gender db 50,0,51 dup('$')

    bday_month db 50,0,51 dup('$')
    bday_day db 50,0,51 dup('$')
    bday_year db 50,0,51 dup('$')

    house db 50,0,51 dup('$')
    street db 50,0,51 dup('$')
    brgy db 50,0,51 dup('$')
    city db 50,0,51 dup('$')
    province db 50,0,51 dup('$')

    elem_name db 100,0,101 dup('$')
    elem_year db 50,0,51 dup('$')
    junior_name db 100,0,101 dup('$')
    junior_year db 50,0,51 dup('$')
    senior_name db 100,0,101 dup('$')
    senior_year db 50,0,51 dup('$')
    college_name db 100,0,101 dup('$')
    college_year db 50,0,51 dup('$')
 
    summary db 13,10,10,'SUMMARY OF INFORMATION', 13, 10, '$'
    please_verify db 'PLEAse verify if all entries are correct.', 13, 10, '$'

    nl db 13, 10, 10, '$'
    vote_wisely db 'Vote wisely!$'
    thanks db 13,10, 'Thank you for registering. $'
    
.code
    
main: 
    MOV AX, @data
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
    
MOV AH, 09h
MOV BL, 60h 
MOV CX, 25
INT 10h

    LEA DX, voter_regis_form
    CALL prINT_string

MOV AH, 09h
MOV BL, 20h 
MOV CX, 35
INT 10h

    LEA DX, created_by
    CALL prINT_string

MOV AH, 09h
MOV BL, 30h 
MOV CX, 21
INT 10h

    LEA DX, date
    CALL prINT_string

    LEA DX, f_name_input
    CALL prINT_string
    LEA DX, f_name
    CALL scan_character
    
    LEA DX, m_name_input
    CALL prINT_string
    LEA DX, m_name
    CALL scan_character
    
    LEA DX, l_name_input
    CALL prINT_string
    LEA DX, l_name
    CALL scan_character
    
    LEA DX, gender_input
    CALL prINT_string
    LEA DX, gender
    CALL scan_character

    LEA DX, bday
    CALL prINT_string
    
    LEA DX, bday_month_input
    CALL prINT_string
    LEA DX, bday_month
    CALL scan_character
    
    LEA DX, bday_day_input
    CALL prINT_string
    LEA DX, bday_day
    CALL scan_character
    
    LEA DX, bday_year_input
    CALL prINT_string
    LEA DX, bday_year
    CALL scan_character

    LEA DX, addrs_input
    CALL prINT_string

    LEA DX, house_input
    CALL prINT_string
    LEA DX, house
    CALL scan_character
    
    LEA DX, street_input
    CALL prINT_string
    LEA DX, street
    CALL scan_character

    LEA DX, brgy_input
    CALL prINT_string
    LEA DX, brgy
    CALL scan_character

    LEA DX, city_input
    CALL prINT_string
    LEA DX, city
    CALL scan_character

    LEA DX, province_input
    CALL prINT_string
    LEA DX, province
    CALL scan_character

    LEA DX, education_input
    CALL prINT_string

    LEA DX, elem_input
    CALL prINT_string

    LEA DX, school_name_input
    CALL prINT_string
    LEA DX, elem_name
    CALL scan_character

    LEA DX, school_year_input
    CALL prINT_string
    LEA DX, elem_year
    CALL scan_character
    
    LEA DX, junior_input
    CALL prINT_string

    LEA DX, school_name_input
    CALL prINT_string
    LEA DX, junior_name
    CALL scan_character

    LEA DX, school_year_input
    CALL prINT_string
    LEA DX, junior_year
    CALL scan_character

    LEA DX, senior_input
    CALL prINT_string

    LEA DX, school_name_input
    CALL prINT_string
    LEA DX, senior_name
    CALL scan_character

    LEA DX, school_year_input
    CALL prINT_string
    LEA DX, senior_year
    CALL scan_character

    LEA DX, college_input
    CALL prINT_string

    LEA DX, school_name_input
    CALL prINT_string
    LEA DX, college_name
    CALL scan_character

    LEA DX, course_input
    CALL prINT_string
    LEA DX, course
    CALL scan_character

    LEA DX, school_year_input
    CALL prINT_string
    LEA DX, college_year
    CALL scan_character
    
    LEA DX, summary
    CALL prINT_string

    LEA DX, please_verify
    CALL prINT_string
    

; prINT_stringing starts here
    LEA DX, f_name_input
    CALL prINT_string
    LEA DX, f_name+2
    CALL prINT_string
    
    LEA DX, m_name_input
    CALL prINT_string
    LEA DX, m_name+2
    CALL prINT_string

    LEA DX, l_name_input
    CALL prINT_string
    LEA DX, l_name+2
    CALL prINT_string

    LEA DX, gender_input
    CALL prINT_string
    LEA DX, gender+2
    CALL prINT_string

    LEA DX, bday
    CALL prINT_string
    
    LEA DX, bday_month_input
    CALL prINT_string
    LEA DX, bday_month+2
    CALL prINT_string
    
    LEA DX, bday_day_input
    CALL prINT_string
    LEA DX, bday_day+2
    CALL prINT_string
    
    LEA DX, bday_year_input
    CALL prINT_string
    LEA DX, bday_year+2
    CALL prINT_string

    LEA DX, addrs_input
    CALL prINT_string

    LEA DX, house_input
    CALL prINT_string
    LEA DX, house+2
    CALL prINT_string
    
    LEA DX, street_input
    CALL prINT_string
    LEA DX, street+2
    CALL prINT_string

    LEA DX, brgy_input
    CALL prINT_string
    LEA DX, brgy+2
    CALL prINT_string

    LEA DX, city_input
    CALL prINT_string
    LEA DX, city+2
    CALL prINT_string

    LEA DX, province_input
    CALL prINT_string
    LEA DX, province+2
    CALL prINT_string

    LEA DX, education_input
    CALL prINT_string

    LEA DX, elem_input
    CALL prINT_string

    LEA DX, school_name_input
    CALL prINT_string
    LEA DX, elem_name+2
    CALL prINT_string

    LEA DX, school_year_input
    CALL prINT_string
    LEA DX, elem_year+2
    CALL prINT_string
    
    LEA DX, junior_input
    CALL prINT_string

    LEA DX, school_name_input
    CALL prINT_string
    LEA DX, junior_name+2
    CALL prINT_string

    LEA DX, school_year_input
    CALL prINT_string
    LEA DX, junior_year+2
    CALL prINT_string

    LEA DX, senior_input
    CALL prINT_string

    LEA DX, school_name_input
    CALL prINT_string
    LEA DX, senior_name+2
    CALL prINT_string

    LEA DX, school_year_input
    CALL prINT_string
    LEA DX, senior_year+2
    CALL prINT_string

    LEA DX, college_input
    CALL prINT_string

    LEA DX, school_name_input
    CALL prINT_string
    LEA DX, college_name+2
    CALL prINT_string

    LEA DX, course_input
    CALL prINT_string
    LEA DX, course+2
    CALL prINT_string

    LEA DX, school_year_input
    CALL prINT_string
    LEA DX, college_year+2
    CALL prINT_string

    LEA DX, nl
    CALL prINT_string

    MOV AH, 09h
	MOV BL, 0ceh 
	MOV CX, 12
	INT 10h

    LEA DX, vote_wisely
    CALL prINT_string

    LEA DX, thanks
    CALL prINT_string

    MOV AX, 4C00h
    INT 21h

prINT_string:
    MOV AH, 09h
    INT 21h
    RET
    
scan_character:
    MOV AH, 0AH
    INT 21h
    RET

end main
