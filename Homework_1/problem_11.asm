.model small
.stack 100h

.data
    str1 db 5 dup('$')    
    msgI db "Please enter the binary number: $"
    msgO db "The given number in Hexadecimal is: $"
.code

 main proc
    mov ax, @data
    mov ds, ax
    
    mov dx, offset msgI
    mov si, offset str1
    
    mov ah, 09h
    int 21h
    
    xor bx, bx
    
    mov cx, 16
    start:
        mov ah, 01h
        int 21h
        mov ah, 00h
        sub al, '0'
        shl bx, 1
        add bx, ax
        loop start
 
    mov ah, 4
    mov cx, 4 
    
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
        
        mov dx, offset msgO
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

    
    