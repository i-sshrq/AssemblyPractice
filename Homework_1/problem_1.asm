.model small
org 100h
.data
    msgX db "Enter the value of X: $"
    msgZ db "Enter the value of Z: $"
    msgB db "Bound exceeds $"
    msgY db "The value of Y: $"
.code

 main proc
    ;ask for X
    mov dx, offset msgX
    mov ah, 9h
    int 21h
    mov ah, 1h
    int 21h
   
    sub al, '0'
    mov bl, al
    shl bl, 1d
    
    call newline
    
    ;ask for Z 
    mov dx, offset msgZ
    mov ah, 9h
    int 21h
    mov ah, 1h
    int 21h
    
    
    
    sub al, '0'
    sub bl, al
    add bl, 3d
    
    call newline
    
    cmp bl, 9d
    jle valid1
    jmp invalid
    
    valid1:
        cmp bl, 0
        jge valid2
        jmp invalid
    
    valid2:
        ;output Y
        mov dx, offset msgY
        mov ah, 9h
        int 21h        
        mov dl, bl
        mov ah, 2
        add dl, '0'
        int 21h
        call newline
        jmp exit
    
    invalid:
        ;output bound exceeds
        mov dx, offset msgB
        mov ah, 9h
        int 21h
        call newline        
    
    
    
    
 exit:
    mov ah, 4ch
    int 21h  
    
    
 endp
 
 newline proc
    mov dl, 10d
    mov ah, 2
    int 21h
    mov dl, 13d
    mov ah, 2
    int 21h
    ret
 endp
 
 end main

    
    