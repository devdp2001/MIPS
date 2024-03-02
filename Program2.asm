.data
arr: .word 10, 3, 45, 90, 12
Length: .word 5
Max: .word 0
Prompt: .asciiz "Largest in given array is "

.text
main:
la $s0, arr
lw $t0, Length
lw $s1, 0($s0)  #s1 is max 
addi $s0, $s0, 4
li $t1, 1 #i = 1

Loop:
beq $t1, $t0, Done
lw $t2, 0($s0)
slt $t3, $s1, $t2
beq $t3, $zero, cont
move $s1, $t2

cont:
addi $s0, $s0, 4
addi $t1, $t1, 1
j Loop

Done:
sw $s1, Max

li $v0, 4
la $a0, Prompt
syscall

li $v0, 1
la $a0, ($s1)
syscall

li $v0, 10
syscall