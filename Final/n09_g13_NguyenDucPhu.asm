.data
# Do dai string la 60 da bao gom ky tu\0
Str1  : .asciiz "                                           *************  \n"
Str2  : .asciiz "**************                            *3333333333333* \n"
Str3  : .asciiz "*222222222222222*                         *33333********  \n"
Str4  : .asciiz "*22222******222222*                       *33333*         \n"
Str5  : .asciiz "*22222*      *22222*                      *33333********  \n"
Str6  : .asciiz "*22222*       *22222*      *************  *3333333333333* \n"
Str7  : .asciiz "*22222*       *22222*    **11111*****111* *33333********  \n"
Str8  : .asciiz "*22222*       *22222*  **1111**       **  *33333*         \n"
Str9  : .asciiz "*22222*      *222222*  *1111*             *33333********  \n"
Str10 : .asciiz "*22222******222222*   *11111*             *3333333333333* \n"
Str11 : .asciiz "*2222222222222222*    *11111*              *************  \n"
Str12 : .asciiz "***************       *11111*                             \n"
Str13 : .asciiz "     ---               *1111**                            \n"
Str14 : .asciiz "   / o o \\              *1111****   *****                 \n" 
Str15 : .asciiz "   \\  >  /               **111111***111*                  \n"
Str16 : .asciiz "    -----                  ***********    dce.hust.edu.vn \n"


Menu: 	.asciiz "-------------- MENU -------------\n"
Opt1:	.asciiz "1. Hien thi DCE\n"
Opt2:	.asciiz "2. Chinh sua DCE chi giu lai vien\n"
Opt3:	.asciiz "3. Thay doi vi tri thanh ECD\n"
Opt4:	.asciiz "4. Doi mau chu\n"
Err:	.asciiz "Not an option, please try again\n"
exit:	.asciiz "5. Exit\n"
Nhap:	.asciiz "Choose an option: "
NhapD:	.asciiz "Nhap mau cho chu D(0->9): "
NhapC:	.asciiz "Nhap mau cho chu C(0->9): "
NhapE:	.asciiz "Nhap mau cho chu E(0->9): "
Err2:	.asciiz "Mau phai nam trong khoang 0->9, vui long nhap lai\n"
Ending: .asciiz "See you later\nEnding program..."

.text 
	# Khoi tao mau ban dau
	# t7 -> D, t8 -> C, t8 -> E
	addi $t7, $0, 50	# Number 2
	addi $t8, $0, 49	# Number 1
	addi $t9, $0, 51	# Number 3
	
main:
	# Goi menu
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
	la $a0, exit	
	li $v0, 4
	syscall

	# Nhap lua chon chuc nang
	la $a0, Nhap	
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall

	# Nhay toi chuc nang
	addi $v1, $0, 1
	beq $v0, $v1, Case1

	addi $v1, $0, 2
	beq $v0, $v1, Case2

	addi $v1, $0, 3
	beq $v0, $v1, Case3

	addi $v1, $0, 4
	beq $v0, $v1, Case4

	addi $v1, $0, 5
	beq $v0, $v1, Exit

	# Default -> raise an Error
	j Error

Case1:	# In ra DCE
	addi $t0, $0, 0		# khoi tao i = 0
	addi $t1, $0, 16	# 16 xau can in
	la $a0, Str1
	loop1:
		beq $t0, $t1, main	# Thoat khi i = so string
		li $v0, 4
		syscall

		addi $a0, $a0, 60	# do dai xau
		addi $t0, $t0, 1 	# i+=1
		j loop1

Case2:	# Print DCE with outline only
	addi $t0, $0, 0		# Bien dem hang
	addi $t1, $0, 16	# So hang
	addi $t2, $0, 0		# Bien dem cot
	addi $t3, $0, 60	# So cot
	la $s0, Str1		# s0 <-- Str1
	loop2:
		beq $t0, $t1, main		# Break outer loop
		loop3: 
			beq $t2, $t3, end_inner	# Break inner loop	
			lb $a0, 0($s0)
			jal Check
			li $v0, 11
			syscall
			addi $t2, $t2, 1		# Column counter ++
			addi $s0, $s0, 1		# Dia chi phan tu tiep theo
			j loop3
		end_inner: 
			addi $t0, $t0, 1		# Tang so hang
			addi $t2, $0, 0			# Dua so cot tro ve 0
			j loop2

Case3:	# Print ECD
	addi $t0, $0, 0		# Dem hang
	addi $t1, $0, 16	# So hang
	la $s0, Str1		# s0 <-- Str1
	loop4:
		beq $t0, $t1, main	# Thoat khi duyet toan bo hang
			
		sb $0, 21($s0)	# Phan cach cac chu cai
		sb $0, 41($s0)
		sb $0, 57($s0)
		
		li $v0, 4 
		la $a0, 42($s0)	# Print E
		syscall

		li $v0, 11
		li $a0, 32 	# In bu mot dau cach bi thieu
		syscall

		li $v0, 4 
		la $a0, 22($s0)	# Print C
		syscall

		li $v0, 11
		li $a0, 32 	# In bu mot dau cach bi thieu
		syscall
		
		li $v0, 4 
		la $a0, 0($s0) 	# Print D
		syscall

		li $v0, 11
		li $a0, 32 	# In bu mot dau cach bi thieu
		syscall
		
		li $v0, 4 
		la $a0, 58($s0)	# In phan con lai cua xau
		syscall
		
		# Hoan tra lai xau nhu ban dau
		addi $a0, $0, 0x20	
		sb $a0, 21($s0)
		sb $a0, 41($s0)
		sb $a0, 57($s0)

		# Tang bien dem
		addi $t0, $t0, 1
		addi $s0, $s0, 60
		j loop4	

Case4:	# Change Color
	addi $t0, $0, 0		# Bien dem hang
	addi $t1, $0, 16	# So hang
	addi $t2, $0, 0		# Bien dem cot
	addi $t3, $0, 60	# So cot
	la $s0, Str1		# s0 <-- Str1
D_color:
	li 	$v0, 4		
	la 	$a0, NhapD
	syscall

	li 	$v0, 5	
	syscall

	blt	$v0,0, D_error  # Bao loi neu nhap ngoai khoang
	bgt	$v0,9, D_error

	addi $s1, $v0, 0
	addi $s1, $s1, 48	# +48 de lay gia tri ASCII
	j C_color
D_error:
	la $a0, Err2
	li $v0, 4
	syscall
	j D_color

C_color:	# Tuong tu nhu tren
	li 	$v0, 4		
	la 	$a0, NhapC
	syscall

	li 	$v0, 5	
	syscall

	blt	$v0,0, C_error   
	bgt	$v0,9, C_error

	addi $s2, $v0, 0
	addi $s2, $s2, 48 
	j E_color
C_error:
	la $a0, Err2
	li $v0, 4
	syscall
	j C_color

E_color:	# Tuong tu nhu tren
	li 	$v0, 4		
	la 	$a0, NhapE
	syscall

	li 	$v0, 5	
	syscall

	blt	$v0,0, E_error 
	bgt	$v0,9, E_error

	addi $s3, $v0, 0
	addi $s3, $s3, 48
	j loop5
E_error:
	la $a0, Err2
	li $v0, 4
	syscall
	j E_color

loop5:
	beq $t0, $t1, main			# Break outer loop
	loop6: 
		beq $t2, $t3, end_loop6	# Break inner loop	
		lb $a0, 0($s0)
		jal Change
		li $v0, 11
		syscall
		addi $t2, $t2, 1		# Tang so cot
		addi $s0, $s0, 1		# Dia chi tiep theo
		j loop6
	end_loop6: 
		addi $t0, $t0, 1		# Tang so hang
		addi $t2, $0, 0			# Khoi tao lai so cot
		j loop5

Error:	# Loi neu khong co chuc nang
	la $a0, Err
	li $v0, 4
	syscall
	j main

Exit:
	la $a0, Ending
	li $v0, 4
	syscall

	li $v0, 10
	syscall
	

# Input: $a0 -> gia tri can check
# Return: 	 $a0 = $a0 neu khong phai la so
#		else $a0 = 32 (ma ascii cua space) 
Check:
	sgtu $a1, $a0, 47	# ma ascii cua so nam tu 47 -> 57
	sleu $a2, $a0, 57 
	add $a1, $a1, $a2
	addi $a1, $a1, -2	# neu a0 la so thi a1=0
	beq $a1, 0, number	# nhay toi nhan bien doi
	jr $ra			# giu nguyen gia tri neu khong phai so
number:
	addi $a0, $0, 32	# chuyen thanh space
	jr $ra

# Input: $a0 -> gia tri can check
# Return: 	 $a0 = $a0 neu khong phai la so
#		else $a0 = mau moi
# Su dung cac gia tri trong thanh ghi t7 t8 t9 va s1 s2 s3 nhung khong thay doi chung
Change:
	# So sanh voi gia tri ban dau
	beq $a0, $t7, ChangeD
	beq $a0, $t8, ChangeC
	beq $a0, $t9, ChangeE
	
	jr $ra	# Neu khong phai so thi tro ve chuong trinh chinh

# Chuyen mau tuong ung
ChangeD:
	addi $a0, $s1, 0
	jr $ra
	
ChangeC:
	addi $a0, $s2, 0
	jr $ra
	
ChangeE:
	addi $a0, $s3, 0
	jr $ra
	
