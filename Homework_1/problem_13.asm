.model small
.stack 100h

.data
    msg db "Sum is: $"
    str1 db 5 dup('$')
    sum dw ?
.code

 main proc
    mov ax, @data
    mov ds, ax
    
    xor bx, bx
    xor dx, dx
    
    mov dl, 1
    mov dh, 0
              
    ; dh ::  1, 2, 3, 4,  5,  6,  7,   8 ...
    ; dl ::  1, 2, 4, 8, 16, 32, 64, 128 ...
    ; bh ::  1, 3, 5, 7,  9, 11, 13,  15 ...
    
    
    mov ah, 01h
    int 21h
    sub al, '0'
    xor ah, ah
    mov cx, ax
    xor al, al
    series:
        mov bl, dl
        shl dl, 1
        mov bh, dh
        inc dh
        shl bh, 1
        add bh, 1
        mov al, bh
        mul bl       
        add sum, ax
        loop series
        
        
        
    ; conversion
    mov si, offset str1
    mov ah, 4
    mov cx, 4 
    mov bx, sum
    xor dl, dl
    begin_processing:
        cmp ah, 0
        je output
        
        rol bx, 1
        jc hasOne
        jnc hasZero
        
        hasOne:
            shl dl, 1
            add dl, 1
            cmp cx, 0
            je next
            loop begin_processing
            jmp next
        hasZero:
            shl dl, 1
            cmp cx, 0
            je next
            loop begin_processing
    
    next:
    cmp dl, 0
    jge is_num_1
    jmp checkLetter
    is_num_1:
        cmp dl, 9
        jle is_num_2
        jmp checkLetter
    is_num_2:
        add dl, '0'
        mov [si], dl
        inc si
        dec ah
        cmp ah, 0
        je output
        xor dl, dl
        mov cx, 4
        jmp begin_processing
    checkLetter:
        cmp dl, 10
        jge is_letter_1
        jmp exit
        is_letter_1:
            cmp dl, 15
            jle is_letter_2
        is_letter_2:
            sub dl, 10
            add dl, 'A'
            mov [si], dl
            inc si
            dec ah
            cmp ah, 0
            je output
            xor dl, dl
            mov cx, 4
            jmp begin_processing
            
            
    output:
        call newline
        
        mov dx, offset msg
        mov ah, 09h
        int 21h
        
        mov dx, offset str1
        int 21h
       
        
    
    
 exit:
    mov ah, 4ch
    int 21h  
    
    
 endp
 
 newline proc
    mov dl, 10d
    mov ah, 2
    int 21h
    mov dl, 13d
    int 21h
    ret
 endp
 
 end main

    
    