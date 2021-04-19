
.globl main
.text

main:

	ori $t0, $0, 0x1234
	sll $t0, $t0, 16
	ori $t0, $t0, 0x5678
	
	# 1    2    3    4    5678
	# 0001 0010 0011 0100 ... 
	# >>>>> 28
	srl $t1, $t0, 28
	
	#PARA o 2
	sll $t0, $t0, 4
	srl $t2, $t0, 28
	# posiciono o elemento
	sll $t2,$t2, 4
	or $t1, $t1, $t2

	#PARA o 3
	sll $t0, $t0, 4
	srl $t2, $t0, 28
	# posiciono o elemento
	sll $t2,$t2, 8
	or $t1, $t1, $t2
	

	#PARA o 4
	sll $t0, $t0, 4
	srl $t2, $t0, 28
	# posiciono o elemento
	sll $t2,$t2, 12
	or $t1, $t1, $t2
	
	
	#PARA o 5
	sll $t0, $t0, 4
	srl $t2, $t0, 28
	# posiciono o elemento
	sll $t2,$t2, 16
	or $t1, $t1, $t2
	
	
	#PARA o 6
	sll $t0, $t0, 4
	srl $t2, $t0, 28
	# posiciono o elemento
	sll $t2,$t2, 20
	or $t1, $t1, $t2
	
	
	#PARA o 7
	sll $t0, $t0, 4
	srl $t2, $t0, 28
	# posiciono o elemento
	sll $t2,$t2, 24
	or $t1, $t1, $t2
	

	#PARA o 8
	sll $t0, $t0, 4
	srl $t2, $t0, 28
	# posiciono o elemento
	sll $t2,$t2, 28
	or $t1, $t1, $t2
	
	
	#87654321