// Pseudocode
// for(int i = 0; i < 100; ++1)
//    // A
// // B
// This program increases the value of R0 by 100 (or loop count)

    @99
    D = A       // I am guessing the compiler takes care of coming
                // up with the value 99 in this particular case
    @i
    M = D

(FOR)
    @i
    D = M

    @ENDFOR
    D; JEQ

    D = D - 1

    @i
    M = D

    @R0
    M = M + 1

    @FOR
    0; JMP

(ENDFOR)
    @ENDFOR
    0; JMP


