main_64: main_64.o area_64bit.o
	gcc -no-pie main_64.o area_64bit.o -o main_64

main_64.o: main.c
	gcc -masm=intel -c main.c -o main_64.o

area_64bit.o: area_64bit.asm
	nasm -f elf64 area_64bit.asm

####
clean:
	rm *.o main_64