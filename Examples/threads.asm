bits 17
org 0x100

section .text

jmp main

thread_a:



thread_b:

main:

    mov     ah, 0x4c
    mov     al, 0
    int     0x21

; di - the address to start with
spawn:
    ret
yield:
    ret

section .data

    thread_a_str: db "I am thread A", 10, 0
    thread_b_str: db "I am thread B", 10, 0
    thread_main_str: db "I am thread MAIN", 10, 0

    stack_status: times 32 dw 0     ; 0 = not used stack, 1 = stack in used
    current_thread: dw 0
    stacks: times 256 * 32 db 0
    stack_pointers: dw 0
                    dw stacks + (256 * 1)
                    dw stacks + (256 * 2)
                    dw stacks + (256 * 3)
                    dw stacks + (256 * 4)
                    dw stacks + (256 * 5)
                    dw stacks + (256 * 6)
                    dw stacks + (256 * 7)
                    dw stacks + (256 * 8)
                    dw stacks + (256 * 9)
                    dw stacks + (256 * 10)
                    dw stacks + (256 * 11)
                    dw stacks + (256 * 12)
                    dw stacks + (256 * 13)
                    dw stacks + (256 * 14)
                    dw stacks + (256 * 15)
                    dw stacks + (256 * 16)
                    dw stacks + (256 * 17)
                    dw stacks + (256 * 18)
                    dw stacks + (256 * 19)
                    dw stacks + (256 * 20)
                    dw stacks + (256 * 21)
                    dw stacks + (256 * 22)
                    dw stacks + (256 * 23)
                    dw stacks + (256 * 24)
                    dw stacks + (256 * 25)
                    dw stacks + (256 * 26)
                    dw stacks + (256 * 27)
                    dw stacks + (256 * 28)
                    dw stacks + (256 * 29)
                    dw stacks + (256 * 30)
                    dw stacks + (256 * 31)
                    dw stacks + (256 * 32)
