// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(START)

    @SCREEN
    D = A

    @cur
    M = D       // cur is a pointer to current address of screen

    @8192
    D = A

    @i
    M = D       // i is a pointer to total screen size

    @KBD
    D = M

    @WHITELOOP
    D; JEQ      // if no key pressed, paint screen white

(BLACKLOOP)     // else paint it black

    @i
    D = M

    @END
    D; JEQ      // if i is zero, we have accessed all screen addresses

    @cur
    A = M
    M = -1      // paint current screen address black

    @cur
    M = M + 1   // Increase current screen address by 1

    @i
    M = M - 1   // Decrease i by 1

    @BLACKLOOP
    0; JMP      // Unconditionally jump, start ofloop will check if i is 0

(WHITELOOP)     // paint screen white. Flow is same as for black loop

    @i
    D = M

    @END
    D; JEQ

    @cur
    A = M
    M = 0

    @cur
    M = M + 1

    @i
    M = M - 1

    @WHITELOOP
    0; JMP

(END)

    @START
    0; JMP