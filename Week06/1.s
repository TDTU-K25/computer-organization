 # Start .data segment (data!)
.data
msg1: .asciiz "Enter N: "
msg2: .asciiz "Sum = "
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
        li $t1, 0 
		li $t2, 0 
		
		
	# Main loop body
loop:	addi $t1, $t1, 1 
		add $t2, $t2, $t1
		beq $t0, $t1, exit
		j loop
		
	# Exit
exit:	li $v0,4         
        la $a0, msg2      
        syscall
		
		#Print Sum
		li $v0,1
		move $a0, $t2
		syscall
		
		li $v0,10
		syscall
