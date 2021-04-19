.globl main
.text

main:
	ori $t1, $0, 0x7777	#0x00007777
	sll $t2, $t1, 16 	#joga 16 pra esquerda -> 0x77770000	 		
	or $t1, $t2, $t1 	#junta t2 e t1 em t1 -> 0x77777777 -> 2004318071 -> 01110111011101110111011101110111
	
	ori $t2, $0, 0x3333	#0x00003333
	sll $t3, $t2, 16	#joga 16 pra esquerda -> 0x33330000
	or $t2, $t3, $t2	#junta t3 e t2 em t2 -> 0x33333333 -> 858993459 -> 00110011001100110011001100110011
	
	addu $t0, $t1, $t2	# Resultado = 0xaaaaaaaa = 2863311530 = 10101010101010101010101010101010
	add $t0, $t1, $t2	#Add finaliza com erro gerando overflow
	
	# 2. Utilize a instrução addu para somar o valor hexadecimal 0x77777777 ao valor 0x33333333 e armazene o resultado no registrador $t0.
	# Escreva o resultado da soma nos comentários e responda a seguinte pergunta:
	# Considerando números representados em complemento de dois, o resultado encontrado está correto? SIM, CORRETO?.
	# Por que? NÃO SEI?.
	# Explique o que acontece se substituirmos a instrução addu por uma instrução add. Por que? Resposta: TERMINA A EXECUÇÃO COM ERRO DE OVERFLOW NA SOMA DOS DOIS INTEIROS.
