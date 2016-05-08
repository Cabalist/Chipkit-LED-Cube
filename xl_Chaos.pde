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

// This is new animation derived from the elevator animation.  Just messing with the 
// elevator's code created this interesting effect.

void Chaos() {
    for (int k = 0; k < 15; k++) {
        byte location[8][8][2];  //this array stores the location and direction of each column
        for (byte xx = 0; xx < 8; xx++) {  // this is the setup routine.
            for (byte yy = 0; yy < 8; yy++) {
                location[xx][yy][0] = random(7);
                if (location[xx][yy][0] > 0) {
                    location[xx][yy][0] = 10;
                }  // only ones at layer 0 are chosen.
                // other 3/4 of LEDs are banished to the 10th layer where they won't be seen.
                location[xx][yy][1] = random(3);  // select an initial direction of travel: up, down, or stopped.
                if (location[xx][yy][0] < 8) {  // if it's not on the 10th level, assign it a color
                    LED(xx, yy, location[xx][yy][0], myred, mygreen, myblue); // and turn it on.
                }
            }
        }

        for (int j = 0; j < 50; j++) {  // now we put them in motion
            getColor(mycolor, 4);
            mycolor = mycolor - 1;
            if (mycolor < 1) {
                mycolor = 189;
            }
            for (byte xx = 0; xx < 8; xx++) {
                for (byte yy = 0; yy < 8; yy++) {
                    if (location[xx][yy][0] < 8) { // if it's a valid location (not 10th layer
                        if (random(3) == 0) {  // 1/3 of the time
                            location[xx][yy][1] = random(3);  //change direction: up, down, or stopped
                            for (int z = 0; z < 8; z++) { // at this time erase everything in this xx,yy column
                                LED(xx, yy, z, 0, 0, 0);
                            }
                        }
                        if (location[xx][yy][1] == 1) { // if it's going up,
                            if (location[xx][yy][0] < 7) {  // and not already on the top floor
                                location[xx][yy][0] = location[xx][yy][0] + 1; // move it up one
                            }
                            else { // on the top floor?
                                location[xx][yy][0] = location[xx][yy][0] - 1;  // move down one
                                location[xx][yy][1] == 2; // change direction to down
                            }
                        }
                        if (location[xx][yy][1] == 2) {  // if it's going down,
                            if (location[xx][yy][0] > 0) { // and not already on the ground floor
                                location[xx][yy][0] = location[xx][yy][0] - 1;  // move it down one
                            }
                            else { // on the bottom floor?
                                location[xx][yy][0] = location[xx][yy][0] + 1; // move up one
                                location[xx][yy][1] == 1;  //change direction to up
                            }
                        }
                        LED(xx, yy, location[xx][yy][0], myred, mygreen, myblue); // turn on in new location
                    }
                }
            }
            delay(30); // this moves pretty fast
        }
        clearCube();    // clear the cube
    }
    delay(1000);
}

