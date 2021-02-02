global AreaA

segment .data
segment .text

AreaA:
    enter 0,0
    pusha

    mov ecx, [ebp + 8]
    dec ecx
    ; ecx = n - 1

    mov ebx, [ebp + 12]
    ; ebx = list

    fldz
    ; ST0 : area = 0

itr_over_arr:

    fld qword [ebx] ; list[i][0]
    fld qword [ebx + 24] ; list[i+1][1]
    ; ST0 : list[i+1][1]
    ; ST1 : list[i][0]
    ; ST2 : area
    fmulp ST1
    ; ST0 : list[i][0] * list[i+1][1]
    ; ST1 : area
    fld qword [ebx + 8]; list[i][1]
    fld qword [ebx + 16]; list[i+1][0]
    ; ST0 : list[i+1][0]
    ; ST1 : list[i][1]
    ; ST2 : list[i][0] * list[i+1][1]
    ; ST3 : area
    fmulp ST1
    ; ST0 : list[i][1] * list[i+1][0]
    ; ST1 : list[i][0] * list[i+1][1]
    ; ST2 : area
    fsubp ST1
    ; ST0 : list[i][0] * list[i+1][1] - list[i][1] * list[i+1][0]
    ; ST1 : area
    faddp ST1
    ; ST0 : area

    add ebx, 16; i++
    loop itr_over_arr

    fabs
    ; ST0 : |area|

    push 2
    fidiv dword [esp]
    add esp, 4

    popa
    leave
    ret