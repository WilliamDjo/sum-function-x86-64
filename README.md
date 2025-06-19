# Sum Function in x86-64 Assembly

A simple assembly function that calculates the sum of integers from 1 to n, callable from C code.

## Overview

This mini project implements `sum_to_n(n)` in x86-64 assembly language using NASM syntax. The function takes an integer parameter and returns the sum of all integers from 1 to n inclusive.

**Example:**

- `sum_to_n(3)` returns `6` (1 + 2 + 3)
- `sum_to_n(5)` returns `15` (1 + 2 + 3 + 4 + 5)

## Files

- `sum_function.asm` - Assembly implementation using simple loop approach
- `test.c` - C test program with assertions
- `README.md` - This file

## Algorithm

The function uses a basic loop approach:

1. Initialize sum = 0, counter = 1
2. While counter ≤ n:
   - Add counter to sum
   - Increment counter
3. Return sum

## Assembly Code Structure

```assembly
sum_to_n:
    push rbp            ; Function prologue
    mov rbp, rsp        ; Set up stack frame

    cmp edi, 0          ; Check if n <= 0
    jle return_zero     ; Return 0 for invalid input

    mov eax, 0          ; sum = 0
    mov ecx, 1          ; counter = 1

loop_start:
    cmp ecx, edi        ; Compare counter with n
    jg loop_end         ; Exit if counter > n
    add eax, ecx        ; sum += counter
    inc ecx             ; counter++
    jmp loop_start      ; Continue loop

loop_end:
    pop rbp             ; Function epilogue
    ret                 ; Return sum in eax
```

## Key Concepts Demonstrated

- **Function calling conventions**: Parameter in `edi`, return value in `eax`
- **Stack frame management**: `push rbp; mov rbp, rsp` setup
- **Loop implementation**: Using labels, conditional jumps, and unconditional jumps
- **Register usage**: Different registers for different purposes
- **Edge case handling**: Returning 0 for invalid input

## Building and Running

### Compile Assembly and C Code

```bash
# Run make file
make
```

### Expected Output

```
OK
```

## Test Cases

The C test program verifies:

- `sum_to_n(0) == 0`
- `sum_to_n(1) == 1`
- `sum_to_n(3) == 6`
- `sum_to_n(10) == 55`
- `sum_to_n(1000) == 500500`

## Learning Objectives

This project teaches:

- Basic x86-64 assembly syntax and structure
- Function prologue/epilogue patterns
- Parameter passing and return values
- Loop implementation in assembly
- Interfacing assembly code with C
- Register usage and calling conventions

## Platform Requirements

- **macOS** with x86-64 architecture
- **NASM** assembler
- **GCC** compiler
- Uses macOS calling conventions and system call numbers
