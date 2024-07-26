
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100
.data     
str1 db "Hello $"
 str2 db 50 dup ('$')
.code
  main proc
        
        mov ax,@data
        mov ds,ax  
        mov si,0
        
        again:
        cmp str1[si],'$'
        je exit
        
        
        mov bl,str1[si] 
        mov str2[si],bl
        inc si
        jmp again        
         
         exit:
         lea dx,str2
         mov ah,09h
         int 21h
                
    mov ah,4ch
    int 21h

    end main
    main end


