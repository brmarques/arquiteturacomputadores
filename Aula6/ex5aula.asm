.globl main
.text

main:
					# sequência fibonnacci 0 1 1 2 3 5 8 13 21 34 55
	lui 	$t5, 0x1001		# carrega o endereço da memória em $t5
	lw 	$t4, 0 ($t5)		# carrega o valor contido na memória (word 10 referenciado pelo endereço da memória contido em $t5, o 0x1001) em $t4
	ori 	$t0, $0, 0		# $t0 com valor inicial 0
	ori 	$t1, $0, 1		# $t1 com valor inicial 1
	ori 	$t3, $0, 1		# define a contagem de repetições do laço, no caso if $t3 < 10 (word na memória)
	
repeat:	
	add 	$t2, $t0, $t1		# soma $t0 com $t1 e coloca o resultado em $t2
	or 	$t0, $t1, $0		# coloca o valor de $t1 em $t0
	or 	$t1, $t2, $0		# coloca o valor de $t2 em $t1
	addi 	$t3, $t3, 1		# incrementa em um o valor de $t3 (contagem de repetições)	
	addi 	$a0, $t0, 0		# recebe o valor a ser impresso
	ori 	$v0, $0, 1		# $v0 recebe 1, para imprimir o inteiro
	syscall
	
	bne  	$t3, $t4, repeat	# if ($t3 != $t4) repete o laço
	sw 	$t1, 4 ($t5)		# armazena o valor no segundo espaço de memória

end:
	ori 	$v0, $0, 10
	syscall
	
.data
	x: .word 10
