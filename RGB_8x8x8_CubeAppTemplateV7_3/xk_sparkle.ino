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

// this code creates flash effects. We turn on a random LED every 10 msec.
// each LED once on stays on through one complete loop or 30 msec. 
void Sparkle() {
    getColor(White, 4);  //flashes are white
    for (int j = 0; j < 200; j++) {  // go around 75 times
        int newx1, newy1, newz1, newx2, newy2, newz2, newx3, newy3, newz3; // locations for 3 LEDs that are on at one time
        newx1 = random(8);
        newy1 = random(8);
        newz1 = random(8);
        LED(newx1, newy1, newz1, myred, mygreen, myblue); // create the first
        delay(10);
        LED(newx2, newy2, newz2, 0, 0, 0);  // turn off the second
        newx2 = random(8);
        newy2 = random(8);
        newz2 = random(8);
        LED(newx2, newy2, newz2, myred, mygreen, myblue);  // create the second
        delay(10);
        LED(newx3, newy3, newz3, 0, 0, 0); // turn off the third
        newx3 = random(8);
        newy3 = random(8);
        newz3 = random(8);
        LED(newx3, newy3, newz3, myred, mygreen, myblue);  // create the third
        delay(10);
        LED(newx1, newy1, newz1, 0, 0, 0);  // turn off the first
    }
    clearCube();
    delay(1000);
}

