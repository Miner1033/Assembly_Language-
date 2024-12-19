.model small              ; Define the memory model as small
.data                     ; Data segment (not used in this code)
.code                     ; Code segment begins here

main proc                 ; Main procedure starts here
    mov cx,5              ; Set the counter register cx to 5, to loop 5 times

outer:                    ; Label for the outer loop
    mov bx,cx             ; Store the value of cx into bx to remember how many times to print the '*' (inner loop)
    
    inner:                ; Label for the inner loop
    mov dl,'*'            ; Load the ASCII value of '*' into the dl register
    mov ah,2              ; Function number for displaying a character using int 21h
    int 21h               ; Call DOS interrupt 21h to display the character stored in dl (i.e., '*')
    loop inner            ; Decrement cx, and if cx is not zero, jump to 'inner' to print '*' again
    
    mov dl,10             ; Load ASCII value for newline (Line feed) into dl
    mov ah,2              ; Set up for interrupt to display a character
    int 21h               ; Print the newline character
    
    mov dl,13             ; Load ASCII value for carriage return (to move the cursor to the beginning of the line)
    mov ah,2              ; Set up for interrupt to display a character
    int 21h               ; Print the carriage return character
    
    mov cx,bx             ; Restore the value of cx from bx for the next iteration of the outer loop
    loop outer            ; Decrement cx, and if cx is not zero, jump to 'outer' to repeat the pattern

main endp                 ; End of main procedure
end main                  ; End of the program

;*****
;****
;***
;**