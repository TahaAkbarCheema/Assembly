.model small
.stack 100
.data   
       msg db " Sum of 24 and 36 is : $" 
       var1 dw 24
       var2 dw 36
.code
main proc
    
          mov ax,@data
          mov ds,ax
          
          mov ax,var1
          add ax,var2    
          mov bx,10
          mov cx,0
          
lab1:
          mov dx,0
          div bx
          add dx,48
          push dx
          inc cx
          cmp ax,0
          jne lab1 
          
          
          
          lea dx,msg
          mov ah,09h
          int 21h
    
lab2:
          pop dx   
          mov ah,02h
          int 21h
          loop lab2
          
          mov ah,4ch
          int 21h
          
  
    main endp
    end main
