; Reverse a string using stack function in assembly language

.model small  
.stack 100h
.data 
input db 'Enter your 6 size string: $'   
output db 10,13,'Your Main String: $'   
reverse db 10,13,'Your Reverse String: $' 
str db 5 dup(?)   ; Memory space for the string (6 characters)

.code
main proc  
    
    mov ax,@data  ; Load the data segment address into AX
    mov ds,ax     ; Set DS to the data segment

   
    lea dx,input  ; Load the address of the input message into DX
    mov ah,9                           
    int 21h                           
    
 
    mov cx,6                           
    mov si,offset str ; SI points to the start of the `str` array
    
    input_label:
        mov ah,1                       
        int 21h                        
        mov [si],al ; Store the input character in the memory location SI points to
        inc si                         
        loop input_label               
    
   
                          
    
    ;mov ah,9
    ;lea dx,output
   ; int 21h
    
   ; mov cx,6
   ; mov si,offset str
    
   ; output_label:
   ;     mov ah,2
   ;     mov dl,[si] 
   ;     int 21h
   ;     inc si
        
   ;     loop output_label
   
    mov cx,6                           
    mov si,offset str 
    
    stack_push:
        mov bx,[si] ; Load the character from the string into BX
        push bx                        
        inc si                         
        loop stack_push                
        
    ; Display msg 
    mov ah,9                           
    lea dx,reverse                    
    int 21h                            
    
    ; Pop characters from the stack to reverse the string
    mov cx,6                           
    
    stack_pop:
        pop dx                         
        mov ah,2                       
        int 21h                        
        loop stack_pop                 
        
exit:
    mov ah,4ch                         
    int 21h                           
main endp
end main
