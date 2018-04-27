@256
D = A
@SP
M = D
// call Sys.init 0
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
@Sys.init
0; JMP
(RET-2)
// ~call Sys.init 0
// function Sys.init 0
(Sys.init)
// ~function Sys.init 0

// push constant 4000
@4000
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 4000
// pop pointer this
@SP
M = M - 1
A = M
D = M
@THIS
M = D
// ~pop pointer this
// push constant 5000
@5000
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 5000
// pop pointer that
@SP
M = M - 1
A = M
D = M
@THAT
M = D
// ~pop pointer that
// call Sys.main 0
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
@0
D = D - A
@ARG
M = D
@SP
D = M
@LCL
M = D
@Sys.main
0; JMP
(RET-0)
// ~call Sys.main 0
// pop temp 1
// pop R6
@SP
M = M - 1
A = M
D = M
@R6
M = D
// ~pop R6
// ~pop temp 1
// label LOOP
(LOOP)
// ~label LOOP
// goto LOOP
@LOOP
0; JMP
// ~goto LOOP
// function Sys.main 5
(Sys.main)
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
// push constant 0
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 0
// ~function Sys.main 5

// push constant 4001
@4001
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 4001
// pop pointer this
@SP
M = M - 1
A = M
D = M
@THIS
M = D
// ~pop pointer this
// push constant 5001
@5001
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 5001
// pop pointer that
@SP
M = M - 1
A = M
D = M
@THAT
M = D
// ~pop pointer that
// push constant 200
@200
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 200
// pop local 1
@SP
M = M - 1
A = M
D = M
@R13
M = D
@1
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
// ~pop local 1
// push constant 40
@40
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 40
// pop local 2
@SP
M = M - 1
A = M
D = M
@R13
M = D
@2
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
// ~pop local 2
// push constant 6
@6
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 6
// pop local 3
@SP
M = M - 1
A = M
D = M
@R13
M = D
@3
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
// ~pop local 3
// push constant 123
@123
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 123
// call Sys.add12 1
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
@Sys.add12
0; JMP
(RET-1)
// ~call Sys.add12 1
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
// push local 2
@2
D = A
@LCL
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push local 2
// push local 3
@3
D = A
@LCL
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push local 3
// push local 4
@4
D = A
@LCL
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push local 4
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
// function Sys.add12 0
(Sys.add12)
// ~function Sys.add12 0

// push constant 4002
@4002
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 4002
// pop pointer this
@SP
M = M - 1
A = M
D = M
@THIS
M = D
// ~pop pointer this
// push constant 5002
@5002
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 5002
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
// push constant 12
@12
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 12
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
