.eqv	HEADING	0xffff8010 
.eqv  	MOVING	0xffff8050   
.eqv  	LEAVETRACK 	0xffff8020
.eqv  	WHEREX     	0xffff8030
.eqv 	WHEREY     	0xffff8040

.eqv KEY_CODE   	0xFFFF0004      	 
.eqv KEY_READY  	0xFFFF0000   	    	                          
.eqv DISPLAY_CODE   	0xFFFF000C   	
.eqv DISPLAY_READY  	0xFFFF0008   	
                                 	
.text
main:	
	li   	$s2,  KEY_CODE              
	li   	$s3,  KEY_READY 
	li   	$s0, DISPLAY_CODE	
	li  	$s1, DISPLAY_READY 
start:
WaitForKey_start:  
	lw  	$t1, 0($s3)                    
	beq  	$t1, $zero, WaitForKey_start

ReadKey_start:
	lw   	$t0, 0($s2)         
	
	beq	$t0, 32, loop	# dau space thi bat dau
	j start	#neu khong thi lap lai

loop: 

WaitForKey:  
	lw  	$t1, 0($s3)                    
	beq  	$t1, $zero, WaitForKey  

ReadKey:
	lw   	$t0, 0($s2)         

WaitForDis:  
	lw   	$t2, 0($s1)            
        	beq  	$t2, $zero, WaitForDis 
        
Input:
InputW:	beq 	$t0, 119, Len
	beq	$t0, 87, Len
	
InputS:	beq 	$t0, 115, Xuong
	beq	$t0, 83, Xuong
	
InputA:	beq 	$t0, 97, Trai
	beq	$t0, 65, Trai
	
InputD:	beq 	$t0, 100, Phai
	beq	$t0, 68, Phai
	j	InputExit

Len:	
	addi    $a0, $zero, 0
        	jal     ROTATE 
	jal     GO 
        	jal     UNTRACK         
        	jal     TRACK          
	addi    $v0,$zero,32    
	li      $a0,100                 
	syscall
	j	ShowKey

Xuong:	
	addi    $a0, $zero, 180
        	jal     ROTATE 
	jal     GO 
        	jal     UNTRACK         
        	jal     TRACK          
	addi    $v0,$zero,32       
	li      $a0,100                 
	syscall
	j	ShowKey

Trai:	
	addi    $a0, $zero, 270
	jal     ROTATE 
	jal     GO 
	jal     UNTRACK        
	jal     TRACK           
	addi    $v0,$zero,32     
	li      $a0,100                 
	syscall
	j	ShowKey

Phai:	
	addi    $a0, $zero, 90
        	jal     ROTATE  
	jal     GO 
        	jal     UNTRACK         
        	jal     TRACK           
	addi    $v0,$zero,32    
	li      $a0,100                 
	syscall
	j	ShowKey
	
InputExit:
	beq	$t0, 32, end_main
	j	ShowKey

ShowKey:     
	sw 	$t0, 0($s0)                          
	nop               
     	j 	loop 	

end_main:
	jal     	UNTRACK         
	jal 	STOP
	li	$v0, 10
	syscall

GO:   
	li    $at, MOVING          
	addi  $k0, $zero,1          
	sb    $k0, 0($at)          
	jr    $ra 
 
ROTATE: 
	li    $at, HEADING          
	sw    $a0, 0($at)          
	jr    $ra 

STOP:   
	li    $at, MOVING          
	sb    $zero, 0($at)   
	jr    $ra 
           
TRACK:  
	li    $at, LEAVETRACK    
	addi  $k0, $zero,1      
	sb    $k0, 0($at)          
	jr    $ra 

UNTRACK:
	li    $at, LEAVETRACK     
	sb    $zero, 0($at)        
	jr    $ra
