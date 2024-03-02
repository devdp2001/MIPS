.data
arr : .word -1,5,6,7,10,-6,-5,4,9,20
arrayLength : .word 10
count: .word 0

.text
main:
la $t1, arr #load array
lw $s2, arrayLength
li $s3, 0 #i = 0
li $s5, 0 #count  = 0
la $t6, count
li $t4, 10 # pointer to number 10 for comparison purpose

Loop:
beq $s2, $s3, Exit #if program has gone through all of array, branch to exit
lw $s4, 0($t1) #load the array value that is going to be compared
slt $t5, $s4, $t4 #compare if < 10
beq $t5, $zero, Adjust #if it is not, branch to Adjust
addi $s5, $s5, 1 #add to count

Adjust: 
addi $t1, $t1, 4 #change offset to get to next value
addi $s3, $s3, 1 #increment i value
j Loop #jump back to Loop

Exit:
sw $s5, 0($t6) #store count value into $s5
li $v0, 10 #exit program
syscall 
