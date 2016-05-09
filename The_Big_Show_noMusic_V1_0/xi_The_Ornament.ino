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

/* This is a new animation.  It uses the sprite object class to create an ornament like object and move it around the cube.
It use a new feature just added to the sprite object class called ChgIntensity() which allows you to modify the intensity
of the LEDs in your sprite selecting 1-4.   The default intensity is always 4 (max. intensity), but this allows you to 
alter it if you want.
*/

void TheOrnament() {
    sprite mySprite(3, 3, 6);
    // define the shape and color.
    // top layer
    mySprite.description[0][0][0] = Black;
    mySprite.description[0][0][1] = Black;
    mySprite.description[0][0][2] = Black;
    mySprite.description[0][1][0] = Black;
    mySprite.description[0][1][1] = Red;
    mySprite.description[0][1][2] = Black;
    mySprite.description[0][2][0] = Black;
    mySprite.description[0][2][1] = Black;
    mySprite.description[0][2][2] = Black;
    // 2nd layer
    mySprite.description[1][0][0] = Black;
    mySprite.description[1][0][1] = Orange;
    mySprite.description[1][0][2] = Black;
    mySprite.description[1][1][0] = Orange;
    mySprite.description[1][1][1] = Black;
    mySprite.description[1][1][2] = Orange;
    mySprite.description[1][2][0] = Black;
    mySprite.description[1][2][1] = Orange;
    mySprite.description[1][2][2] = Black;
    // 3rd layer
    mySprite.description[2][0][0] = Green;
    mySprite.description[2][0][1] = Green;
    mySprite.description[2][0][2] = Green;
    mySprite.description[2][1][0] = Green;
    mySprite.description[2][1][1] = Green;
    mySprite.description[2][1][2] = Green;
    mySprite.description[2][2][0] = Green;
    mySprite.description[2][2][1] = Green;
    mySprite.description[2][2][2] = Green;
    // 4th layer
    mySprite.description[3][0][0] = Blue;
    mySprite.description[3][0][1] = Blue;
    mySprite.description[3][0][2] = Blue;
    mySprite.description[3][1][0] = Blue;
    mySprite.description[3][1][1] = Blue;
    mySprite.description[3][1][2] = Blue;
    mySprite.description[3][2][0] = Blue;
    mySprite.description[3][2][1] = Blue;
    mySprite.description[3][2][2] = Blue;
    // 5th layer
    mySprite.description[4][0][0] = Black;
    mySprite.description[4][0][1] = Purple;
    mySprite.description[4][0][2] = Black;
    mySprite.description[4][1][0] = Purple;
    mySprite.description[4][1][1] = Black;
    mySprite.description[4][1][2] = Purple;
    mySprite.description[4][2][0] = Black;
    mySprite.description[4][2][1] = Purple;
    mySprite.description[4][2][2] = Black;
    // bottom layer
    mySprite.description[5][0][0] = Black;
    mySprite.description[5][0][1] = Black;
    mySprite.description[5][0][2] = Black;
    mySprite.description[5][1][0] = Black;
    mySprite.description[5][1][1] = Violet;
    mySprite.description[5][1][2] = Black;
    mySprite.description[5][2][0] = Black;
    mySprite.description[5][2][1] = Black;
    mySprite.description[5][2][2] = Black;


    mySprite.place[0] = 3;
    mySprite.place[1] = 3;
    mySprite.place[2] = 1;
    for (int j = 0; j < 7; j++) {
        mySprite.ChgIntensity(1);
        mySprite.setIt();
        delay(150);
        mySprite.ChgIntensity(2);
        mySprite.setIt();
        delay(150);
        mySprite.ChgIntensity(3);
        mySprite.setIt();
        delay(150);
        mySprite.ChgIntensity(4);
        mySprite.setIt();
        delay(150);
        mySprite.ChgIntensity(3);
        mySprite.setIt();
        delay(150);
        mySprite.ChgIntensity(2);
        mySprite.setIt();
        delay(150);
    }
    mySprite.ChgIntensity(1);
    mySprite.setIt();
    delay(150);
    mySprite.ChgIntensity(2);
    mySprite.setIt();
    delay(150);
    mySprite.ChgIntensity(3);
    mySprite.setIt();
    delay(150);
    mySprite.ChgIntensity(4);
    mySprite.setIt();
    delay(3000);
    for (int j = 0; j < 50; j++) {
        mySprite.rollZ(1);
        delay(100);
    }
    clearCube();
    mySprite.place[0] = 3;
    mySprite.place[1] = 3;
    mySprite.place[2] = 1;
    mySprite.motion[0] = 0;
    mySprite.motion[1] = 0;
    mySprite.motion[2] = 1;
    for (int j = 0; j < 28; j++) {
        mySprite.bounceIt();
        delay(200);
    }
    for (int j = 0; j < 50; j++) {
        mySprite.ChgIntensity(1 + j % 4);
        mySprite.rollZ(0);
        delay(200);
    }
    clearCube();
    mySprite.ChgIntensity(4);
    mySprite.place[0] = 3;
    mySprite.place[1] = 3;
    mySprite.place[2] = 1;
    mySprite.motion[0] = 0;
    mySprite.motion[1] = 0;
    mySprite.motion[2] = 1;
    for (int j = 0; j < 27; j++) {
        mySprite.bounceIt();
        delay(200);
    }
    mySprite.clearIt();
    mySprite.place[0] = 3;
    mySprite.place[1] = 3;
    mySprite.place[2] = 1;
    mySprite.ChgIntensity(4);
    mySprite.setIt();
    delay(500);
    mySprite.ChgIntensity(3);
    mySprite.setIt();
    delay(500);
    mySprite.ChgIntensity(2);
    mySprite.setIt();
    delay(500);
    mySprite.ChgIntensity(1);
    mySprite.setIt();
    delay(2000);
    clearCube();
    delay(1000);
}
