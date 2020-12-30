GCC_FLAGS = -m32

run.out: main.o lcm.o gcd.o
	gcc $(GCC_FLAGS) main.o lcm.o gcd.o -o run.out

lcm.o: lcm.asm
	nasm -f elf32 lcm.asm

gcd.o: gcd.asm
	nasm -f elf32 gcd.asm

main.o: main.c
	gcc $(GCC_FLAGS) -c main.c

clean:
	rm *.o *.out