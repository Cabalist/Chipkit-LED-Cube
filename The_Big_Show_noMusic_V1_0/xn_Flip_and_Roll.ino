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

// In this animation, we create three sprites, then rotate them around themselves while rolling them around the edge of the cube. 
// An interesting effect demonstrating both .roll and .rotate methods of our sprite object class.

void Flip_and_Roll() {
    int mydelay = 250;
    sprite Sprite1(3, 3, 3);  // X and Y dimensions must be equal if we are going to rotate around Z axis.
    Sprite1.place[0] = 1;
    Sprite1.place[1] = 1;
    Sprite1.place[2] = 1;
    // top layer
    Sprite1.description[0][0][0] = Red;
    Sprite1.description[0][0][1] = Red;
    Sprite1.description[0][0][2] = Red;
    Sprite1.description[0][1][0] = Red;
    Sprite1.description[0][1][1] = Red;
    Sprite1.description[0][1][2] = Red;
    Sprite1.description[0][2][0] = Red;
    Sprite1.description[0][2][1] = Red;
    Sprite1.description[0][2][2] = Red;
    // middle layer
    Sprite1.description[1][0][0] = Black;
    Sprite1.description[1][0][1] = Black;
    Sprite1.description[1][0][2] = Black;
    Sprite1.description[1][1][0] = Black;
    Sprite1.description[1][1][1] = Black;
    Sprite1.description[1][1][2] = Black;
    Sprite1.description[1][2][0] = Black;
    Sprite1.description[1][2][1] = Black;
    Sprite1.description[1][2][2] = Black;
    // bottom layer
    Sprite1.description[2][0][0] = Black;
    Sprite1.description[2][0][1] = Black;
    Sprite1.description[2][0][2] = Black;
    Sprite1.description[2][1][0] = Black;
    Sprite1.description[2][1][1] = Black;
    Sprite1.description[2][1][2] = Black;
    Sprite1.description[2][2][0] = Black;
    Sprite1.description[2][2][1] = Black;
    Sprite1.description[2][2][2] = Black;

    sprite Sprite2(3, 3, 3);  // X and Y dimensions must be equal if we are going to rotate around X axis.
    Sprite2.place[0] = 4;
    Sprite2.place[1] = 4;
    Sprite2.place[2] = 5;
    // just a simple red green green line across 3 layers
    // top layer
    Sprite2.description[0][0][0] = Green;
    Sprite2.description[0][0][1] = Black;
    Sprite2.description[0][0][2] = Black;
    Sprite2.description[0][1][0] = Green;
    Sprite2.description[0][1][1] = Black;
    Sprite2.description[0][1][2] = Black;
    Sprite2.description[0][2][0] = Green;
    Sprite2.description[0][2][1] = Black;
    Sprite2.description[0][2][2] = Black;
    // middle layer
    Sprite2.description[1][0][0] = Green;
    Sprite2.description[1][0][1] = Black;
    Sprite2.description[1][0][2] = Black;
    Sprite2.description[1][1][0] = Green;
    Sprite2.description[1][1][1] = Black;
    Sprite2.description[1][1][2] = Black;
    Sprite2.description[1][2][0] = Green;
    Sprite2.description[1][2][1] = Black;
    Sprite2.description[1][2][2] = Black;
    // bottom layer
    Sprite2.description[2][0][0] = Green;
    Sprite2.description[2][0][1] = Black;
    Sprite2.description[2][0][2] = Black;
    Sprite2.description[2][1][0] = Green;
    Sprite2.description[2][1][1] = Black;
    Sprite2.description[2][1][2] = Black;
    Sprite2.description[2][2][0] = Green;
    Sprite2.description[2][2][1] = Black;
    Sprite2.description[2][2][2] = Black;

    sprite Sprite3(3, 3, 3);  // X and Y dimensions must be equal if we are going to rotate around X axis.
    Sprite3.place[0] = 1;
    Sprite3.place[1] = 4;
    Sprite3.place[2] = 3;
    // just a simple red green green line across 3 layers
    // top layer
    Sprite3.description[0][0][0] = Blue;
    Sprite3.description[0][0][1] = Black;
    Sprite3.description[0][0][2] = Black;
    Sprite3.description[0][1][0] = Blue;
    Sprite3.description[0][1][1] = Black;
    Sprite3.description[0][1][2] = Black;
    Sprite3.description[0][2][0] = Blue;
    Sprite3.description[0][2][1] = Black;
    Sprite3.description[0][2][2] = Black;
    // middle layer
    Sprite3.description[1][0][0] = Blue;
    Sprite3.description[1][0][1] = Black;
    Sprite3.description[1][0][2] = Black;
    Sprite3.description[1][1][0] = Blue;
    Sprite3.description[1][1][1] = Black;
    Sprite3.description[1][1][2] = Black;
    Sprite3.description[1][2][0] = Blue;
    Sprite3.description[1][2][1] = Black;
    Sprite3.description[1][2][2] = Black;
    // bottom layer
    Sprite3.description[2][0][0] = Blue;
    Sprite3.description[2][0][1] = Black;
    Sprite3.description[2][0][2] = Black;
    Sprite3.description[2][1][0] = Blue;
    Sprite3.description[2][1][1] = Black;
    Sprite3.description[2][1][2] = Black;
    Sprite3.description[2][2][0] = Blue;
    Sprite3.description[2][2][1] = Black;
    Sprite3.description[2][2][2] = Black;


    for (int count = 0; count < 15; count++) {
        Sprite1.rotateX(0);
        Sprite2.rotateZ(1);
        Sprite3.rotateZ(1);
        Sprite1.rollZ(0);
        Sprite2.rollZ(1);
        Sprite3.rollZ(0);
        delay(mydelay);
        Sprite1.rotateZ(0);
        Sprite2.rotateY(1);
        delay(mydelay);
        Sprite1.rotateY(0);
        Sprite2.rotateX(0);
        Sprite3.rotateX(0);
        Sprite1.rollZ(0);
        Sprite2.rollZ(1);
        Sprite3.rollZ(0);
        delay(mydelay);
        Sprite1.rotateX(0);
        Sprite2.rotateZ(1);
        delay(mydelay);
        Sprite1.rotateZ(0);
        Sprite2.rotateY(1);
        Sprite3.rotateY(1);
        Sprite1.rollZ(0);
        Sprite2.rollZ(1);
        Sprite3.rollZ(0);
        delay(mydelay);
        Sprite1.rotateY(0);
        Sprite2.rotateX(0);
        delay(mydelay);
    }
    clearCube();
    delay(1000);
}
