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
        li $v0,7        
        syscall
        mov.d $f2,$f0         

    # Print string msg2
        li $v0,4         
        la $a0, msg2         
        syscall

    # Get input B from user and save
        li $v0,7        
        syscall
        mov.d $f4,$f0         

    # Math!
        add.d $f6, $f2, $f4    # sum = A+B
        sub.d $f8, $f2, $f4     # sub = A-B
        mul.d $f10, $f2, $f4
        
    # Print string msg3
        li $v0, 4
        la $a0, msg3
        syscall

    # Print sum
        li $v0,3        
        mov.d $f12, $f6         
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
        li $v0,3        
        mov.d $f12, $f8        
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
        li $v0,3        
        mov.d $f12, $f10       
        syscall

    # Print \n
        li $v0,4         
        la $a0, newline
        syscall

        li $v0,10         # exit
        syscall