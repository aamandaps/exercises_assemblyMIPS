.data
	entrada01: .asciiz "Digite o cateto B: \n"
	entrada02: .asciiz "Digite o cateto C: "
	msgsaida: .asciiz "\n A hipotenusa é aproximadamente: "
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
	
	#Cálculo da hipotenusa
	mul $t2 , $t0 , $t0
	mul $t3 , $t1 , $t1
	add $t4 , $t2 , $t3
	 
	# raiz
	li $t5,1

	loop:
	mul $t6,$t5,$t5

	beq $t6,$t4,saida
	bgt $t6,$t4,saida

	addi $t5,$t5,1
	j loop
	
saida: 
	li $v0,4
	la $a0,msgsaida
	syscall

	# numero
	li $v0,1
	add $a0,$t5,$zero
	syscall

