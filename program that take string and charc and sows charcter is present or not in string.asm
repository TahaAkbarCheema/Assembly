
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

 .model small
.stack 100h
.data
msg1 db "Enter the String : $"
msg2 db 10,13, "Your String is : $"   
msg3 db 10,13, "Enter a Charcacter : $" 
msg4 db 10,13, " Your Entered character is Present :$"
msg5 db 10,13, " Your Entered character is NOT Present :$"
str db 50 dup ('$') 
char db ?    
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


lea dx,msg3          ;Displaying 3rd message
mov ah,09h 
int 21h

mov ah,01h            ;Taking Charcter
int 21h 
;mov char,al
mov si,offset str      ;Redirecting string at address 0

search:
cmp [si],al
je present         ; Comparing charcter with each chracter in string
inc si 
cmp [si],('$')
je absent
jmp search

present:
lea dx,msg4           ;displaying 4th message Present
mov ah,09h 
int 21h
jmp terminate_program
         
absent:
lea dx,msg5           ;displaying 5th message Present
mov ah,09h 
int 21h 
jmp terminate_program       

terminate_program:
mov ah,4ch       ; Termination of Program 
int 21h

main endp
end main


