; School of Computer Engineering
; K.N. Toosi University of Technology

global lcm
extern gcd

segment .data

segment .text

lcm:
    enter 0,0
    push ebx

    push dword[ebp + 12] ; b
    push dword[ebp + 8] ; a
    call gcd
    add esp, 8

    mov ebx, eax ; save the eax

    mov edx, 0
    mov eax, [ebp + 8]
    mul dword [ebp + 12]

    div ebx

    pop ebx
	leave
	ret