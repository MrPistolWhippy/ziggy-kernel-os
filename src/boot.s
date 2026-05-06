.section .multiboot
.align 8
header_start:
    .long 0xe85250d6
    .long 0
    .long header_end - header_start
    .long 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start))
    .short 0, 0
    .long 8
header_end:

.section .text
.code64
.global _start
_start:
    cli
    mov $stack_top, %rsp
    call kmain

.halt:
    hlt
    jmp .halt

.section .bss
.align 16
stack_bottom:
    .skip 16384
stack_top:
