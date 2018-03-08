// push constant 7
@7
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 7
// push constant 8
@8
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 8
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
@R13
D = M
@R14
M = D + M
// push R14
@R14
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R14
// ~add
