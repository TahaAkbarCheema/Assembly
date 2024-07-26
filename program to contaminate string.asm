
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100
.data     
str1 db "Hello $"   
str2 db "World $"
 str3 db 50 dup ('$')
.code
  main proc
        
        mov ax,@data
        mov ds,ax  
        mov si,0 
        mov di,0
        again:
        cmp str1[si],'$' 
        je exit1                   ;after copying str1 to str3 jmp exit1
        
        
        mov bl,str1[si]          ; copy from str1 to str3
        mov str3[si],bl
        inc si
        jmp again   
        
        again2:
        cmp str2[di],'$'          ;after copying str2 to str3 jmp exit2
        je exit2     
         
         
         mov cl,str2[di]         ; copy from str2 to str3
         mov str3[di],cl
         inc di
         jmp again2
         
         exit1:
         lea dx,str3        ;printing str3(str1) 
         mov ah,09h
         int 21h
         jmp again2         ;after printing and copying we are jumping on again2 to copy str2 in str3 
         
         exit2:
         lea dx,str3       
         mov ah,09h         ;printing str3(str2)
         int 21h
         
                
    mov ah,4ch
    int 21h

    end main
    main end





