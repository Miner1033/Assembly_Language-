.model small
.data
msg1 db '1 for one, 2 for two, 3 for three$', '$'
one db 13, 10, 'one$', '$'
two db 13, 10, 'two$', '$'
three db 13, 10, 'three$', '$'

.code
main proc
    ; Initialize the Data Segment
    mov ax, @data
    mov ds, ax

    ; Display the Prompt Message
    mov dx, offset msg1
    mov ah, 9
    int 21h

    ; Add Newline for Formatting
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h

    ; Get Input from User
    mov ah, 1
    int 21h
    mov bl, al ; Store the input in BL

    ; Compare Input
    cmp bl, '1'
    je po ; Jump to 'po' if input is '1'

    cmp bl, '2'
    je pt ; Jump to 'pt' if input is '2'

    cmp bl, '3'
    je thr ; Jump to 'thr' if input is '3'

    ; If Input Is Invalid, Exit
    jmp Exit

po:
    ; Display "one"
    mov dx, offset one
    mov ah, 9
    int 21h
    jmp Exit ; Go to Exit

pt:
    ; Display "two"
    mov dx, offset two
    mov ah, 9
    int 21h
    jmp Exit ; Go to Exit

thr:
    ; Display "three"
    mov dx, offset three
    mov ah, 9
    int 21h
    jmp Exit ; Go to Exit

Exit:
    ; Exit Program
    mov ah, 4Ch
    int 21h

main endp
end main