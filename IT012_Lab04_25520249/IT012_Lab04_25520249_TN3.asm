#Ho ten: Nguyen Cong Danh, MSSV: 25520249, muc dich: tinh dien nang tung thang, tong ca nam va thang cao nhat
.data
m1:      .asciiz "Thang "
m2:      .asciiz ": "
mt:      .asciiz "Tong: "
mm:      .asciiz "Thang cao nhat: "
lp:      .asciiz " ("
rp:      .asciiz ")\n"
nl:      .asciiz "\n"
reading: .word 1180, 1339, 1468, 1577, 1681, 1800, 1949
         .word 2123, 2337, 2586, 2850, 3089, 3283
usage:   .space 48

# Ma nguon 8 – dien nang tung thang
.text
.globl main
main:
  la   $s0, reading     # dia chi nen reading
  la   $s1, usage       # dia chi nen usage
  addi $s2, $zero, 0    # i = 0
  addi $s3, $zero, 12   # n = 12 thang
  addi $s4, $zero, 0    # tong dien nang = 0
  addi $s5, $zero, -1   # max_usage = -1
  addi $s6, $zero, 0    # max_month = 0

Loop:
  beq  $s2, $s3, Done

  # Tinh dia chi reading[i] va reading[i+1]
  sll  $t1, $s2, 2      
  add  $t2, $s0, $t1    
  lw   $t3, 0($t2)      
  lw   $t4, 4($t2)      

  # Tinh usage[i]
  sub  $t5, $t4, $t3    

  # Luu vao usage[i]
  add  $t6, $s1, $t1    
  sw   $t5, 0($t6)

  # Cong don vao tong
  add  $s4, $s4, $t5

  # Kiem tra max: neu $s5 < $t5 thi cap nhat
  slt  $t7, $s5, $t5
  beq  $t7, $zero, PrintMonth
  add  $s5, $t5, $zero   
  addi $s6, $s2, 1      

PrintMonth:
  # In "Thang "
  li   $v0, 4
  la   $a0, m1
  syscall
  # In i + 1
  li   $v0, 1
  addi $a0, $s2, 1
  syscall
  # In ": "
  li   $v0, 4
  la   $a0, m2
  syscall
  # In usage[i]
  li   $v0, 1
  add  $a0, $t5, $zero
  syscall
  # In xuong dong
  li   $v0, 4
  la   $a0, nl
  syscall

  addi $s2, $s2, 1
  j    Loop

Done:
  # In Tong: <tong>
  li   $v0, 4
  la   $a0, mt
  syscall
  li   $v0, 1
  add  $a0, $s4, $zero
  syscall
  li   $v0, 4
  la   $a0, nl
  syscall

  # In Thang cao nhat: <thang> (<dien nang>)
  li   $v0, 4
  la   $a0, mm
  syscall
  li   $v0, 1
  add  $a0, $s6, $zero
  syscall
  li   $v0, 4
  la   $a0, lp
  syscall
  li   $v0, 1
  add  $a0, $s5, $zero
  syscall
  li   $v0, 4
  la   $a0, rp
  syscall

  li   $v0, 10
  syscall
