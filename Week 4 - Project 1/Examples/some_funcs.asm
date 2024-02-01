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

.global main
main:
    jal some_func
    print_str "Yup, we back here"
    

some_func:
    print_str "You're not gonna believe it, but we down here"
    jr ra

exit:
    li v0, 10
    syscall