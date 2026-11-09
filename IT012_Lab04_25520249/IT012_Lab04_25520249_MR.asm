#H? tên: Nguy?n Công Danh, MSSV: 25520249, m?c ?ích: dem so thang theo bac gia
#Ma nguon 7
.data
reading: .word 1000, 1095, 1205, 1345, 1510, 1715, 1955
         .word 2210, 2440, 2625, 2775, 2895, 2995
usage:   .space 48
cnt:     .word 0, 0, 0, 0     # Mang 4 tu dem so thang cua 4 bac
mb:      .asciiz "Bac "
mcolon:  .asciiz ": "
nl:      .asciiz "\n"

.text
.globl main
main:
  la   $s0, reading
  la   $s1, usage
  addi $s2, $zero, 0
  addi $s3, $zero, 12

# Buoc 1: Tinh mang usage
CalcUsage:
  beq  $s2, $s3, ResetLoop
  sll  $t1, $s2, 2
  add  $t2, $s0, $t1
  lw   $t3, 0($t2)
  lw   $t4, 4($t2)
  sub  $t5, $t4, $t3
  add  $t6, $s1, $t1
  sw   $t5, 0($t6)
  addi $s2, $s2, 1
  j    CalcUsage

ResetLoop:
  addi $s2, $zero, 0          # i = 0
  la   $s7, cnt               # $s7 = dia chi nen mang cnt

# Buoc 2: Duyet mang usage de phan bac
CountLoop:
  beq  $s2, $s3, PrintResult
  sll  $t1, $s2, 2
  add  $t6, $s1, $t1
  lw   $t5, 0($t6)            # $t5 = usage[i]

  # Xac dinh chi so bac (bac 1 -> index 0, bac 2 -> index 1, ...)
  slti $t0, $t5, 101
  bne  $t0, $zero, Bac1
  slti $t0, $t5, 151
  bne  $t0, $zero, Bac2
  slti $t0, $t5, 201
  bne  $t0, $zero, Bac3
  addi $t8, $zero, 3          # B?c 4: index 3
  j    IncCount

Bac1:
  addi $t8, $zero, 0          # B?c 1: index 0
  j    IncCount
Bac2:
  addi $t8, $zero, 1          # B?c 2: index 1
  j    IncCount
Bac3:
  addi $t8, $zero, 2          # B?c 3: index 2

IncCount:
  sll  $t9, $t8, 2
  add  $t9, $t9, $s7          # dia chi cnt[index]
  lw   $t0, 0($t9)
  addi $t0, $t0, 1
  sw   $t0, 0($t9)

  addi $s2, $s2, 1
  j    CountLoop

# Buoc 3: In ket qua 4 bac
PrintResult:
  addi $s2, $zero, 0          # k = 0..3
  addi $s4, $zero, 4
PrintLoop:
  beq  $s2, $s4, Exit
  li   $v0, 4
  la   $a0, mb
  syscall
  li   $v0, 1
  addi $a0, $s2, 1
  syscall
  li   $v0, 4
  la   $a0, mcolon
  syscall

  sll  $t1, $s2, 2
  add  $t1, $t1, $s7
  lw   $a0, 0($t1)
  li   $v0, 1
  syscall
  li   $v0, 4
  la   $a0, nl
  syscall

  addi $s2, $s2, 1
  j    PrintLoop

Exit:
  li   $v0, 10
  syscall