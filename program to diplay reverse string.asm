
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100h
.data
msg1 db "Enter the String : $"
msg2 db 10,13, "Your Reversed String is : $"
str db 50 dup ('$')
.code
main proc
 mov ax,@data
 mov ds,ax

lea dx,msg1         ; Displaying 1st Message 
mov ah,09h
int 21h
mov si,offset str  ;          mov si,str[0,1,2,3..]
mov cx,0
again1:
mov ah,01h         ;  Taking Input String
int 21h  

cmp al,13            ; Checking Enter
je exit  

cmp al,32             ; Checking Space
je again2

mov [si],al          ; Storing Characters in str
push [si]
inc cx               ;pushing string
inc si
jmp again1

again2:
mov [si],al
push [si]
inc cx               ;Storing Space 
inc si
jmp again1
 
 exit:
lea dx, msg2         ; Displaying 2nd Message
mov ah,09h
int 21h

 popstring:
 pop [si]                  ;poping string
lea dx,[si]           
mov ah,09h               ; Displaying Output String 
int 21h
loop popstring

mov ah,4ch       ; Termination of Program 
int 21h

main endp
end main


