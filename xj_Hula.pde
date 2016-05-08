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

void Hula() {
    colorCount = 0;
    rotation = 10 * .0174532; // convert 10 degree angle to radians
    for (int reps = 0; reps < 50; reps++) {
        for (int z = 0; z < 8; z++) {  // for each layer
            getColor(colorCount, 4);  // pick a color.  It will gradually change as colorCount increases.
            colorCount = colorCount + 3;
            if (colorCount > 188) {
                colorCount = 0;
            }
            // here is the actual animation for one layer and it's compliment (7-z)
            for (int x = 0; x < z + 1; x++) {
                for (int y = 0; y < z + 1; y++) {
                    buffer_LED(x, y, 7 - z, myred, mygreen, myblue);
                }
            }
            for (int x = 0; x < z + 1; x++) {
                for (int y = 0; y < z + 1; y++) {
                    buffer_LED(x, y, z, myred, mygreen, myblue);
                }
            }
            for (int x = 1; x < z; x++) {
                for (int y = 1; y < z; y++) {
                    buffer_LED(x, y, 7 - z, 0, 0, 0);
                }
            }
            for (int x = 1; x < z; x++) {
                for (int y = 1; y < z; y++) {
                    buffer_LED(x, y, z, 0, 0, 0);
                }
            }
        }
        // Now we rotate the new formation 90 degrees. (9 * 10 degrees)
        for (int count = 0; count < 9; count++) {  // now rotate it.
            rotateAll(myangle);  // the actual rotation of the animation
            myangle = myangle + rotation; // increment the angle
            if (myangle > 6.28318) { // and make sure it doesn't overflow
                myangle = myangle - 6.28318;  //subtract 2 pi radians
            }
        }
    }
    clearBufferCube();
    clearCube();
    delay(1000);
}

