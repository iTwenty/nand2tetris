// push constant 0
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 0
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
// label LOOP_START
(LOOP_START)
// ~label LOOP_START
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
// push constant 1
@1
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 1
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
// pop argument 0
@SP
M = M - 1
A = M
D = M
@R13
M = D
@0
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
// ~pop argument 0
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
// if-goto LOOP_START
@SP
M = M - 1
A = M
D = M
@LOOP_START
D; JNE
// ~if-goto LOOP_START
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
