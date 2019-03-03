bits 16
org 0x100

IVT8_OFFSET_SLOT    equ 0x8 * 4
IVT8_SEGMENT_SLOT    equ 0x8 * 4 + 2

section .text

main:
    mov     ax, 0x0000
    mov     es, ax

    cli
    mov     ax, [es:IVT8_OFFSET_SLOT]
    mov     [ivt8_offset], ax
    mov     ax, [es:IVT8_SEGMENT_SLOT]
    mov     [ivt8_segment], ax

    lea     ax, [timer_isr]
    mov     [es:IVT8_OFFSET_SLOT], ax
    mov     ax, cs
    mov     [es:IVT8_SEGMENT_SLOT]
    sti

spawn_new_task:
    

timer_isr:
    jmp far [cs:ivt8_offset]    ; function chaining, reads 4 bytes in memory

section .data

    ivt8_offset:    dw 0
    ivt8_segment:   dw 0