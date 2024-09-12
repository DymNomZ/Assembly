;Filename: PRELIM.ASM
;CS243 Lab Prelim Exam First Semester SY 2024-2025
;Student Name: JOHN DYMIER O. BORGONIA
;Date Finished: Date Today

.model small

.stack 100

.data

whites db "                                                                       $"
line1  db "               Cebu Institute of Technology - University               $"
line2  db "                    VEHICLE STICKER APPLICATION FORM                   $"
line3  db "                       Please fill out form below.                     $"
whits2 db "        $"
whits3 db "           $"
v      db " V $"
box11  db "Personnel Type:          $"
box12  db "Vehicle Sticker Type: $"
box21  db "Name of Applicant/Driver:$"
box22  db "ID Number:            $"
box31  db "Mobile Number:           $"
box32  db "Address:              $"
box41  db "Vehicle Make(s)/Brand:   $"
box42  db "Plate Number:         $"
box51  db "Vehicle Color:           $"
box52  db "Vehicle Type:         $"

whits4 db "                                 $"
submit db "  SUBMIT  $"
whits5 db "                          $"

line10 db "                   Copyright 2024 JOHN DYMIER O. BORGONIA              $"
thanks db "Thank you!$"

.code

start:

	mov ax, @data
	mov ds, ax

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

    lea dx, box12
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
 