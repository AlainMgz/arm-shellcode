.global _start      // Provide starting address to the linker
.align 4            // 2^4 bytes alignement, useful for function programming, can also be 2 or 3

// Syscall description in xnu/bsd/kern/syscalls.master
_start: mov x0, #1         // 1 = stdout
        adr x1, helloworld // load the address of helloworld into x1
        mov x2, #17        // string length into x2
        mov x16, #4        // write syscall number is 4, register to write syscall code is 16 -> osfmk/arm64/proc_reg.h#L2212
        svc #0x80          // According to arm documentation, the imm16 is ignored by the processor, so we can pass what we want.
                           // I haven't found a place in XNU where this value is read. Values like 0, 1 and 42 all work.
                           // I guess I will use 0x80 because it seems to be the standard.

// Now exit the program
        mov x0, #0         // return 0-like
        mov x16, #1        // exit syscall code is 1
        svc #0x80

helloworld: .asciz "Hello, Aarch64!\n"
