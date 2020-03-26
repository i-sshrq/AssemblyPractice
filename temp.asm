.model small
org 100h

.data

.code

 main proc
    mov ah, 01h
    int 21h
    sub al, '0'
    mov bl, al
    
    ;no. of rows = n  (stored in bl)
    ;no. of spaces = n - rowNumber
    ;no. of stars = rowNumber
    

            
    
    
    
    
    
        
        
 
    
    
    
    
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

    
    