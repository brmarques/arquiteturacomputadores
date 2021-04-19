.globl main
.text

main:
	# 0x8000 = 10
	ori $t0, $0, 0x8000
	sll $t0, $t0, 16
	# 1000 0000 0000 0000 0000 0000 0000 0000
	# 0111 1111 1111 1111 1111 1111 1111 1111
	# 1000 0000 0000 0000 0000 0000 0000 0000 = -2147483648
	ori $t1, $0, 20
	
	add $t2, $t0, $t1 #subtrai o positivo do negativo, nesse caso
	
	#Error - Runtime exception at 0x0040000c: arithmetic overflow
	#Step: execution terminated with errors.
	#add $t2, $t0, $t0
	
	#o addu permite o overflow, não acusa o erro
	#addu $t2, $t0, $t0
	
	# Para transformar 16 em 32 bits, no número negativo, O MIPS repete o dígito significativo 16x à esquerda, no caso o bit 1
	#16 bits em complemento de 2
	# 1111 1111 1111 1111 1111 1111 1111 0110 (-10)
	
	#addi $t0, $0, -10  #causa trap em caso de overflow
	
	#addiu $t0, $0, -10 #igual ao addi, mas não causa trap em caso de overflow
	
	