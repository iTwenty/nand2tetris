// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

    @R2
    M = 0       // M[2] stores the result of mult. Init with 0

    @R0
    D = M
    @i
    M = D       // M[i] = M[1]. M[i] is the loop var

(LOOP)
    @i
    D = M

    @END
    D; JEQ      // if M[i] is 0, go to END

    @R1
    D = M

    @R2
    M = D + M   // M[2] = M[1] + M[2]

    @i
    M = M - 1   // M[i] = M[i] - 1

    @LOOP
    0; JMP      // go to LOOP

(END)
    @END
    0; JMP
