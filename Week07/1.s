.data
list: .asciiz "Hello TDT"
size: .word 9
newline: .asciiz "\n"

.text
.globl main
main:

    lw $t0, size # N = 9
    la $t1, list # truyền địa chỉ của list vào thanh ghi t1
    li $t2, 0 # i = 0

print_loop:
	
    beq $t2, $t0, exit
    lb $a0, ($t1) # in kí tự (lb: load byte)
    li $v0, 11
    syscall

    #Newline
    li $v0, 4
    la $a0, newline
    syscall

    #i++
    addi $t2, $t2, 1
    addi $t1, $t1, 1
    j print_loop

	#Exit
exit:
    li $v0,10
    syscall