.model small
.stack 100h
.code
main proc
    ; Input the first number
    mov ah, 1
    int 21h
    mov bl, al
    sub bl, '0'

    ; Input the second number
    mov ah, 1
    int 21h
    mov bh, al
    sub bh, '0'

    ; Input the third number
    mov ah, 1
    int 21h
    mov cl, al
    sub cl, '0'

    ; New line
    mov dl, 13
    mov ah, 2
    int 21h
    mov dl, 10
    mov ah, 2
    int 21h

    ; Add the three numbers
    add bl, bh    ; Add first and second numbers
    add bl, cl    ; Add the third number

    ; Convert the result to ASCII
    mov dl, bl
    add dl, '0'

    ; Display the result
    mov ah, 2
    int 21h

    ; Exit
    mov ah, 4ch
    int 21h
main endp
end main
