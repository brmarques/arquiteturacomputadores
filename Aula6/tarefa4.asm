.globl main
.text

#4 - Cria um programa que transforma todas as letras entre ‘a’ e ‘g’ de uma string em letras maiúsculas e o restante das letras em minúsculas.
#Além disso, remova todos os espaços em branco da String.


					#read the string, remove ' ' and print it
main:
	ori $v0, $0, 8			# 8 to read string
	lui $a0, 0x1001			# locate in memory position 0x1001 ...pointer to go through the string
	ori $a1, $0, 50			# $a1 = maximum number of characters to read
	syscall				# execute
	
	lui $t3, 0x1001			# pointer to store the values, point to same memory location than $a0	
	
back:	
	lbu $t0, 0($a0)			# go through the string in $a0 until it equals to 0
					#check if $t0 = 0x20 that is equal to a hexadecimal notation to space or " "
	subi $t1, $t0, 0x20		
	beq $t1, $0, jump		
	sb $t0, 0($t3)			# store value cause is not " "
	addi $t3, $t3, 1		# next position to be written
	jump:				# do not store value " "
	
	addi $a0, $a0, 1		# next memory location
	bne $t0, $0, back		# while is not equal to 0, repeat the instruction lbu
	
return:	
	beq $t3, $a0, print		# put 0 until $t3 == $a0
	sb $0, 0($t3)
	addi $t3, $t3, 1
	j return
	
print:	
	ori $v0, $0, 4			# 4 to print string
	lui $a0, 0x1001
	syscall				

	ori $v0, $0, 10
	syscall
