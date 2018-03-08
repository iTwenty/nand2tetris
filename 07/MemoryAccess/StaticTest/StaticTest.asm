// push constant 111
@111
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 111
// push constant 333
@333
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 333
// push constant 888
@888
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 888
// pop static 8
@SP
M = M - 1
A = M
D = M
@StaticTest.8
M = D
// ~pop static 8
// pop static 3
@SP
M = M - 1
A = M
D = M
@StaticTest.3
M = D
// ~pop static 3
// pop static 1
@SP
M = M - 1
A = M
D = M
@StaticTest.1
M = D
// ~pop static 1
// push static 3
@StaticTest.3
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push static 3
// push static 1
@StaticTest.1
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push static 1
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
// push static 8
@StaticTest.8
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push static 8
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
