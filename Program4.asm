.data
arr : .word 4, 7, 4
arrayLength : .word 3
average: .asciiz "Average of Array: "

.text
main:
la $a0, arr
lw $a1, arrayLength
jal Average
move $t3, $v0 #move result to t3
li $v0, 4
la $a0, average
syscall

move $a0, $t3
li $v0, 1
syscall

mainEnd:
li $v0, 10
syscall 

Average:
move $t8, $a1 
move $t0, $a0 
li $t3, 0
li $t5, 0 

getValues:
bge $t3, $t8, exit
mul $t4, $t3, 4
add $t4, $t4, $t0
lw $t6, 0($t4)
add $t5, $t5, $t6
addi $t3, $t3, 1
j getValues

exit:
div $v0, $t5, $t8 #gets average
jr $ra 
