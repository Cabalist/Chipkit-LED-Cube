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

// this is the pulsing sphere animation.

void sphere(int mycount) {
    for (int counter = 0; counter < mycount; counter++) {
        if (runMode > 0) { break; } // drop out if mode changes
        for (count = 0; count < 5; count++) {  //expand
            show_sphere();
        }
        for (count = 4; count > 0; count--) {  //contract
            show_sphere();
        }
    }
    clearCube();
}

void show_sphere() { // draw the sphere and change its color

    for (byte layer = 0; layer < 8; layer++) {  // scan thru each layer
        if (runMode > 0) { break; } // drop out if mode changes
        for (byte column = 0; column < 8; column++) {  // scan thru every column
            for (byte panel = 0; panel < 8; panel++) {  // scan thru every panel
                x = float(layer); // convert coordinates to floating point to compute distance from center of cube
                y = float(panel);
                z = float(column);
                polar = sqrt((x - 3.5) * (x - 3.5) + (y - 3.5) * (y - 3.5) + (z - 3.5) * (z - 3.5)); // Calculate the distance
                if (polar < count) { // if an LED is inside the radius specified by count, turn it on.
                    LED(column, panel, layer, myred, mygreen, myblue);
                }
                else {  // otherwise turn it off
                    LED(column, panel, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(75);  // control speed
    colorCount = colorCount + 12;  // increment color wheel by twelve
    if (colorCount > 189) {  // keep color wheel colors in bounds
        colorCount = 0;
    }
    getColor(colorCount, 3); // get the color wheel color for next pass
}





