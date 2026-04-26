.data
	entrada: .asciiz "\nDigite um numero: "
	saida01: .asciiz "\n numeros de 0-25 = "
	saida02: .asciiz "\n numeros de 26-50 = "
	saida03: .asciiz "\n numeros de 51-75 = "
	saida04: .asciiz "\n numeros de 76-100 = "
.text
main:
	li $t1 , 0 #CONT 1
	li $t2 , 0 #CONT 2
	li $t3 , 0 #CONT 3
	li $t4 , 0 #CONT 4
	
loop:
	#Recebendo o numero
	li $v0 , 4
	la $a0 , entrada
	syscall 
	
	#Leitura do numero
	li $v0 , 5
	syscall
	add $s0 , $v0 , 0 #Cópia do valor de v0
	
	bltz $s0 , fimloop #Encerra
	
	ble $s0 , 25 , cont1 #Incrementa o contador 1 (0-25)
	
	ble $s0 , 50 , cont2 #Incrementa o contador 2 (26-50)
	
	ble $s0 , 75 , cont3 #Incrementa o contador 3 (51-75)
	
	ble $s0 , 100 , cont4 #Incrementa o contador 4 (76-100)
	
	j loop 
	
cont1: 
	addi $t1 , $t1 , 1
	j loop
	
cont2: 
	addi $t2 , $t2 , 1
	j loop
	
cont3: 
	addi $t3 , $t3 , 1
	j loop
	
cont4: 
	addi $t4 , $t4 , 1
	j loop
	
fimloop:
	#Saída primeiro laço
	li $v0 , 4
	la $a0 , saida01
	syscall
	li $v0 , 1 
	add $a0 , $zero , $t1
	syscall
	
	#Saída segundo laço
	li $v0 , 4
	la $a0 , saida02
	syscall
	li $v0 , 1 
	add $a0 , $zero , $t2
	syscall
	
	#Saída terceiro laço
	li $v0 , 4
	la $a0 , saida03
	syscall
	li $v0 , 1 
	add $a0 , $zero , $t3
	syscall
	
	#Saída quarto laço
	li $v0 , 4
	la $a0 , saida04
	syscall
	li $v0 , 1 
	add $a0 , $zero , $t4
	syscall