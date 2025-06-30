# General Shellcode writing learning notes
### Common
- Since we learned that the immediate value passed to `svc` is ignored ([ ARM docs ](https://developer.arm.com/documentation/dui0489/i/arm-and-thumb-instructions/svc?lang=en)), we can pass `0xffff` to avoid null-bytes.

### `aarch64`
- To zero-out a register always use `mov xN, xzr` and not `mov xN, #0`. The former does not have null-bytes in its encoding.
- In general, using `xzr` seems OP to de-nullify a shellcode. Another example is loading a register with any immediate value. Instead of `mov xN, #imm` we can do `orr xN, xzr, #imm`.
- If a string is needed, construct it with bit-shifting (`movk xN, #imm, lsl #imm`) and push it on the stack instead of having a label and a word for it in text or data.

### `aarch32`
