.data 
arr: .word 1, 4 ,3 ,8 ,7 ,6 ,9, 2, 5, 0
size: .word 10
max_msg: .asciiz "Max = "
min_msg: .asciiz "Min = "
newline: .asciiz "\n"
.text 
.globl main
main:
	lw $t0, size # thanh ghi t0 ch?a s? ph?n t? c?a m?ng 
	la $t1, arr # thanh ghi t1 l?u ??a ch? c?a label arr
	lw $t2, ($t1) # L?u giá tr? c?a ph?n t? ??u tiên trong m?ng vào thanh ghi t1
	lw $t3, ($t1) # Max = giá tr? c?a ph?n t? ??u tiên trong m?ng
	lw $t4, ($t1) # Min = giá tr? c?a ph?n t? ??u tiên trong m?ng
	li $t5, 0 # i = 0
	
max_loop:
	beq $t0, $t5, reset_reg # N == i 
	bgt $t2, $t3, max # if arr[i] > max -> max = arr[i]
	addi $t5, $t5, 1 # i++
	addi $t1, $t1, 4 # t?ng ??a ch? lên 4 giá tr?
	lw $t2, ($t1) # l?u giá tr? t?i ??a ch? thanh ghi t1 vào thanh ghi t2
	j max_loop
max:
	move $t3, $t2
	j max_loop
	
reset_reg:
	la $t1, arr
	lw $t2, ($t1)
	li $t5, 0
	
min_loop: 
	beq $t0, $t5, exit # N == i 
	blt $t2, $t4, min # if arr[i] < min -> min = arr[i]
	addi $t5, $t5, 1 # i++
	addi $t1, $t1, 4 # t?ng ??a ch? lên 4 giá tr?
	lw $t2, ($t1) # l?u giá tr? t?i ??a ch? thanh ghi t1 vào thanh ghi t2
	j min_loop

min:
	move $t4, $t2
	j min_loop
	
exit:
	li $v0, 4
	la $a0, max_msg
	syscall
	
	li $v0, 1
	la $a0, ($t3)
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, min_msg
	syscall
	
	li $v0, 1
	la $a0, ($t4)
	syscall

	li $v0, 10
	syscall
