@256
D = A
@SP
M = D
// call Sys.init 0
@RET-3
D = A
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@LCL
D = M
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@ARG
D = M
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@THIS
D = M
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@THAT
D = M
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@SP
D = M
@5
D = D - A
@0
D = D - A
@ARG
M = D
@SP
D = M
@LCL
M = D
@Sys.init
0; JMP
(RET-3)
// ~call Sys.init 0
// function Main.fibonacci 0
(Main.fibonacci)
// ~function Main.fibonacci 0

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
// lt
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
D = D - M
@IF-LT-0
D; JLT
// push constant 0
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 0
@END-LT-0
0; JMP
(IF-LT-0)
// push constant -1
@SP
A = M
M = -1
@SP
M = M + 1
// ~push constant -1
(END-LT-0)
// ~lt
// if-goto IF_TRUE
@SP
M = M - 1
A = M
D = M
@IF_TRUE
D; JNE
// ~if-goto IF_TRUE
// goto IF_FALSE
@IF_FALSE
0; JMP
// ~goto IF_FALSE
// label IF_TRUE
(IF_TRUE)
// ~label IF_TRUE
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
// label IF_FALSE
(IF_FALSE)
// ~label IF_FALSE
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
// call Main.fibonacci 1
@RET-0
D = A
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@LCL
D = M
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@ARG
D = M
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@THIS
D = M
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@THAT
D = M
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@SP
D = M
@5
D = D - A
@1
D = D - A
@ARG
M = D
@SP
D = M
@LCL
M = D
@Main.fibonacci
0; JMP
(RET-0)
// ~call Main.fibonacci 1
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
// call Main.fibonacci 1
@RET-1
D = A
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@LCL
D = M
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@ARG
D = M
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@THIS
D = M
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@THAT
D = M
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@SP
D = M
@5
D = D - A
@1
D = D - A
@ARG
M = D
@SP
D = M
@LCL
M = D
@Main.fibonacci
0; JMP
(RET-1)
// ~call Main.fibonacci 1
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
// function Sys.init 0
(Sys.init)
// ~function Sys.init 0

// push constant 4
@4
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 4
// call Main.fibonacci 1
@RET-2
D = A
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@LCL
D = M
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@ARG
D = M
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@THIS
D = M
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@THAT
D = M
@R13
M = D
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
@SP
D = M
@5
D = D - A
@1
D = D - A
@ARG
M = D
@SP
D = M
@LCL
M = D
@Main.fibonacci
0; JMP
(RET-2)
// ~call Main.fibonacci 1
// label WHILE
(WHILE)
// ~label WHILE
// goto WHILE
@WHILE
0; JMP
// ~goto WHILE
