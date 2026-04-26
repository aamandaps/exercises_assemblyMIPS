.data
	entrada01: .asciiz "\nDigite A: "
	entrada02: .asciiz "\nDigite B: "
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
	
	#Se A=B
	beq $t0 , $t1 , entao
	j senao
	
entao:
	add $s0 , $t0 , $t1 #A+B
	
	#Saída
	li $v0 , 1
	add $a0 , $s0 , 0
	syscall
	
	j fimse #Pula
	
senao:
	mul $s0 , $t0 , $t1 #A*B
	#Saída
	li $v0 , 1
	add $a0 , $s0 , 0
	syscall
	
	j fimse #Pula

fimse:
