.globl main
.text

main:
	lui $t0, 0x1001	#load upper immediate - carrega um imediato nos 16 bits mais significativos de um registrador, útil para setar o registrador de base
			# 0x 1001 0000
	
	lw $t1, 0 ($t0) 
	# $t1 <= x
	
	lw $t2, 4 ($t0)	#4 próxima posição na memória (Value +4), em relação a anterior que era a primeira (Value +0)
			# $t2 <= y
	mult $t1, $t2	#multiplica os valores dos registradores
	mflo $t3	#carrega o registro de número pequeno, por isso está no lo, para o registrador $t3	
	sw $t3, 8($t0)	# escreve na memória o valor de $t3 no 8 da memória (Value +8), tendo como referência o base $t0
			# pode-se adicionar 8 no registrador base e deixar o offset em 0, gera mesmo resultado
	
	
	.data		#seta valores na memória
	x: .word 32 	# x, y e z não tem impacto no código, serve apenas para organização na hora da codificação
	y: .word 16
	
	# z: .word 15
	# .word 1