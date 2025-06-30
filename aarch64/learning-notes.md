# ARM aarch64 learning notes

- There is no `pc` in aarch64. To access the address of the current instruction use `adr x0, .`. This also works with offsets: `adr x0, . + 8`.
- For some reason `add xN, xzr, #imm` does not compile and throws "invalid operand", need to dig out why.
