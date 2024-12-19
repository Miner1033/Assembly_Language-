
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
    mov ah, 0        ; Clear AH manually for division
    div bh           ; Divide AL by BH (AL = dividend, BH = divisor)
    add al, '0'      ; Convert result to ASCII
    mov dl, al

    mov ah, 2
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main
