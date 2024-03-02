.data
arr: .word 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
size: .word 20
prompt: .asciiz "Enter an integer value to find index: "

.text
main:
la $t1, arr 
li $t2, 0 
la $t4, size 
lw $t3, ($t4) 

li $v0, 4 
la $a0, prompt 
syscall 

#user input
li $v0, 5
syscall
move $s0, $v0 

Loop:
beq $t2, $t3, endLoop 
lw $t5, ($t1) 
beq $t5, $s0, matchFound 

addi $t2, $t2, 1 
addi $t1, $t1, 4 
j Loop 

endLoop:
#if not found print -1
li $v0, 1 
la $a0, -1 
syscall 

li $v0, 10
syscall

matchFound:
li $v0, 1 
la $a0, ($t2) 
syscall

li $v0, 10 
syscall