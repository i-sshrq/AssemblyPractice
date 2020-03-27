.model small
org 100h

.data
    msg1 db "Enter 1st number: $"
    msg2 db "Enter 2nd number: $"
    msg3 db "Enter 3rd number: $"
    
    msgMax db "Maximum : $"
    msgMin db "Minimum : $"
    
    max db ?
    min db ?
.code

 main proc
    mov dx, offset msg1
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, '0'
    mov bh, al
    
    call newline
    mov dx, offset msg2
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, '0'
    mov bl, al
    
    call newline
    mov dx, offset msg3
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, '0'
    mov cl, al
    
    call newline
    cmp bh, bl
    jge L1        ; A >= B
    jmp L2        ; A < B
    
    L1:
        cmp bh, cl
        jge L3          ; max = A, min undecided
        mov max, cl
        mov min, bl     ; C > A > B
        jmp output      
    
    L2:
        cmp bl, cl
        jge L4          ; max = B, min undecided
        mov max, cl
        mov min, bh     ; A < B < C
        jmp output
    
    L3:
        cmp bl, cl
        jge L5          ; max = A, min = C
        mov max, bh
        mov min, bl
        jmp output
    
    L4:
        cmp bh, cl
        jge L6          ; max = B, min = C
        mov max, bl
        mov min, bh
        jmp output
        
    L5:
        mov max, bh
        mov min, cl
        jmp output
    
    L6:
        mov max, bl
        mov min, cl
        jmp output
    
    output:
        mov dx, offset msgMin
        mov ah, 09h
        int 21h
        mov dl, min
        add dl, '0'
        mov ah, 02h
        int 21h
        call newline
        mov dx, offset msgMax
        mov ah, 09h
        int 21h
        mov dl, max
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

    
    