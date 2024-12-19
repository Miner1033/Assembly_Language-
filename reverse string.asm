.model small  
.stack 100h
.data 
output db 10,13,'Your String: $'   
reverse db 10,13,'Your Reversed String: $' 
str db 'abcdef'  ; Predefined string (6 characters)

.code
main proc  

    mov ax,@data  ; Load the data segment address into AX
    mov ds,ax     ; Set DS to the data segment

    ; Display output message
    mov ah,9                           
    lea dx,output                        
    int 21h                            

    ; Display the original string
    mov cx,6                             ; Set loop counter for 6 characters
    mov si,offset str                    ; SI points to the start of the `str` array

output_label:
    mov ah,2
    mov dl,[si]                          ; Load each character into DL
    int 21h                               ; Print the character
    inc si                                ; Move to next character
    loop output_label                     ; Loop until all characters are printed

    ; Display the reversed string message
    mov ah,9                           
    lea dx,reverse                       
    int 21h                            

    ; Reverse the string using the stack
    mov cx,6                             ; Set loop counter for 6 characters
    mov si,offset str                    ; SI points to the start of the `str` array

stack_push:
    mov bx,[si]                          ; Load the character from the string into BX
    push bx                               ; Push the character onto the stack
    inc si                                ; Move to next character
    loop stack_push                       ; Loop until all characters are pushed onto the stack

    ; Pop characters from the stack to reverse the string
    mov cx,6                             ; Reset loop counter for 6 characters
    stack_pop:
        pop dx                             ; Pop a character from the stack into DX
        mov ah,2                           ; Function to print a character
        int 21h                            ; Display the popped character
        loop stack_pop                     ; Loop until all characters are popped and printed

exit:
    mov ah,4ch                           ; Exit program
    int 21h                             
main endp
end main
