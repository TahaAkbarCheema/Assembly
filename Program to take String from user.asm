
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
.model small
.stack 100
.data     
msg1 db "Enter String : $"
msg2 db 10,13, "String is : $"
 str db 50 dup ('$')
.code
  main proc
        
        mov ax,@data
        mov ds,ax  
        
        lea dx,msg1
        mov ah,09h
        int 21h   
        mov si,offset str
        
        again:
        mov ah,01h      ;Taking String
        int 21h
        
        cmp al,13       ;checking Enter
        je exit
        
        cmp al,32
        je again2        ;Check Space
        
        mov [si],al 
        inc si            ;store character
        jmp again
         
        again2:
        mov [si],al       ; store space
        inc si 
        jmp again
                
       
        exit:
        
        lea dx,msg2
        mov ah,09h        ;show 2nd message
        int 21h
        
        lea dx,str
        mov ah,09h        ;show output string
        int 21h  
  
    mov ah,4ch
    int 21h

    end main
    main end
    
   