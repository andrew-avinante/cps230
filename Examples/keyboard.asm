bits 16
org 0x100

section .text

main:
    cli
    xor     ax, ax
    mov     es, ax
    
    mov     dx, [es:0x09*4]             ; interrupt in text
    mov     [previous9offset], dx
    mov     dx, [es:0x09*4+2]             ; interrupt in text
    mov     [previous9segment], dx

    lea     dx, [keyboard]
    mov     [es:0x9*4], dx
    mov     dx, cs
    mov     [es:0x09*4+2], dx            ; interrupt in text
    sti

.loop:
    cmp     byte[number], 0
    je      .loop

    cmp     byte[number], 0x10
    jne     .print
    jmp     .finish
.print:
    mov     al, [number]
    shr     al, 4
    and     al, 0xF
    printHexChar
    mov     al, [number]
    and     al, 0xF
    printHexChar
    mov     byte[number], 0
    jmp     .loop
.finish:
    cli
    xor     ax, ax
    mov     es, ax

    mov     dx, [previous9offset]
    mov     [es:0x09*4], dx
    mov     dx, [previous9segment]
    mov     [es:0x09*4+2], dx
    sti
    ret

keyboard:
    push    ax
    cmp     byte[number], 0
    jne     .skip
    in      al, 0x60
    mov     [number], al
    mov     al, 0x20
    out     0x20, al
.skip
    pop     ax
    iret            ; return from an interrupt

section .data
    number: db 0
    previous9offset: dw 0
    previous9segment: dw 0