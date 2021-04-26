.globl main
.text
	#3. Use, como exemplo, a área de dados abaixo e calcule a média aritmética.
	#Armazene a média em um word na memória. Não deixe de testar com outros valores.
	#.data	.word 12	.word 97	.word 133	.word 82	.word 236
main:
	lui $t0, 0x1001
	ori $t3, $0, 5
	lw $t1, 0 ($t0)
	lw $t2, 4 ($t0)
	add $t1, $t1, $t2
	lw $t2, 8 ($t0)
	add $t1, $t1, $t2
	lw $t2, 0xc ($t0)
	add $t1, $t1, $t2
	lw $t2, 0x10 ($t0)
	add $t1, $t1, $t2
	div $t1, $t3
	mflo $t1
	sw $t1, 0x14($t0)
	
	.data
	.word 12
	.word 97
	.word 133
	.word 82
	.word 236