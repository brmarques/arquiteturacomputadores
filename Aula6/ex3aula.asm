.globl main
.text

main:
	#somar de 1 a 10 usando beq (branch on equal)
	lui $t0, 0x1001		#carrega o espaço da memória em $t0
	lw $t1, 0 ($t0)		#carrega a word da memória em $t1
repeat:	beq $t1, $t3, equal	#branch on equal - compara se são iguais; i == limite, repete = label para o laço de repetição
	add $t2, $t2, $t3	#acc = acc + i
	addi $t3, $t3, 1	#i = i + 1
	j repeat		#salta para o laço condicional "repete:"
	
equal: add $t2, $t2, $t3	#se o valor nos registradores for iguais, realiza a instrulção nesse label
	sw $t2, 4 ($t0)		#armazena o resultado final no segundo espaço de memória
	
	#===============================
	#$t1 = responsável pelo limite
	#$t2 = somatório (acc)
	#$t3 = valor atual (i)
	
	#exemplo do laço:
	#acc = 0
	#for(i = 0; i < x; i++)
	#	acc = acc +1;
	#===============================
	
	.data
	x: .word 10