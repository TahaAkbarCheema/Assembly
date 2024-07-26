
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100h
.data
msg1 db "Enter the String : $"
msg2 db 10,13, "Your String is : $"
msg3 db 10,13, "Your Total no of Characters in Entered string is : $"
str db 50 dup ('$')
char_count dw 0
.code
main proc
 mov ax,@data
 mov ds,ax

lea dx,msg1         ; Displaying 1st Message 
mov ah,09h
int 21h
mov si,offset str  ;          mov si,str[0,1,2,3..]
 
again1:
mov ah,01h         ;  Taking Input String
int 21h  

cmp al,13            ; Checking Enter
je exit  

cmp al,32             ; Checking Space
je again2


inc char_count 
mov [si],al            ; Storing Characters in str
inc si
jmp again1

again2:
mov [si],al           ;Storing Space 
inc si
jmp again1
 
 exit:
lea dx, msg2         ; Displaying 2nd Message
mov ah,09h
int 21h


lea dx,str            ; Displaying Output String 
mov ah,09h
int 21h   
 
 lea dx, msg3         ; Displaying 3rd Message
mov ah,09h
int 21h  

mov ax,char_count     ; converting char_count in digit from ascii value
mov bx,10
mov cx,0

doubledigit:
 mov dx,0
 div bx
 add dx,48
 push dx
 inc cx
 cmp ax,0
 jne doubledigit
 
 
popdigit2:
pop dx
mov ah,02h
int 21h
loop popdigit2

mov ah,4ch       ; Termination of Program 
int 21h

main endp
end main


