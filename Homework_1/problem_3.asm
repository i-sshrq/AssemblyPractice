.model small
org 100h

.data
   msgX db "Enter the value of X: $"
   msgEven db "Given input is an even number$"
   msgOdd db "Given input is an odd number$"
   
.code

 main proc
    mov ah, 09h
    mov dx, offset msgX
    int 21h
    mov ah, 01h
    int 21h
    mov bl, al
    test bl, 01h
    jz isEven
    jmp isOdd
    
    isEven:
        call newline
        mov ah, 09h
        mov dx, offset msgEven
        int 21h
        jmp exit
    isOdd:
        call newline
        mov ah, 09h
        mov dx, offset msgOdd
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

    
    