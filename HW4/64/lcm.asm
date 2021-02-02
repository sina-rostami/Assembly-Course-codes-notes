; School of Computer Engineering
; K.N. Toosi University of Technology

global lcm
extern gcd

segment .data

segment .text

lcm:
    enter 0,0
    push rdi
    push rsi

    call gcd
    mov rbx, rax ; save the rax

    pop rsi
    pop rdi

    mov rdx, 0
    mov rax, rdi
    mul rsi

    div rbx

	leave
	ret