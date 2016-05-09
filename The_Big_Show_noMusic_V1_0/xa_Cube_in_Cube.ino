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

/*
This animation creates a whole bunch of different sprites, but only creates them very briefly 
inside a subroutine.  That way they are automatically disposed of when the sub is exited.
The displayCube sub and the bounceCube sub are where the actual sprites are created.  We use
the new .outline action of the sprite object class to create the cube outlines. 
*/
void CubeInCube() {
    for (int i = 0; i < 4; i++) {
        displayCube(6, 1, 1, 1, Blue);
        displayCube(5, 1, 1, 1, Blue + 5);
        displayCube(4, 1, 1, 1, Blue + 10);
        displayCube(3, 1, 1, 1, Blue + 15);
        displayCube(2, 1, 1, 1, Blue + 20);
        displayCube(2, 1, 1, 1, Blue + 20);
        displayCube(2, 1, 1, 1, Blue + 20);
        displayCube(3, 1, 1, 1, Blue + 15);
        displayCube(4, 1, 1, 1, Blue + 10);
        displayCube(5, 1, 1, 1, Blue + 5);
        displayCube(6, 1, 1, 1, Blue);
        displayCube(6, 1, 1, 1, Blue);
    }
    for (int i = 0; i < 4; i++) {
        displayCube(6, 1, 1, 1, Blue);
        displayCube(5, 2, 2, 1, Blue - 15);
        displayCube(4, 3, 3, 1, Blue - 30);
        displayCube(3, 4, 4, 1, Blue - 45);
        displayCube(2, 5, 5, 1, Blue - 60);
        displayCube(2, 5, 5, 1, Blue - 60);
        displayCube(2, 5, 5, 1, Blue - 60);
        displayCube(3, 4, 4, 1, Blue - 45);
        displayCube(4, 3, 3, 1, Blue - 30);
        displayCube(5, 2, 2, 1, Blue - 15);
        displayCube(6, 1, 1, 1, Blue);
        displayCube(6, 1, 1, 1, Blue);
    }
    for (int i = 0; i < 4; i++) {
        displayCube(6, 1, 1, 1, Blue);
        displayCube(5, 2, 1, 2, Blue + 15);
        displayCube(4, 3, 1, 3, Blue + 30);
        displayCube(3, 4, 1, 4, Blue + 45);
        displayCube(2, 5, 1, 5, Blue + 60);
        displayCube(2, 5, 1, 5, Blue + 60);
        displayCube(2, 5, 1, 5, Blue + 60);
        displayCube(3, 4, 1, 4, Blue + 45);
        displayCube(4, 3, 1, 3, Blue + 30);
        displayCube(5, 2, 1, 2, Blue + 15);
        displayCube(6, 1, 1, 1, Blue);
        displayCube(6, 1, 1, 1, Blue);
    }
    for (int i = 0; i < 4; i++) {
        displayCube(6, 1, 1, 1, Blue);
        displayCube(5, 1, 2, 2, Blue - 20);
        displayCube(4, 1, 3, 3, Blue - 40);
        displayCube(3, 1, 4, 4, Blue - 60);
        displayCube(2, 1, 5, 5, Blue - 80);
        displayCube(2, 1, 5, 5, Blue - 80);
        displayCube(2, 1, 5, 5, Blue - 80);
        displayCube(3, 1, 4, 4, Blue - 60);
        displayCube(4, 1, 3, 3, Blue - 40);
        displayCube(5, 1, 2, 2, Blue - 20);
        displayCube(6, 1, 1, 1, Blue);
        displayCube(6, 1, 1, 1, Blue);
    }
    bounceCube(4, 1, 1, 1, Blue);
    clearCube();
    delay(500);
    // This is where the flashing occurs.
    for (int i = 0; i < 5; i++) {
        //Turn everything ON to white
        for (byte layer = 0; layer < 8; layer++) {  // scan thru each layer
            for (byte column = 0; column < 8; column++) {  // scan thru every column
                for (byte panel = 0; panel < 8; panel++) {  // scan thru every panel
                    cube[layer][panel][column][0] = 31;
                    cube[layer][panel][column][1] = 63;
                    cube[layer][panel][column][2] = 63;
                }
            }
        }
        delay(10);
        //Turn everything off.(Same as clearCube)
        for (byte layer = 0; layer < 8; layer++) {  // scan thru each layer
            for (byte column = 0; column < 8; column++) {  // scan thru every column
                for (byte panel = 0; panel < 8; panel++) {  // scan thru every panel
                    cube[layer][panel][column][0] = 0;
                    cube[layer][panel][column][1] = 0;
                    cube[layer][panel][column][2] = 0;
                }
            }
        }
        delay(390);
    }
    delay(500);
}

void displayCube(int side, int x, int y, int z, int color) {
    sprite mySprite(side, side, side);
    mySprite.outline(color);
    mySprite.place[0] = x;
    mySprite.place[1] = y;
    mySprite.place[2] = z;
    mySprite.setIt();
    delay(50);
    mySprite.clearIt();
}

void bounceCube(int side, int x, int y, int z, int color) {
    sprite mySprite(side, side, side);
    mySprite.place[0] = x;
    mySprite.place[1] = y;
    mySprite.place[2] = z;
    mySprite.motion[0] = 1;  // gives my sprite an initial direction of motion
    mySprite.motion[1] = 2;  // gives my sprite an initial direction of motion
    mySprite.motion[2] = -1; // gives my sprite an initial direction of motion

    for (count = 0; count < 66; count++) { // loop around 100 times
        color = color + 3;
        if (color > 189) { color = 0; }
        mySprite.outline(color);
        mySprite.bounceIt(); // move the sprite one increment. Reverse direction if cube's edge is detected.
        delay(95); // wait 1/10th second before next move.
    } // finish the loop
    mySprite.clearIt(); // turn off the sprite since we're done.
    delay(1000);
}
