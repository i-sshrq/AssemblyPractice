.model small
.stack 100h

.data
    ; For Naomi, read this:
    ; creates 30 byte array with '$' as each element
    ; x dup(y) means create x number of element with y in each
    ; db states what is the data type of each element
    ; It is the same as saying str1 db "$$$$$$$$$$$$$$$$$...$$$"
    
    str1 db 30 dup('$')
    msgI db "Enter a string: $"
    msgO db "Your given string is: $"
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
        je stop
        mov [si], al
        inc si
        jmp start
    
    stop:
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

    
    