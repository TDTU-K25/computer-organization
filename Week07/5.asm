.data
arr: .word 0,1,2,3,4,5,6,7,8,9
size: .word 10
enter_a_mgs: .asciiz "Enter a: "
enter_b_mgs: .asciiz "Enter b: "
again_a_msg: .asciiz "The number you have entered isn't in an array, please try again"
again_b_msg: .asciiz "The number you have entered isn't in an array, please try again"
arr_before: .asciiz "Array before: "
arr_after: .asciiz "Array after swap: "
space: .asciiz " "
newline: .asciiz "\n"
.text
.globl main
main:

	la $t4, arr
	
	li $v0, 4
	la $a0, arr_before
	syscall
	
print_before_loop:
	lw $t6, 0($t4)
	addi $t4, $t4, 4
	addi $t1, $t1, 1 # i++
	li $v0, 1
	la $a0, ($t6)
	syscall
	li $v0, 4
	la $a0, space
	syscall
	blt $t1, 10, print_before_loop
	
	li $v0, 4
	la $a0, newline
	syscall

	li $t2, 0 # i = 0
	lw $t3, size # reg t3 cotain the number of elements of an array (N = 10)

enter_a:
	# Print enter_a_mgs
	li $v0, 4
	la $a0, enter_a_mgs
	syscall
	
	# User enter a 
	li $v0, 5
	syscall
	move $t0, $v0
	
	la $t4, arr # ??a ch? c?a m?ng ???c l?u vào thanh ghi t4
	
check_a:
	lw $t5, ($t4) # thanh ghi t5 l?u giá tr? c?a ph?n t? trong m?ng
	beq $t0, $t5, get_a_address
	addi $t2, $t2, 1 # i++
	addi $t4, $t4, 4 # t?ng ??a ch? lên 4 giá tr?
	beq $t2, $t3, again_a # i == 10 ngh?a là ?ã duy?t qua 10 ph?n t? nh?ng v?n không th?y a -> nh?p l?i
	j check_a 
	
again_a:
	li $v0, 4
	la $a0, again_a_msg
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	j enter_a
	
get_a_address:

	la $t6, 0($t4) # thanh ghi t6 l?u ??a ch? c?a thanh ghi t5


	li $t2, 0 # i = 0
	
enter_b:
	# Print enter_b_mgs
	li $v0, 4
	la $a0, enter_b_mgs
	syscall

	# User enter b
	li $v0, 5
	syscall
	move $t1, $v0
	
	la $t4, arr # ??a ch? c?a m?ng ???c l?u vào thanh ghi t4
	
check_b:
	lw $t5, ($t4) # thanh ghi t5 l?u giá tr? c?a ph?n t? trong m?ng
	beq $t1, $t5, get_b_address
	addi $t2, $t2, 1 # i++
	addi $t4, $t4, 4 # t?ng ??a ch? lên 4 giá tr?
	beq $t2, $t3, again_b # i == 10 ngh?a là ?ã duy?t qua 10 ph?n t? nh?ng v?n không th?y a -> nh?p l?i
	j check_b
	
again_b:
	li $v0, 4
	la $a0, again_b_msg
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	j enter_b
	
get_b_address:

	la $t7, 0($t4) # thanh ghi t6 l?u ??a ch? c?a thanh ghi t5
	
swap:
	sw $t0, ($t7)
	sw $t1, ($t6)
	
	la $t4, arr
	
	li $v0, 4
	la $a0, arr_after
	syscall
	
	li $t2, 0 # i = 0
	
print_after_loop:
	lw $t6, 0($t4)
	addi $t4, $t4, 4
	addi $t2, $t2, 1 # i++
	li $v0, 1
	la $a0, ($t6)
	syscall
	li $v0, 4
	la $a0, space
	syscall
	blt $t2, 10, print_after_loop
	
exit:
	li $v0, 10
	syscall
	
