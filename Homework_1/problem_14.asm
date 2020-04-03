.model small
.stack 100h

.data
    msg db "Sum is: $"
.code

 main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 01h
    int 21h
    sub al, '0'
    xor ah, ah   
    mov bl, 1
    mov cx, ax   
    series:
        add bh, bl
        add bl, 2
        loop series
    
    ;bh has answer
     
    call newline
    mov dx, offset msg
    mov ah, 09h
    int 21h
    mov cx, 8
    output:
        rol bh, 1
        jc foundOne
        jnc foundZero
            foundOne:
                mov dl, '1'
                mov ah, 02h
                int 21h
                jmp next
            foundZero:
                mov dl, '0'
                mov ah, 02h
                int 21h
            next:
                loop output
    
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

    
    