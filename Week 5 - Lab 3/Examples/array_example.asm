# let's declare an array of ints
.eqv ARR_LEN 5
.data
    arr:    .word 0,1,2,3,4 # declares an array of len 5


    # to index an array of ints (word), need to move the size of 1 int (word) in memory!
    # in this case, each int takes up 4 bytes of memory

    # if arr is at address 0x00000000...
    # arr[0] is at 0x00000000
    # arr[1] is at 0x00000004 (an int is 4 bytes!)
    # arr[2] is at 0x00000008
    # arr[3] is at 0x0000000C
    # arr[4] is at 0x00000010
.text
.global main
main:

    #longer syntax
    la t1, arr # t1 = arr[0]
    li t0, 0 # i = 0
    _loop:
    	
        bge t0, ARR_LEN, _break # if (i >= arr_len) break;

        # index = sizeof(word) * i
        mul t2, t0, 4 # word is 4 bytes
        add t2, t1, t2 # t2= arr[index]

        # print(arr[index])
        lw a0, (t2)
        li v0, 1
        syscall

        addi t0, t0, 1 # i++
        j _loop
    _break:

    #shorter syntax
    li t0, 0 # i = 0
    _loop2:

        bge t0, ARR_LEN _exit

        # a0 = arr[i]
        mul t1, t0, 4
        lw a0, arr(t1)

        # print(arr[i])
        li v0, 1
        syscall
        
        addi t0, t0, 1
        
        j _loop2

    _exit:
        li v0, 10
        syscall
