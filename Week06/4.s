 # Start .data segment (data!)
.data
msg: .asciiz "Nhap mot so nguyen: "
msg1: .asciiz "So ban vua nhap chia het cho 3"
msg2: .asciiz "So ban vua nhap khong chia het cho 3"
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
		
	rem $t0,$t0,3     
    beq $t0, 0, sochiahetcho3
	bne $t0, 0, sokhongchiahetcho3
	
		
sochiahetcho3:	li $v0,4         
				la $a0, msg1
				syscall
				j exit
		
sokhongchiahetcho3: 
					li $v0,4         
					la $a0, msg2
					syscall
		
exit:
		li $v0,10
		syscall
