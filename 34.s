@Setar o valor de R0
mov R1,#0       
mov R2,#0        
loop: 
	and R2,R2,R0,LSR#1
    	addcs R1,R1,#1                
    	cmp R0,#0                      
	beq loop                      