/* This method of rotation is simple in concept, though a little messy to implement. It rotates a
   single plane around in the cube.  This single is initially placed on the diagonal. It uses the table
   below (called table) to determine the position of y for each x though a simple 45 degree transition
   The table is used in reverse to get through the next 45 degrees.  These steps need to be repeated
   a total of 8 times to get through a full rotation.  This method has as its advantage that it's very
   fast. Its disadvantage is that the pattern being displayed is much wider on the diagonal than it is
   when on a face of the cube.  */

void simple_rotation(int rotations, int mydelay) {
    // This is a pattern to be rotated. It can be anything fitting in an 8x8 panel.
    // This one is a simple red arrow.
    int const myPattern[8][8] = {
            {Black, Black, Black, Black, Black, Black, Black, Black,},
            {Black, Black, Red,   Red,   Black, Black, Black, Black,},
            {Black, Red,   Red,   Black, Black, Black, Black, Black,},
            {Red,   Red,   Red,   Red,   Red,   Red,   Red,   Red,},
            {Red,   Red,   Red,   Red,   Red,   Red,   Red,   Red,},
            {Black, Red,   Red,   Black, Black, Black, Black, Black,},
            {Black, Black, Red,   Red,   Black, Black, Black, Black,},
            {Black, Black, Black, Black, Black, Black, Black, Black,},
    };
    // This is the table that tells Y how to move for each X as we move though 45 degrees.
    int const table[32] = {0, 1, 2, 3, 4, 5, 6, 7, 1, 1, 2, 3, 4, 5, 6, 6, 2, 2, 3, 3, 4, 4, 5, 5, 3, 3, 3, 3, 4, 4, 4, 4};

    for (int x = 0; x < rotations; x++) {  // move first 45 degrees
        for (int count = 0; count < 4; count++) {
            for (int layer = 0; layer < 8; layer++) {
                for (int x = 0; x < 8; x++) {
                    getColor(myPattern[layer][x], 4);
                    LED(x, table[count * 8 + x], layer, myred, mygreen, myblue);
                }
            }
            delay(mydelay);
            clearCube();
        }

        for (int count = 0; count < 4; count++) {  // move second 45 degrees
            for (int layer = 0; layer < 8; layer++) {
                for (int x = 0; x < 8; x++) {
                    getColor(myPattern[layer][x], 4);
                    LED(x, table[31 - (count * 8 + x)], layer, myred, mygreen, myblue);
                }
            }
            delay(mydelay);
            clearCube();
        }

        for (int count = 1; count < 4; count++) {  // move third 45 degrees
            for (int layer = 0; layer < 8; layer++) {
                for (int x = 0; x < 8; x++) {
                    getColor(myPattern[layer][x], 4);
                    LED(table[count * 8 + x], 7 - x, layer, myred, mygreen, myblue);
                }
            }
            delay(mydelay);
            clearCube();
        }

        for (int count = 0; count < 3; count++) {  // move fourth 45 degrees
            for (int layer = 0; layer < 8; layer++) {
                for (int x = 0; x < 8; x++) {
                    getColor(myPattern[layer][x], 4);
                    LED(table[31 - (count * 8 + x)], 7 - x, layer, myred, mygreen, myblue);
                }
            }
            delay(mydelay);
            clearCube();
        }

        for (int count = 0; count < 4; count++) {  // move fifth 45 degrees
            for (int layer = 0; layer < 8; layer++) {
                for (int x = 0; x < 8; x++) {
                    getColor(myPattern[layer][7 - x], 4);
                    LED(x, table[count * 8 + x], layer, myred, mygreen, myblue);
                }
            }
            delay(mydelay);
            clearCube();
        }

        for (int count = 1; count < 4; count++) {  // move sixth 45 degrees
            for (int layer = 0; layer < 8; layer++) {
                for (int x = 0; x < 8; x++) {
                    getColor(myPattern[layer][7 - x], 4);
                    LED(x, table[31 - (count * 8 + x)], layer, myred, mygreen, myblue);
                }
            }
            delay(mydelay);
            clearCube();
        }

        for (int count = 1; count < 4; count++) {  // move seventh 45 degrees
            for (int layer = 0; layer < 8; layer++) {
                for (int x = 0; x < 8; x++) {
                    getColor(myPattern[layer][7 - x], 4);
                    LED(table[count * 8 + x], 7 - x, layer, myred, mygreen, myblue);
                }
            }
            delay(mydelay);
            clearCube();
        }

        for (int count = 0; count < 3; count++) {  // move last 45 degrees
            for (int layer = 0; layer < 8; layer++) {
                for (int x = 0; x < 8; x++) {
                    getColor(myPattern[layer][7 - x], 4);
                    LED(table[31 - (count * 8 + x)], 7 - x, layer, myred, mygreen, myblue);
                }
            }
            delay(mydelay);
            clearCube();
        }
    }
}


