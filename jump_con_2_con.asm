.model small
.data
msg1 db 'hey  1 for hello world or 2 for 59A$' 
hw db 13,10,'hellow world$'
59 db 13,10,'59A$'

.code
main proc
       mov ax,@data
       mov ds,ax
       mov dx,offset msg1
       mov ah,9
       int 21h  
       
        mov dl,10
        mov ah,2
        int 21h
    
         mov dl,13
        mov ah,2
        int 21h  
        
        
        mov ah,1
        int 21h
        mov bl,al
        
          
               
       cmp bl,'1'
       je printh
       
       cmp bl ,'2'        ;db je Exit kheal rakah
       je print59
       
       jmp Exit
       
        printh:
        mov dx,offset hw
        mov ah,9
        int 21h   
        jmp Exit:
        
          print59:
        mov dx,offset 59
        mov ah,9
        int 21h  
        jmp Exit:
        
            Exit:
            mov ah,4ch
            int 21h
               
              
    
    main endp
end main
