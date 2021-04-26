.globl main
.text
	# 1. Faça um programa que calcule 
	#	9xy - 13x - 4y + 56. 
	# Seu programa deve usar a memória para armazenar os valores de x e y (posições 0x10010000 e 0x10010004), assim como o resultado em (0x10010008).
main:
	lui $t0, 0x1001
	ori $t4, $0, 9
	ori $t5, $0, 13
	ori $t6, $0, 4
	lw $t1, 0 ($t0)		# $t1 <= x
	lw $t2, 4 ($t0)		# $t2 <= y
	add $t3, $t1, $t2
	mult $t3, $t4
	mflo $t3 		# 9*(x+y) = 108
	
	mult $t5, $t1
	mflo $t5		# 13*x = 52
	
	mult $t6, $t2		
	mflo $t6		# 4*y = 32
	
	sub $t3, $t3, $t5
	sub $t3, $t3, $t6
	
	add $t3, $t3, 56
	
	sw $t3, 8($t0)

	.data
	x: .word 4 
	y: .word 8
	
	
