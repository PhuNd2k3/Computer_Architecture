.data
	A: .word 6,9,-3,27,20,-5,-12,8
	Aend: .word
	message1: .asciiz " "
	message2: .asciiz "\n"
.text
	la $a0, A
	la $a1, Aend
	la $t7, Aend 	#Use to Print Array
	li $s0, 0		# count = 0 (dem phan tu)
	li $s1, 0		# key = 0
	li $s2, 0		# j = 0	
	li $s3, 1		# i = 1
DemPhanTu:	
	beq  $a1, $a0, Loop	
	addi $a1, $a1, -4	
	addi $s0, $s0, 1		
	j DemPhanTu
Loop:	
	beq $s3, $s0, Exit	
	sll $t0, $s3, 2		
	add $s4, $a0, $t0	
	lw $s1, 0($s4)		
	addi $s2, $s3, -1	
While: 	
	slt $t1, $s2, $zero	
	sll $t0, $s2, 2		
	add $s5, $a0, $t0	
	lw $t3, 0($s5)		
	sle $t4, $t3, $s1	
	add $t1, $t1, $t4	
	bne $t1, $zero,  loop_continue 
	addi $s5, $s5, 4		
	sw $t3, 0($s5)		
	addi $s2, $s2, -1	
	j While			
loop_continue:
	addi $s5, $s5, 4		
	sw $s1, 0($s5)		
	addi $s3, $s3, 1	
print_arr:
	la $t6,A
	j show_arr
end_print: 		
	j Loop
show_arr:	
	li $v0,1
	lw $a0,0($t6)
	syscall
	li $v0, 4
	la $a0, message1
	syscall 
	addi $t6,$t6,4
	bne $t6,$t7,show_arr
	li $v0, 4
	la $a0, message2
	syscall 
	la $a0,A
	j end_print	
Exit: 	
	li $v0, 10
	syscall
