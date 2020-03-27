.model small
org 100h
.data
.code
 main proc
    mov bh, 0
    mov ah, 01h
    int 21h
    mov cl, al
    sub cl, '0'
    call newline
    row:
        inc bh
        mov bl, cl
        dec cl
        spaces:
            cmp cx, 00h
            je next
            mov dl, ' '
            mov ah, 02h
            int 21h
            loop spaces
        next:
        mov cl, bh
        stars:
            mov dl, '*'
            mov ah, 02h
            int 21h
            loop stars        
        mov cl, bl
        call newline
        loop row
    exit:
 	mov ah, 4ch
    	int 21h
   
 endp
 
 newline proc
    mov dl, 10d
    mov ah, 02h
    int 21h
    mov dl, 13d
    int 21h
    ret
 endp
end main