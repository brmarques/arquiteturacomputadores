.globl main
.text

main:
	sw $9, -8 ($8)
	
	# Assumindo que $8 contenha 0x00400014, escreve o conteúdo de $9 no endereço 0x0040000C
	# Nota: Os endereços múltiplos de 4 são aqueles terminados em 0x0, 0x4, 0x8 e 0xC