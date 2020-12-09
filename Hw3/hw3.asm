; School of Computer Engineering
; K.N. Toosi University of Technology

%include "asm_io.inc"
segment .data
pattern: db 01000011b ; 43
input_sequence: resb 10000



segment .text

global asm_main:
	asm_main:
	enter 0,0
	pusha

;read input

	mov edi, 0
read_input:
	call read_char
	cmp al, '0'
	jne not_equal_to_zero
add_to_sequence:
	mov byte [input_sequence + edi], al
	inc edi
	jmp read_input

not_equal_to_zero:
	cmp al, '1'
	jne make_divisible_by_8
	jmp add_to_sequence
;---------------------------------------


; make_divisible_by_8

make_divisible_by_8:
	mov edx, 0
	mov eax, edi
	mov ecx, 8
	div ecx
	cmp edx, 0
	je after_making_divisible_by_8
	sub ecx, edx
add_a_zero:
	mov byte [input_sequence + edi], '0'
	inc edi
	loop add_a_zero
;---------------------------------------

after_making_divisible_by_8:

; print divisible by 8
	mov ecx, edi
print:
	mov eax, edi
	sub eax, ecx
	mov byte al, [input_sequence + eax]
	call print_char
	loop print
	call print_nl
;---------------------------------------

; print 8-bit 8-bit

mov esi, 0

read_a_8_bit:
	mov bl, 0

	mov ecx, 8
read_from_arr:
	mov dl,[input_sequence + esi]
	inc esi
	shl bl, 1
	cmp dl, '1'
	je equal_to_one
continue_loop:
	loop read_from_arr
	jmp reading_an_8bit_done

equal_to_one:
	inc bl
	jmp continue_loop

reading_an_8bit_done:
	movsx eax, bl
	call print_int
	call print_nl

	cmp esi, edi
	jl read_a_8_bit
; ------------------------------

; count of pattern matching

mov bh, 0

mov dh, 0

read_a_8_bit_for_pattern:
	mov bl, 0
	movsx esi, dh
	inc dh

	; mov eax, esi
	; call print_int
	; call print_nl

	mov ecx, 8
read_from_arr_for_pattern:
	mov dl,[input_sequence + esi]
	inc esi
	shl bl, 1
	cmp dl, '1'
	je equal_to_one_for_pattern
continue_loop_for_pattern:
	loop read_from_arr_for_pattern
	jmp reading_an_8bit_done_for_pattern

equal_to_one_for_pattern:
	inc bl
	jmp continue_loop_for_pattern

reading_an_8bit_done_for_pattern:
	mov dl, [pattern]
	cmp dl, bl
	je are_equ
	jmp continue
are_equ:
	inc bh
continue:
	cmp esi, edi
	jl read_a_8_bit_for_pattern
; -------------------------------
	movsx eax, bh
	call print_int
	call print_nl

	popa
	leave
	ret