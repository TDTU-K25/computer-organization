.data
promptMsg: .asciiz "Enter a number to find its factorial: "
resultMsg: .asciiz "The factorial of the number is "
tryAgainMsg: .asciiz "You entered the wrong number, please try again\n"
theNumber: .word 0
theAnswer: .word 0

.text
.globl main
main: 

enterN:
	li $v0, 4
	la $a0, promptMsg
	syscall
	
	li $v0, 5
	syscall 
	
	blt $v0, 0, again
	bgt $v0, 10, again
	
	sw $v0, theNumber
	
	j callFactorialFunc
	
again:
	li $v0, 4
	la $a0, tryAgainMsg
	syscall
	
	j enterN

callFactorialFunc:
	lw $a0, theNumber
	jal fact
	sw $v0, theAnswer
	
	li $v0, 4
	la $a0, resultMsg
	syscall
	
	li $v0, 1
	lw $a0, theAnswer
	syscall

exit:
	li $v0, 10
	syscall

# int fact(int n): return n <= 0 ? 1 : n * fact(n-1);
fact:
	addi $sp, $sp, -8 # space for two words
	sw $ra, 4($sp) # save return address
	sw $a0, 0($sp) # temporary variable to hold n
	li $v0, 1
	ble $a0, $zero, fact_return
	addi $a0, $a0, -1
	jal fact
	lw $a0, 0($sp) # retrieve original n
	mul $v0, $v0, $a0 # n * fact(n - 1)
fact_return:
	lw $ra 4($sp) # restore $ra
	addi $sp, $sp, 8 # restore $sp
	jr $ra # back to caller
