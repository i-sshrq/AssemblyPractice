.model small
.stack 100h

.data
    input db 30 dup('$')
    digits db 0
    consonants db 0
    vowels db 0
    
    msgVowels db "Number of vowels: $"
    msgConsonants db "Number of consonants: $"
    msgDigits db "Number of digits: $"
    
    
.code
 main proc
    mov ax, @data
    mov ds, ax
    mov si, offset input
    
    start_input:
        mov ah, 01h
        int 21h
        cmp al, 0dh
        je after_input_1
        mov [si], al
        inc si
        jmp start_input
    
    after_input_1:
        mov si, offset input
    
    after_input_2: 
        mov bl, [si]
        cmp bl, '$'
        je after_counting
        call checkDigit
        cmp cl, 01h
        je next_letter
        call checkLetter    
        
    next_letter:
        inc si
        jmp after_input_2
        
    after_counting:
        call newline
        mov ah, 09h
        mov dx, offset msgVowels
        int 21h
        mov dl, vowels
        add dl, '0'
        mov ah, 02h
        int 21h
        
        call newline
        mov ah, 09h
        mov dx, offset msgConsonants
        int 21h
        mov dl, consonants
        add dl, '0'
        mov ah, 02h
        int 21h
        
        call newline
        mov ah, 09h
        mov dx, offset msgDigits
        int 21h
        mov dl, digits
        add dl, '0'
        mov ah, 02h
        int 21h
        
   
    
 exit:
    mov ah, 4ch
    int 21h  
    
    
 endp
 
 checkDigit proc
    cmp bl, '0'
    jge cn1
    jmp cn3
    cn1:
        cmp bl, '9'
        jle cn2
        jmp cn3
    cn2:
        inc digits
        mov cl, 01h
        ret
    cn3:
        mov cl, 00h
        ret 
 endp
 
 checkLetter proc
    cmp bl, 'a'
    je vowel
    cmp bl, 'e'
    je vowel
    cmp bl, 'i'
    je vowel
    cmp bl, 'o'
    je vowel
    cmp bl, 'u'
    je vowel
    cmp bl, 'a'
    jge cc1
    jmp skip
    vowel:
        inc vowels
        mov cl, 01h
        ret
    cc1:
        cmp bl, 'z'
        jle cc2
        jmp skip
    cc2:
        inc consonants
        mov cl, 01h
        ret
    skip:
        mov cl, 00h
        ret
        
    
    
    
    
       
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

    
    