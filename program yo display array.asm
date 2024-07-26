
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model samll 
.stack 100
.data 
arr db  6,3,8,9,1,5
str db "Array is :"
.code 
main proc 
    mov ax,data
    mov ds,ax 
    mov cx,6                Q1Q
    mov si,offset arr
    again:
    mov dl,[si]
    add dl,48
    mov ah,02h
    int 21h
    mov dl,32
    int 21h
    inc si
    loop again  
     mov ah,4ch
     int 21h
     main endp
end main

