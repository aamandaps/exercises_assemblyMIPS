.data
	entrada01: .asciiz "\nDigite um valor: "
	entrada02: .asciiz "\nDigite um valor diferente de 0: "
.text
main:
	#Recebendo valor 1
	li $v0 , 4
	la $a0 , entrada01
	syscall 
	
	#Leitura valor 1
	li $v0 , 5
	syscall
	add $t0 , $v0 , 0 #Cópia do valor de v0
	
	#Recebendo valor 2
	li $v0 , 4
	la $a0 , entrada02
	syscall
	
	#Leitura valor 2
	li $v0 , 5
	syscall
	add $t1 , $v0 , 0 #Cópia do valor de v0
	
	#Se valor 2 for diferente de 0
	bne $t1 , 0 , entao
	j main
	
entao:
	div $s0 , $t0 , $t1 # valor1/valor2
	
	#Saída
	li $v0 , 1
	add $a0 , $s0 , 0
	syscall
	
	j fimse #Pula
fimse:
	
