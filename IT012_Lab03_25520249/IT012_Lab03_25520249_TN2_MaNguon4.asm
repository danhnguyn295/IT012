# Ho va ten: Nguyen Cong Danh, MSSV: 25520249, Muc dich: chuyen cua lenh thanh hop ngu
# Ma nguon 4 - chuyen cau lenh thanh lenh hop ngu
.text
.globl main
main:	
    addi $s0, $zero, 8       # y = 8
    addi $s1, $zero, 5       # z = 5
    addi $s2, $zero, 3       # w = 3
 
    # >>> cac lenh cho x1, x2, x3 va x4
    # x1
    add  $t0, $s0, $s1
    add  $t0, $t0, $s2
    # x2
    add  $t1, $s0, $s1
    addi $t5, $s2, 5
    sub  $t1, $t1, $t5
    # x3
    add  $t2, $s0, $zero
    # x4
    sub  $t3, $s1, $s0
 
    li   $v0, 10
    syscall