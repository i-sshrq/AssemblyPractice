.model small
.stack 100h
.data
    msgI db "Please enter a binary number: $"
    msgO db "After reversing the input:    $"
.code
 main proc
    mov ax, @data
    mov ds, ax
    mov dx, offset msgI
    mov ah, 09h
    int 21h
    
    mov cx, 8
    start:
        mov ah, 01h
        int 21h
        mov ah, 00h
        push ax
        loop start
        
        
    call newline
    mov ah, 09h
    mov dx, offset msgO
    int 21h
    
    mov cx, 8
    output:
        mov ah, 02h
        pop dx
        int 21h
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


 
end