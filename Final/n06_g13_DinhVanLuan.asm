.data
    #Bien con tro
	CharPtr: 	.word 0	# Bien con tro, tro toi kieu asciiz
	BytePtr: 	.word 0	# Bien con tro, tro toi kieu Byte
	WordPtr: 	.word 0	# Bien con tro, tro toi mang kieu Word
	ArrayPtr: 	.word 0	# Bien con tro, tro toi mang hai chieu
	CharPtr1: 	.word 0	# Bien con tro copy xau
	CharPtr2: 	.word 0	# Bien con tro copy xau
	WordPtr_Max: 	.word 0 # Bien con tro dung trong chuc nang tim max
	
	# Luu string can copy
	input_string: .space 500 #chuc nang 6

	Padding:	.asciiz "No meaning\n"
    #Bien thuc hien goi menu
    Menu: 	.asciiz "-------------- Program -------------\n"
	Opt1: 	.asciiz "1. Malloc CharPtr\n"
	Opt2: 	.asciiz "2. Malloc BytePtr\n"
	Opt3: 	.asciiz "3. Malloc WordPtr\n"
	Opt4: 	.asciiz "4. Tra ve gia tri cua cac bien con tro\n"
	Opt5: 	.asciiz "5. Tra ve dia chi cua cac bien con tro\n"
	Opt6: 	.asciiz "6. Copy 2 con tro xau ki tu\n"
	Opt7: 	.asciiz "7. Giai phong bo nho\n"
	Opt8: 	.asciiz "8. Tinh toan luong bo nho da phat\n"
	Opt9: 	.asciiz "9. Malloc cap phat hai chieu\n"
	Opt10: 	.asciiz "10. SetArray[i][j]\n"
	Opt11: 	.asciiz "11. GetArray[i][j]\n"
	Opt12: 	.asciiz "12. Nhap mot mang so nguyen va tim Max\n"

    exit:	.asciiz "0. Exit\n"
    Err:	.asciiz "Khong co lua chon nay, hay thu nhap lai\nHoac lua chon 0 de thoat chuong trinh\n"
    Nhap:	.asciiz "Hay chon mot chuc nang: "
    Ending: .asciiz "Hoan thanh chuong trinh!!!"

	#Cac bien khac
	Nhap_char: 	.asciiz "Nhap so ky tu: "
	Nhap_byte: 	.asciiz "Nhap so byte can su dung: "
	Nhap_word: 	.asciiz "Nhap so word can su dung: "
	Nhap_int: 	.asciiz "Nhap phan tu so  "
	Spacing: 	.asciiz ":	"
	Err_val:		.asciiz "Gia tri nhap vao phai duong\n"
	chua_cap: 	.asciiz "Mang hai chieu chua duoc cap phat\n"
	Err_negative:	.asciiz "Gia tri nhap vao khong duoc am\n"
	Err_size:	.asciiz "Vuot ngoai kich thuoc ma tran\n"

	addr_noti:	.asciiz "Dia chi cua cac bien con tro\n"
	value_noti:	.asciiz "Gia tri cua cac bien con tro\n"
	Char_addr: 	.asciiz "Char Pointer Address:	"
	Byte_addr: 	.asciiz "Byte Pointer Address:	"
	Word_addr: 	.asciiz "Word Pointer Address:	"
	Arr_addr: 	.asciiz "Arr Pointer Address:	"
	Char_value: .asciiz "Char Pointer Value:	"
	Byte_value: .asciiz "Byte Pointer Value:	"
	Word_value: .asciiz "Word Pointer Value:	"
	Arr_value: 	.asciiz "Arr Pointer Value:	"
	String_noti: .asciiz "Nhap xau ky tu can copy: "
	copy_success: .asciiz "Copy thanh cong, xau da copy la: "
	Memory: 	.asciiz "Luong bo nho da cap phat la: "
	Byte:		.asciiz " Byte\n"
	Max_noti: 	.asciiz "Gia tri lon nhat cua mang la: "
	Newline: 	.asciiz "\n"
	Row_noti: 	.asciiz "Nhap so hang:	"
	Col_noti:	.asciiz "Nhap so cot:	"
	i_noti:		.asciiz "Nhap i cho A[i][j]: "
	j_noti:		.asciiz "Nhap j cho A[i][j]: "
	success_noti:	.asciiz "Thuc hien chuc nang thanh cong!\n"
	Aij_noti: 	.asciiz "Nhap gia tri cho A[i][j]: "
	Output_val: .asciiz "Gia tri lay duoc la: "
.kdata
	# Bien chua dia chi dau tien cua vung nho con trong
	Sys_TheTopOfFree: .word 1
	# Vung khong gian tu do, dung de cap bo nho cho cac bien con tro
	Sys_MyFreeSpace:

.text
	# Khoi tao vung nho cap phat dong
	jal SysInitMem

main:
	# Ouput Menu option
	nop
	la $a0, Menu
	li $v0, 4
	syscall
    
	la $a0, Opt1
	li $v0, 4
	syscall
	la $a0, Opt2
	li $v0, 4
	syscall
	la $a0, Opt3
	li $v0, 4
	syscall
	la $a0, Opt4
	li $v0, 4
	syscall
	la $a0, Opt5
	li $v0, 4
	syscall
	la $a0, Opt6
	li $v0, 4
	syscall
	la $a0, Opt7
	li $v0, 4
	syscall
	la $a0, Opt8
	li $v0, 4
	syscall
	la $a0, Opt9
	li $v0, 4
	syscall
	la $a0, Opt10
	li $v0, 4
	syscall
	la $a0, Opt11
	li $v0, 4
	syscall
	la $a0, Opt12
	li $v0, 4
	syscall

	la $a0, exit	
	li $v0, 4
	syscall

    	# Nhap lua chon
	la $a0, Nhap	
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall

	# Jump to choosen option
	addi $v1, $0, 1
	beq $v0, $v1, Case1

	addi $v1, $0, 2
	beq $v0, $v1, Case2

	addi $v1, $0, 3
	beq $v0, $v1, Case3

	addi $v1, $0, 4
	beq $v0, $v1, Case4

	addi $v1, $0, 5
	beq $v0, $v1, Case5

	addi $v1, $0, 6
	beq $v0, $v1, Case6
    

	addi $v1, $0, 7
	beq $v0, $v1, Case7
    

	addi $v1, $0, 8
	beq $v0, $v1, Case8
    

	addi $v1, $0, 9
	beq $v0, $v1, Case9
    

	addi $v1, $0, 10
	beq $v0, $v1, Case10
    

	addi $v1, $0, 11
	beq $v0, $v1, Case11

	addi $v1, $0, 12
	beq $v0, $v1, Case12

	addi $v1, $0, 0
	beq $v0, $v1, Exit
    
    	# Default -> raise an Error
	j Error

Case1:
	la $a0, Nhap_char	
	jal Input_int
	jal Check_int

	bne $v1, $zero, Case1

	add $s0, $zero, $a0 # $s0 number of characters and not changed in program
	la $a0, CharPtr
	add $a1, $zero, $s0
	addi $a2, $zero, 1
	jal malloc

	li $v0, 4
	la $a0, success_noti
    syscall
	j main

Case2:
	la $a0, Nhap_byte	
	jal Input_int
	jal Check_int

	bne $v1, $zero, Case2

	add $s1, $zero, $a0	# $s1 number of Byte and not changed in program
	la $a0, BytePtr
	add $a1, $zero, $s1
	addi $a2, $zero, 1
	jal malloc

	li $v0, 4
	la $a0, success_noti
    syscall
	j main

Case3:
	la $a0, Nhap_word	
	jal Input_int
	jal Check_int

	bne $v1, $zero, Case3
	add $s2, $zero, $a0	# $s2 number of Word and not changed in program
	la $a0, WordPtr
	add $a1, $zero, $s2
	addi $a2, $zero, 4
	jal malloc

	li $v0, 4
	la $a0, success_noti
    syscall
	j main

Case4:	# In ra gia tri bien con tro
	la	$a0, value_noti
	li	$v0, 4		
	syscall

	la $a0, Char_value
	li $v0, 4
	syscall

	li	$a0, 0			
	jal	Ptr_value	# Lay gia tri cua CharPtr
	jal Print_hexa

	la $a0, Byte_value
	li $v0, 4
	syscall
	
	li 	$a0, 1
	jal Ptr_value	# Lay gia tri cua BytePtr
	jal Print_hexa
   		

	la $a0, Word_value
	li $v0, 4
	syscall
	
	li 	$a0, 2
	jal Ptr_value	# Lay gia tri cua WordPtr
	jal Print_hexa
			

	la $a0, Arr_value
	li $v0, 4
	syscall
	
	li 	$a0, 3
	jal Ptr_value	# Lay gia tri cua ArrayPtr
	jal Print_hexa
	
	j main

Case5:
	la	$a0, addr_noti
	li	$v0, 4		
	syscall

	la $a0, Char_addr
	li $v0, 4
	syscall

	li	$a0, 0			
	jal	Ptr_addr	# Lay gia tri cua CharPtr
	jal Print_hexa

	la $a0, Byte_addr
	li $v0, 4
	syscall
	
	li 	$a0, 1
	jal Ptr_addr	# Lay gia tri cua BytePtr
	jal Print_hexa
   		

	la $a0, Word_addr
	li $v0, 4
	syscall
	
	li 	$a0, 2
	jal Ptr_addr	# Lay gia tri cua WordPtr
	jal Print_hexa
			

	la $a0, Arr_addr
	li $v0, 4
	syscall
	
	li 	$a0, 3
	jal Ptr_addr	# Lay gia tri cua ArrayPtr
	jal Print_hexa
	
	j main

Case6:
	la $a0, CharPtr1
	addi $a1, $zero, 500
	addi $a2, $zero, 1
	jal malloc

	la $a0, String_noti
	li $v0, 4        
	syscall

	la $a0, CharPtr2
	addi $a1, $zero, 500
	addi $a2, $zero, 1
	jal malloc

    li $v0, 8                	
    la $a0, CharPtr1    
	lw $a0, 0($a0)    
    li $a1, 500            	
    syscall

	la $a0, CharPtr1 
	lw $a0, 0($a0)
	la $a1, CharPtr2
	lw $a1, 0($a1)
	jal Copy

	li $v0, 4
	la $a0, copy_success
    syscall

	li $v0, 4
	la $a0, CharPtr2
	lw $a0, 0($a0)
	syscall
    j main

Case7:
	la $t9, Sys_TheTopOfFree
	lw $t9, 0($t9)
	la $t7, Sys_MyFreeSpace
	loop1:	# vong lap set tat ca gia tri trong vung cap phat dong ve 0
		addi $t9, $t9, -1
		sb $zero, 0($t9)
		bne $t9, $t7, loop1 
	
	# Lam moi gia tri cac bien con tro
	la $a0, CharPtr
	sw $zero, 0($a0)
	la $a0, BytePtr
	sw $zero, 0($a0)
	la $a0, WordPtr
	sw $zero, 0($a0)
	la $a0, ArrayPtr
	sw $zero, 0($a0)
	la $a0, CharPtr1
	sw $zero, 0($a0)
	la $a0, CharPtr2
	sw $zero, 0($a0)
	la $a0, WordPtr_Max
	sw $zero, 0($a0)


	jal SysInitMem
	li $v0, 4
	la $a0, success_noti
    syscall
	j main

Case8:	# Luong bo nho da cap phat
	li $v0, 4		# Thong bao
	la $a0, Memory
	syscall

	la  $t9, Sys_TheTopOfFree
    lw  $t9, 0($t9)               
    la  $t8, Sys_MyFreeSpace
    sub     $a0, $t9, $t8	# luong bo nho = Gia tri duoc luu tai Sys_TheTopOfFree - dia chi Sys_MyFreeSpace
	
	li $v0, 1	# in so nguyen = luong bo nho da cap phat
	syscall

	li $v0, 4	# in chu Byte
	la $a0, Byte
	syscall

	j main

Case9:	# Malloc 2 chieu 
Row_input:
	la $a0, Row_noti	
	jal Input_int
	jal Check_int

	bne $v1, $zero, Row_input
	add $s3, $zero, $a0	# $s3 number of row and not changed in program

Col_input:
	la $a0, Col_noti
	jal Input_int
	jal Check_int

	bne $v1, $zero, Col_input
	add $s4, $zero, $a0	# $s4 number of Column and not changed in program

	la $a0, ArrayPtr
	mul $a1, $s3, $s4
	li $a2, 4
	jal malloc

    li $v0, 4
	la $a0, success_noti
    syscall
	j main

Case10:	# Set gia tri cho A[i][j], chi so bat dau tu [0][0]
check_cap_phat_10:
	beq $s3, $zero, chua_cap_phat_10
	beq $s4, $zero, chua_cap_phat_10
	j i_input

chua_cap_phat_10:
	li $v0, 4
	la $a0, chua_cap
	syscall
	j main

i_input:
	la $a0, i_noti	
	jal Input_int
	jal Check_negative

	bne $v1, $zero, i_input
	add $t0, $zero, $a0

	sgt $t2, $s3, $t0 # s3 > t0 -> thoa man -> t2 = 1 neu khong thi loi va t2=0
	addi $t3, $t2, -1 # tru di 1 de su dung lenh bltzal
	bltzal $t3, Err_matrix # neu t2 <= 0 -> in loi 
	beq $t2, $zero, i_input # t2 = 0 thi nhap lai

j_input:
	la $a0, j_noti
	jal Input_int
	jal Check_negative

	bne $v1, $zero, j_input
	add $t1, $zero, $a0

	sgt $t2, $s4, $t1 # s4 > t1 -> thoa man -> t2 = 1 neu khong thi loi va t2=0
	addi $t3, $t2, -1 # tru di 1 de su dung lenh bltzal
	bltzal $t3, Err_matrix # neu t2 <= 0 -> in loi 
	beq $t2, $zero, j_input # t2 = 0 thi nhap lai

	la $a0, Aij_noti
	jal Input_int # a0 = gia tri can nhap vao A[i][j]

    mul $t2, $t0, $s4	# t2= i* so cot -> hang thu i
	add $t2, $t2, $s3	# t2= i* so cot + j -> hang thu i cot j
	sll $t2, $t2, 2		# t2= t2*4

	la $a1, ArrayPtr
	add $a1, $a1, $t2	# a1 =  address of A[i][j]
	sw $a0, 0($a1)		# luu lai gia tri vao dung vi tri
	j main

Case11:	# Lay gia tri tu A[i][j]
check_cap_phat_11:
	beq $s3, $zero, chua_cap_phat_11
	beq $s4, $zero, chua_cap_phat_11
	j get_i

chua_cap_phat_11:
	li $v0, 4
	la $a0, chua_cap
	syscall
	j main
get_i:
	la $a0, i_noti	
	jal Input_int
	jal Check_negative

	bne $v1, $zero, get_i
	add $t0, $zero, $a0

	sgt $t2, $s3, $t0 # s3 > t0 -> thoa man -> t2 = 1 neu khong thi loi va t2=0
	addi $t3, $t2, -1 # tru di 1 de su dung lenh bltzal
	bltzal $t3, Err_matrix # neu t2 <= 0 -> in loi 
	beq $t2, $zero, get_i # t2 = 0 thi nhap lai

get_j:
	la $a0, j_noti
	jal Input_int
	jal Check_negative

	bne $v1, $zero, get_j
	add $t1, $zero, $a0

	sgt $t2, $s4, $t1 # s4 > t1 -> thoa man -> t2 = 1 neu khong thi loi va t2=0
	addi $t3, $t2, -1 # tru di 1 de su dung lenh bltzal
	bltzal $t3, Err_matrix # neu t2 <= 0 -> in loi 
	beq $t2, $zero, get_j # t2 = 0 thi nhap lai

    mul $t2, $t0, $s4	# t2= i* so cot -> hang thu i
	add $t2, $t2, $s3	# t2= i* so cot + j -> hang thu i cot j
	sll $t2, $t2, 2		# t2= t2*4

	la  $a0, Output_val
    li  $v0, 4
    syscall

	la $a1, ArrayPtr
	add $a1, $a1, $t2	# a1 =  address of A[i][j]
	lw $a0, 0($a1)		# lay gia tri ra

    li  $v0, 1			# print value he 10
    syscall

	li $v0, 4
	la $a0, Newline
    syscall
    j main

Case12: # Tim max trong 1 mang nhap vao
	la $a0, Nhap_word	
	jal Input_int
	jal Check_int

	bne $v1, $zero, Case12
	add $s6, $zero, $a0	# $s2 number of Word and not changed in program
	la $a0, WordPtr_Max
	add $a1, $zero, $s6
	addi $a2, $zero, 4
	jal malloc

	addi $t0, $zero,0
	la $t1, WordPtr_Max
	lw $t1, 0($t1)
loop2:
	la $a0, Nhap_int
	li $v0, 4
	syscall

	addi $a0, $t0, 1
	li $v0, 1
	syscall

	la $a0, Spacing
	li $v0, 4
	syscall


	li $v0, 5
	syscall
	move $a0, $v0

	sw $a0, 0($t1)
	addi $t1, $t1, 4	# +4 byte -> gia tri tiep theo cua mang
	addi $t0, $t0, 1
	bne $t0, $s6, loop2	# van lap chung nao i < so phan tu 
 
	addi $t0, $zero, 1
	la $t1, WordPtr_Max
	lw $t1, 0($t1)
	lw $t2, 0($t1) # init max = A[0]
find_max:
	addi $t1, $t1, 4	# +4 byte -> gia tri tiep theo cua mang
	lw $t3, 0($t1)
	sgt $t4, $t3, $t2	# t3 > max ? t4 = 1 : 0
	beq $t4, $zero, continue
	addi $t2, $t3, 0 # if t3 > max -> max = t3
continue:
	addi $t0, $t0, 1
	bne $t0, $s6, find_max

	li $v0, 4
	la $a0, Max_noti
	syscall

    addi $a0, $t2, 0
	li $v0, 1
    syscall
	li $v0, 4
	la $a0, Newline
	syscall
	j main

Exit:
	la $a0, Ending
	li $v0, 4
	syscall

	li $v0, 10
	syscall

Error:
	la $a0, Err
	li $v0, 4
	syscall
	j main

#------------------------------------------
# Ham khoi tao cho viec cap phat dong
# @param khong co
# @detail Danh dau vi tri bat dau cua vung nho co the cap phat duoc
#------------------------------------------
SysInitMem: 
	la $t9, Sys_TheTopOfFree 	#Lay con tro chua dau tien con trong, khoi tao
	la $t7, Sys_MyFreeSpace 	#Lay dia chi dau tien con trong, khoi tao
	sw $t7, 0($t9) 				# Luu lai
	jr $ra

#------------------------------------------
# Ham cap phat bo nho dong cho cac bien con tro
# @param [in/out] $a0 Chua dia chi cua bien con tro can cap phat
# Khi ham ket thuc, dia chi vung nho duoc cap phat se luu tru vao bien con tro
# @param [in] $a1 So phan tu can cap phat
# @param [in] $a2 Kich thuoc 1 phan tu, tinh theo byte
# @return $v0 Dia chi vung nho duoc cap phat
#------------------------------------------
malloc: 
	la $t9, Sys_TheTopOfFree 
	lw $t8, 0($t9) 			#Lay dia chi dau tien con trong
	divu $t0, $t8, $a2
	mfhi $t0
	beq $t0, $zero, khong_du	# so du = 0 thi bo qua, so du khac 0 thi - so du + a2
	sub $t8, $t8, $t0		# Neu du thi tru di so du do
	add $t8, $t8, $a2		# Cong them so byte de gia tri chia het cho a2

khong_du:
	sw $t8, 0($a0) 			#Cat dia chi do vao bien con tro
	addi $v0, $t8, 0 		#Dong thoi la ket qua tra ve cua ham
	mul $t7, $a1, $a2 		#Tinh kich thuoc cua mang can cap phat
	add $t6, $t8, $t7 		#Tinh dia chi dau tien con trong
	sw $t6, 0($t9) 			#Luu tro lai dia chi dau tien do vaobien Sys_TheTopOfFree
	jr $ra

# 
# return
Ptr_value:
	la 	$t0, CharPtr		# Luu dia chi bien con tro CharPtr vao $t0
	sll 	$t1, $a0, 2		# CharPtr, BytePtr, WordPtr nam lien tiep nhau
	add 	$t0, $t0, $t1	# $t0 luu dia chi cua CharPtr/BytePtr/WordPtr/ArrayPtr
	lw 	$v0, 0($t0)			# lay gia tri luu tai bien con tro va luu vao $v0 (gia tri tra ve)
	jr 	$ra	

Ptr_addr:
    la  $t0, CharPtr        # Luu dia chi bien con tro CharPtr vao $t0
    sll     $t1, $a0, 2     # CharPtr, BytePtr, WordPtr nam lien tiep nhau
    add     $v0, $t0, $t1   # $v0 luu dia chi cua CharPtr/BytePtr/WordPtr/ArrayPtr
    jr  $ra

Print_hexa:				# in ra gia tri $v0
    move $a0, $v0
    li  $v0, 34         # in ra so hexa
    syscall
    la  $a0, Newline
    li  $v0, 4         # in ra dau xuong dong
    syscall
    jr  $ra


# input a0: string notification
# return a0: int input
Input_int:
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	move $a0, $v0
	jr $ra

# input a0: int value to check
# return v1 = 1  if a0 < 1, else v1 = 0
Check_int:
	li $v1, 1
	slt $v1, $a0, $v1
	bne $v1, $zero, Err_noti 
	jr $ra

Err_noti:
	li $v0, 4
	la $a0, Err_val
	syscall
	jr $ra

# input a0: int value to check
# return v1 = 1  if a0 < 0, else v1 = 0
Check_negative:
	li $v1, 0
	slt $v1, $a0, $v1
	bne $v1, $zero, Negative_noti
	jr $ra

Negative_noti:
	li $v0, 4
	la $a0, Err_negative
	syscall
	jr $ra

# Chi in ra thong bao
Err_matrix:
	li $v0, 4
	move $a1, $a0
	la $a0, Err_size
	syscall
	move $a0, $a1
	jr $ra
	
#Input:	 	a0 Char pointer 1: chua string can copy
# 			a1 Char pointer 2: chua string dich
# Sau khi thuc hien ham thi noi dung duoc copy vao Char pointer 2	
Copy:
	li $t0, 10
loop_copy:	
	lb $t1, 0($a0)
	sb $t1, 0($a1)
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	bne $t1, $t0, loop_copy

	sb $zero, 0($a1)
	jr $ra
