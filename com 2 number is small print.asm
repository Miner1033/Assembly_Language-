.model small
.data   
var1 db 49  
msg1 db 'enter the first number: $' 
msg2 db 10,13,'enter the second number: $'
msg3 db 'Small Value: $'
.code
main proc
    mov ax,@data
    mov ds,ax  ;initialize into code segment
    mov dx,offset msg1
    mov ah,9
    int 21h
    mov ah,1  ;1st input
    int 21h
    mov bl,al 
    mov dx,offset msg2
    mov ah,9
    int 21h  
    mov ah,1  ;2nd input
    int 21h
    mov bh,al 
    mov dl,10  ;new line
    mov ah,2
    int 21h
    mov dl,13  ;cret
    mov ah,2
    int 21h
    cmp bl,bh
    jl l1 ;je = jump if les than  v dx,offset msg2 
    lea dx,msg3 
    mov ah,9
    int 21h 
    mov dl,bh
    mov ah,2    ;if not less 
    int 21h 
    jmp Exit
    l1:   
    mov dx,offset msg3
    mov ah,9
    int 21h 
    mov dl,bl     
    mov ah,2     ;if less
    int 21h  
    Exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    