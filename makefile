CC = riscv64-linux-gnu-gcc
LD = riscv64-linux-gnu-ld
AS = riscv64-linux-gnu-as

kernel: boot.o start.o
	$(LD) -T kernel.ld boot.o start.o -o kernel.elf

boot.o:
	$(AS) boot.s -o boot.o

start.o:
	$(CC) -c start.c -o start.o

clean:
	rm -rf *.o *.elf

run: clean kernel
	qemu-system-riscv64 -machine virt -cpu rv64 -smp 4 -m 128M -nographic -serial mon:stdio -bios none -kernel kernel.elf