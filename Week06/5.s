 # Start .data segment (data!)
.data
msg: .asciiz "Nhap mot so nguyen: "
msg1: .asciiz "So ban vua nhap la so nguyen duong"
msg2: .asciiz "So ban vua nhap la so nguyen am"
msg3: .asciiz "So ban vua nhap la so 0"
newline: .asciiz "\n"
# Start .text segment (program code)
.text
.globl main
main:
    # Print string msg
        li $v0,4         
        la $a0, msg   
        syscall

    # Get input number from user and save
		li $v0,5       
        syscall     
		move $t0,$v0

    # Math!
		 
    beq $t0, 0, so0
	blt $t0, 0, soam
	bgt $t0, 0, soduong
	
		
so0:	li $v0,4         
		la $a0, msg3
		syscall
		j exit
		
soduong: 
		li $v0,4         
		la $a0, msg1
		syscall
		j exit
		
soam:
		li $v0,4         
		la $a0, msg2
		syscall
		j exit

exit:
		li $v0,10
		syscall
