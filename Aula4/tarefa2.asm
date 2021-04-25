.globl main
.text

main:
	ori $t1, $0, 0x7777	#0x00007777
	sll $t2, $t1, 16 	#joga 16 pra esquerda -> 0x77770000	 		
	or $t1, $t2, $t1 	#junta t2 e t1 em t1 -> 0x77777777 -> 2004318071 -> 01110111011101110111011101110111
	
	ori $t2, $0, 0x3333	#0x00003333
	sll $t3, $t2, 16	#joga 16 pra esquerda -> 0x33330000
	or $t2, $t3, $t2	#junta t3 e t2 em t2 -> 0x33333333 -> 858993459 -> 00110011001100110011001100110011
	
	addu $t0, $t1, $t2	# Resultado = (Obtido) 0xaaaaaaaa =  -1431655766 = 1010101010101010101010101010110 | 2863311530 = 10101010101010101010101010101010
	add $t0, $t1, $t2	#Add finaliza com erro gerando overflow
	
	# 10101010101010101010101010101010 ---> 2863311530
	# 01010101010101010101010101010101 --->  complemento de 1
	# 00000000000000000000000000000001 ---> soma de 1 (complemento de 2)
	# --------------------------------
	# 01010101010101010101010101010110 ---> resultado
	
	
	# 2. Utilize a instrução addu para somar o valor hexadecimal 0x77777777 ao valor 0x33333333 e armazene o resultado no registrador $t0.
	# Escreva o resultado da soma nos comentários e responda a seguinte pergunta:
	# Considerando números representados em complemento de dois, o resultado encontrado está correto? Por que? 
	# Resposta: Está correto. Fazendo a conversão com complemento de 2 mostrado acima, foi o resultado encontrado.
	# Explique o que acontece se substituirmos a instrução addu por uma instrução add. Por que? 
	# Resposta: Termina a execução com erro de overflow na soma dos dois inteiros.
