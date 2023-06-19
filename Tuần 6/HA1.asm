.data
	A: .word 
	message1: .asciiz "Nhap so phan tu: "
	message2: .asciiz "Nhap lan luot cac phan tu:\n"
.text
main: 	
	li $v0, 4
	la $a0, message1
	syscall
	li $v0, 5
	syscall
	
	add $a1,$zero,$v0 	# $a1 chua so phan tu 
	
	li $v0, 4
	la $a0, message2
	syscall
	la $a0,A
	addi $t0,$zero,0
input:	
	beq $t0,$a1,end_input
	add $t2,$t0,$t0 
	add $t2,$t2,$t2 
	add $t3,$t2,$a0	# address of A[i] in $t3
	li $v0, 5
	syscall
	sw $v0,0($t3)
	addi $t0,$t0,1
	j input
end_input:	
	j mspfx
	nop
continue:
lock: 	j lock
	nop
end_of_main:

mspfx: 	addi $v0,$zero,0 #initialize length in $v0 to 0
	addi $v1,$zero,0 #initialize max sum in $v1to 0
	addi $t0,$zero,0 #initialize index i in $t0 to 0
	addi $t1,$zero,0 #initialize running sum in $t1 to 0
loop: 	add $t2,$t0,$t0 #put 2i in $t2
	add $t2,$t2,$t2 #put 4i in $t2
	add $t3,$t2,$a0 #put 4i+A (address of A[i]) in $t3
	lw $t4,0($t3) #load A[i] from mem(t3) into $t4
	add $t1,$t1,$t4 #add A[i] to running sum in $t1
	slt $t5,$v1,$t1 #set $t5 to 1 if max sum < new sum
	bne $t5,$zero,mdfy #if max sum is less, modify results
	j test #done?
mdfy: 	addi $v0,$t0,1 #new max-sum prefix has length i+1
	addi $v1,$t1,0 #new max sum is the running sum
test: 	addi $t0,$t0,1 #advance the index i
	slt $t5,$t0,$a1 #set $t5 to 1 if i<n
	bne $t5,$zero,loop #repeat if i<n
done: 	j continue
mspfx_end:
