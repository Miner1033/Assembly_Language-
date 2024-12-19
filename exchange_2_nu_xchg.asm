
.model small
.data

.code
main proc
    mov ah,1
    int 21h
 
    mov bl,al   
    
    
     mov ah,1
    int 21h
   
    mov bh,al 
    
    
    mov dl,13 
    mov ah,2
    int 21h
    mov dl,10 
    mov ah,2
    int 21h
               ;temp na dileo hobe ebong sub 0 oigula   na dileo hobe xchg dia exchange
    xchg bl,bh
    
    mov dl,bl
    mov ah,2 
    int 21h
    
    
    mov dl,bh
    mov ah,2
    int 21h
    mov ah,4ch
    int 21h
  main endp
end main