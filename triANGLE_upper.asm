.model small
.data
.code

main proc
    mov ax, @data       ; Initialize the data segment.
    mov ds, ax

    mov cx, 5           ; Outer loop: total number of lines (5 lines).
    mov bx, 1           ; BX will track the number of stars to print per row.

OuterLoop:               ; Outer loop label.
    push cx             ; Save CX (number of lines remaining).
    mov cx, bx          ; Set CX to BX (number of stars to print).

InnerLoop:               ; Inner loop label.
    mov dl, '*'         ; ASCII character '*'.
    mov ah, 2           ; DOS interrupt to print a character.
    int 21h             ; Print '*'.
    loop InnerLoop      ; Repeat inner loop BX times.

    ; Newline after finishing stars for this row.
    mov dl, 10          ; ASCII Line Feed (LF).
    mov ah, 2           ; DOS interrupt to print a character.
    int 21h             ; Print LF.
    mov dl, 13          ; ASCII Carriage Return (CR).
    mov ah, 2           ; DOS interrupt to print a character.
    int 21h             ; Print CR.

    inc bx              ; Increment BX (number of stars for the next row).
    pop cx              ; Restore CX (lines remaining).
    loop OuterLoop      ; Repeat outer loop for the next row.

    ; Exit the program.
    mov ah, 4ch         ; DOS interrupt to terminate the program.
    int 21h

main endp
end main
;*
;**
;***
;****