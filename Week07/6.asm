.data
read_row_matrix_prompt_p:   .asciiz "Enter an integer: "
enter_row: .asciiz "Enter rows: "
enter_col: .asciiz "Enter columns: "
matrix_prompt_msg: .asciiz "Matrix:\n"
space: .asciiz " "
newline: .asciiz "\n"
.text
.globl main
main:

	li $v0, 4
	la $a0, enter_row
	syscall

	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0, enter_col
	syscall

	li $v0, 5
	syscall
	move $t2, $v0
	
	mul $a0, $t1, $t2 # number of elements
	sll $a0, $a0, 2  # multiply number of elements by 2^2 = 4
			 # because each integer number takes 4 bytes
			 
	li  $v0, 9
	syscall
	move $t0,$v0   # save array address in $t0
	
	
read_row_matrix:
	li $t3, 0               # initialize outer-loop counter to 0

read_row_matrix_loop_outer:
	bge $t3, $t1, read_row_matrix_loop_outer_end

	li $t4, 0               # initialize inner-loop counter to 0

read_row_matrix_loop_inner:
	bge $t4, $t2, read_row_matrix_loop_inner_end

	mul $t5, $t3, $t2       # $t5 <-- width * i
	add $t5, $t5, $t4       # $t5 <-- width * i + j
	sll $t5, $t5, 2         # $t5 <-- 2^2 * (width * i + j)
	add $t5, $t0, $t5       # $t5 <-- base address + (2^2 * (width * i + j))

	li $v0, 4               # prompt for number
	la $a0, read_row_matrix_prompt_p
	syscall

	li $v0, 5               # read a integer number
	syscall

	sw $v0, 0($t5)          # store input number into array

    	addiu $t4, $t4, 1       # increment inner-loop counter

    	b read_row_matrix_loop_inner    # branch unconditionally back to beginning of the inner loop

read_row_matrix_loop_inner_end:
    	addiu $t3, $t3, 1       # increment outer-loop counter

    	b read_row_matrix_loop_outer    # branch unconditionally back to beginning of the outer loop

read_row_matrix_loop_outer_end:

	li $v0, 4              
	la $a0, matrix_prompt_msg
	syscall
	
print_row_matrix:
	li $t3, 0               # initialize outer-loop counter to 0

print_row_matrix_loop_outer:
	bge $t3, $t1, print_row_matrix_loop_outer_end

	li $t4, 0               # initialize inner-loop counter to 0

print_row_matrix_loop_inner:
	bge $t4, $t2, print_row_matrix_loop_inner_end

	mul $t5, $t3, $t2       # $t5 <-- width * i
	add $t5, $t5, $t4       # $t5 <-- width * i + j
	sll $t5, $t5, 2         # $t5 <-- 2^2 * (width * i + j)
	add $t5, $t0, $t5       # $t5 <-- base address + (2^2 * (width * i + j))

	lw $t6, 0($t5)
	
	li $v0, 1              
	la $a0, ($t6)
	syscall

	li $v0, 4             
	la $a0, space
	syscall
	
    	addiu $t4, $t4, 1       # increment inner-loop counter

    	b print_row_matrix_loop_inner    # branch unconditionally back to beginning of the inner loop

print_row_matrix_loop_inner_end:
	li $v0, 4
	la $a0, newline
	syscall
	
    	addiu $t3, $t3, 1       # increment outer-loop counter

    	b print_row_matrix_loop_outer    # branch unconditionally back to beginning of the outer loop

print_row_matrix_loop_outer_end:
exit: 
	li $v0, 10
	syscall
	