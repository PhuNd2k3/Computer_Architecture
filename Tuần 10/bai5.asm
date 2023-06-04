.eqv MONITOR_SCREEN 0x10010000  
.eqv RED            0x00FF0000 
.eqv GREEN          0x0000FF00 
.data
	x1: .asciiz "Nhap x1: "
	y1: .asciiz "Nhap y1: "
	x2: .asciiz "Nhap x2: "
	y2: .asciiz "Nhap y2: "
	error1: .asciiz "x2 phai khac x1\n"
	error2: .asciiz "y2 phai khac y1\n"
.text 
   	li	$k0, MONITOR_SCREEN

   	li	$v0, 4
   	la	$a0, x1
   	syscall	
   	li	$v0, 5
   	syscall
   	move	$s0, $v0
   	
   	li	$v0, 4
   	la	$a0, y1
   	syscall	
   	li	$v0, 5
   	syscall
   	move	$s1, $v0
   	
NhapX2: 
	li	$v0, 4
   	la	$a0, x2
   	syscall	
   	li	$v0, 5
   	syscall
   	move	$s2, $v0
   	beq	$s2, $s0, Error1
   	
NhapY2: 
	li	$v0, 4
   	la	$a0, y2
   	syscall	
   	li	$v0, 5
   	syscall
   	move	$s3, $v0
   	beq	$s3, $s1, Error2
   	j	continue
   	
Error1: 
	li	$v0, 4
	la	$a0, error1
	syscall
	j 	NhapX2
Error2:	
	li	$v0, 4
	la	$a0, error2
	syscall
	j 	NhapY2
continue:	
	slt	$t0, $s0, $s2
	slt	$t1, $s1, $s3
	
	beq	$t0, 0, Case3
	beq	$t1, 0, Case2
Case1:	add	$v0, $s1, $zero 
loop_1: 	
	bgt	$v0, $s3, Exit
	add	$v1, $s0, $zero
loop_2: 	
	bgt	$v1, $s2, endloop_2
	beq	$v0, $s1, InVien1
	beq	$v0, $s3, InVien1
	beq	$v1, $s0, InVien1
	beq	$v1, $s2, InVien1
	sll	$t8, $v0, 6		
	add	$t8, $t8, $v1
	sll	$t8, $t8, 2
 	li	$a1, GREEN
 	add	$a2, $k0, $t8
 	sw	$a1, 0($a2)
 	add	$v1, $v1, 1
 	j	loop_2
InVien1:	
	sll	$t8, $v0, 6		
	add	$t8, $t8, $v1
	sll	$t8, $t8, 2
 	li	$a1, RED
 	add	$a2, $k0, $t8
 	sw	$a1, 0($a2)
 	add	$v1, $v1, 1
 	j	loop_2
endloop_2:
	add	$v0, $v0, 1
	j	loop_1

Case2:	
	add	$v0, $s3, $zero 
loop_3: 	
	bgt	$v0, $s1, Exit
	add	$v1, $s0, $zero
loop_4: 	
	bgt	$v1, $s2, endloop_4
	beq	$v0, $s1, InVien2
	beq	$v0, $s3, InVien2
	beq	$v1, $s0, InVien2
	beq	$v1, $s2, InVien2
	sll	$t8, $v0, 6		
	add	$t8, $t8, $v1
	sll	$t8, $t8, 2
 	li	$a1, GREEN
 	add	$a2, $k0, $t8
 	sw	$a1, 0($a2)
 	add	$v1, $v1, 1
 	j	loop_4
InVien2:
	sll	$t8, $v0, 6		
	add	$t8, $t8, $v1
	sll	$t8, $t8, 2
 	li	$a1, RED
 	add	$a2, $k0, $t8
 	sw	$a1, 0($a2)
 	add	$v1, $v1, 1
 	j	loop_4
endloop_4:
	add	$v0, $v0, 1
	j	loop_3
Case3:	
	beq	$t1, 0, Case4
	add	$v0, $s1, $zero 
loop_5: 	
	bgt	$v0, $s3, Exit
	add	$v1, $s2, $zero
loop_6: 	
	bgt	$v1, $s0, endloop_6
	beq	$v0, $s1, InVien3
	beq	$v0, $s3, InVien3
	beq	$v1, $s0, InVien3
	beq	$v1, $s2, InVien3
	sll	$t8, $v0, 6		
	add	$t8, $t8, $v1
	sll	$t8, $t8, 2
 	li	$a1, GREEN
 	add	$a2, $k0, $t8
 	sw	$a1, 0($a2)
 	add	$v1, $v1, 1
 	j	loop_6
InVien3:
	sll	$t8, $v0, 6		
	add	$t8, $t8, $v1
	sll	$t8, $t8, 2
 	li	$a1, RED
 	add	$a2, $k0, $t8
 	sw	$a1, 0($a2)
 	add	$v1, $v1, 1
 	j	loop_6
endloop_6:
	add	$v0, $v0, 1
	j	loop_5
Case4:	add	$v0, $s3, $zero 
loop_7: 	
	bgt	$v0, $s1, Exit
	add	$v1, $s2, $zero
loop_8: 	
	bgt	$v1, $s0, endloop_8
	beq	$v0, $s1, InVien4
	beq	$v0, $s3, InVien4
	beq	$v1, $s0, InVien4
	beq	$v1, $s2, InVien4
	sll	$t8, $v0, 6		
	add	$t8, $t8, $v1
	sll	$t8, $t8, 2
 	li	$a1, GREEN
 	add	$a2, $k0, $t8
 	sw	$a1, 0($a2)
 	add	$v1, $v1, 1
 	j	loop_8
InVien4:	
	sll	$t8, $v0, 6		
	add	$t8, $t8, $v1
	sll	$t8, $t8, 2
 	li	$a1, RED
 	add	$a2, $k0, $t8
 	sw	$a1, 0($a2)
 	add	$v1, $v1, 1
 	j	loop_8
endloop_8:
	add	$v0, $v0, 1
	j	loop_7
	
Exit:	li	$v0, 10
	syscall
