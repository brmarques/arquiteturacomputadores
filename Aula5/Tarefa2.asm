.globl main
.text

	#2. Utilize o método de Horner para calcular: ax^3 + bx^2 + cx + d. Use a seguinte área de dados:
	#.data	x: .word 1 	a: .word -3	b: .word 3	c: .word 9	d: .word -24
	#Armazene o resultado na posição seguinte de memória (após a área de dados contendo x, a, b, c, d).

	# 	ax^3 + bx^2 + cx + d
	# 	a*x*x*x + b*x*x + c*x + d	==>> 6 multiplicações e 3 somas (método convencional)
	
	# 	ax^3 + bx^2 + cx + d		==>> Método de Horner
	# 	a*x
	# 	(a*x) + b
	# 	((a*x) + b)*x
	# 	(((a*x) + b)*x) + c
	#	((((a*x) + b)*x) + c) * x
	#	(((((a*x) + b)*x) + c) * x) + d	===> 3 multiplicações e 3 somas

main:
	lui $t0, 0x1001
	lw $t1, 0 ($t0)
	lw $t2, 4 ($t0)
	lw $t3, 8 ($t0)
	lw $t4, 0xc ($t0)
	lw $t5, 0x10 ($t0)
	mult $t2, $t1		#a*x
	mflo $t2		# $t2 = a*x carregado de lo
	add $t2, $t2, $t3	# $t3 = (a*x) + b = 0
	mult $t3, $t1		# 3
	mflo $t2		# $t2 = 3 carregado de lo
	add $t2, $t2, $t4
	mult $t2, $t1
	mflo $t2
	add $t1, $t2, $t5
	sw $t1, 0x14($t0)
	
	.data
	x: .word 1
	a: .word -3
	b: .word 3
	c: .word 9
	d: .word -24