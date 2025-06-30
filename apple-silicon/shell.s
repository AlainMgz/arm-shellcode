// shell in asm
.global _start
_start:
    adr x0,  sh_addr
    mov x1,  #0 // argp is null
    mov x2,  #0// envp is null
    mov x16, #0x3b // Syscall number 59 for execve
    svc #0x80

    mov x0,  #0
    mov x16, #1
    svc #0x80

sh_addr: .asciz "/bin/sh"
