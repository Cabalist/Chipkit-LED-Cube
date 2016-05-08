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
    mySprite.description = {  // define the shape and color.
            {  // top layer
                    {Black, Black,  Black}, // 1st column,  3 panels
                    {Black,  Red,    Black}, // 2nd column,  3 panels
                    {Black, Black,  Black}, // 3rd column,  3 panels
            },
            {  // 2nd layer
                    {Black, Orange, Black}, // 1st column,  3 panels
                    {Orange, Black,  Orange}, // 2nd column,  3 panels
                    {Black, Orange, Black}, // 3rd column,  3 panels
            },
            {  // 3rd layer
                    {Green, Green,  Green}, // 1st column,  3 panels
                    {Green,  Green,  Green}, // 2nd column, 3 panels
                    {Green, Green,  Green}, // 3rd column,  3 panels
            },
            {  // 4th layer
                    {Blue,  Blue,   Blue}, // 1st column,  3 panels
                    {Blue,   Blue,   Blue}, // 2nd column,  3 panels
                    {Blue,  Blue,   Blue}, // 3rd column,  3 panels
            },
            {  // 5th layer
                    {Black, Purple, Black}, // 1st column,  3 panels
                    {Purple, Black,  Purple}, // 2nd column,  3 panels
                    {Black, Purple, Black}, // 3rd column,  3 panels
            },
            {  // 6th layer
                    {Black, Black,  Black}, // 1st column,  3 panels
                    {Black,  Violet, Black}, // 2nd column,  3 panels
                    {Black, Black,  Black}, // 3rd column,  3 panels
            },
    };
    mySprite.place = {3, 3, 1};
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
    mySprite.place = {3, 3, 1};
    mySprite.motion = {0, 0, 1};
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
    mySprite.place = {3, 3, 1};
    mySprite.motion = {0, 0, 1};
    for (int j = 0; j < 27; j++) {
        mySprite.bounceIt();
        delay(200);
    }
    mySprite.clearIt();
    mySprite.place = {3, 3, 1};
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
