#$v1 value of min element in unsorted part
#--------------------------------------------------------------
.data
	A: .word -2,5,7,-23,45,-6,34,2
	Aend: .word 
.text
main: 	la $a0,A 		#$a0 = Address(A[0])
 	la $a1,Aend
 	addi $a1,$a1,-4 	#$a1 = Address(A[n-1])
 	j sort 		#sort
after_sort: 
	li $v0, 10 		#exit
	syscall
sort: 	beq $a0,$a1,done 	#single element list is sorted
 	j min 		#call the min procedure
after_min: 	lw $t0,0($a1) 	#load last element into $t0
 	sw $t0,0($v0) 	#copy last element to min location
 	sw $v1,0($a1) 	#copy min value to last element
 	addi $a1,$a1,-4 	#decrement pointer to last element
 	j sort 		#repeat sort for smaller list
done: 	j after_sort
#------------------------------------------------------------------------
#Procedure min
#function: fax the value and address of min element in the list
#$a0 pointer to first element
#$a1 pointer to last element
#------------------------------------------------------------------------
min:	addi $v0,$a0,0 	#init min pointer to first element
	lw $v1,0($v0) 	#init min value to first value
	addi $t0,$a0,0 	#init next pointer to first
loop:	beq $t0,$a1,ret 	#if next=last, return
	addi $t0,$t0,4 	#advance to next element
	lw $t1,0($t0) 	#load next element into $t1
	slt $t2,$v1,$t1 	#(next)>(min) ?
	bne $t2,$zero,loop 	#if (next)>(min), repeat
	addi $v0,$t0,0 	#next element is new min element
	addi $v1,$t1,0 	#next value is new min value
	j loop 		#change completed; now repeat
ret:	j after_min

