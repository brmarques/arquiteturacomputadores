.globl main
.text
##################################################################################
#	1 – Fazer um programa que faça a soma de todos os valores entre x e y. 	 #
#	Considere x e y dois bytes alocados na memória.				 #
#	half word - 2 bytes							 #
##################################################################################

main:
	ori 	$v0, $0, 8		# 8 para ler a string de entrada
	lui 	$a0, 0x1001		# define o endereço de memória 0x1001 para $a0
	lh 	$t0,0($a0)		# carrega o conteúdo, halfword 0 para $t0
	lh 	$t1,2($a0)		# carrega o conteúdo, halfword 2 para $t1
	add	$t5, $t0, $0		# guarda valor de $t0 em $t5 para contagem e comparação
	addi	$t2, $t0, 1		
	add 	$t3, $t0, $t2		

repeat:					# inicia o loop
	sw 	$t3, 0x4($a0)		# armazena o valor de $t3 no primeiro espaço de memória
	addi	$t2, $t2, 1		# t2 = t2 + 1
	add	$t5, $t5, 1		# contador
	beq	$t5, $t1, finally	# if t1  = t5 então finaliza o programa (jump to finally)
	add 	$t3, $t3, $t2		# 
	blt	$t5, $t1, repeat	# if t1 < t5 então repete o laço		
	
finally:	
	ori 	$v0, $0, 10		# encerra o programa
	syscall

.data
					# para teste supondo que x = 2 e y = 7 | soma de 2 + 3 = 5 + 4 = 9 + 5 = 14 + 6 = 20 + 7 = 27
	x: 	.half 2			# modificar o valor inicial do intervalo aqui
	y: 	.half 7			# modificar o valor final do intervalo aqui

