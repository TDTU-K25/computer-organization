 # Start .data segment (data!)
.data
msg1: .asciiz "Nhap a: "
msg2: .asciiz "Nhap b: "
msg3: .asciiz "a = b"
msg4: .asciiz "a > b"
msg5: .asciiz "a < b"
newline: .asciiz "\n"
# Start .text segment (program code)
.text
.globl main
main:
    # Print string msg1
        li $v0,4         
        la $a0, msg1   
        syscall

    # Get input first number from user and save
		li $v0,5       
        syscall     
		move $t0,$v0
		
	 # Print string msg2
        li $v0,4         
        la $a0, msg2   
        syscall

    # Get input second number from user and save
		li $v0,5       
        syscall     
		move $t1,$v0

    # Math!
		 
    beq $t0, $t1, bang
	blt $t0, $t1, nho
	bgt $t0, $t1, lon
	
		
bang:	li $v0,4         
		la $a0, msg3
		syscall
		j exit
		
nho: 
		li $v0,4         
		la $a0, msg5
		syscall
		j exit
		
lon:
		li $v0,4         
		la $a0, msg4
		syscall
		j exit

exit:
		li $v0,10
		syscall
