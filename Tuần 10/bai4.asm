.eqv MONITOR_SCREEN 0x10010000 
.eqv RED 0x00FF0000 
.eqv GREEN 0x0000FF00
.eqv BLUE 0x000000FF
.eqv WHITE 0x00FFFFFF
.eqv YELLOW 0x00FFFF00
.text
	li 	$k0, MONITOR_SCREEN 	#Nap dia chi bat dau cua man hinh
	li	$t2, 2			# khoi tao 2
	li	$t4, 8			# khoi tao 8
	li	$t1, -1			# i = -1
	li	$t4, 0			# j = 0
	li 	$s1, 4			# $s1 = 4
	add	$k0, $k0, -4		# $k0 = $k0 - 4
FOR:	addi	$t1, $t1, 1		# i = 0, i ++
	addi	$t4, $t4, 1		# j++
	beq	$t1, 72, EXIT		# i = 72 stop
 	add	$k0, $k0, $s1		# $k0 += 4
 	div	$t1, $t2		# i / 2
 	mfhi	$t3			# $t3 = i % 2

 	bne	$t4, 8, continue	# j = 8 => i++
 	li 	$t4, 0			# j = 0
 	addi	$t1, $t1, 1		# i++
continue:	
 	beq	$t3, $zero, doi_mau
 	li 	$t0, WHITE
 	sw 	$t0, 0($k0)
 	nop
 	j	FOR

doi_mau:
	li 	$t0, BLUE
	sw 	$t0, 0($k0) 
	nop
	j FOR

EXIT:	li 	$v0, 10
	syscall 
