;Find out the biggest number among 3 number using aseembly language must use String and Input   
.model small
.data
msg1 db 'Enter any  3 number: $' 
msg2 db 10,13,'Biggest number is: $'
.code
main proc
    mov ax,@data
    mov ds,ax  
    
    lea dx, msg1
    mov ah, 9
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,1
    int 21h
    mov bh,al
    
    mov ah,1
    int 21h
    mov cl,al 
    
    mov dl,bl  
    cmp dl,bh ;compare
    jge l1    ;if bl bigger than bh go to l1
    mov dl,bh ;otherwise bh is bigerr than bl
    
    l1:
        cmp dl,cl  ;current bigger compare to cl
        jge l2     ;if current is bugger than cl go to l2
        mov dl,cl  ;otherwise cl is bigger number

        
    l2: 
       
             
        mov ah, 2  ;print
        int 21h
        jmp exit 
        
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
        