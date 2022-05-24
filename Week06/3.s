 # Start .data segment (data!)
.data
msg1: .asciiz "Enter N: "
msg2: .asciiz "Sum of even numbers = "
# Start .text segment (program code)
.text
.globl main
main:
    # Print string msg1
        li $v0,4         
        la $a0, msg1       
        syscall

    # Get input N from user and save
		li $v0,5       
        syscall     
		move $t0,$v0

    # Math!
        li $t1, 0 # Sum = 0
		li $t2, 2 # i = 2
		
		
	# Main loop body
SumOfEven_loop:	bgt $t2, $t0, exit
				add $t1, $t1, $t2
				addi $t2, $t2, 2
				j SumOfEven_loop
		
	# Exit
exit:	li $v0,4         
        la $a0, msg2      
        syscall
		
		#Print Sum
		li $v0,1
		move $a0, $t1
		syscall
		
		li $v0,10
		syscall
