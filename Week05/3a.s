 # Start .data segment (data!)
.data
msg1: .asciiz "Enter A: "
msg2: .asciiz "Enter B: "
msg3: .asciiz "A + B = "
msg4: .asciiz "A - B = "
msg5: .asciiz "A * B = "
newline: .asciiz "\n"


# Start .text segment (program code)
.text
.globl main
main:
    # Print string msg1
        li $v0,4         
        la $a0, msg1         
        syscall

    # Get input A from user and save
        li $v0,6        
        syscall
        mov.s $f1,$f0         

    # Print string msg2
        li $v0,4         
        la $a0, msg2         
        syscall

    # Get input B from user and save
        li $v0,6        
        syscall
        mov.s $f2,$f0         

    # Math!
        add.s $f3, $f1, $f2    # sum = A+B
        sub.s $f4, $f1, $f2    # sub = A-B
        mul.s $f5, $f1, $f2	   # mul = A*B	
        
    # Print string msg3
        li $v0, 4
        la $a0, msg3
        syscall

    # Print sum
        li $v0,2       
        mov.s $f12, $f3         
        syscall

    # Print \n
        li $v0,4         
        la $a0, newline
        syscall

    # Print string msg4
        li $v0, 4
        la $a0, msg4
        syscall

    # Print sub
        li $v0,2        
        mov.s $f12, $f4        
        syscall

    # Print \n
        li $v0,4         
        la $a0, newline
        syscall

    # Print string msg5
        li $v0, 4
        la $a0, msg5
        syscall

    # Print mul
        li $v0,2       
        mov.s $f12, $f5        
        syscall

    # Print \n
        li $v0,4         
        la $a0, newline
        syscall

        li $v0,10         # exit
        syscall