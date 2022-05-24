.data
arr: .space 40
prompt_msg: .asciiz "Enter the number elements of an array: "
error_mgs: .asciiz "Incorrect, please try again"
newline: .asciiz "\n"
input_msg: .asciiz "Enter vaule to an array: "
array: .asciiz "Array: "
space: .asciiz " "
.text
.globl main
main: 
	li $t1, 0 # counter = 0
	li $t2, 0 # index = 0

user_input:

	li $v0, 4
	la $a0, prompt_msg
	syscall
	
	li $v0, 5 
	syscall
	move $t0, $v0 # s? ph?n t? c?a m?ng do ng??i dùng nh?p vào 
	
	blt $t0, 1, check
	bgt $t0, 10, check
	
	j loop
	
check:
	li $v0, 4
	la $a0, error_mgs
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	j user_input
	
	
	
loop:	
	li $v0, 4
	la $a0, input_msg
	syscall
	
	li $v0, 5 
	syscall
	
	sw $v0, arr($t2)
	addi $t2, $t2 , 4
	addi $t1, $t1, 1
	blt $t1, $t0, loop
	
    li $t1, 0 # i = 0
    la $t7, arr
    
    li $v0, 4
    la $a0, array
    syscall
	
printloop:
    lw $t6, 0($t7)
    addi $t7, $t7, 4
    addi $t1, $t1, 1 # i++
    li $v0, 1
    la $a0, ($t6)
    syscall
    li $v0, 4
    la $a0, space
    syscall
    blt $t1, $t0, printloop
	
exit: 
	li $v0, 10
	syscall
	

	
