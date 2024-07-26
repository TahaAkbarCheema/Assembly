
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model samll 
.stack 100
.data 
arr db  1,3,8,9,2,5
str db "Smallest Digit in Array is :$"   
var1 dw ?
.code 
main proc 
    mov ax,@data
    mov ds,ax 
    mov si,offset arr
    mov cx,6
    mov bl,[si]
     
    Compare:
    inc si
    cmp [si],bl               ;Comparing ALL Digits of Array
    jle small
    increament:
    ;inc si
    loop Compare
    
   lea dx,str
    mov ah,09h 
   int 21h
    
     
      mov dl,bl
    add dl,48                ;Displaying Smallest Digit in Array
    mov ah,02h
    int 21h
    ;mov ah,4ch 
    ;int 21h
     jmp exit
    
    

    small:
    mov bl,[si]                 ;Moving 1st small digit in bl 
    jmp increament    
    exit:
    
    mov ah,4ch 
    int 21h
    
 ;   main endp
  ;  end main










