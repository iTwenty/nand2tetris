// Pseudocode
// if (i == 0)
//     // A
// else if (i > 0)
//     // B
// else
//     // C
//
// This program fills R0 with 0 for A, 1 for B and 2 for C.

    @i
    D = M

    @A
    D; JEQ

    @B
    D; JGT

(C)
    @2
    D = A

    @R0
    M = D

    @ENDIF
    0; JMP

(A)
    @0
    D = A

    @R0
    M = D

    @ENDIF
    0; JMP
(B)
    @1
    D = A

    @R0
    M = D

    @ENDIF
    0; JMP

(ENDIF)
    @ENDIF
    0; JMP