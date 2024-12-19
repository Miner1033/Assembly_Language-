.model small  
.stack 100h
.data   
var1 dw ?  ; dw = 16 bits and db 8 bits
var2 dw ?
.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    
    mov ah, 1
    int 21h
    mov var1 , ax  
    
    
    mov ah, 1
    int 21h
    mov var2 , ax   
    
    
    push var1
    push var2 
    
    pop var1
    pop var2
    
    mov dl,10
    mov ah,2
    int 21h  
    mov dl,13
    mov ah,2
    int 21h   
    
    mov dx,var1
    mov ah,2
    int 21h
    
    mov dx,var2
    mov ah,2
    int 21h
    
    
    
    
 
    
    
    
    ;jz = jump if zero 
    ;jg = jump if greater
    ;jng = jump if not greater
    ;jge = jump if greater or equal
    ;jnl = jump if not equal
    ;jle = jump if less than or equal 
    
    
    Exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    