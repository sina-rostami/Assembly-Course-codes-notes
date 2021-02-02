
run.out: main.o lcm.o gcd.o
	gcc main.o lcm.o gcd.o -o run.out

lcm.o: lcm.asm
	nasm -f elf64 lcm.asm

gcd.o: gcd.asm
	nasm -f elf64 gcd.asm

main.o: main.c
	gcc -c main.c

clean:
	rm *.o *.out