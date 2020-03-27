.model small
org 100h

.data
    
    msg db "Enter the value of X: $"
    again db "Do you want to give another input?", 10d, 13d, '$'
    
    isNumber db "Given input is a number", 10d, 13d, '$'
    isVowel db "Given input is a vowel", 10d, 13d, '$'
    isConsonant db "Given input is a consonant", 10d, 13d, '$'
    isInvalid db "Invalid input", 10d, 13d, '$'
    
    FLAG_number db -1
    FLAG_vowel db -1
    FLAG_letter db -1
    
.code
 main proc
    start:
        call newline
        mov dx, offset msg
        mov ah, 09h
        int 21h
        
        mov ah, 01h
        int 21h
        mov bl, al
        
        call newline
        
        call checkNumber
        call checkVowel
        call checkConsonant
        call checkOther
        
        mov dx, offset again
        mov ah, 09h
        int 21h
        mov ah, 01h
        int 21h
        cmp al, 'Y'
        je start
        cmp al, 'N'
        je exit
 
 
    
    
    

            
    
    
    
    
    
        
        
 
    
    
    
    
 exit:
    mov ah, 4ch
    int 21h  
    
    
 endp
 
 checkNumber proc
    cmp bl, '0'
    jge cn1
    jmp cn3
    cn1:
        cmp bl, '9'
        jle cn2
        jmp cn3
    cn2:
        mov dx, offset isNumber
        mov ah, 09h
        int 21h
        mov FLAG_number, 01h
        ret
    cn3:
        mov FLAG_number, 00h
        ret
 endp
 
 checkVowel proc
    cmp FLAG_number, 01h
    je L1
    
    cmp bl, 'A'
    je cv1
    cmp bl, 'E'
    je cv1
    cmp bl, 'I'
    je cv1
    cmp bl, 'O'
    je cv1
    cmp bl, 'U'
    je cv1
    jmp cv2
    
    cv1:
        mov dx, offset isVowel
        mov ah, 09h
        int 21h
        mov FLAG_vowel, 01h
        mov FLAG_letter, 01h
        ret
    L1:
        mov FLAG_letter, 00h
    cv2:
        mov FLAG_vowel, 00h
        ret
 endp
 
 checkConsonant proc
    cmp FLAG_vowel, 01h
    je skip
    
    cmp FLAG_number, 01h
    je notLetter
    
    cmp bl, 'A'
    jge cc1
    jmp notLetter
    
    cc1:
        cmp bl, 'Z'
        jle cc2
        jmp notLetter
    cc2:
        mov FLAG_letter, 01h
        mov dx, offset isConsonant
        mov ah, 09h
        int 21h
        ret
    notLetter:
        mov FLAG_letter, 00h
        ret
    skip:
        ret   
 endp
 
 checkOther proc
    cmp FLAG_letter, 01h
    je skipCheck
    cmp FLAG_number, 01h
    je skipCheck
    
    mov dx, offset isInvalid
    mov ah, 09h
    int 21h
    
    skipCheck:
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

    
    