.globl main
.text

main:
	# 3. Sem utilizar a operação de multiplicação, crie um programa capaz de calcular o valor de z na equação abaixo.
	# Certifique-se de que o programa funciona para diferentes valores de x e y
	# (use dois registradores para armazenar os valores de x e y).
	# Para otimizar o código utilize deslocamentos ao invés de fazer várias somas seguidas.
	# z = 13x - 8y + 9
	
	#$t0 = x = 2
	#$t1 = y = 3
	
	# 13 --> 1101
	#  8 --> 1000
	
	#13x = 8x + 4x +x
	#8x = x << 3 = 1000
	#4x = x << 2 =  100
	# x = x
	#13x
	sll $t2, $t0, 3 # 16
	sll $t3, $t0, 2 # 8
	ori $t4, $0, 1
	add $t2, $t2, $t3 #24
	#addi $t4, $t4, 1
	add $t0, $t2, $t4 #
	#t0 = (8*2(16)) + (4*2(8)) + 1 = 25
	
	#8y
	sll $t1, $t1, 3 #24
	
	sub $t0, $t0, $t1 #4
	addi $t0, $t0, 9 #13
	
	#z = 25 - 24 + 9 = 10
	
	
	
	
	
