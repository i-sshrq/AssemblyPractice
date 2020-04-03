.model small
.stack 100h

.data
    msgI db "Please enter the Hexadecimal number: $"
    msgO db "The given number in Binary is: $"
.code

 main proc
    mov ax, @data
    mov ds, ax
    
    mov dx, offset msgI
    mov ah, 09h
    int 21h
    
    mov cx, 4
    start:
        mov ah, 01h
        int 21h
        cmp al, '0'
        jge isNum_1
        jmp checkLetter
        isNum_1:
            cmp al, '9'
            jle isNum_2
            jmp checkLetter
        isNum_2:
            sub al, '0'
            xor dx, dx
            mov dx, cx
            mov cl, 4
            shl bx, cl
            xor ah, ah
            add bx, ax
            mov cx, dx
            loop start
        checkLetter:
            cmp al, 'A'
            jge isLetter_1
            jmp exit
            isLetter_1:
                cmp al, 'F'
                jle isLetter_2
                jmp exit
            isLetter_2:
                sub al, 'A'
                add al, 10d
                xor dx, dx
                mov dx, cx
                mov cl, 4
                shl bx, cl
                xor ah, ah
                add bx, ax
                mov cx, dx
                loop start
                
         output_1:
            call newline
            mov ah, 09h
            mov dx, offset msgO
            int 21h
            
            mov cx, 16
            output_2:
                rol bx, 1
                jc foundOne
                jnc foundZero
                
                foundOne:
                    mov dl, '1'
                    mov ah, 02h
                    int 21h
                    loop output_2
                    jmp exit
                
                foundZero:
                    mov dl, '0'
                    mov ah, 02h
                    int 21h
                    loop output_2
                
            
            
        
                
                
    
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

    
    