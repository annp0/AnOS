OUTPUT_ARCH( "riscv" )
ENTRY( _entry )

PHDRS{
    text PT_LOAD;
    data PT_LOAD;
    bss PT_LOAD;
}

SECTIONS{
    . = 0x80000000;

    .text : {
        *(.text)
    } :text

    .data : {
        *(.data)
    } :data

    .bss : {
        *(.bss)
    } :bss
}