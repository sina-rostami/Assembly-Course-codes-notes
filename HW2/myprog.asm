%include "asm_io.inc"

segment .text

global asm_main

; ===================================
; strings to be printed in the output
; ***********************************
asc_message: db "Ascending", 10, 0
desc_message: db "Descending", 10, 0
both_message: db "Both", 10, 0
neither_message: db "Neither", 10, 0
; ===================================

asm_main:

	enter 0,0
	pusha
	; wirte your codes here
	call read_int
	mov ebx, eax

; ===================================
; we use edi register as flag in the program :
; ***********************************
	mov edi, 0 ; flag
; 0 : start value
; 1 : neither
; 2 : both
; 3 : descending
; 4 : ascending
; ===================================

; ==================================
; this scope divides the ebx to 10
; stores the rem in ecx,
; stores the quotient in ebx
; **********************************
	mov edx, 0 ; qoutient
r1:
	sub ebx, 10
	inc edx
	jae r1

	add ebx, 10 ; rem
	dec edx ; quotient

	mov ecx, ebx ; rem in ecx
	mov ebx, edx ; qoutionet in ebx
; ==================================

continue:

; ==================================
; this scope divides the ebx to 10
; stores the rem in edx,
; stores the quotient in ebx
; **********************************
	mov edx, 0 ; qoutient
r2:
	sub ebx, 10
	inc edx
	jae r2

	add ebx, 10 ; rem
	dec edx ; quotient

	mov esi, ebx
	mov ebx, edx ; quotionet in ebx
	mov edx, esi ; rem in edx
; ==================================

	; check cending
	cmp ecx, edx
	ja ascending_matched
	je both_matched
	jb descending_mathced

	;check if loop ends or not
check_continue:
	mov ecx, edx
	cmp ebx, 0
	je end
	jmp continue

ascending_matched:
	cmp edi, 0
	je set_asc
	cmp edi, 2
	je set_asc
	cmp edi, 3
	je neither_matched
	jmp check_continue

	set_asc:
		mov edi, 4
		jmp check_continue

descending_mathced:
	cmp edi, 0
	je set_des
	cmp edi, 2
	je set_des
	cmp edi, 4
	je neither_matched
	jmp check_continue

	set_des:
		mov edi, 3
		jmp check_continue

both_matched:
	cmp edi, 0
	je set_both
	jmp check_continue

	set_both:
		mov edi, 2
		jmp check_continue

neither_matched:
	mov edi, 1
	jmp end

end:
	cmp edi, 1
	je print_neither
	cmp edi, 2
	je print_both
	cmp edi, 3
	je print_des
	cmp edi, 4
	je print_asc

	print_asc:
		mov eax, asc_message
		jmp print
	print_des:
		mov eax, desc_message
		jmp print
	print_both:
		mov eax, both_message
		jmp print
	print_neither:
		mov eax, neither_message
		jmp print
print:
	call print_string

	; end your codes here
	popa
	leave
	ret
