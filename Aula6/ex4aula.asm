.globl main
.text

main:
	#somar de 1 a 10 usando bne (branch on not equal)
	lui $t0, 0x1001
	lw $t1, 0 ($t0)
repeat:	bne $t1, $t3, diferent		#i != limite
	add $t2, $t2, $t3		#são iguais
	sw $t2, 4 ($t0)
	j end
	
diferent: 
	add $t2, $t2, $t3		#acc = acc + 1
	addi $t3, $t3, 1		#i = i + 1
	j repeat
	
end:

	.data
	x: .word 4
