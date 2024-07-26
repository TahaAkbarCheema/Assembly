
                                       .model small
.stack 100
.data     
     msg1 db "Enter Digit 1 to 9 : $"  
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