.data
arrayA: .word 10, 5, 6, 15, 17, 19, 25, 30, 12, 56
arrayB: .word 4, 15, 16, 5, 7, 9, 15, 10, 22, 6
arrayC: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
Length: .word 10
Prompt: .asciiz "Result is ["
commaSpace: .asciiz ", "
endBracket: .asciiz "]"

.text
main:
la $t0, arrayA
la $t1, arrayB
la $t3, arrayC
la $t2, Length
li $t8, 0
lw $t7, 0($t2)

li $v0, 4
la $a0, Prompt
syscall

Loop:
lw $t4, 0($t0)
lw $t5, 0($t1)
sub $t6, $t4, $t5
sw $t6, 0($t3)

li $v0, 1
lw $a0, 0($t3)
syscall

li $v0, 4
la $a0, commaSpace
syscall

addi $t0, $t0, 4
addi $t1, $t1, 4
addi $t3, $t3, 4
addi $t8, $t8, 1
blt $t8, $t7, Loop

li $v0, 4
la $a0, endBracket
syscall

#li $v0, 1
#lw $a0, 0($t3)
#syscall

li $v0, 10
syscall
