.globl main
.text

main:
	sll $0, $0, 0
	sll $0, $0, 0
	sll $0, $0, 0
	j main
	addi $8, $8, 1
	#nop #command that does nothing