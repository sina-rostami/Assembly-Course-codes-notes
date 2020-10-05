%include "asm_io.inc"

segment .text

global asm_main

; implement the below formula : 
; (((input2 + 74) * 7) + (input1 - 46 ))* 3

asm_main:

	enter 0,0
	pusha
	; wirte your codes here

	call read_int
	mov ebx, eax ; ebx is input1
	call read_int
	mov ecx, eax ; ecx is intput2
	
	sub ebx, 46 
	add ecx, 74

	mov edx, ecx
	add ecx, ecx
	add ecx, ecx
	add ecx, ecx
	sub ecx, edx

	add ecx, ebx
	mov eax, ecx

	mov edx, eax
	add eax, eax
	add eax, edx


	call print_int
	call print_nl

	; end your codes here
	popa
	leave
	ret
