
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt





                   ; To add single digit numbers
.model small
.stack 100
.data     
     msg1 db "Enter 1st Digit : $"
     msg2 db "Enter 2nd Digit : $"    
     msg3 db "Sum of Digits are : $"    
     
     newline macro
        mov dl,0dh
        mov ah,02h
        int 21h
        mov dl,0ah
        mov ah,02h
        int 21h    
            newline endm
.code
main proc    
          mov ax,@data
          mov ds,ax
        
        lea dx,msg1
        mov ah,9
        int 21h 
        
        mov ah,1  
        int 21h 
        sub al,48
        mov bl,al         
        
         newline    
        
        lea dx,msg2
        mov ah,9
        int 21h 
                
        mov ah,1
        int 21h
        
        sub al,48
        add bl,al      
        add bl,48 
        
         newline
         
        lea dx,msg3
        mov ah,9
        int 21h        
       
           mov dl,bl           
           mov ah,2
           int 21h    
main endp