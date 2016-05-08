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
This is a very simple animation. Not much to it, but a nice effect.  My intent was mainly to create 
the falling effect, but some people think the best part is the return where they all rapidly return
to their original position on the top.  Looks like a whole bunch of guns going off. 
*/
void RandomFall() {
    for (int x = 0; x < 8; x++) {
        for (int y = 0; y < 8; y++) {
            LED(x, y, 7, 63, 0, 0);
        }
    }
    delay(500);
    while (count3 < 64) {
        x3 = random(8);
        y3 = random(8);
        if (upDown[x3][y3] == 0) {
            upDown[x3][y3] = 1;
            count3++;
            mycolor = 16;
            getColor(mycolor, 4);
            for (z = 7; z > 0; z--) {
                LED(x3, y3, z, 0, 0, 0);
                LED(x3, y3, z - 1, myred, mygreen, myblue);
                delay((z * mywait) / 5);
                mycolor = mycolor + 15;
                getColor(mycolor, 4);
            }
        }
    }
    delay(200);
    count3 = 0;

    while (count3 < 64) {
        x3 = random(8);
        y3 = random(8);
        if (upDown[x3][y3] == 1) {
            upDown[x3][y3] = 0;
            count3++;
            mycolor = 91;
            getColor(mycolor, 4);
            for (z = 0; z < 7; z++) {
                LED(x3, y3, z, 0, 0, 0);
                LED(x3, y3, z + 1, myred, mygreen, myblue);
                delay(mywait / 5);
                mycolor = mycolor - 15;
                getColor(mycolor, 4);
            }
        }
    }
    delay(200);
    count3 = 0;
    delay(200);
    clearCube();
}


