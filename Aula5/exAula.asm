.globl main
.text

main:
	#mult $t1, $t2
	# HI RECEBE OS 32 BITS MAIS SIGNIFICATIVOS
	# LO RECEBE OS 32 MENOS SIGNIFICATIVOS, SE NÚMERO FOR PEQUENO, FICA TODO NO LO
	#mflo $t0 # move o resultado do lo para o $0
	
	div $t1, $t2
	# resultado em lo
	# resto em hi