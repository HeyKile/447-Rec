# dot (.) notation allows us to define different sections of our
# assembly program

# .data is used for defining variables
.data
    my_global:  .word 0 # global data variable

# .text defines where the code starts 
# .global or .globl define a global label
# global labels are visible everywhere, including to other asm
# programs
.text
.global main 
main:
    # main code...