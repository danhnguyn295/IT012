# Ho va ten: Nguyen Cong Danh, MSSV: 25520249, Muc dich: Lam quen voi MARS
# Ma nguon 0 - kiem tra nhanh
.data
msg:   .asciiz "Xin chao, MARS!\n"
 
.text
.globl main
main:
    li   $v0, 4
    la   $a0, msg
    syscall
    li   $v0, 10
    syscall
