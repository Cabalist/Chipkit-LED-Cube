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

// In this animation, we demo the sprite class by creating a couple of simple sprites and moving them about the cube. 
void simple_demos() {
    sprite mySprite(2, 2, 2); // this creates a sprite called mySprite with dimensions 2x2x2 LEDs.
    sprite Sprite1(3, 3, 3);
    sprite Sprite2(3, 3, 3);

    mySprite.colorIt(Green); // makes my new sprite green.

    // this is the description of our Sprite 1
    // top layer
    // 1st column,  3 panels
    Sprite1.description[0][0][0] = Black;
    Sprite1.description[0][0][1] = Black;
    Sprite1.description[0][0][2] = Black;
    // 2nd column,  3 panels
    Sprite1.description[0][1][0] = Black;
    Sprite1.description[0][1][1] = Red;
    Sprite1.description[0][1][2] = Black;
    // 3rd column,  3 panels
    Sprite1.description[0][2][0] = Black;
    Sprite1.description[0][2][1] = Black;
    Sprite1.description[0][2][2] = Black;

    // middle layer
    // 1st column,  3 panels
    Sprite1.description[1][0][0] = Black;
    Sprite1.description[1][0][1] = Green;
    Sprite1.description[1][0][2] = Black;
    // 2nd column,  3 panels
    Sprite1.description[1][1][0] = Green;
    Sprite1.description[1][1][1] = Green;
    Sprite1.description[1][1][2] = Green;
    // 3rd column,  3 panels
    Sprite1.description[1][2][0] = Black;
    Sprite1.description[1][2][1] = Green;
    Sprite1.description[1][2][2] = Black;

    // bottom layer
    // 1st column,  3 panels
    Sprite1.description[2][0][0] = Black;
    Sprite1.description[2][0][1] = Black;
    Sprite1.description[2][0][2] = Black;
    // 2nd column,  3 panels
    Sprite1.description[2][1][0] = Black;
    Sprite1.description[2][1][1] = Red;
    Sprite1.description[2][1][2] = Black;
    // 3rd column,  3 panels
    Sprite1.description[2][2][0] = Black;
    Sprite1.description[2][2][1] = Black;
    Sprite1.description[2][2][2] = Black;



    // top layer
    // 1st column,  3 panels
    Sprite2.description[0][0][0] = Black;
    Sprite2.description[0][0][1] = Blue;
    Sprite2.description[0][0][2] = Black;
    // 2nd column,  3 panels
    Sprite2.description[0][1][0] = Blue;
    Sprite2.description[0][1][1] = Blue;
    Sprite2.description[0][1][2] = Blue;
    // 3rd column,  3 panels
    Sprite2.description[0][2][0] = Black;
    Sprite2.description[0][2][1] = Blue;
    Sprite2.description[0][2][2] = Black;

    // middle layer
    // 1st column,  3 panels
    Sprite2.description[1][0][0] = Blue;
    Sprite2.description[1][0][1] = Black;
    Sprite2.description[1][0][2] = Blue;
    // 2nd column,  3 panels
    Sprite2.description[1][1][0] = Black;
    Sprite2.description[1][1][1] = Blue;
    Sprite2.description[1][1][2] = Black;
    // 3rd column,  3 panels
    Sprite2.description[1][2][0] = Blue;
    Sprite2.description[1][2][1] = Black;
    Sprite2.description[1][2][2] = Blue;

    // bottom layer
    // 1st column,  3 panels
    Sprite2.description[2][0][0] = Black;
    Sprite2.description[2][0][1] = Blue;
    Sprite2.description[2][0][2] = Black;
    // 2nd column,  3 panels
    Sprite2.description[2][1][0] = Blue;
    Sprite2.description[2][1][1] = Blue;
    Sprite2.description[2][1][2] = Blue;
    // 3rd column,  3 panels
    Sprite2.description[2][2][0] = Black;
    Sprite2.description[2][2][1] = Blue;
    Sprite2.description[2][2][2] = Black;

    mySprite.place[0] = 1; // locate it in the lower, back corner of the cube
    mySprite.place[1] = 2; // locate it in the lower, back corner of the cube
    mySprite.place[2] = 1; // locate it in the lower, back corner of the cube

    Sprite1.place[0] = 5; // Here we specify the initial location of Sprite 1
    Sprite1.place[1] = 2; // Here we specify the initial location of Sprite 1
    Sprite1.place[2] = 5; // Here we specify the initial location of Sprite 1
    Sprite1.motion[0] = -1; // Here we specify motion of Sprite 1
    Sprite1.motion[1] = 1;  // Here we specify motion of Sprite 1
    Sprite1.motion[2] = -1; // Here we specify motion of Sprite 1

    Sprite2.place[0] = 0; // Here we specify the initial location of Sprite 2
    Sprite2.place[1] = 1; // Here we specify the initial location of Sprite 2
    Sprite2.place[2] = 0; // Here we specify the initial location of Sprite 2

    Sprite2.motion[0] = 1;  // Here we specify motion of Sprite 2
    Sprite2.motion[1] = 2;  // Here we specify motion of Sprite 2
    Sprite2.motion[2] = -1; // Here we specify motion of Sprite 2

    mySprite.setIt(); // actually puts it in the cube, turning on the LEDs.
    delay(2000);

    mySprite.motion[0] = 2; // gives my sprite an initial direction of motion
    mySprite.motion[1] = 1; // gives my sprite an initial direction of motion
    mySprite.motion[2] = 1; // gives my sprite an initial direction of motion
    for (count = 0; count < 100; count++) { // loop around 100 times
        mySprite.bounceIt(); // move the sprite one increment. Reverse direction if cube's edge is detected.
        delay(100); // wait 1/10th second before next move.
    } // finish the loop
    mySprite.clearIt(); // turn off the sprite since we're done.

    Sprite1.setIt();
    delay(500);
    Sprite1.moveIt();
    delay(500);
    Sprite1.moveIt();
    delay(500);
    Sprite1.moveIt();
    delay(2000);
    Sprite1.motion[0] = 1;   // reverse direction
    Sprite1.motion[1] = -1;  // reverse direction
    Sprite1.motion[2] = 1;   // reverse direction
    Sprite1.moveIt();
    delay(500);
    Sprite1.moveIt();
    delay(500);
    Sprite1.moveIt();
    delay(2000);
    Sprite1.clearIt();  // cleanup by removing our sprites when done.

    Sprite2.setIt();
    delay(1000);
    for (int count = 0; count < 10; count++) { // display Sprite 2
        Sprite2.setIt();
        delay(300);
        Sprite2.description[1][1][1] = White;  // make its center LED blink Red
        Sprite2.setIt();
        delay(300);
        Sprite2.description[1][1][1] = Blue;
    }
    Sprite2.description[1][1][1] = White;     // Make center Red
    for (int count = 0; count < 45; count++) { // now bounce it around in the cube
        Sprite2.bounceIt();
        delay(150);
    }
    Sprite2.clearIt();  // now cleanup by removing Sprite 2
}
