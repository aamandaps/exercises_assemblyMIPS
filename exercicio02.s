.data
	entrada01: .asciiz "\nDigite quantidade de camisetas tam. P: "
	entrada02: .asciiz "\nDigite a quantidade de camisetas tam. M: "
	entrada03: .asciiz "\nDigite a quantidade de camisetas tam. G: "
.text
main:
	#Recebendo tam. P
	li $v0 , 4
	la $a0 , entrada01
	syscall 
	
	#Leitura tam. P
	li $v0 , 5
	syscall
	add $t0 , $v0 , 0 #Cópia do valor de v0
	
	#Recebendo tam. M
	li $v0 , 4
	la $a0 , entrada02
	syscall
	
	#Leitura tam. M
	li $v0 , 5
	syscall
	add $t1 , $v0 , 0 #Cópia do valor de v0
	
	#Recebendo tam. G
	li $v0 , 4
	la $a0 , entrada03
	syscall 
	
	#Leitura tam. G
	li $v0 , 5
	syscall
	add $t2 , $v0 , 0 #Cópia do valor de v0
	
	#P custa 10
	li $s0 , 10
	mul $t0 , $t0 , $s0 
	
	#M custa 12
	li $s1 , 12
	mul $t1 , $t1 , $s1
	
	#G custa 15
	li $s2 , 15
	mul $t2 , $t2 , $s2 
	
	#Total
	add $s3 , $t0 , $t1
	add $s3 , $s3 , $t2
	
	#Saída
	li $v0 , 1
	add $a0 , $s3 , 0
	syscall
	
	#FIM
	li $v0, 10
	syscall