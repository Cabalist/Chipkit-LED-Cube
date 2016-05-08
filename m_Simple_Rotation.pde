/* * 8X8X8 RGB QUBE SOFTWARE - Code to control the SuperTech-IT 8x8x8 RGB LED Cube
 * Copyright (C) 2014, 2015, 2016 Doug Domke, Norman Skinner
 *
 * This file is part of 8X8X8 RGB QUBE SOFTWARE.
 *
 * 8X8X8 RGB QUBE SOFTWARE is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * 8X8X8 RGB QUBE SOFTWARE is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with 8X8X8 RGB QUBE SOFTWARE.  If not, see <http://www.gnu.org/licenses/>.
 */

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


