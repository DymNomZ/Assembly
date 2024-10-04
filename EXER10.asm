.model small
.stack 100
.data
	text1 db 'Filename: EXER10.ASM$'
	text2 db 'Programmer Name: JOHN DYMIER O. BORGONIA$'
	text3 db 'Program Description: College Enrollment Form$'
	text4 db 'Date Created: September 6, 2024$'

    horiB   db "________________________________________________________________________ $"
    vertiB  db "|                                                                       |$"
    college db "|   College Enrollment Form:                                    CIT-U   |$"
    subtext db "|   Complete the registration form with attention to detail             |$"
    
    b0      db "|           _________________________    ______________________________ |$"
    fName   db "|Full Name |_________________________|  |______________________________||$"
    b1      db "|                      First Name                   Last Name           |$"

    b2      db "|                      ________________________________________________ |$"
    addrs   db "|   Address           |________________________________________________||$"
    b3      db "|                      Street Address                                   |$"

    b4      db "|                      _____________________    _______________________ |$"
    addrs1  db "|                     |_____________________|  |_______________________||$"
    b5      db "|                      City                     State/Province          |$"

    b6      db "|                      ____________    ____________    _______________  |$"
    bDate   db "|   Birth Date        |____________|  |____________|  |_______________| |$"
    b7      db "|                      Month           Day             Year             |$"

    b8      db "|                      __              __              __               |$"
    gender  db "|   Gender            |__| Male       |__| Female     |__| N/A          |$"

    b9      db "|                      ________________________________________________ |$"
    sNum    db "|   Student Number    |________________________________________________||$"
    b10     db "|                      Phone Number                                     |$"

    b11     db "|                      ________________________________________________ |$"
    sEmail  db "|   Student Email     |________________________________________________||$"
    b12     db "|                      example@example.com                              |$"

    b13     db "|                      ___________________________________________      |$"
    compny  db "|   Company           |___________________________________________|     |$"
    
    b14     db "|                      __              __               __              |$"
    course  db "|   Courses           |__| Eng 101    |__| Eng 102     |__| Cr. Writ.1  |$"

    b15     db "|                      __              __               __              |$"
    course1 db "|                     |__| Cr. Writ. 2|__| History 101 |__| History 102 |$"

    b16     db "|                      __              __               __              |$"
    course2 db "|                     |__| Math 101   |__| Math 102    |__| Windows 8   |$"

    b17     db "|                           ___________________________________________ |$"
    addcom  db "|   Additional Comments    |                                           ||$"
    addcom1 db "|                          |                                           ||$"
    addcom2 db "|                          |                                           ||$"
    addcom3 db "|                          |___________________________________________||$"

    b18     db "|                                                  ___________________  |$"
    sig     db "|                                                 |      Signature    | |$"
    sig1    db "|                                                 |                   | |$"
    sig2    db "|                                                 |                   | |$"
    sig3    db "|                                                 |                   | |$"
    sig4    db "|  ________________________                       |                   | |$"
    sig5    db "| | Date:                  |                      |     (Your Name)   | |$"
    sig6    db "| |________________________|                      |___________________| |$"

.code

start:

	mov ax, @data

	mov ds, ax

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


	lea dx, horiB

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, vertiB

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, college

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, subtext

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, horiB

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, b0

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, fName

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, b1

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, b2

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, addrs

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, b3

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, b4

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, addrs1

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, b5

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, b6

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, bDate

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, b7

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, b8

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, gender

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, b9

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, sNum

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, b10

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, b11

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, sEmail

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, b12

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, b13

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, compny

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, b14

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, course

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, b15

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, course1

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, b16

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, course2

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, b17

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, addcom

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, addcom1

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, addcom2

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, addcom3

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, b18

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, sig

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, sig1

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, sig2

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, sig3

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, sig4

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, sig5

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, sig6

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


    lea dx, vertiB

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h


	lea dx, horiB

	mov ah, 09

	int 21h


	mov ah, 02h

	mov cl, 0Ah ; NL

	mov dl, cl

	int 21h

int 27h   ; terminate
end start ; end program