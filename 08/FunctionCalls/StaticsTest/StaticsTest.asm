@256
D = A
@SP
M = D
// call Sys.init 0
@RET-4
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
(RET-4)
// ~call Sys.init 0
// function Class1.set 0
(Class1.set)
// ~function Class1.set 0

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
// pop static 0
@SP
M = M - 1
A = M
D = M
@Class1.0
M = D
// ~pop static 0
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
// pop static 1
@SP
M = M - 1
A = M
D = M
@Class1.1
M = D
// ~pop static 1
// push constant 0
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 0
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
// function Class1.get 0
(Class1.get)
// ~function Class1.get 0

// push static 0
@Class1.0
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push static 0
// push static 1
@Class1.1
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

// push constant 6
@6
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 6
// push constant 8
@8
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 8
// call Class1.set 2
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
@2
D = D - A
@ARG
M = D
@SP
D = M
@LCL
M = D
@Class1.set
0; JMP
(RET-0)
// ~call Class1.set 2
// pop temp 0
// pop R5
@SP
M = M - 1
A = M
D = M
@R5
M = D
// ~pop R5
// ~pop temp 0
// push constant 23
@23
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 23
// push constant 15
@15
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 15
// call Class2.set 2
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
@2
D = D - A
@ARG
M = D
@SP
D = M
@LCL
M = D
@Class2.set
0; JMP
(RET-1)
// ~call Class2.set 2
// pop temp 0
// pop R5
@SP
M = M - 1
A = M
D = M
@R5
M = D
// ~pop R5
// ~pop temp 0
// call Class1.get 0
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
@0
D = D - A
@ARG
M = D
@SP
D = M
@LCL
M = D
@Class1.get
0; JMP
(RET-2)
// ~call Class1.get 0
// call Class2.get 0
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
@Class2.get
0; JMP
(RET-3)
// ~call Class2.get 0
// label WHILE
(WHILE)
// ~label WHILE
// goto WHILE
@WHILE
0; JMP
// ~goto WHILE
// function Class2.set 0
(Class2.set)
// ~function Class2.set 0

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
// pop static 0
@SP
M = M - 1
A = M
D = M
@Class2.0
M = D
// ~pop static 0
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
// pop static 1
@SP
M = M - 1
A = M
D = M
@Class2.1
M = D
// ~pop static 1
// push constant 0
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 0
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
// function Class2.get 0
(Class2.get)
// ~function Class2.get 0

// push static 0
@Class2.0
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push static 0
// push static 1
@Class2.1
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
