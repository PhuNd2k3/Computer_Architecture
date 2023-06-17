.text
li $s0, 0x12345678 		#example number
andi $t1, $s0, 0xff000000 	#extract MSB
andi $t2, $s0, 0xffffff00	#clear LSB
or $t3, $s0, 0x000000ff	#set LSB
xor $s0, $s0, $s0		#clear $s0