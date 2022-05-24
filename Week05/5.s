 # Start .data segment (data!)
.data
msg1: .asciiz "Enter A: "
msg2: .asciiz "Enter B: "
msg3: .asciiz "A * B = "
newline: .asciiz "\n"

# Start .text segment (program code)
.text
.globl main
main:
    # Print string msg1
        li $v0,4         
        la $a0, msg1         
        syscall

    # Get input A from user and save
        li $v0,5       
        syscall
        move $s0,$v0         

    # Print string msg2
        li $v0,4         
        la $a0, msg2         
        syscall

    # Get input B from user and save
        li $v0,5       
        syscall
        move $s1,$v0         

    # Math!
        mult $s0, $s1	   # mul = A*B	
		mfhi $t0 #The 32 most significant bits of multiplication
		mflo $t1 #The 32 least significant bits of multiplication
		add $a1, $t0, $t1
	  
    # Print string msg3
        li $v0,4
        la $a0, msg3
        syscall

    # Print mul
        li $v0,1       
        move $a0, $a1        
        syscall

    # Print \n
        li $v0,4         
        la $a0, newline
        syscall
	
        li $v0,10         # exit
        syscall