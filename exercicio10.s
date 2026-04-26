.data
	entrada01: .asciiz "\nDigite A: "
	entrada02: .asciiz "\nDigite B: "
	saida01: .asciiz "\nO resultado é: "
	saida02: .asciiz "\nO resto da divisao é: "
	
.text
main:
	#Recebendo A
	li $v0 , 4
	la $a0 , entrada01
	syscall 
	
	#Leitura A
	li $v0 , 5
	syscall
	add $t0 , $v0 , 0 #Cópia do valor de v0
	
	#Recebendo B
	li $v0 , 4
	la $a0 , entrada02
	syscall
	
	#Leitura B
	li $v0 , 5
	syscall
	add $t1 , $v0 , 0 #Cópia do valor de v0
	
	#Se A>B
	bge $t0 , $t1 , entao
	j senao
	
entao:
	div $t2 , $t0 , $t1 # A/B
	mul $t3 , $t2 , $t1 # RESUL * MENOR
	sub $t4 , $t0 , $t3 # RESUL.MUL - MAIOR
	
	#Saída parte inteira
	li $v0 , 4
	la $a0 , saida01
	syscall
	li $v0 , 1 
	add $a0 , $zero , $t2
	syscall
	
	#Saída do resto
	li $v0 , 4
	la $a0 , saida02
	syscall
	li $v0 , 1 
	add $a0 , $zero , $t4
	syscall
	
	j fimse #Pula
senao:
	div $t2 , $t1 , $t0 # B/A
	mul $t3 , $t2 , $t0 # RESUL * MENOR
	sub $t4 , $t1 , $t3 # RESUL.MUL - MAIOR
	
	#Saída parte inteira
	li $v0 , 4
	la $a0 , saida01
	syscall
	li $v0 , 1 
	add $a0 , $zero , $t2
	syscall
	
	#Saída do resto
	li $v0 , 4
	la $a0 , saida02
	syscall
	li $v0 , 1 
	add $a0 , $zero , $t4
	syscall
	
	j fimse #Pula
	
fimse: