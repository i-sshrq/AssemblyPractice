.model small
org 100h
.data

    output db 9 dup('$')
    msg1 db "Enter the value of number_1: $"
    msg2 db "Enter the value of number_2: $"
    msg3 db "Enter the sign: $"
    msg4 db "Result is: $"
    
.code

 main proc
    mov dx, offset msg1
    mov ah, 09h
    int 21h

    xor bx, bx
    mov cx, 8
    L1:
        mov ah, 01h
        int 21h
        shl bl, 1
        sub al, '0'
        add bl, al
        loop L1 
        
    call newline
    
    mov dx, offset msg2
    mov ah, 09h
    int 21h
    
    mov cx, 8
    L2:
        mov ah, 01h
        int 21h
        shl bh, 1
        sub al, '0'
        add bh, al
        loop L2
        
    call newline
    
    mov dx, offset msg3
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    
    cmp al, '+'
    je plus
    cmp al, '-'
    je minus
    jmp exit
    
    plus:
        mov cx, 8
        add bl, bh
        jmp ans_2
    minus:
        mov cx, 8
        sub bl, bh
        jmp ans_2
    ans_2:
        mov ax, @data
        mov ds, ax
        mov si, offset output        
    ans_1:
        
        rol bl, 1
        jc oneFound
        jnc zeroFound
        
        oneFound:
            mov [si], '1'
            inc si
            loop ans_1
        
        zeroFound:
            mov [si], '0'
            inc si
            loop ans_1
                
                
    call newline
    call newline
    
    mov dx, offset msg4
    mov ah, 09h
    int 21h
    
        
    mov ah, 09h
    mov dx, offset output
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

    
    