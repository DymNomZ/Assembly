
 
    ;color
    mov ah, 06h
    xor cl, cl
    xor ax, ax
 
    mov ah, 06h
    mov ch, 11
    mov cl, 0
    mov dh, 11
    mov dl, 36
    mov bh, 04eh
    int 10h
 
    mov ah, 06h
    mov ch, 14
    mov cl, 0
    mov dh, 14
    mov dl, 36
    mov bh, 70h
    int 10h
 
    mov ah, 06h
    mov ch, 15
    mov cl, 0
    mov dh, 15
    mov dl, 36
    mov bh, 30h
    int 10h
 
    ;B1
    mov ah, 06h
    mov ch, 11
    mov cl, 0
    mov dh, 16
    mov dl, 0
    mov bh, 70h
    int 10h
 
    ;B2
    mov ah, 06h
    mov ch, 11
    mov cl, 37
    mov dh, 16
    mov dl, 37
    mov bh, 70h
    int 10h
 
    ;F
    mov ah, 06h
    mov ch, 19
    mov cl, 1
    mov dh, 19
    mov dl, 17
    mov bh, 0ceH
    int 10h
 
 