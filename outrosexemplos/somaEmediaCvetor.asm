.data   
  $LS: .asciiz " a soma é: "    
  $LM: .asciiz " a media é: "    
  vetor: .word 0, 1, 2, 3, 4
 
.text
.globl main

main:    
  # configurações do programa principal    
   subu $sp, $sp, 32    
   sw $ra, 20($sp)    
   sw $fp, 16($sp)    
   addiu $sp, $sp, 28             
   la $a0, vetor    # chama o procedimento    
   jal soma    
   
   # Move o conteúdo do registrador de retorno ($v0) para outro 
   # registrador ($a1), para que seja liberado e usado novamente.   
     move $a1, $v0    
     jal media    
     move $a1, $v0
     
.text  
 
   # imprimindo a string  
    li $v0, 4  
    la $a0, $LS   
    syscall 
 
   # imprimindo o inteiro   
     li $v0, 1   
     move $a0, $s1   
     syscall 
 
   # imprimindo a string   
     li $v0, 4   
     la $a0, $LM   
     syscall 
 
   # imprimindo o inteiro   
     li $v0, 1   
     move $a0, $s2   
     syscall  
 
   # configurações do programa principal    
     lw $ra, 20($sp)    
     lw $fp, 16($sp)    
     addiu $sp, $sp, 32  
     j fim   # encerra o programa
 
.text
soma:    
   # configurações do procedimento    
    subu $sp, $sp, 32   # reserva o espaço do frame    
    sw $ra, 20($sp)     # salva o endereço de retorno    
    sw $fp, 16($sp)     # salva o frame pointer    
    addiu $fp, $sp, 28  # prepara o frame pointer    
    sw $a0, 0($fp)      # salva o argumento    
    la $s4, vetor # indice do vetor    
    li $s3, 5 # número total de elementos no vetor   
    li $s1, 0 # soma    
 
   #FOR  
     move $s0, $zero     # i = 0 ($s0 é i)  
     LOOP:      
      # configurações do FOR      
      slt $t0, $s0, $s3      # t0 = 0 se $s0 >= $s3 ( i >= n), t0 = 1 caso contrário
      beq $t0, $zero, EXIT   # se $s0 >= $s3 ( i >= n) vá para EXIT      
  
      # configuração do ARRAY      
       sll $t1, $s0, 2      # $t1 = 4 * i (4 * $s0)      
       add $t2, $s4, $t1    # t2 = ( vetor + ( 4 * i) )      
       lw $t3, 0($t2)       # $t3 = vetor[i]      
       add $s1, $s1, $t3    # somando os elementos (soma = soma + vetor[i]    
 
      # configurações do FOR      
       addi $s0, $s0, 1       # $s0 = $s0 + 1 (ou i = i + 1) é o contador      
      j LOOP                 # volta para o LOOP  
      EXIT:    
 
   # configurações do procedimento    
    add $v0, $s1, $zero # retorna para quem chamou.    
    jr $ra
 
media:   
   # configurações do procedimento    
    subu $sp, $sp, 32   # reserva o espaço do frame    
    sw $ra, 20($sp)     # salva o endereço de retorno    
    sw $fp, 16($sp)     # salva o frame pointer    
    addiu $fp, $sp, 28  # prepara o frame pointer    
    sw $a0, 0($fp)      # salva o argumento   
    li $s3, 5 # número total de elementos no vetor    
    li $s2, 0 # media    
    div $s2, $s1, $s3 # calcula a média    
 
   # configurações do procedimento    
    add $v0, $s2, $zero # retorna para quem chamou.    
    jr $ra
 
fim:    
  li $v0, 10    
  syscall