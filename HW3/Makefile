a.out: hw3.o driver.o asm_io.o
	gcc -m32 driver.o asm_io.o hw3.o

hw3.o: hw3.asm
	nasm -f elf hw3.asm

driver.o: driver.c
	gcc -m32 -c driver.c

asm_io.o: asm_io.asm
	nasm -f elf -d ELF_TYPE asm_io.asm

clean:
	rm *.o *.out
