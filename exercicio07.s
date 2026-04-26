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
	
	rem $t1 , $t0 , 2 #$t1 recebe resto de num/2
	
	#Se num é par
	beq $t1 , 0 , entao
	j senao
	
entao:
	add $s0 , $t0 , 5 #num + 5
	
	#Saída
	li $v0 , 1
	add $a0 , $s0 , 0
	syscall
	
	j fimse #Pula
	
senao:
	add $s0 , $t0 , 8 #num + 8
	
	#Saída
	li $v0 , 1
	add $a0 , $s0 , 0
	syscall
	
	j fimse #Pula

fimse: