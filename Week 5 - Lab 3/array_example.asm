# let's declare an array of ints
.data
    arr:   .word 0,1,2,3,4 # declares an array of len 5

    # to index an array of ints (word), need to move the size of
    # 1 int (word) in memory!
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
    