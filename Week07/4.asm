# S?p x?p m?ng gi?m d?n
.data
arr: .word 13,5,4,6,9,7,16,63,1,100
descend_sort_msg: .asciiz "Array after sort: "
space: .asciiz " "
.text
.globl main
main:
    la  $t0, arr            # l?u d?a ch? c?a m?ng vào thanh ghi t0
    add $t0, $t0, 36        # 4 bytes m?i s? nguyên * 9 s? nguyên = 36 bytes                              
outterLoop:                 # Vòng l?p ngoài l?p qua các ph?n t? trong m?ng
    li $t1, 0
    la  $a0, arr            # l?u d?a ch? c?a m?ng vào thanh ghi a0
innerLoop:                  # Vòng l?p trong s? l?p qua các ph?n t? ?? ki?m tra
    lw  $t2, 0($a0)         # thanh ghi t2 l?u giá tr? c?a ph?n t? hi?n t?i
    lw  $t3, 4($a0)         # thanh ghi t3 l?u giá tr? c?a ph?n t? k? ti?p
    slt $t5, $t2, $t3       # thanh ghi t5 = 1 n?u giá tr? thanh ghi $t0 < $t1
    beq $t5, $0, continue   # n?u thanh ghi t5 = 1, hoán ??i v? trí 2 ph?n t?
    add $t1, $0, 1          
    sw  $t2, 4($a0)         # giá tr? thanh ghi $t2 s? l?u vào ??a ch? c?a thanh ghu $t3
    sw  $t3, 0($a0)         # giá tr? thanh ghi $t3 s? l?u vào ??a ch? c?a thanh ghu $t2
continue:
    addi $a0, $a0, 4            
    bne  $a0, $t0, innerLoop   
    bne  $t1, $0, outterLoop   
    
    li $t1, 0 # i = 0
    la $t7, arr
    
    li $v0, 4
    la $a0, descend_sort_msg
    syscall
    
printloop:
    lw $t6, 0($t7)
    addi $t7, $t7, 4
    addi $t1, $t1, 1 # i++
    li $v0, 1
    la $a0, ($t6)
    syscall
    li $v0, 4
    la $a0, space
    syscall
    blt $t1, 10, printloop
    
exit: 
    li $v0, 10
    syscall
