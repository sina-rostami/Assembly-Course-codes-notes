; School of Computer Engineering
; K.N. Toosi University of Technology

global gcd

segment .data

segment .text

gcd:
    enter 0, 0

    mov edx, 0
    mov eax, [ebp + 8] ; a
    div dword[ebp + 12] ; b

    ; base case
    cmp edx, 0
    je rem_is_zero

    ; recursion step
    push edx ; a % b
    push dword [ebp + 12] ; b
    call gcd
    add esp, 8
    jmp end


rem_is_zero:
    mov eax, [ebp + 12]

end:
    leave
	ret