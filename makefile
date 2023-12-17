CC = riscv64-linux-gnu-gcc
LD = riscv64-linux-gnu-ld
AS = riscv64-linux-gnu-as

kernel: boot.o start.o
	$(LD) -T kernel.ld boot.o start.o -o kernel.elf

boot.o:
	$(AS) boot.s -o boot.o

start.o:
	$(CC) -c start.c -o start.o

cleanup:
	rm -rf *.o *.elf