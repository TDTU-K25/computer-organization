.data
promptMsg: .asciiz "Enter the number of Fibonacci numbers you want to print: "
resultMsg: .asciiz "Fibonacci numbers: "
tryAgainMsg: .asciiz "You entered the wrong number, please try again\n"
space: .asciiz " "

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
	bgt $v0, 100, again
	
	move $t5, $v0
	
	j next
	
again:
	li $v0, 4
	la $a0, tryAgainMsg
	syscall
	
	j enterN
	
next:
	li $t0, 0 # i = 0  
	
	li $v0, 4
	la $a0, resultMsg
	syscall
	
loop: 	beq $t0, $t5, exit

	jal fibonacci
	jal print_output

	addi $t0, $t0, 1 #i++
	j loop

exit:
	li $v0, 10
	syscall

fibonacci:

  move $t1, $0
  move $t2, $sp
  li $t3, 1
    addi $sp, $sp, -4          
  sw $t0, 0($sp)

  recursive_call:
    beq $sp, $t2, fib_exit      

    lw $t4, 0($sp)             
    addi $sp, $sp, 4

    bleu $t4, $t3, early_return

      sub $t4, $t4, 1           
      addi $sp, $sp, -4
      sw $t4, 0($sp)

      sub $t4, $t4, 1            
      addi $sp, $sp, -4
      sw $t4, 0($sp)

      j recursive_call

    early_return:

      add $t1, $t1, $t4
      j recursive_call

  fib_exit:
jr $31

print_output:
  li $v0, 1
  move $a0, $t1
  syscall

  li $v0, 4
  la $a0, space
  syscall
jr $31
