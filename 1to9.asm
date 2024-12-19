   .model small
.data
msg db '0'  ; Initialize the msg with ASCII '0'
.code
main proc
    mov ax, @data    ; Initialize the data segment
    mov ds, ax
    mov cx, 10       ; Loop 10 times for digits 0-9

digit:
    mov dl, msg      ; Load the current character (ASCII digit)
    mov ah, 2        ; DOS interrupt to display character
    int 21h
    inc msg          ; Move to the next character (increment to next digit)
    loop digit       ; Repeat for 10 iterations

    mov ah, 4Ch      ; Exit program
    int 21h
main endp
end main
