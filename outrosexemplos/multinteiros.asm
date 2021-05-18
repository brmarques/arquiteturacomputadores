.text

#multiplicação de inteiros

	li $t0, 12			
	addi $t1, $0, 10
	
	sll $s1, $t1, 10	#multiplicar por 2^10 = 1024  --> multiplicação por múltiplos de 2, shift left logical
	
	#$s0 terá o resultado da multiplicação
	mul $s0, $t0, $t1
	
	li $v0, 1		#1 = por ser inteiro em caso de dúvidas, ver ajuda, aba syscall
	move $a0, $s0		# $a0 = integer to print, value 1 = code in $v0
	syscall