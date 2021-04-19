.globl main
.text

main:
	ori $t0, $0, 0x1234
	sll $t0, $t0, 16
	ori $t0, $t0, 0x5678
	srl $t1 , $t0, 28 	#joga o um pro final t1=== > 00000001
	
	sll $t0, $t0, 4 	#desloca uma para a esquerda em t0 ===> 23456780
	srl $t2, $t0, 28	#joga 2 na primeira posição em t2===> 00000002
	sll $t2, $t2, 4		#move 2 para a segunda posição em t2===> 00000020
	or $t1, $t2, $t1	#compara e soma os dois jogando em t1===> 00000021
	
	sll $t0, $t0, 4		#3 - repete os mesmos passos do bloco anterior, mudando apenas o deslocamento da posição do número em questão
	srl $t2, $t0, 28
	sll $t2, $t2, 8
	or $t1, $t2, $t1
	
	sll $t0, $t0, 4		#4
	srl $t2, $t0, 28
	sll $t2, $t2, 12
	or $t1, $t2, $t1
	
	sll $t0, $t0, 4		#5
	srl $t2, $t0, 28
	sll $t2, $t2, 16
	or $t1, $t2, $t1
	
	sll $t0, $t0, 4		#6
	srl $t2, $t0, 28
	sll $t2, $t2, 20
	or $t1, $t2, $t1
	
	sll $t0, $t0, 4		#7
	srl $t2, $t0, 28
	sll $t2, $t2, 24
	or $t1, $t2, $t1
	
	sll $t0, $t0, 4		#8
	srl $t2, $t0, 28
	sll $t2, $t2, 28
	or $t1, $t2, $t1