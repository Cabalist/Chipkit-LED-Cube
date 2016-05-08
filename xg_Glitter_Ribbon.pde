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

// This is new animation which is a variation on the previous cosine animation.  In this modification, the cosine function is flattened out 
// to produce a wavy flat sheet moving up and down.  Then we've added in some sparkle. 

void Glitter_ribbon() {
    for (int j = 0; j < 10; j++) {
        for (int i = 0; i < 36; i++) {   //it takes 36 steps to complete one full cycle
            getColor(i * 5, 3); // get a rainbow color.  We need to go through most of 189 colors over the course of one full cycle.
            for (byte xx = 0; xx < 8; xx++) {
                for (byte yy = 0; yy < 8; yy++) {
                    z = ((byte)(4 + cos((xx / 7.23) + (yy / 12.23) + (float) i / 6.28) * 4)); // the actual z calculation
                    if (z > 7) {
                        z = 7;
                    }
                    if (random(40) == 0) {
                        LED(xx, yy, z, 31, 63, 63);  // add white flash sparkle 1/40th of the time.
                    }
                    else {
                        LED(xx, yy, z, myred, mygreen, myblue);
                    }
                }
            }
            delay(30);       // Increase or decrease to change speed of this animation
            clearCube();    // clear the cube
        }
    }
}

