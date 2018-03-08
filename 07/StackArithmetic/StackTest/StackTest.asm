// push constant 17
@17
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 17
// push constant 17
@17
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 17
// eq
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
@IF-EQ-0
D; JEQ
// push constant 0
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 0
@END-EQ-0
0; JMP
(IF-EQ-0)
// push constant -1
@SP
A = M
M = -1
@SP
M = M + 1
// ~push constant -1
(END-EQ-0)
// ~eq
// push constant 17
@17
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 17
// push constant 16
@16
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 16
// eq
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
@IF-EQ-1
D; JEQ
// push constant 0
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 0
@END-EQ-1
0; JMP
(IF-EQ-1)
// push constant -1
@SP
A = M
M = -1
@SP
M = M + 1
// ~push constant -1
(END-EQ-1)
// ~eq
// push constant 16
@16
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 16
// push constant 17
@17
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 17
// eq
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
@IF-EQ-2
D; JEQ
// push constant 0
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 0
@END-EQ-2
0; JMP
(IF-EQ-2)
// push constant -1
@SP
A = M
M = -1
@SP
M = M + 1
// ~push constant -1
(END-EQ-2)
// ~eq
// push constant 892
@892
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 892
// push constant 891
@891
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 891
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
@IF-LT-3
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
@END-LT-3
0; JMP
(IF-LT-3)
// push constant -1
@SP
A = M
M = -1
@SP
M = M + 1
// ~push constant -1
(END-LT-3)
// ~lt
// push constant 891
@891
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 891
// push constant 892
@892
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 892
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
@IF-LT-4
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
@END-LT-4
0; JMP
(IF-LT-4)
// push constant -1
@SP
A = M
M = -1
@SP
M = M + 1
// ~push constant -1
(END-LT-4)
// ~lt
// push constant 891
@891
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 891
// push constant 891
@891
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 891
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
@IF-LT-5
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
@END-LT-5
0; JMP
(IF-LT-5)
// push constant -1
@SP
A = M
M = -1
@SP
M = M + 1
// ~push constant -1
(END-LT-5)
// ~lt
// push constant 32767
@32767
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 32767
// push constant 32766
@32766
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 32766
// gt
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
@IF-GT-6
D; JGT
// push constant 0
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 0
@END-GT-6
0; JMP
(IF-GT-6)
// push constant -1
@SP
A = M
M = -1
@SP
M = M + 1
// ~push constant -1
(END-GT-6)
// ~gt
// push constant 32766
@32766
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 32766
// push constant 32767
@32767
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 32767
// gt
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
@IF-GT-7
D; JGT
// push constant 0
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 0
@END-GT-7
0; JMP
(IF-GT-7)
// push constant -1
@SP
A = M
M = -1
@SP
M = M + 1
// ~push constant -1
(END-GT-7)
// ~gt
// push constant 32766
@32766
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 32766
// push constant 32766
@32766
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 32766
// gt
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
@IF-GT-8
D; JGT
// push constant 0
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 0
@END-GT-8
0; JMP
(IF-GT-8)
// push constant -1
@SP
A = M
M = -1
@SP
M = M + 1
// ~push constant -1
(END-GT-8)
// ~gt
// push constant 57
@57
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 57
// push constant 31
@31
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 31
// push constant 53
@53
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 53
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
// push constant 112
@112
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 112
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
// neg
// pop R13
@SP
M = M - 1
A = M
D = M
@R13
M = D
// ~pop R13
M = -M
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
// ~neg
// and
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
M = D & M
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
// ~and
// push constant 82
@82
D = A
@SP
A = M
M = D
@SP
M = M + 1
// ~push constant 82
// or
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
M = D | M
// push R13
@R13
D = M
@SP
A = M
M = D
@SP
M = M + 1
// ~push R13
// ~or
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
