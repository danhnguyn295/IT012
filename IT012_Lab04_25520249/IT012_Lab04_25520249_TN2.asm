#Ho ten: Nguyen Cong Danh, MSSV: 25520249, muc dich: Nhap dien nang tieu thu (kWh), xac dinh bac gia dien (1-4) va in ra man hinh

.data
prompt: .asciiz "Nhap dien nang (kWh): "
msg:    .asciiz "Bac: "
nl:     .asciiz "\n"

.text
.globl main
main:

  li   $v0, 4
  la   $a0, prompt
  syscall

  
  li   $v0, 5
  syscall
  add  $s0, $v0, $zero   # $s0 = dien nang (kWh)



  slti $t0, $s0, 101
  bne  $t0, $zero, SetBac1


  slti $t0, $s0, 151
  bne  $t0, $zero, SetBac2

  
  slti $t0, $s0, 201
  bne  $t0, $zero, SetBac3


  li   $s1, 4
  j    PrintResult

SetBac1:
  li   $s1, 1
  j    PrintResult

SetBac2:
  li   $s1, 2
  j    PrintResult

SetBac3:
  li   $s1, 3

PrintResult:

  li   $v0, 4
  la   $a0, msg
  syscall


  li   $v0, 1
  add  $a0, $s1, $zero
  syscall


  li   $v0, 4
  la   $a0, nl
  syscall


  li   $v0, 10
  syscall