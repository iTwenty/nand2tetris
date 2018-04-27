// function SimpleFunction.test 2
// push constant 0
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 0
// push constant 0
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 0
// ~function SimpleFunction.test 2

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
// push local 1
@1
D = A
@LCL
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push local 1
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
// not
// pop R13
@SP
M = M - 1
A = M
D = M
@R13
M = D
// ~pop R13
M = !M
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
// ~not
// push argument 0
@0
D = A
@ARG
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push argument 0
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
// return
@LCL
D = M
@R13
M = D
@R14
M = D
@5
D = A
@R14
M = M - D
A = M
D = M
@R14
M = D
// pop R15
@SP
M = M - 1
A = M
D = M
@R15
M = D
// ~pop R15
@R15
D = M
@ARG
A = M
M = D
@ARG
D = M + 1
@SP
M = D
@4
D = A
@R13
M = M - D
A = M
D = M
@LCL
M = D
@R13
M = M + 1
A = M
D = M
@ARG
M = D
@R13
M = M + 1
A = M
D = M
@THIS
M = D
@R13
M = M + 1
A = M
D = M
@THAT
M = D
@R14
A = M
0; JMP
// ~return
