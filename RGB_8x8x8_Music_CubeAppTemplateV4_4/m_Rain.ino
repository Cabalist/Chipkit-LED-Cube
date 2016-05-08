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

void rain(int times, int rdelay) {
    for (int count = 0; count < times; count++) {
        if (runMode > 0) { break; } // drop out if mode changes
        zdown(1); // shift whole cube down 1 layer
        //clean top layer
        for (byte i = 0; i < 64; i++) { // 64 LEDs in top layer.
            y = i / 8; // calculate the Y axis of the current LED we are clearing
            x = i - y * 8; // calculate the X axis of the LED we are clearing
            LED(x, y, 7, 0, 0, 0); // clear that LED in the top (7th) layer
        }
        lightOne();   // load 5 colored LEDs into the top layer
        lightOne();
        lightOne();
        lightOne();
        lightOne();
        delay(rdelay);  // wait 1/10 second

    }
    clearCube();
}

void lightOne() {
    int RED = 0;
    int GREEN = 0;
    int BLUE = 0;
    if (random(2)) {  // red is on or off
        RED = 63;
    }
    if (random(2)) {  // green is on or off
        GREEN = 63;
    }
    if (random(2)) {  // blue is on or off
        BLUE = 63;
    }
    LED(random(8), random(8), 7, RED, GREEN, BLUE); // light an LED in the top layer with a random color
}


