// push constant 10
@10
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 10
// pop local 0
@SP
M = M - 1
A = M
D = M
@R13
M = D
@0
D = A
@LCL
D = D + M
@R14
M = D
@R13
D = M
@R14
A = M
M = D
// ~pop local 0
// push constant 21
@21
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 21
// push constant 22
@22
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 22
// pop argument 2
@SP
M = M - 1
A = M
D = M
@R13
M = D
@2
D = A
@ARG
D = D + M
@R14
M = D
@R13
D = M
@R14
A = M
M = D
// ~pop argument 2
// pop argument 1
@SP
M = M - 1
A = M
D = M
@R13
M = D
@1
D = A
@ARG
D = D + M
@R14
M = D
@R13
D = M
@R14
A = M
M = D
// ~pop argument 1
// push constant 36
@36
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 36
// pop this 6
@SP
M = M - 1
A = M
D = M
@R13
M = D
@6
D = A
@THIS
D = D + M
@R14
M = D
@R13
D = M
@R14
A = M
M = D
// ~pop this 6
// push constant 42
@42
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 42
// push constant 45
@45
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 45
// pop that 5
@SP
M = M - 1
A = M
D = M
@R13
M = D
@5
D = A
@THAT
D = D + M
@R14
M = D
@R13
D = M
@R14
A = M
M = D
// ~pop that 5
// pop that 2
@SP
M = M - 1
A = M
D = M
@R13
M = D
@2
D = A
@THAT
D = D + M
@R14
M = D
@R13
D = M
@R14
A = M
M = D
// ~pop that 2
// push constant 510
@510
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 510
// pop temp 6
// pop R11
@SP
M = M - 1
A = M
D = M
@R11
M = D
// ~pop R11
// ~pop temp 6
// push local 0
@0
D = A
@LCL
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push local 0
// push that 5
@5
D = A
@THAT
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push that 5
// add
// pop R13
@SP
M = M - 1
A = M
D = M
@R13
M = D
// ~pop R13
// pop R14
@SP
M = M - 1
A = M
D = M
@R14
M = D
// ~pop R14
@R14
D = M
@R13
M = D + M
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
// ~add
// push argument 1
@1
D = A
@ARG
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push argument 1
// sub
// pop R13
@SP
M = M - 1
A = M
D = M
@R13
M = D
// ~pop R13
// pop R14
@SP
M = M - 1
A = M
D = M
@R14
M = D
// ~pop R14
@R14
D = M
@R13
M = D - M
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
// ~sub
// push this 6
@6
D = A
@THIS
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push this 6
// push this 6
@6
D = A
@THIS
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push this 6
// add
// pop R13
@SP
M = M - 1
A = M
D = M
@R13
M = D
// ~pop R13
// pop R14
@SP
M = M - 1
A = M
D = M
@R14
M = D
// ~pop R14
@R14
D = M
@R13
M = D + M
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
// ~add
// sub
// pop R13
@SP
M = M - 1
A = M
D = M
@R13
M = D
// ~pop R13
// pop R14
@SP
M = M - 1
A = M
D = M
@R14
M = D
// ~pop R14
@R14
D = M
@R13
M = D - M
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
// ~sub
// push temp 6
// push R11
@R11
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R11
// ~push temp 6
// add
// pop R13
@SP
M = M - 1
A = M
D = M
@R13
M = D
// ~pop R13
// pop R14
@SP
M = M - 1
A = M
D = M
@R14
M = D
// ~pop R14
@R14
D = M
@R13
M = D + M
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
// ~add
