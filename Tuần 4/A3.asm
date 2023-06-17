.text
	li $s0, 0
	li $s1, -6
	li $s2, 9
	# abs	$s0, $s1:
	sra $t0, $s1, 31
	xor $s0, $t0, $s1
	subu $s0, $s0, $t0
	
	# move	$s0, $s1:
	andi $s0, $s1, 0xffffffff
	
	# not	$s0, $s1:
	nor $s0, $s1, $zero
	
	# ble	$s1, $s2, label:
	slt $t0, $s2, $s1
	beq $t0, $zero, label
	j EXIT
label: li $t0,	3
EXIT: