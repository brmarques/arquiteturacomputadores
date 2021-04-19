.globl main
.text

main:
	# 1. Faça um programa que some os números decimais abaixo e escreva o resultado em $t0.
	# Valores: 1458, -356, 989, -985, -1, 15
	# 1458 - 356 = 1102
	# 1102 + 989 = 2091
	# 2091 - 985 = 1106
	# 1106 - 1 = 1105
	# 1105 +15 = 1120
	# Resultado: 1120

	ori $t0, $0, 1458
	addi $t0, $t0, -356
	addi $t0, $t0, 989
	addi $t0, $t0, -985
	addi $t0, $t0, -1
	addi $t0, $t0, 15
	
	#$t0 = 1120

	
	# 356 ->  0101100100
	
	# -356 -> 1 010011011
	#	+ 0 000000001
	#	  1 010011100
