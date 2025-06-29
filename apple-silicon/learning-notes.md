# ARM64 Assembly on Apple Silicon learning notes

### The XNU Repository
The main official source of information is the open source part of [XNU](https://github.com/apple-oss-distributions/xnu/tree/main) kernel itself. Specifically here is a list of useful information and their locations in the `xnu` repository:
- [ Syscall codes and descriptions ](https://github.com/apple-oss-distributions/xnu/blob/main/bsd/kern/syscalls.master)
- Information about [ processor registers ](https://github.com/apple-oss-distributions/xnu/blob/main/osfmk/arm64/proc_reg.h)

### `lldb` debugger
The most commonly used tool to debug executables on macOS and iOS is `lldb`, here are some useful commands:
- Set a breakpoint at an address: `breakpoint set --address 0x12345678`
- Get register info: `register read`
