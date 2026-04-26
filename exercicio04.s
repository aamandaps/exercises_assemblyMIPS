.data
	entrada01: .asciiz "\nDigite a base maior: "
	entrada02: .asciiz "\nDigite a base menor: "
	entrada03: .asciiz "\nDigite a altura: "
.text
main:
	#Recebendo base maior
	li $v0 , 4
	la $a0 , entrada01
	syscall 
	
	#Leitura base maior
	li $v0 , 5
	syscall
	add $t0 , $v0 , 0 #Cópia do valor de v0
	
	#Recebendo base menor
	li $v0 , 4
	la $a0 , entrada02
	syscall
	
	#Leitura base menor
	li $v0 , 5
	syscall
	add $t1 , $v0 , 0 #Cópia do valor de v0
	
	#Recebendo altura
	li $v0 , 4
	la $a0 , entrada03
	syscall 
	
	#Leitura altura
	li $v0 , 5
	syscall
	add $t2 , $v0 , 0 #Cópia do valor de v0
	
	#Cálculo da área
	add $s0 , $t0 , $t1
	mul $s0 , $s0 , $t2
	div $s0 , $s0 , 2
	
	#Saída
	li $v0 , 1
	add $a0 , $s0 , 0
	syscall
	
	#FIM
	li $v0, 10
	syscall
