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

void Elevators() {
    byte location[8][8][2];  //this array stores the location and direction of each elevator
    for (byte xx = 0; xx < 8; xx++) {  // this is the setup routine.
        for (byte yy = 0; yy < 8; yy++) {
            location[xx][yy][0] = random(4); // pick an initial floor
            if (location[xx][yy][0] > 0) { location[xx][yy][0] = 10; }  // only ones on the ground floor are chosen.
            // other 2/4 of LEDs are banished to the 10th floor where they won't be seen.
            location[xx][yy][1] = random(3);  // select an initial direction of travel: up, down, or stopped.
            if (location[xx][yy][0] < 8) {  // if it's not on the 10th floor, assign it a color
                rnd_std_color();
                LED(xx, yy, location[xx][yy][0], myred, mygreen, myblue); // and turn it on.
            }
        }
    }
    delay(2000); // our elevators are all set up and lit up on the ground floor.
    for (int j = 0; j < 250; j++) {  // now we put them in motion
        for (byte xx = 0; xx < 8; xx++) {
            for (byte yy = 0; yy < 8; yy++) {
                if (location[xx][yy][0] < 8) { // if it's a valid elevator
                    myred = cube[xx][yy][location[xx][yy][0]][0]; // get its color
                    mygreen = cube[xx][yy][location[xx][yy][0]][1];
                    myblue = cube[xx][yy][location[xx][yy][0]][2];
                    LED(xx, yy, location[xx][yy][0], 0, 0, 0); // then erase it from its current position
                    if (random(3) == 0) {  // 1/3 of the time
                        location[xx][yy][1] = random(3);  //change direction: up, down, or stopped
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
        delay(300 - j);  // wait, with animation speeding up as j increases.
    }
    clearCube();    // clear the cube
    delay(1000);
}
