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

/*
This is the new and improved Helicopter!  It takes advantage of the fact that sprites
can now be up to 6x6x6.   It's now 6x6x4 while the old one was 4x4x4.   
The main rotor is bigger and actually rotates now. And the tail is longer, so it actually
looks a little more like a helicopter.  There are actually three different subroutines
here working on the sprite, so it is created globally, outside of any of them.  This is
very wasteful of RAM, but I have enough because I have been very careful in all the other 
animations to dispose of sprites when they are finished with. I guess I could have done that
here too. but it's not that easy to create. Also, I would need some global variable to keep track
of where it is as its flying around if I kept destroying it (and losing its position) after every
subroutine. 
*/
sprite heli(6, 6, 4);  // Our sprite is 6 x 6 x 4.
void Helicopter() {
    heli.place[0] = 2; // set up its initial location
    heli.place[1] = 2; // set up its initial location
    heli.place[2] = 0; // set up its initial location

    heli.motion[0] = 1;  // set up its initial motion
    heli.motion[1] = -1; // set up its initial motion
    heli.motion[2] = 1;  // set up its initial motion

    // define the shape and color of the helicopter.
    // top layer
    heli.description[0][0][0] = White;
    heli.description[0][0][1] = Black;
    heli.description[0][0][2] = Black;
    heli.description[0][0][3] = Black;
    heli.description[0][0][4] = Black;
    heli.description[0][0][5] = Black;
    heli.description[0][1][0] = Black;
    heli.description[0][1][1] = White;
    heli.description[0][1][2] = Black;
    heli.description[0][1][3] = Black;
    heli.description[0][1][4] = Black;
    heli.description[0][1][5] = Black;
    heli.description[0][2][0] = Black;
    heli.description[0][2][1] = Black;
    heli.description[0][2][2] = White;
    heli.description[0][2][3] = Black;
    heli.description[0][2][4] = Black;
    heli.description[0][2][5] = Black;
    heli.description[0][3][0] = Black;
    heli.description[0][3][1] = Black;
    heli.description[0][3][2] = Black;
    heli.description[0][3][3] = White;
    heli.description[0][3][4] = Black;
    heli.description[0][3][5] = Black;
    heli.description[0][4][0] = Black;
    heli.description[0][4][1] = Black;
    heli.description[0][4][2] = Black;
    heli.description[0][4][3] = Black;
    heli.description[0][4][4] = White;
    heli.description[0][4][5] = Black;
    heli.description[0][5][0] = Black;
    heli.description[0][5][1] = Black;
    heli.description[0][5][2] = Black;
    heli.description[0][5][3] = Black;
    heli.description[0][5][4] = Black;
    heli.description[0][5][5] = White;
    // 1st middle layer
    heli.description[1][0][0] = Black;
    heli.description[1][0][1] = Black;
    heli.description[1][0][2] = Black;
    heli.description[1][0][3] = Black;
    heli.description[1][0][4] = Black;
    heli.description[1][0][5] = Black;
    heli.description[1][1][0] = Black;
    heli.description[1][1][1] = Black;
    heli.description[1][1][2] = Black;
    heli.description[1][1][3] = Black;
    heli.description[1][1][4] = Black;
    heli.description[1][1][5] = Black;
    heli.description[1][2][0] = Black;
    heli.description[1][2][1] = Blue;
    heli.description[1][2][2] = Blue;
    heli.description[1][2][3] = Blue;
    heli.description[1][2][4] = Blue;
    heli.description[1][2][5] = Blue;
    heli.description[1][3][0] = Black;
    heli.description[1][3][1] = Blue;
    heli.description[1][3][2] = Blue;
    heli.description[1][3][3] = Blue;
    heli.description[1][3][4] = Blue;
    heli.description[1][3][5] = Blue;
    heli.description[1][4][0] = Black;
    heli.description[1][4][1] = Black;
    heli.description[1][4][2] = Black;
    heli.description[1][4][3] = Black;
    heli.description[1][4][4] = Black;
    heli.description[1][4][5] = Black;
    heli.description[1][5][0] = Black;
    heli.description[1][5][1] = Black;
    heli.description[1][5][2] = Black;
    heli.description[1][5][3] = Black;
    heli.description[1][5][4] = Black;
    heli.description[1][5][5] = Black;
    // 2nd middle layer
    heli.description[2][0][0] = Black;
    heli.description[2][0][1] = Black;
    heli.description[2][0][2] = Black;
    heli.description[2][0][3] = Black;
    heli.description[2][0][4] = Black;
    heli.description[2][0][5] = Black;
    heli.description[2][1][0] = Black;
    heli.description[2][1][1] = Black;
    heli.description[2][1][2] = Black;
    heli.description[2][1][3] = Black;
    heli.description[2][1][4] = Black;
    heli.description[2][1][5] = Black;
    heli.description[2][2][0] = Black;
    heli.description[2][2][1] = Blue;
    heli.description[2][2][2] = Blue;
    heli.description[2][2][3] = Black;
    heli.description[2][2][4] = Black;
    heli.description[2][2][5] = Black;
    heli.description[2][3][0] = Black;
    heli.description[2][3][1] = Blue;
    heli.description[2][3][2] = Blue;
    heli.description[2][3][3] = Black;
    heli.description[2][3][4] = Black;
    heli.description[2][3][5] = Black;
    heli.description[2][4][0] = Black;
    heli.description[2][4][1] = Black;
    heli.description[2][4][2] = Black;
    heli.description[2][4][3] = Black;
    heli.description[2][4][4] = Black;
    heli.description[2][4][5] = Black;
    heli.description[2][5][0] = Black;
    heli.description[2][5][1] = Black;
    heli.description[2][5][2] = Black;
    heli.description[2][5][3] = Black;
    heli.description[2][5][4] = Black;
    heli.description[2][5][5] = Black;
    // bottom layer
    heli.description[3][0][0] = Black;
    heli.description[3][0][1] = Black;
    heli.description[3][0][2] = Black;
    heli.description[3][0][3] = Black;
    heli.description[3][0][4] = Black;
    heli.description[3][0][5] = Black;
    heli.description[3][1][0] = Black;
    heli.description[3][1][1] = Black;
    heli.description[3][1][2] = Black;
    heli.description[3][1][3] = Black;
    heli.description[3][1][4] = Black;
    heli.description[3][1][5] = Black;
    heli.description[3][2][0] = Blue;
    heli.description[3][2][1] = Black;
    heli.description[3][2][2] = Blue;
    heli.description[3][2][3] = Black;
    heli.description[3][2][4] = Black;
    heli.description[3][2][5] = Black;
    heli.description[3][3][0] = Blue;
    heli.description[3][3][1] = Black;
    heli.description[3][3][2] = Blue;
    heli.description[3][3][3] = Black;
    heli.description[3][3][4] = Black;
    heli.description[3][3][5] = Black;
    heli.description[3][4][0] = Black;
    heli.description[3][4][1] = Black;
    heli.description[3][4][2] = Black;
    heli.description[3][4][3] = Black;
    heli.description[3][4][4] = Black;
    heli.description[3][4][5] = Black;
    heli.description[3][5][0] = Black;
    heli.description[3][5][1] = Black;
    heli.description[3][5][2] = Black;
    heli.description[3][5][3] = Black;
    heli.description[3][5][4] = Black;
    heli.description[3][5][5] = Black;

    heli.setIt();  // display helicopter
    delay(3000);
    for (int count = 0; count < 10; count++) {  // make the tail light blink
        blinkRed();
        heli.setIt();
        delay(500);
    }
    for (int count = 0; count < 19; count++) {  // start the rotor turning
        blinkRed();
        heli.setIt();
        rotor();
        rotor();
        rotor();
        rotor();
        rotor();
    }
    for (int count = 0; count < 40; count++) {  // now the helicopter is flying
        heli.bounceIt();
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
    if (heli.description[0][3][0] == Black) {  // now it's landing
        rotor();
    }
    for (int count = 0; count < 9; count++) {  // make the rotor stop where it started
        blinkRed();
        heli.setIt();
        rotor();
        rotor();
        rotor();
        rotor();
        rotor();
    }
    for (int count = 0; count < 11; count++) {  // rotor stops but tail light still blinks
        blinkRed();
        heli.setIt();
        delay(500);
    }
    delay(3000);  // blinking stops
    rot = 1;
    blinkMe = 0;
    clearCube();  // done - clear the cube
    delay(1000);

}

void rotor() {  // makes the rotor rotate
    switch (rot) {
        case 1:
            heli.description[0][3][0] = Black;
            heli.description[0][3][1] = Black;
            heli.description[0][3][2] = Black;
            heli.description[0][2][3] = Black;
            heli.description[0][2][4] = Black;
            heli.description[0][2][5] = Black;
            heli.description[0][0][0] = White;
            heli.description[0][1][1] = White;
            heli.description[0][2][2] = White;
            heli.description[0][3][3] = White;
            heli.description[0][4][4] = White;
            heli.description[0][5][5] = White;
            rot = 2;
            break;
        case 2:
            heli.description[0][0][0] = Black;
            heli.description[0][1][1] = Black;
            heli.description[0][2][2] = Black;
            heli.description[0][3][3] = Black;
            heli.description[0][4][4] = Black;
            heli.description[0][5][5] = Black;
            heli.description[0][5][3] = White;
            heli.description[0][4][3] = White;
            heli.description[0][3][3] = White;
            heli.description[0][2][2] = White;
            heli.description[0][1][2] = White;
            heli.description[0][0][2] = White;
            rot = 3;
            break;
        case 3:
            heli.description[0][5][3] = Black;
            heli.description[0][4][3] = Black;
            heli.description[0][3][3] = Black;
            heli.description[0][2][2] = Black;
            heli.description[0][1][2] = Black;
            heli.description[0][0][2] = Black;
            heli.description[0][5][0] = White;
            heli.description[0][4][1] = White;
            heli.description[0][3][2] = White;
            heli.description[0][2][3] = White;
            heli.description[0][1][4] = White;
            heli.description[0][0][5] = White;
            rot = 4;
            break;
        case 4:
            heli.description[0][5][0] = Black;
            heli.description[0][4][1] = Black;
            heli.description[0][3][2] = Black;
            heli.description[0][2][3] = Black;
            heli.description[0][1][4] = Black;
            heli.description[0][0][5] = Black;
            heli.description[0][3][0] = White;
            heli.description[0][3][1] = White;
            heli.description[0][3][2] = White;
            heli.description[0][2][3] = White;
            heli.description[0][2][4] = White;
            heli.description[0][2][5] = White;
            rot = 1;
            break;
    }
    heli.setIt();
    delay(80);
}

void blinkRed() {  // turns tail light on if off, or off if on.
    if (blinkMe == 0) {
        blinkMe = 1;
        heli.description[1][2][5] = Blue;
        heli.description[1][3][5] = Blue;
    }
    else {
        blinkMe = 0;
        heli.description[1][2][5] = Red;
        heli.description[1][3][5] = Red;
    }
}

