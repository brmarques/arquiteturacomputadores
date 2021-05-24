.globl main
.text

main:
	lui $t1, 0x1001
	lhu $t2, 0 ($t1)
	
.data
	.byte 0x12
	.byte 0x33
	.half 0x9999
	.word 0x12345678
