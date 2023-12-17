.section .data

msg_boot: .ascii "Power On\n\0"

.section .text
.global _entry

_entry:
    csrr t0, mhartid
    bnez t0, _start
    la a0, msg_boot
    call _uart_write
    /*  sp = stack0 + ((hartid + 1) * 4096) */
    la sp, stack
    li a0, 4096
    csrr a1, mhartid
    addi a1, a1, 1
    mul a0, a0, a1
    add sp, sp, a0
    call start

spin:
    j spin

_uart_write:
    li t1, 0x10000000
    lb t2, (a0)
    beq t2, zero, _uart_write_end
    sb t2, (t1)
    li t2, 1
    add a0, t2, a0
    j _uart_write

_uart_write_end:
    ret

_start:
    call start
