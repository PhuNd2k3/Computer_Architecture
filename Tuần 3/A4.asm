.data 
	x: .word 2
	y: .word 7
	z: .word 3
.text 
	addi $s1, $zero, 7	# Khoi tao i = 7
	addi $s2, $zero, 4	# Khoi tao j = 4	
	la $a0, x		# Lay dia chi cua x
	lw $t1, 0($a0)		# Load gia tri cua x vao thanh ghi $t1
	la $a0, y		# Lay dia chi cua y
	lw $t2, 0($a0)		# Load gia tri cua y vao thanh ghi $t2
	la $a0, z		# Lay dia chi cua z
	lw $t3, 0($a0)		# Load gia tri cua z vao thanh ghi $t3
	addi $s5,$zero,1	#m=1
	addi $s6,$zero,2	#n=2
start:
	add $t4, $s1,$s2	# $t4=i+j
	add $t5, $s5,$s6	# $t5=m+n
	slt $t0,$t5,$t4 	# $t5 < $t4
	beq $t0,$zero,else 	# branch to else if m+n >= i+j
	addi $t1,$t1,1 # then part: x=x+1
	addi $t3,$zero,1 # z=1
	j endif # skip “else” part
else: 
	addi $t2,$t2,-1 # begin else part: y=y-1
	add $t3,$t3,$t3 # z=2*z
endif:
