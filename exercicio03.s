.data
	entrada01: .asciiz "\nDigite quantidade de horas normais trabalhadas: "
	entrada02: .asciiz "\nDigite a quantidade de horas extras trabalhadas: "
	entrada03: .asciiz "\nDigite o valor do desconto: "
	saida01: .asciiz "\n O salário bruto é igual a: "
	saida02: .asciiz "\n O salário líquido é igual a : "
.text
main:
	#Recebendo quant. horas trabalhadas
	li $v0 , 4
	la $a0 , entrada01
	syscall 
	
	#Leitura quant. horas trabalhadas
	li $v0 , 5
	syscall
	add $t0 , $v0 , 0 #Cópia do valor de v0
	
	#Recebendo quant. horas extras
	li $v0 , 4
	la $a0 , entrada02
	syscall
	
	#Leitura quant. horas extras
	li $v0 , 5
	syscall
	add $t1 , $v0 , 0 #Cópia do valor de v0
	
	#Recebendo desconto
	li $v0 , 4
	la $a0 , entrada03
	syscall 
	
	#Leitura desconto
	li $v0 , 5
	syscall
	add $t2 , $v0 , 0 #Cópia do valor de v0
	
	#Salário bruto
	mul $t3 , $t0 , 10
	mul $t4 , $t1 , 15
	add $t4 , $t4 , $t3
	
	#Salário líquido
	sub $t5 , $t4 , $t2
	
	#Saída salário bruto
	li $v0 , 4
	la $a0 , saida01
	syscall
	li $v0 , 1 
	add $a0 , $zero , $t4
	syscall
	
	#saída salário líquido 
	li $v0 , 4
	la $a0 , saida02
	syscall
	li $v0 , 1 
	add $a0 , $zero , $t5
	syscall