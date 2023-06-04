.eqv SEVENSEG_LEFT    0xFFFF0011	
.eqv SEVENSEG_RIGHT   0xFFFF0010	
.data
	message: .asciiz "Nhap vao mot so nguyen: "
	arr: .word 0x3F,0x6,0x5B,0x4F,0x66,0x6D,0x7D,0x7,0x7F,0x6F 
#Ma de hien thi tu 0->9
.text
main:	
	li	$v0, 4
	la	$a0, message
	syscall
	li 	$v0, 5
	syscall
	move 	$s0, $v0		#s0 = So nhap vao
	
	li	$t2, 10
	div	$s0, $s0, $t2
	mfhi	$t1			# lay phan du khi chia 10
	sll	$t1,$t1,2
	la 	$a1, arr
	add	$a1,$a1,$t1
	lw	$a0,0($a1)	#lay ra ma hien thi
	jal	SHOW_7SEG_RIGHT

#lam lai tuong thi hien thi so con lai
	la	$a1, arr
	div	$s0, $s0, $t2
	mfhi	$t1
	sll	$t1,$t1,2
	la 	$a1, arr
	add	$a1,$a1,$t1
	lw	$a0,0($a1)
	jal	SHOW_7SEG_LEFT

	li 	$v0, 10		#Exit
	syscall
#--------------------------
# Function  SHOW_7SEG_LEFT : turn on/off the 7seg
# param[in]  $a0   value to shown       
# remark     $t0 changed
#--------------------------
SHOW_7SEG_LEFT:	
	li   $t0, SEVENSEG_LEFT 	
	sb   $a0, 0($t0)		
	jr   $ra
#---------------------------
# Function  SHOW_7SEG_RIGHT : turn on/off the 7seg
# param[in]  $a0   value to shown       
# remark     $t0 changed
#--------------------------
SHOW_7SEG_RIGHT: 
	li   $t0,  SEVENSEG_RIGHT	
	sb   $a0,  0($t0)		
	jr   $ra
