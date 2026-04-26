.data
	entrada: .asciiz "\nDigite a altura: "
	saida01: .asciiz "\nA maior altura é: "
	saida02: .asciiz "\nA menor altura é: "
.text
main:
	li $t1 , 1 #Contador de pessoas
	
	#Recebendo a altura
	li $v0 , 4
	la $a0 , entrada
	syscall 
	
	#Leitura da altura
	li $v0 , 5
	syscall
	add $s0 , $v0 , 0 #Cópia do valor de v0
	
	li $t1 , 2
	
	#Definindo os valores para a comparação
	add $s1 , $s0 , 0 #Maior = s1
	add $s2 , $s0 , 0 #Menor = s2
	
enquanto:
	bgt $t1 , 15 , fimenquanto #Encerra
	
	#Recebendo a altura
	li $v0 , 4
	la $a0 , entrada
	syscall 
	
	#Leitura da altura
	li $v0 , 5
	syscall
	add $s0 , $v0 , 0 #Cópia do valor de v0
	
	bgt $s0 , $s1 , novoMaior #altura<menor
	
	blt $s0 , $s2 , novoMenor #altura>maior
	
	j incrementa
	
novoMenor:
	add $s2 , $s0 , 0 #Maior = s1
	
	j incrementa
	
novoMaior:
	add $s1 , $s0 , 0 #Maior = s1
	
	j incrementa
	
incrementa: 
	addi $t1 , $t1 , 1
	j enquanto
	
fimenquanto: 
	#Saída do maior
	li $v0 , 4
	la $a0 , saida01
	syscall
	li $v0 , 1 
	add $a0 , $zero , $s1
	syscall
	
	#Saída do menor
	li $v0 , 4
	la $a0 , saida02
	syscall
	li $v0 , 1 
	add $a0 , $zero , $s2
	syscall
	
	
	
	