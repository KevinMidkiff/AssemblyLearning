SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1
ARR_SIZE  equ 6

segment .data
    msg db "Average: "
    len equ $- msg

    newline db "", 0xA, 0xD
    newlinelen equ $- newline

    global x
    x: db 6 9 7 8 5 4

    sum: db 0
    avg: db 0


section .text
    global _start

_start:
    mov eax, ARR_SIZE   ; Number of bytes to be averaged
    mov ebx, 0          ; ebx will store the sum and the average when it is done
    mov ecx, x          ; exc will point to the array of elements

sum:
    add ebx, [ecx]      ; Add the value at ecx's address to the sum
    dec eax             ; Decrement the counter
    jnz sum             ; Jump to sum if the counter (eax) is not 0

average:
    sub ebx, '0'
    mov eax, ARR_SIZE
    sub eax, '0'
    div 
      

done:


display:
    ; Display Message
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg
    mov edx, len 
    int 0x80    
    
    ; Print Result 
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov edx, 1      ; Message Length
    mov ecx, avg    ; Message to Write
    int 0x80 

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, newline    
    mov edx, newlinelen

exit:
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80

