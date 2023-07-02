.eqv  HEADING    0xffff8010    	                     
.eqv  MOVING     0xffff8050                    	
.eqv  LEAVETRACK 0xffff8020	                    	
.eqv  WHEREX     0xffff8030    		
.eqv  WHEREY     0xffff8040   		
.text  
main:  	
	addi  	$a0, $zero, 90       
	jal   	ROTATE
	jal   	GO
sleep1: 	
addi  	$v0,$zero,32    	
	li    	$a0,16000        
	syscall
	jal     	UNTRACK        	
goDOWN: 	
addi	$a0, $zero, 180	
	jal     	ROTATE
sleep2: 	
addi 	$v0,$zero,32  	
	li      	$a0,9000        
	syscall
	jal     	UNTRACK         
	jal     	TRACK           	

go120: 	
addi  	$a0, $zero, 150	 
	jal   	ROTATE
sleep3: 	
addi    	$v0,$zero,32    
	li      	$a0,15000        
	syscall
	jal     	UNTRACK         	
	jal     	TRACK           	
goLEFT:	
addi  	$a0, $zero, 270	 
	jal   	ROTATE    
sleep4: 	
addi    	$v0,$zero,32    	
	li      	$a0,15000        
	syscall
	jal	UNTRACK
	jal	TRACK
go30:	
addi	$a0, $zero, 30
	jal	ROTATE
sleep5:	
addi	$v0,$zero,32
	li	$a0,15000
	syscall
	jal	UNTRACK
goLEFT1:	
addi	$a0,$zero,270
	li	$a0,10000
	syscall
	jal       STOP    	
end_main:
	li $v0,10
	syscall
#-----------------------------------------------------------
# GO procedure, to start running
# param[in]    none
#-----------------------------------------------------------
GO:     	li    	$at, MOVING     	
	addi  	$k0, $zero,1    	# to  logic 1,
	sb    	$k0, 0($at)     	# to start running
	jr    	$ra
#-----------------------------------------------------------
# STOP procedure, to stop running
# param[in]    none
#-----------------------------------------------------------
STOP:   	li    	$at, MOVING     	
	sb    	$zero, 0($at)  	# to stop
	jr    	$ra
#-----------------------------------------------------------
# TRACK procedure, to start drawing line 
# param[in]    none
#-----------------------------------------------------------
TRACK:  	li    	$at, LEAVETRACK 		
        	addi  	$k0, $zero,1    		
        	sb    	$k0, 0($at)     		
        	jr    	$ra
#-----------------------------------------------------------
# UNTRACK procedure, to stop drawing line
# param[in]    none
#-----------------------------------------------------------
UNTRACK:	li    	$at, LEAVETRACK 		
        	sb    	$zero, 0($at)   		 
        	jr    	$ra
#-----------------------------------------------------------
# ROTATE procedure, to rotate the robot
# param[in]    $a0, An angle between 0 and 359
#                   0 : North (up)
# 90: East (right)
# 180: South (down)
# 270: West (left)
#-----------------------------------------------------------
ROTATE: 	li 	$at, HEADING 		
        	sw 	$a0, 0($at) 		
        	jr 	$ra
