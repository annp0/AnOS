OUTPUT_ARCH( "riscv" )
ENTRY( _start )

MEMORY{
    ram (wxa): ORIGIN = 0x8000000, LENGTH = 128M 
    /* This is where qemu expect our kernel to be */
}

PHDRS{
    text PT_LOAD; /* Segment for instructions */
    data PT_LOAD; /* Segment for initialized data*/
    bss PT_LOAD; /*Segment for uninitialized data*/
    /* Use PT_LOAD to indicate they will be loaded from file */
}

SECTIONS{
    /* Pattern match each section of each file
    to the corresponding section declared in PHDRS */
    .text : {
        *(.text)
    } >ram :text

    .data : {
        *(.data)
    } >ram :data

    .bss : {
        *(.bss)
    } >ram :bss

    /* Provide a memory start label */
    PROVIDE(_memory_start = ORIGIN(ram));
}