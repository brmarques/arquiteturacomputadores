.globl main
.text
#############################################################################
# 2 - Utilizando a seção de dados, coloque na memória uma string qualquer.  #
# Faça um programa que transforme todas as letras minúsculas em maiúsculas. #
#############################################################################

main:
	lui 	$a0, 0x1001		# referência em $a0 o endereço da memória onde será mantida a string definida em .data

getin:
	lbu 	$t0, 0($a0)		# percorre a string até chegar a zero
	bge 	$t0, 0x41, goahead	# t0 >= 0x41 (A)

goahead:
	ble 	$t0, 0x5a, jump		# t0 <= 0x5a (Z)
	addi	$t0, $t0, -32																
	
jump:										
	sb 	$t0, 0($a0)		# armazena o valor pq é maiúscula
	addi 	$a0, $a0, 1		# próxima posição de memória
	bne 	$t0, $0, getin		# enquanto não é igual a 0, volta à instrução lbu
	ori 	$v0, $0, 4		# 4 p/ imprimir string
	lui 	$a0, 0x1001		# conteúdo a ser impresso em tela
	syscall	
	ori 	$v0, $0, 10		#finaliza o programa
	syscall	
	
.data
	string: .asciiz "FinAllY, I g0t It!!!"
