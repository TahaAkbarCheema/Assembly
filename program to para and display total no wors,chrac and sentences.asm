.model small
.stack 100h
.data
     char_count dw 0
     words_count dw 0
     sent_count dw 0

.code

main proc
    mov ax,@data
    mov ds,ax
           
           again:
           
           mov ah,01h
           int 21h
           cmp al,13
           je exit
           
           inc char_count
            jmp again
           ;cmp al,32
           ;je again1
           
           ;cmp al,'.'
           ;je again2
           
       ; again1:
        ;inc words_count
        ;jmp again
        
       ; again2:
        ;inc sent_count
       ; inc words_count
       ; jmp again
        
        exit:
           add dx,48
        mov dx,char_count
        mov ah,02h
        int 21h
           
     mov ah,4ch
     int 21h
    main endp
end main