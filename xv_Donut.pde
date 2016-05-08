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

// This makes a donut revolve in the middle of the cube.
void Donut(int mycount) {
    colorCount = 0;
    for (int reps = 0; reps < mycount; reps++) {
        rotation = 10 * .0174532; // convert angle to radians
        getColor(colorCount, 4);  // pick a color.  It will gradually change as colorCount increases.
        colorCount = colorCount + 1;
        if (colorCount > 188) {
            colorCount = 0;
        }
        for (int layer = 0; layer < 8; layer++) { // build the donut on the buffer_cube array.
            for (int panel = 0; panel < 8; panel++) {
                float mydistance = distance[layer][panel];
                if (mydistance < 4) {  // make a circle 2 columns wide
                    buffer_LED(3, panel, layer, myred, mygreen, myblue);
                    buffer_LED(4, panel, layer, myred, mygreen, myblue);
                }
                if (mydistance < 2) {  // make the donut hole
                    buffer_LED(3, panel, layer, 0, 0, 0);
                    buffer_LED(4, panel, layer, 0, 0, 0);
                }
            }
        }
        for (int count = 0; count < 5; count++) {  // now rotate it.
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

