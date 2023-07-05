.eqv IN_ADDRESS_HEXA_KEYBOARD 0xFFFF0012
.eqv OUT_ADDRESS_HEXA_KEYBOARD 0xFFFF0014
.text
main: 
	li $t1, IN_ADDRESS_HEXA_KEYBOARD
	li $t2, OUT_ADDRESS_HEXA_KEYBOARD
	li $t3, 0x01 # check row 1 with key C, D,E, F
	li $t4, 0x02 # check row 2 with key C, D,E, F
	li $t5, 0x04 # check row 3 with key C, D,E, F
	li $t6, 0x08 # check row 4 with key C, D,E, F
	li $t0, 0
polling: 	
	beq	$t0, 4, exit	#exit after print 4 times
	sb 	$t3, 0($t1 ) 
	lb 	$a0, 0($t2) 
	bne	$a0, $zero, print

	sb 	$t4, 0($t1 ) 
	lb 	$a0, 0($t2) 
	bne	$a0, $zero, print

	sb 	$t5, 0($t1 ) 
	lb 	$a0, 0($t2) 
	bne	$a0, $zero, print

	sb 	$t6, 0($t1 ) 
	lb 	$a0, 0($t2) 
	bne	$a0, $zero, print
	j 	continue
print: 	li 	$v0, 34 		# print integer (hexa)
	syscall
	addi 	$v0,$zero,11
	li 	$a0,'\n' 

syscall
continue:
	addi 	$t0, $t0, 1
	
sleep: 	li $a0, 2500 	# sleep 2500ms
	li $v0, 32
	syscall
back_to_polling: 
	j polling 		# continue polling
exit:
