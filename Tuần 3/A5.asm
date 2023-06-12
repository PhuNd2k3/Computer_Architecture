.data
	A: .word 1,1,-2,0,5

.text
	addi $s1, $zero, 0 	# i = 0
	addi $s3, $zero, 5	# n = 5	
	addi $s4, $zero, 1	# step = 1
	addi $s5, $zero, 0 	# sum = 0
	la $s2, A		# load address A[0] to $s2

loop: 
	slt $t2, $s1, $s3 # $t2 = i < n ? 1 : 0
	beq $t2, $zero, endloop
	add $t1, $s1, $s1 # $t1 = 2 * $s1
	add $t1, $t1, $t1 # $t1 = 4 * $s1
	add $t1, $t1, $s2 
	lw $t0, 0($t1) 
	beq $t0,$zero, endloop #if A[i]=0 => end
	add $s5, $s5, $t0 # sum = sum + A[i]
	add $s1, $s1, $s4 # i = i + step
	j loop # goto loop
endloop:














