.data
	entrada: .asciiz "\nDigite um numero: "
.text
main:
	#Recebendo num
	li $v0 , 4
	la $a0 , entrada
	syscall 
	
	#Leitura num
	li $v0 , 5
	syscall
	add $t0 , $v0 , 0 #Cópia do valor de v0
	
	#Se num é maior que zero
	bgtz $t0 , entao
	j senao
	
entao:
	mul $s0 , $t0 , 2 #num * 2
	
	#Saída
	li $v0 , 1
	add $a0 , $s0 , 0
	syscall
	
	j fimse #Pula
	
senao:
	mul $s0 , $t0 , 3 #num * 3
	
	#Saída
	li $v0 , 1
	add $a0 , $s0 , 0
	syscall
	
	j fimse #Pula

fimse: