; Filename: EXER21.ASM
; Programmer Name: JOHN DYMIER O. BORGONIA
; Date: SEPTEMBER 20, 2024
 
.MODEL SMALL
.STACK 100h
.DATA
    f_name DB 50 DUP('$')  
    m_name DB 50 DUP('$')
    b_name DB 50 DUP('$')
    f_name_input DB 'Enter First Name: $'
    m_name_input DB 'Enter Middle Name: $'
    b_name_input DB 'Enter Family Name: $'
    regis_frm DB 'REGISTRATION FORM',13,10,'$'
    greet_mgs DB 'Hello, $'
 
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, regis_frm
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
 
    LEA DX, greet_mgs
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
    mov cl,21h ; !
    mov dl,cl
    int 21h

    MOV AX, 4C00h             
    INT 21h
MAIN ENDP
END MAIN