.model small
org 100h

.data
    msgA db "Enter the value of A: $"
    msgB db "Enter the value of B: $"
    msgR db "Result is: $"
.code

 main proc
    mov dx, offset msgA
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    
    mov bl, al
    
    call newline
    
    mov dx, offset msgB
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    
    cmp bl, al
    jge ifCondition ; y = a - b    
    jmp elseCondition ; y = b - a
    
    ifCondition:
        sub bl, al
        add bl, '0'
        call newline
        mov dx, offset msgR
        mov ah, 09h
        int 21h
        mov dl, bl
        mov ah, 02h
        int 21h
        call newline
        jmp exit
        
    elseCondition:
        sub bl, al
        neg bl
        add bl, '0'
        call newline
        mov dx, offset msgR
        mov ah, 09h
        int 21h
        mov dl, bl
        mov ah, 02h
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

    
    