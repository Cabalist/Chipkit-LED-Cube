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

int xpos = 3;
int ypos = 3;
int mydelay = 50;
int myrandom;

void Mysterious() {
    for (int j = 0; j < 300; j++) {
        myrandom = random(8);
        if (myrandom == 0) {
            xpos++;
        }
        if (myrandom == 1) {
            xpos--;
        }
        if (myrandom == 2) {
            ypos++;
        }
        if (myrandom == 3) {
            ypos--;
        }
        if (xpos < 0) {
            xpos = 1;
        }
        if (xpos > 6) {
            xpos = 5;
        }
        if (ypos < 0) {
            ypos = 1;
        }
        if (ypos > 6) {
            ypos = 5;
        }
        getColor(mycolor, 4);
        mycolor = mycolor - 3;
        if (mycolor < 1) {
            mycolor = 189;
        }
        LED(xpos, ypos, 7, myred, mygreen, myblue);
        LED(xpos + 1, ypos, 7, myred, mygreen, myblue);
        LED(xpos, ypos + 1, 7, myred, mygreen, myblue);
        LED(xpos + 1, ypos + 1, 7, myred, mygreen, myblue);
        delay(mydelay);

        for (int x = 0; x < 8; x++) { // copy content of each layer to the layer below it.
            for (int y = 0; y < 8; y++) {
                for (int z = 1; z < 8; z++) {
                    for (int c = 0; c < 3; c++) {
                        cube[x][y][z - 1][c] = cube[x][y][z][c];
                    }
                }
            }
        }
        LED(xpos, ypos, 7, 0, 0, 0);
        LED(xpos + 1, ypos, 7, 0, 0, 0);
        LED(xpos, ypos + 1, 7, 0, 0, 0);
        LED(xpos + 1, ypos + 1, 7, 0, 0, 0);
    }
    clearCube();
    delay(1000);
}

