// push constant 3030
@3030
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 3030
// pop pointer this
@SP
M = M - 1
A = M
D = M
@THIS
M = D
// ~pop pointer this
// push constant 3040
@3040
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 3040
// pop pointer that
@SP
M = M - 1
A = M
D = M
@THAT
M = D
// ~pop pointer that
// push constant 32
@32
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 32
// pop this 2
@SP
M = M - 1
A = M
D = M
@R13
M = D
@2
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
// ~pop this 2
// push constant 46
@46
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 46
// pop that 6
@SP
M = M - 1
A = M
D = M
@R13
M = D
@6
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
// ~pop that 6
// push pointer this
@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push pointer this
// push pointer that
@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push pointer that
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
// push this 2
@2
D = A
@THIS
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push this 2
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
// push that 6
@6
D = A
@THAT
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push that 6
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
