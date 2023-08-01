.global _main
.align 4

_main:
    mov x2, xzr         ; start the count of the string at 0

loop:
    cmp x2, #15         ; check to see if value of x2 > 16
    b.HS endloop        ; if higher or same, jump to endloop
    add x2, x2, #1       ; increment count by 1
    mov x0, #1          ; arg[0] - stdout
    adr x1, helloworld  ; copy the offset of helloworld into register x1
    mov x16, #4         ; Unix system call to write
    svc #0x80   
    b loop              ; continue loop if condition is not met
endloop:
    mov x0, #0
    mov x16, #1
    svc #0x80

helloworld:     .ascii "\nHello world! \n"