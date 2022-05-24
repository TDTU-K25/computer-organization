 # Start .data segment (data!)
.data
msg1: .asciiz "Nhap so nguyen duong n: "
msg2: .asciiz "Nhap sai, nhap lai"
msg3: .asciiz "Ban vua nhap so nguyen duong" 
newline: .asciiz "\n"
# Start .text segment (program code)
.text
.globl main
main:
    
loop:
		li $v0,4         
        la $a0, msg1   
        syscall

		li $v0,5       
        syscall     
		move $t0,$v0
		
		bgt $t0, 0, exit
		j again
		
again:
		li $v0,4         
		la $a0, msg2
		syscall
		
		li $v0,4         
		la $a0, newline
		syscall
		
		j loop
		
exit:
		li $v0,4         
		la $a0, msg3
		syscall

		li $v0,10
		syscall
