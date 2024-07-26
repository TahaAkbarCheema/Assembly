
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100
.data     
     msg1 db "Your 1st Message : $"  
.code
main proc 
    
        mov ax,@data
        mov ds,ax
        
        mov dl,offset msg1
        mov ah,9
        int 21h 
        
        mov ah,1
        int 21h      
       
    main endp
