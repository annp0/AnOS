.section .data

msg_boot: .ascii "Booting..."

.section .text
.global _entry

_entry:
    /* csr read mhartid into temporary register t0 */
    csrr t0, mhartid
    bnez t0, _wait
    la a0, msg_boot
    call _uart_write
    wfi

_uart_write:
    /* li is used to load constant integer value */
    /* uart_address: 0x10000000 */
    li t1, 0x10000000
    lb t2, (a0)
    beq t2, zero, _uart_write_end
    sb t2, (t1)
    li t2, 1
    add a0, t2, a0
    j _uart_write

_uart_write_end:
    ret

_wait:
    wfi
