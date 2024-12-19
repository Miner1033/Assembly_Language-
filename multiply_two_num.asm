.model small
.stack 100h
.code
main proc
    mov ah, 1
    int 21h
    mov bl, al
    sub bl, '0'
    mov ah, 1
    int 21h
    mov bh, al
    sub bh, '0'

    mov dl, 13
    mov ah, 2
    int 21h
    mov dl, 10
    mov ah, 2
    int 21h

    mov al, bl
    mul bh
    add al, '0'
    mov dl, al

    mov ah, 2
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main
