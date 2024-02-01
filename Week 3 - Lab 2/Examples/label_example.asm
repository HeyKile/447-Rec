# macro from lab 2
# preserves a0, v0
.macro print_str %str
	.data
	print_str_message: .asciiz %str
	.text
	push a0
	push v0
	la a0, print_str_message
	li v0, 4
	syscall
	pop v0
	pop a0
.end_macro

.data
	i: .word 0
.text

.global main
main:
	
	_loop:
		
		# if (i % 2 == 0)
		lw t0, i
		rem v0, t0, 2
		beq v0, 0, _even
		
		# i is odd
		_odd:
			print_str "Odd\n"
			j _incrament
		
		# i is even
		_even:
			print_str "Even\n"
		
		# i++
		_incrament:
			# i++
			lw v0, i
			addi v0, v0, 1
			sw v0, i
			
		# break when i == 10
		lw v0, i
		beq v0, 10, _exit
	
		j _loop
	
	_exit:
		li v0, 10
		syscall
	