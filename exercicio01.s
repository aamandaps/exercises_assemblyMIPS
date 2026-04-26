.data
	entrada01: .asciiz "Digite o comprimento do terreno: \n"
	entrada02: .asciiz "Digite a altura do terreno: "
.text
main:
	#Recebendo primeiro valor
	li $v0 , 4
	la $a0 , entrada01
	syscall 
	
	#Leitura primeiro valor 
	li $v0 , 5
	syscall
	add $t0 , $v0 , 0 #Cópia do valor de v0
	
	#Recebendo segundo valor
	li $v0 , 4
	la $a0 , entrada02
	syscall
	
	#Leitura do segundo valor
	li $v0 , 5
	syscall
	add $t1 , $v0 , 0 #Cópia do valor de v0
	
	#Cálculo da área
	mul $t2 , $t0 , $t1
	
	#Saída
	li $v0 , 1
	add $a0 , $t2 , 0
	syscall
	
	#FIM
	li $v0, 10
	syscall
