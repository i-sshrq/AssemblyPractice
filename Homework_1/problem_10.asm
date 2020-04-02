.model small
.stack 100h
.data
    str1 db 30 dup('$')
    
    msgI db "Enter a string: $"
    msgO db "Total number of even digits in input: $"
    
.code

 main proc
    mov ax, @data
    mov ds, ax
    mov dx, offset msgI
    mov ah, 09h
    int 21h
    
    mov si, offset str1
    
    start:
        mov ah, 1h
        int 21h
        cmp al, 0Dh
        je next
        mov [si], al
        inc si
        jmp start
    next:
        mov si, offset str1
        xor cx, cx
        
        checkNumbers:
            mov bl, [si]
            cmp bl, '$'
            je afterwards
            sub bl, '0'
            call isEven
            cmp bh, 01h
            je numberIsEven
            jmp numberIsNotEven
            
            numberIsEven:
                inc cl
                inc si
                jmp checkNumbers
            numberIsNotEven:
                inc si
                jmp checkNumbers
        
        afterwards:
            call newline
            mov dx, offset msgO
            mov ah, 09h
            int 21h
            mov dl, cl
            add dl, '0'
            mov ah, 02h
            int 21h
            
                
                
                
        
        
    
       
    

            
    
    
    
    
    
        
        
 
    
    
    
    
 exit:
    mov ah, 4ch
    int 21h  
    
    
 endp
 
 isEven proc
    test bl, 01h
    jz even
    jmp notEven
    even:
        mov bh, 01h
        ret
    notEven:
        mov bh, 00h
        ret   
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

    
    