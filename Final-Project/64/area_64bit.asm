global AreaA

segment .data
two: dq 2.0
neg_one: dq -1.0
segment .text

AreaA:
    enter 0,0

    ; set area to 0
    sub rsp, 8
    mov qword [rsp], 0
    movsd xmm0, [rsp]
    add rsp, 8
    ; =================

    ; set for couner
    mov rcx, rdi
    dec rcx
    ; =================
itr_over_arr:

    movlpd xmm1, [rsi] ; list[i][0]
    movlpd xmm2, [rsi + 24]; list[i+1][1]

    movhpd xmm1, [rsi + 8]; list[i][1]
    movhpd xmm2, [rsi + 16]; list[i+1][0]
    mulpd xmm1, xmm2 ; store muls in xmm1

    sub rsp, 16
    movapd [rsp], xmm1
    movlpd xmm1, [rsp] ; in xmm1's low packed : list[i][0] * list[i+1][1]
    movlpd xmm2, [rsp + 8]; in xmm2's low packed : list[i+1][0] * list[i][1]
    add rsp, 16

    subpd xmm1, xmm2 ; temp_area is in xmm1's low packed =  list[i][0] * list[i+1][1] - list[i+1][0] * list[i][1]
    addsd xmm0, xmm1 ; area += temp_area

    add rsi, 16
    loop itr_over_arr


    ; area = | area |
    sub rsp, 8
    mov qword [rsp], 0
    movsd xmm1, [rsp]
    add rsp, 8
    ; xmm1's low packed is zero to be compared with area
    ucomisd xmm0, xmm1
    ja positive
    mulsd xmm0, [neg_one]
    ; ===================

positive:
    divsd xmm0, [two] ; area /= 2

    leave
    ret