.data
	largest: .asciiz "Largest: "
	smallest: .asciiz "\nSmallest: "
	comma: .asciiz ", "
.text
main:	
li $s0, 3
	li $s1, 5
	li $s2,	-45
	li $s3, 6
	li $s4, 27
	li $s5, -1
	li $s6, 666
	li $s7, -9
	
	jal saveNumbers
	nop
	li $v0, 4			# Print message Largest
	la $a0, largest
	syscall
	add $a0, $t0, $zero	# Print Max
	li $v0, 1		
	syscall		
	li $v0, 4			# Print message Comma
	la $a0, comma
	syscall
	add $a0, $t5, $zero
	li $v0, 1			# Print the register number of Max
	syscall
	li $v0, 4			# Print message Smallest
	la $a0, smallest
	syscall
	add $a0, $t1, $zero	# Print Min
	li $v0, 1		
	syscall	
	li $v0, 4			# Print message Comma
	la $a0, comma
	syscall
	add $a0, $t6, $zero
	li $v0, 1			# Print the register number of Min
	syscall
endmain:
	li $v0, 10			# Exit
	syscall
#---------------------------------------------------------------------- 
# Return $t0 = Max 
# Return $t1 = Min
# Index of Max = $t5
# Index of Min = $t6 
#return $v0 the largest value 
#---------------------------------------------------------------------- 
swapMax:
add $t0,$t3,$zero
	add $t5,$t2,$zero	
	jr $ra
swapMin:
add $t1,$t3,$zero
	add $t6,$t2,$zero
	jr $ra
saveNumbers:
	add $t9,$sp,$zero		# Save address of origin $sp
	addi $sp,$sp, -32
	sw $s1, 0($sp)
	sw $s2, 4($sp)
	sw $s3, 8($sp)
	sw $s4, 12($sp)
	sw $s5, 16($sp)
	sw $s6, 20($sp)
	sw $s7, 24($sp)
	sw $ra, 28($sp)		# Save $ra for main
	add $t0,$s0,$zero		# Max = $s0
	add $t1,$s0,$zero		# Min = $s0
	li $t5, 0			# Index of Max to 0
	li $t6, 0			# Index of Min to 0
	li $t2, 0			# i = 0
findMaxMin:
	addi $sp,$sp,4
	lw $t3,-4($sp)
	sub $t4, $sp, $t9
	beq $t4,$zero, done	# If $sp = $fp branch to the 'done'
	nop
	addi $t2,$t2,1		# i++
	sub $t4,$t0,$t3
	bltzal $t4, swapMax	# If $t3 > Max branch to the swapMax
	nop
	sub $t4,$t3,$t1
	bltzal $t4, swapMin	# If $t3 < Min branch to the swapMin
	nop
	j findMaxMin			# Repeat
done: 	
lw $ra, -4($sp)
	jr $ra 				# Return to calling program
