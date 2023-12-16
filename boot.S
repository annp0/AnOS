.option norvc # Do not generate compressed instructions
.section .data

.section .text
.global _start # Output this symbol

_start:
    wfi # Wait for interrupts
