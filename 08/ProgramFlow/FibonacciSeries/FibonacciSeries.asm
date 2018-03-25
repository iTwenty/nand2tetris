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
// pop pointer that
@SP
M = M - 1
A = M
D = M
@THAT
M = D
// ~pop pointer that
// push constant 0
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 0
// pop that 0
@SP
M = M - 1
A = M
D = M
@R13
M = D
@0
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
// ~pop that 0
// push constant 1
@1
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 1
// pop that 1
@SP
M = M - 1
A = M
D = M
@R13
M = D
@1
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
// ~pop that 1
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
// push constant 2
@2
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 2
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
// label MAIN_LOOP_START
(MAIN_LOOP_START)
// ~label MAIN_LOOP_START
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
// if-goto COMPUTE_ELEMENT
@SP
M = M - 1
A = M
D = M
@COMPUTE_ELEMENT
D; JNE
// ~if-goto COMPUTE_ELEMENT
// goto END_PROGRAM
@END_PROGRAM
0; JMP
// ~goto END_PROGRAM
// label COMPUTE_ELEMENT
(COMPUTE_ELEMENT)
// ~label COMPUTE_ELEMENT
// push that 0
@0
D = A
@THAT
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push that 0
// push that 1
@1
D = A
@THAT
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push that 1
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
// push pointer that
@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push pointer that
// push constant 1
@1
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 1
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
// pop pointer that
@SP
M = M - 1
A = M
D = M
@THAT
M = D
// ~pop pointer that
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
// goto MAIN_LOOP_START
@MAIN_LOOP_START
0; JMP
// ~goto MAIN_LOOP_START
// label END_PROGRAM
(END_PROGRAM)
// ~label END_PROGRAM
