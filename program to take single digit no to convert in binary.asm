
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100
.data
    msg1 db "Enter single digit Decimal No:$"
    msg2 db 10,13, "Your Binary Number is: $"
   
.code    
main proc
       mov ax,@data
       mov ds,ax
       
       lea dx,msg1
       mov ah,09h
       int 21h
       
       mov ah,01h
       int 21h
        
       sub al,48      ;ax==54-48=6   
       mov ah,0
       mov bx,2
       mov cx,0  
 lab1: 
        mov dx,0
        div bx  
        push dx 
        inc cx
        cmp ax,0        
        jne lab1
        
        
         lea dx,msg2
         mov ah,09h
         int 21h 
lab2:         
        pop dx
        add dx,48
        mov ah,02h
        int 21h
        loop lab2
         
         mov ah,4ch
         int 21h
 main endp
 end main            