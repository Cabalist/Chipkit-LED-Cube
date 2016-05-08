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

/*  This is the helicopter animation. This would be better if our sprite could be bigger, specifically longer, than
our 4x4x4 maximum sprite size allows, but we did the best we could with the space available.  

There are a couple of subroutines that are external to the primary one, so we define our helicopter sprite outside
of the primary routine, as well as a couple counter variables that we need to be global.  This animation demonstrates how
you can use a sprite, but then modify its appearance on the fly during the animation, as we do with the rotor blade 
and the blinking tail light. */

sprite mySprite(4, 4, 4);  // Our sprite is 4 x 4 x 4.
int rot, blinkMe;

void helicopter() {
    mySprite.place = {  // set up its initial location
            2, 2, 0};
    mySprite.motion = {  // set up its initial motion
            1, -1, 1};
    mySprite.description = {  // define the shape and color of the helicopter.
            {  // top layer
                    {White, Black, Black, Black}, // 1st column,  4 panels
                    {Black, White, Black, Black}, // 2nd column,  4 panels
                    {Black, Black, White, Black}, // 3rd column,  4 panels
                    {Black, Black, Black, White}, // 4th column,  4 panels
            },
            {  // middle layer
                    {Black, Black, Black, Black}, // 1st column,  4 panels
                    {Black, Blue,  Blue,  Black}, // 2nd column,  4 panels
                    {Black, Blue,  Blue,  Black}, // 3rd column,  4 panels
                    {Black, Black, Black, Black}, // 4th column,  4 panels
            },
            {  // 2nd middle layer
                    {Black, Black, Black, Black}, // 1st column,  4 panels
                    {Black, Blue,  Blue,  Black}, // 2nd column,  4 panels
                    {Black, Blue,  Blue,  Black}, // 3rd column,  4 panels
                    {Black, Black, Black, Black}, // 4th column,  4 panels
            },
            {  // bottom layer
                    {Black, Black, Black, Black}, // 1st column,  4 panels
                    {Blue,  Black, Blue,  Black}, // 2nd column,  4 panels
                    {Blue,  Black, Blue,  Black}, // 3rd column,  4 panels
                    {Black, Black, Black, Black}, // 4th column,  4 panels
            },
    };
    mySprite.setIt();  // display helicopter
    delay(3000);
    for (int count = 0; count < 10; count++) {  // make the tail light blink
        blinkRed();
        mySprite.setIt();
        delay(500);
    }
    for (int count = 0; count < 19; count++) {  // start the rotor turning
        blinkRed();
        mySprite.setIt();
        rotor();
        rotor();
        rotor();
        rotor();
        rotor();
    }
    for (int count = 0; count < 40; count++) {  // now the helicopter is flying
        mySprite.bounceIt();
        blinkRed();
        rotor();
        rotor();
        rotor();
        rotor();
        rotor();
        blinkRed();
        rotor();
        rotor();
        rotor();
        rotor();
        rotor();
    }
    if (mySprite.description[0][3][0] == Black) {  // now it's landing
        rotor();
    }
    for (int count = 0; count < 9; count++) {  // make the rotor stop where it started
        blinkRed();
        mySprite.setIt();
        rotor();
        rotor();
        rotor();
        rotor();
        rotor();
    }
    for (int count = 0; count < 11; count++) {  // rotor stops but tail light still blinks
        blinkRed();
        mySprite.setIt();
        delay(500);
    }
    delay(3000);  // blinking stops
    clearCube();  // done - clear the cube
}

void rotor() {  // makes the rotor rotate 90 degrees
    if (rot == 0) {
        rot = 1;
        mySprite.description[0][0][0] = White;
        mySprite.description[0][1][1] = White;
        mySprite.description[0][2][2] = White;
        mySprite.description[0][3][3] = White;
        mySprite.description[0][3][0] = Black;
        mySprite.description[0][2][1] = Black;
        mySprite.description[0][1][2] = Black;
        mySprite.description[0][0][3] = Black;
    }
    else {
        rot = 0;
        mySprite.description[0][0][0] = Black;
        mySprite.description[0][1][1] = Black;
        mySprite.description[0][2][2] = Black;
        mySprite.description[0][3][3] = Black;
        mySprite.description[0][3][0] = White;
        mySprite.description[0][2][1] = White;
        mySprite.description[0][1][2] = White;
        mySprite.description[0][0][3] = White;
    }
    mySprite.setIt();
    delay(100);
}

void blinkRed() {  // turns tail light on if off, or off if on.
    if (blinkMe == 0) {
        blinkMe = 1;
        mySprite.description[1][1][3] = Black;
        mySprite.description[1][2][3] = Black;
    }
    else {
        blinkMe = 0;
        mySprite.description[1][1][3] = Red;
        mySprite.description[1][2][3] = Red;
    }
}
