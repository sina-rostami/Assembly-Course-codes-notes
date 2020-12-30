; School of Computer Engineering
; K.N. Toosi University of Technology

global gcd

segment .data

segment .text

gcd:
	enter 0,0

    mov rdx, 0
    mov rax, rdi
    div rsi

    ; base case
    cmp rdx, 0
    je rem_is_zero

    ; recursion step
    mov rdi, rsi
    mov rsi, rdx
    call gcd


rem_is_zero:
    mov rax, rsi
	leave
	ret