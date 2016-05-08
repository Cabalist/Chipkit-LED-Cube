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

// This animation is similar to the sinewave animation, but instead of running the sine 
// from the middle outward, it displays across the diagonal of the cube. While it uses
// the cosine, it could just as easily be done with sine. 
void Cosine(int myNumber) {  // myNumber is number of iterations of this animation
    for (count = 0; count < myNumber; count++) {
        for (int i = 0; i < 40; i++) {   //it takes 40 steps to complete one full cycle
            getColor(i * 4, 4); // get a rainbow color.  We need to go through 160 colors over the course of one full cycle.
            for (byte xx = 0; xx < 8; xx++) {
                for (byte yy = 0; yy < 8; yy++) {
                    z = ((byte)(4 + cos((xx / 2.23) + (yy / 2.23) + (float) i / 6.28) * 4)); // the actual z calculation
                    if (z > 7) { // this is necessary because a one spot the cos is actually one
                        z = 7;     // and tries to set z at 8.
                    }
                    LED(xx, yy, z, myred, mygreen, myblue);
                }
            }
            delay(20);       // Increase or decrease to change speed of this animation
            clearCube();    // clear the cube
        }
    }
    delay(1000);
}
