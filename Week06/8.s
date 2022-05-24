 # Start .data segment (data!)
.data
msg1: .asciiz "Nhap so nguyen duong a: "
msg2: .asciiz "Nhap so nguyen duong b: "
msg3: .asciiz "Nhap sai, nhap lai!"
msg4: .asciiz "Sum = " 
newline: .asciiz "\n"
# Start .text segment (program code)
.text
.globl main
main:
    
loop1:
		li $v0,4         
        la $a0, msg1   
        syscall

		li $v0,5       
        syscall     
		move $t0,$v0
		
		blt $t0, 0, again1
		blt $t0, $t1, sum_loop
		
loop2:
		blt $t0, $t1, sum_loop
		li $v0,4         
        la $a0, msg2 
        syscall

		li $v0,5       
        syscall     
		move $t1,$v0
		
		blt $t1, 0, again2

	bgt $t1, 0, check
	
again1: 
		li $v0,4         
        la $a0, msg3   
        syscall
		
		li $v0,4         
        la $a0, newline   
        syscall
		
		j loop1
		
again2:
		li $v0,4         
		la $a0, msg3   
        syscall
		
		li $v0,4         
        la $a0, newline   
        syscall
		
		j loop2
				
		li $t2, 0 #Sum = 0
		
check:
		bgt $t0, $t1, again1
		
sum_loop: 
		add $t2, $t2, $t0 # sum += i
		addi $t0, $t0, 1 # i++
		bgt $t0, $t1, exit
		j sum_loop
		
exit:
		li $v0,4         
        la $a0, msg4
        syscall
		
		#Print Sum
		li $v0,1
		move $a0, $t2
		syscall
		
		li $v0,10
		syscall
