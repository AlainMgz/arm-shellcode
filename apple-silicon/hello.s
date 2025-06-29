.global _start      // Provide starting address to the linker
.align 4            // Proper alignement

// Syscall description in xnu/bsd/kern/syscalls.master
_start: mov x0, #1         // 1 = stdout
        adr x1, helloworld // load the address of helloworld into x1
        mov x2, #17        // string length into x2
        mov x16, #4        // write syscall number is 4, register to write syscall code is 16 -> xnu/osfmk/arm64/proc_reg.h#L2212
        svc #0x80          // 0x80000000 from xnu/osfmk/arm64/proc_reg.h#L2210

// Now exit the program
        mov x0, #0         // return 0-like
        mov x16, #1        // exit syscall code is 1
        svc #0x80

helloworld: .ascii "Hello, Aarch64!\n\0"
