.globl main
.text

main:
					# somar de 1 a 10 usando bne (branch on not equal)
	lui 	$t0, 0x1001		# $t0 recebe o espaço de memória como referência
	lw 	$t1, 0 ($t0)		# $t1 recebe o valor contido no primeiro espaço de memória de 0x1001 definido no .data

repeat:	
	bne 	$t1, $t3, diferent	# i != limite	# repeat	# jump to diferent
	add 	$t2, $t2, $t3		# são iguais
	sw 	$t2, 4 ($t0)		# armazena valor de $t0 na segunda posição de memória de 0x1001
	j end				# jump to end
	
diferent: 				
	add 	$t2, $t2, $t3		# acc = acc + 1		# diferent
	addi 	$t3, $t3, 1		# i = i + 1
	j repeat			# jump to repeat
	
end:					
	ori 	$v0, $0, 10		# encerra o programa
	syscall

.data
	x: .word 5
