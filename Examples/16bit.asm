bits    16
org     0x100

section .text

jmp     main

main:

    mov     ah, 0x4c
    mov     al, 0
    int     0x21

section .data

;nasm -fbin -o temp.com temp.asm
;mount D "C:\Users\blah..."
;D: