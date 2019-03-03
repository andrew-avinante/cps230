bits 16
org 0x100

section .text

jmp main

main:
    mov     cx, 0xA000
    mov     es, cx

    mov     ah, 0x0
    mov     al, 0x13
    int     0x10

    mov     cx, 0
    mov     bx, 0
.while:
    cmp     cx, 64000
    jge     .end
    mov     byte [es:bx], cl
    inc     cx
    inc     bx
    jmp     .while
.end:
    

    mov     ah, 0x4c
    mov     al, 0
    int     ox21

section.data

    str: db "hello world!", 0