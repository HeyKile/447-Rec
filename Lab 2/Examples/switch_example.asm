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
	input: .word 0
.text

.global main
main:
	
	_loop:
		
		# get input
	        li v0, 5
	        syscall
	        sw v0, input
	
	        # switch(input)
	        lw t0, input
	        beq t0, 1, _one # if (input == 1)
	        beq t0, 10, _ten # if (input == 10)
	        j _default
	
	        # case 1:
	        _one:
	            print_str "It's a 1\n"
	            j _exit
	
	        # case 10:
	        _ten:
	            print_str "It's a 10\n"
	            j _exit
	            
	        # default
	        _default:
	        	print_str "Not what we are looking for...\n"
	        	j _loop
		
	_exit:
		li v0, 10
		syscall
	
