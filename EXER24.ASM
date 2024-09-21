; Filename: EXER24.ASM
; Programmer Name: JOHN DYMIER O. BORGONIA
; Date: SEPTEMBER 21, 2024

.model small

.stack 100

.data

    cit_u DB 'Cebu Institute of Technology - University',13,10,'$'
    veh_frm DB 'VEHICLE STICKER APPLICATION FORM',13,10,10,'$'
    enter_prompt DB 'Please enter the needed information:',13,10,'$'

    whites db "                                                                       $"
    line1  db "               Cebu Institute of Technology - University               $"
    line2  db "                    VEHICLE STICKER APPLICATION FORM                   $"
    line3  db "                       Please fill out form below.                     $"
    whits2 db "        $"
    whits3 db "           $"
    v      db " V $"

    box11  db "Personnel Type:          $"
    per_type_input db "Personnel Type: $"
    per_type db 9,0,10 DUP('$')

    box12  db "Vehicle Sticker Type: $"
    veh_stkr_input db "Vehicle Sticker Type: $"
    veh_stkr db 9,0,10 DUP('$')

    box21  db "Name of Applicant/Driver:$"
    dvr_name_input db "Name of Applicant/Driver: $"
    dvr_name db 12,0,13 DUP('$')

    box22  db "ID Number:            $"
    id_num_input db "ID Number: $"
    id_num db 12,0,13  DUP('$')

    box31  db "Mobile Number:           $"
    mob_num_input db "Mobile Number: $"
    mob_num db 12,0,13  DUP('$')

    box32  db "Address:              $"
    addrs_input db "Address: $"
    addrs db 12,0,13  DUP('$')

    box41  db "Vehicle Make(s)/Brand:   $"
    veh_mb_input db "Vehicle Make(s)/Brand: $"
    veh_mb db 12,0,13  DUP('$')

    box42  db "Plate Number:         $"
    plate_num_input db "Plate Number: $"
    plate_num db 12,0,13  DUP('$')

    box51  db "Vehicle Color:           $"
    veh_color_input db "Vehicle Color: $"
    veh_color db 9,0,10 DUP('$')

    box52  db "Vehicle Type:         $"
    veh_type_input db "Vehicle Type: $"
    veh_type db 9,0,10 DUP('$')

    summary DB 13,10,'SUMMARY',13,10,'$'

    whits4 db "                                 $"
    submit db "  SUBMIT  $"
    whits5 db "                          $"

    line10 db "                   Copyright 2024 JOHN DYMIER O. BORGONIA              $"
    thanks db "Thank you!$"

.code

start:

	mov ax, @data
	mov ds, ax

    LEA DX, cit_u
    MOV AH, 09h               
    INT 21h

    LEA DX, veh_frm
    MOV AH, 09h               
    INT 21h

    LEA DX, enter_prompt
    MOV AH, 09h               
    INT 21h

    LEA DX, per_type_input
    MOV AH, 09h               
    INT 21h

    LEA DX, per_type
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, dvr_name_input
    MOV AH, 09h               
    INT 21h

    LEA DX, dvr_name
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, mob_num_input
    MOV AH, 09h               
    INT 21h

    LEA DX, mob_num
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, veh_mb_input
    MOV AH, 09h               
    INT 21h

    LEA DX, veh_mb
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, veh_color_input
    MOV AH, 09h               
    INT 21h

    LEA DX, veh_color
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, veh_stkr_input
    MOV AH, 09h               
    INT 21h

    LEA DX, veh_stkr
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, id_num_input
    MOV AH, 09h               
    INT 21h

    LEA DX, id_num
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

    LEA DX, plate_num_input
    MOV AH, 09h               
    INT 21h

    LEA DX, plate_num
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, veh_type_input
    MOV AH, 09h               
    INT 21h

    LEA DX, veh_type
    MOV AH, 0Ah               
    INT 21h

    mov ah,02h
    mov cl,0Ah ; NL
    mov dl,cl
    int 21h

    LEA DX, summary
    MOV AH, 09h               
    INT 21h



	mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



	mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 4Fh
mov cx, 71                              
int 10h

	lea dx, line1
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



	mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 4Fh
mov cx, 71                              
int 10h

	lea dx, line2
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



	mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 0CEh
mov cx, 71                              
int 10h

	lea dx, line3
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 2                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



	mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 75                                
int 10h

	lea dx, whites
	mov ah, 09
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 70h
mov cx, 27                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    lea dx, box11
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 20h
mov cx, 8                                
int 10h

    lea dx, whits2
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 4Fh
mov cx, 3                                
int 10h

    lea dx, V
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 70h
mov cx, 24                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    lea dx, box12
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 20h
mov cx, 8                                
int 10h

    lea dx, whits2
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 4Fh
mov cx, 3                                
int 10h

    lea dx, V
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 70h
mov cx, 2                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 75                                
int 10h

	lea dx, whites
	mov ah, 09
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 70h
mov cx, 27                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    lea dx, box21
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 0AAh
mov cx, 11                                
int 10h

    lea dx, whits3
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 70h
mov cx, 24                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    lea dx, box22
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 0AAh
mov cx, 11                                
int 10h

    lea dx, whits3
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 70h
mov cx, 2                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 75                                
int 10h

	lea dx, whites
	mov ah, 09
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 70h
mov cx, 27                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    lea dx, box31
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 0AAh
mov cx, 11                                
int 10h

    lea dx, whits3
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 70h
mov cx, 24                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    lea dx, box32
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 0AAh
mov cx, 11                                
int 10h

    lea dx, whits3
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 70h
mov cx, 2                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 75                                
int 10h

	lea dx, whites
	mov ah, 09
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 70h
mov cx, 27                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    lea dx, box41
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 0AAh
mov cx, 11                                
int 10h

    lea dx, whits3
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 70h
mov cx, 24                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    lea dx, box42
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 0AAh
mov cx, 11                                
int 10h

    lea dx, whits3
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 70h
mov cx, 2                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



	mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 75                                
int 10h

	lea dx, whites
	mov ah, 09
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 70h
mov cx, 27                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    lea dx, box51
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 0AAh
mov cx, 8                                
int 10h

    lea dx, whits2
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 4Fh
mov cx, 3                                
int 10h

    lea dx, V
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 70h
mov cx, 24                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    lea dx, box52
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 0AAh
mov cx, 8                                
int 10h

    lea dx, whits2
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 4Fh
mov cx, 3                                
int 10h

    lea dx, V
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 70h
mov cx, 2                                
int 10h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



	mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 75                                
int 10h

	lea dx, whites
	mov ah, 09
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



	mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 33                                
int 10h

	lea dx, whits4
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 4Eh
mov cx, 10                              
int 10h

	lea dx, submit
	mov ah, 09
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 32                                
int 10h

	lea dx, whits5
	mov ah, 09
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 75                                
int 10h

	lea dx, whites
	mov ah, 09
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 70h
mov cx, 75                                
int 10h

	lea dx, line10
	mov ah, 09
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 0FFh
mov cx, 75                                
int 10h

	lea dx, whites
	mov ah, 09
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h



    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 20h ; SPACE
	mov dl, cl
	int 21h

mov ah, 09h
mov bl, 8Eh
mov cx, 10                                
int 10h

	lea dx, thanks
	mov ah, 09
	int 21h

    mov ah, 02h
	mov cl, 0Ah ; NL
	mov dl, cl
	int 21h

int 27h

end start
 