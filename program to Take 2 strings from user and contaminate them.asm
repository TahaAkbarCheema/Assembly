
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100
.data     

 str1 db , 50 dup ('$')  
 str2 db  50 dup ('$') 
 str3 db 10,13, 50 dup ('$') 
 msg1 db  "Enter 1st String : $"
 msg2 db 10,13,  "Enter 2nd String : $"        
 msg3 db 10,13,  "Contaminated String is : $"
.code
  main proc                  
        
        mov ax,@data
        mov ds,ax  
                   ;-------------(Taking 1st String from User)----------
        lea dx,msg1
        mov ah,09h
        int 21h   
        mov si,offset str1
        
        again1:
        mov ah,01h      ;Taking String1
        int 21h
        
        cmp al,13       ;checking Enter
        je exit1
        
        cmp al,32
        je again2        ;Check Space
        
        mov [si],al 
        inc si            ;store character
        jmp again1
         
        again2:
        mov [si],al       ; store space
        inc si 
        jmp again1
                
       
        exit1:
        
        lea dx,msg1
        mov ah,09h        ;show 2nd message
        int 21h
        
        lea dx,str1
        mov ah,09h        ;show output string
        int 21h                                   
        
                  
                      ;-------------(Taking 2nd String from User)----------
         
         lea dx,msg2
        mov ah,09h
        int 21h   
        mov di,offset str2
        
        again3:
        mov ah,01h      ;Taking String1
        int 21h
        
        cmp al,13       ;checking Enter
        je exit4
        
        cmp al,32
        je again4        ;Check Space
        
        mov [di],al 
        inc di            ;store character
        jmp again3
         
        again4:
        mov [di],al       ; store space
        inc di 
        jmp again1
                
       
        exit4:
        
        lea dx,msg1
        mov ah,09h        ;show 2nd message
        int 21h
        
        lea dx,str2
        mov ah,09h        ;show output string
        int 21h  
                  
         lea dx,msg3
        mov ah,09h
        int 21h                 
         
                 ;--------------(contaminating Strin Part)-----------
        mov si,0 
        mov di,0    
           
         
        copy1:
        cmp str1[si],'$' 
        je exit2                   ;after copying str1 to str3 jmp exit1
        
        
        mov bl,str1[si]          ; copy from str1 to str3
        mov str3[si],bl
        inc si
        jmp copy1   
        
        copy2:
        cmp str2[di],'$'          ;after copying str2 to str3 jmp exit2
        je exit3     
         
         
         mov bl,str2[di]         ; copy from str2 to str3
         mov str3[di],bl
         inc di
         jmp copy2
         
             
            
         exit2:
         lea dx,str3        ;printing str3(str1) 
         mov ah,09h
         int 21h
         jmp copy2         ;after printing and copying we are jumping on again2 to copy str2 in str3 
         
         exit3:
         lea dx,str3       
         mov ah,09h         ;printing str3(str2)
         int 21h
         
                
    mov ah,4ch
    int 21h

    end main
    main end





