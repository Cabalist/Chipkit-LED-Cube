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

// In this demo we are rotating a simple sprite around itself.  There is one restriction that must
// be observed.  The sprite must have equal dimensions in the plane in which its rotating, i.e. if we are 
// going to use rotateX on a sprite, that sprites Y and Z dimensions must be equal.  See Sprite1 as an
// example. 
void eyes() {
    int mydelay = 200;
    sprite Sprite1(4, 4, 4);  // X and Y dimensions must be equal if we are going to rotate around Z axis.
    Sprite1.place[0] = 0;
    Sprite1.place[1] = 0;
    Sprite1.place[2] = 3;
    Sprite1.motion[0] = 1;
    Sprite1.motion[1] = 2;
    Sprite1.motion[2] = -1;

    // just a simple red green green line across 3 layers
    // top layer
    // 1st column,  4 panels
    Sprite1.description[0][0][0] = Black;
    Sprite1.description[0][0][1] = Black;
    Sprite1.description[0][0][2] = Black;
    Sprite1.description[0][0][3] = Black;
    // 2nd column,  4 panels
    Sprite1.description[0][1][0] = Black;
    Sprite1.description[0][1][1] = Red;
    Sprite1.description[0][1][2] = Red;
    Sprite1.description[0][1][3] = Black;
    // 3rd column,  4 panels
    Sprite1.description[0][2][0] = Black;
    Sprite1.description[0][2][1] = Red;
    Sprite1.description[0][2][2] = Red;
    Sprite1.description[0][2][3] = Black;
    // 4th column,  4 panels
    Sprite1.description[0][3][0] = Black;
    Sprite1.description[0][3][1] = Black;
    Sprite1.description[0][3][2] = Black;
    Sprite1.description[0][3][3] = Black;


    // 1st middle layer
    // 1st column,  4 panels
    Sprite1.description[1][0][0] = Black;
    Sprite1.description[1][0][1] = Red;
    Sprite1.description[1][0][2] = Red;
    Sprite1.description[1][0][3] = Black;
    // 2nd column,  4 panels
    Sprite1.description[1][1][0] = Red;
    Sprite1.description[1][1][1] = Red;
    Sprite1.description[1][1][2] = Red;
    Sprite1.description[1][1][3] = Red;
    // 3rd column,  4 panels
    Sprite1.description[1][2][0] = Red;
    Sprite1.description[1][2][1] = Red;
    Sprite1.description[1][2][2] = Red;
    Sprite1.description[1][2][3] = Red;
    // 4th column,  4 panels
    Sprite1.description[1][3][0] = Black;
    Sprite1.description[1][3][1] = Red;
    Sprite1.description[1][3][2] = Red;
    Sprite1.description[1][3][3] = Black;

    // 2nd middle layer
    // 1st column,  4 panels
    Sprite1.description[2][0][0] = Black;
    Sprite1.description[2][0][1] = Red;
    Sprite1.description[2][0][2] = Red;
    Sprite1.description[2][0][3] = Black;
    // 2nd column,  4 panels
    Sprite1.description[2][1][0] = Red;
    Sprite1.description[2][1][1] = Red;
    Sprite1.description[2][1][2] = Red;
    Sprite1.description[2][1][3] = Red;
    // 3rd column,  4 panels
    Sprite1.description[2][2][0] = Red;
    Sprite1.description[2][2][1] = Red;
    Sprite1.description[2][2][2] = Red;
    Sprite1.description[2][2][3] = Red;
    // 4th column,  4 panels
    Sprite1.description[2][3][0] = Black;
    Sprite1.description[2][3][1] = Red;
    Sprite1.description[2][3][2] = Red;
    Sprite1.description[2][3][3] = Black;

    // bottom layer
    // 1st column,  4 panels
    Sprite1.description[3][0][0] = Black;
    Sprite1.description[3][0][1] = Black;
    Sprite1.description[3][0][2] = Black;
    Sprite1.description[3][0][3] = Black;
    // 2nd column,  4 panels
    Sprite1.description[3][1][0] = Black;
    Sprite1.description[3][1][1] = Red;
    Sprite1.description[3][1][2] = Red;
    Sprite1.description[3][1][3] = Black;
    // 3rd column,  4 panels
    Sprite1.description[3][2][0] = Black;
    Sprite1.description[3][2][1] = Red;
    Sprite1.description[3][2][2] = Red;
    Sprite1.description[3][2][3] = Black;
    // 4th column,  4 panels
    Sprite1.description[3][3][0] = Black;
    Sprite1.description[3][3][1] = Black;
    Sprite1.description[3][3][2] = Black;
    Sprite1.description[3][3][3] = Black;
    
    Sprite1.description[1][1][0] = Blue;
    Sprite1.description[1][2][0] = Blue;

    for (int count = 0; count < 100; count++) {
        Sprite1.rollZ(0);
        if (count % 4 == 0) {
            Sprite1.rotateZ(1);
        }
        delay(mydelay);
    }
    Sprite1.clearIt();
}
