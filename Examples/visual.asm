bits 16
org 0x100

section .text

jmp main

main:
    mov     cx, 0xB800
    mov     es, cx

    mov     ah, 0
    mov     al, 3
    int     0x10

    mov     ax, 994

    lea     dx, [str]
.while:
    mov     bx, dx
    cmp     byte [bx], 0
    je      .end
    movzx   cx, byte [bx]
    and     cx, 0xFF
    or      cx, 0xDB00
    mov     bx, ax
    mov     [es:bx], cx
    inc     ax
    inc     dx
    jmp     .while

.end

    mov     ah, 0x4c
    mov     al, 0
    int     ox21

section.data

    str: db "hello world!", 0