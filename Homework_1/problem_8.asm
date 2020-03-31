.model small
org 100h

.data
    msgI db "Please enter the binary number", 10d, 13d, '$'
    msgO db "Total number of 1 in decimal: $"
    
    count db 0
.code

 main proc
    mov dx, offset msgI
    mov ah, 09h
    int 21h
   
    mov cx, 8d
    start_input:
        mov ah, 01h
        int 21h
        cmp al, 0dh
        je after_input
        cmp al, '1'
        je increase_count
        loop start_input
        increase_count:
            inc count
            loop start_input
 
    after_input:
        call newline
        mov dx, offset msgO
        mov ah, 09h
        int 21h
        mov dl, count
        add dl, '0'
        mov ah, 02h
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
    mov ah, 2
    int 21h
    ret
 endp
 
 end main

    
    