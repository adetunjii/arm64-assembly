// Simple Hello world Program
// 
// Registers X0-X2 -> hold parameters to unix syscalls
// Register X16 -> Holds the System Call function number
// This system call function number is used to specify exactly what we want the OS kernel to do
// When the supervisor mode is active, the OS takes over, reads the number in the x16 register, 
// compares the number to it's internal lookup table and executes the appropriate function with the
// data from X0-X2 as arguments

// .align specifies the number of bytes (usually a power of 2) in which data is written to memory and read by the processor
// This ensures that the processor is able to read data in an efficient and performant way. 
// In simpler terms, it's just the arrangement of data in memory and how it is accessed. 
// Ex: if .align is set to 4 bytes, data is read from the memory in 4 bytes chunks and also data is written into memory in 4 bytes chunks



.global _main                                       // provides the program entry point to linker
.align 4                                            // specifies the memory address alignment to optimize memory access and improve performance 
_main:                                              // label _main is synonymous to a function in higher level programming languages. It allows you to specify a section of code for execution
    mov X0, #1                                      // copy the destination of the output to register X0, 1 = StdOut 
    adr X1, helloworld                              // copies the address of the output string to register X1
    mov X2, #14                                     // length of the string
    mov X16, #4                                     // Unix system call to write
    svc #0x80                                       // call the OS kernel to execute 

    mov X0, #0                                      // 0 to return code
    mov X16, #1                                     // Unix system call to exit the program

    svc #0x80                                       // call the kernel to terminate the program


helloworld:    .ascii  "Hello World!\n"
