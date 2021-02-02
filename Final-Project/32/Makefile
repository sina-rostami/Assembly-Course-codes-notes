main_32: main_32.o area_32bit.o
	gcc -m32 main_32.o area_32bit.o -o main_32

main_32.o: main.c
	gcc -m32 -masm=intel -c main.c -o main_32.o

area_32bit.o: area_32bit.asm
	nasm -f elf area_32bit.asm

asm_io.o: asm_io.asm
	nasm -f elf -d ELF_TYPE asm_io.asm

####
clean:
	rm *.o main_32