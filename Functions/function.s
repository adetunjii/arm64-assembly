.global _main
.align 4

_main:
    bl hello_function               ; branch with link. At this point PC + 4 is stored in the LR

    // basically quit the program once the function has returned
    mov x0, #0                      ; arg[0] return code. This is the return point of the function call i.e PC is pointing to this
    mov x2, #0
    add x2, x2, #1
    mov x16, #1                       
    svc #0x80

hello_function:
    mov    x8, #0x480A
    movk   x8, #0x6C65,   lsl#16
    movk   x8, #0x6F6C,   lsl#32
    movk   x8, #0x7720,   lsl#48
    mov    x9, #0x726F
    movk   x9, #0x646C,   lsl#16
    movk   x9, #0x21,     lsl#32
    stp    x8, x9, [SP, #-16]!               ; push data in x8 and x9 to stack
    mov    x2, xzr    
loop:
    cmp x2, #15
    b.HS endloop
    add x2, x2, #1
    mov x0, #1                              ; arg[0] - stdout
    mov x1, SP                              ; point x1 to the output string which is in SP
    mov x16, #4                             ; unix syscall to write to a destination
    svc #0x80
    b loop
endloop:
   ret                                       ; all the code from line 12 the return point is treated as part of the function