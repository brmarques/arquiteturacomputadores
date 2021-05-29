.globl main
.text

main:
	lui 	$t1, 0x1001		#pega o endereço de memória 0x1001
	#lw 	$t2, 1 ($t1)		#lw = load word, causa erro, por causa do alinhamento de memória que não está associado com uma palavra de memória
	#lb 	$t2,2($t1)		# lb = load byte
	ori 	$t2, $0, 0x55		#acrescenta 0x55 no registrador $t2
	sb	$t2, 2 ($t1)		#sb = store byte, a instrução joga o valor de $t2 na posição 2 de memória onde está armazenado o valor de $t1, no caso o 2 é 34, 3 é 12, 1 é 56 e 0 é 78, pegando de 2 em 2 bytes da direita pra esquerda
	
.data
	.word 0x12345678
