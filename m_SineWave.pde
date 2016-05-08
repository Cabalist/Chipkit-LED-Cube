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

// This is my version of the well known sinewave animation.  I have tried to keep it simple and understandable. 
void sinewave(int repeat) {
    for (int reps = 0; reps < repeat; reps++) {
        for (int i = 0; i < 80; i++) {   //it takes 40 steps to complete one full cycle
            getColor(i * 2, 4); // get a rainbow color.  We need to go through all 189 color over the course of one full cycle.
            for (byte xx = 0; xx < 4; xx++) { // for 1 quadrant of the cube
                for (byte yy = 0; yy < 4; yy++) {
                    // the next line is the guts of the calculation, where the z value is calculated both as a function of i and distance
                    // from center of cube.  The calculation is time consuming, so we calculate it for only one quadrant and
                    // then reflect it onto the other 3 quadrants.
                    z = ((byte)((4 + sin(sqrt((3.5 - xx) * (3.5 - xx) + (3.5 - yy) * (3.5 - yy)) / 1.3 + (float) i / 12) * 4))); // the actual z calculation
                    LED(xx, yy, z, myred, mygreen, myblue); // put z into the proper place for each position in quadrant 1
                    LED(7 - xx, 7 - yy, z, myred, mygreen, myblue); // put z into the proper place for each position in quadrant 3
                    LED(7 - xx, yy, z, myred, mygreen, myblue);  // put z into the proper place for each position in quadrant 2
                    LED(xx, 7 - yy, z, myred, mygreen, myblue);  // put z into the proper place for each position in quadrant 4
                }
            }
            delay(5);       // Increase or decrease to change speed of this animation
            clearCube();    // clear the cube
        }
    }
    clearCube();
}
