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

/* This animation simulates a bouncing ball.  The timing for lateral movements is constant, but the movement up and down is timed to resemble how the 
ball would bounce under the influence of gravity. This animation requires that we duplicate the .move and .bounce actions of the sprite class modifying them
to account for gravity.  For example, .bounce automatically checks for the edge of the cube and reverses direction, but in this case, we have to do it manually. 
*/
void Basketball_Dribble() {
    sprite mySprite(4, 4, 4);  // Our ball is 4 x 4 x 4.
    mySprite.place[0] = 1;// set up its initial location
    mySprite.place[1] = 2;// set up its initial location
    mySprite.place[2] = 4;// set up its initial location

    mySprite.motion[0] = -1;// set up its initial motion
    mySprite.motion[1] = 1;// set up its initial motion
    mySprite.motion[2] = -1;// set up its initial motion


    // define the shape and color of a red ball.
    // top layer
    mySprite.description[0][0][0] = Black;
    mySprite.description[0][0][1] = Black;
    mySprite.description[0][0][2] = Black;
    mySprite.description[0][0][3] = Black;
    mySprite.description[0][1][0] = Black;
    mySprite.description[0][1][1] = 10;
    mySprite.description[0][1][2] = 10;
    mySprite.description[0][1][3] = Black;
    mySprite.description[0][2][0] = Black;
    mySprite.description[0][2][1] = 10;
    mySprite.description[0][2][2] = 10;
    mySprite.description[0][2][3] = Black;
    mySprite.description[0][3][0] = Black;
    mySprite.description[0][3][1] = Black;
    mySprite.description[0][3][2] = Black;
    mySprite.description[0][3][3] = Black;
    // 1st middle layer
    mySprite.description[1][0][0] = Black;
    mySprite.description[1][0][1] = 10;
    mySprite.description[1][0][2] = 10;
    mySprite.description[1][0][3] = Black;
    mySprite.description[1][1][0] = 10;
    mySprite.description[1][1][1] = 10;
    mySprite.description[1][1][2] = 10;
    mySprite.description[1][1][3] = 10;
    mySprite.description[1][2][0] = 10;
    mySprite.description[1][2][1] = 10;
    mySprite.description[1][2][2] = 10;
    mySprite.description[1][2][3] = 10;
    mySprite.description[1][3][0] = Black;
    mySprite.description[1][3][1] = 10;
    mySprite.description[1][3][2] = 10;
    mySprite.description[1][3][3] = Black;
    // 2nd middle layer
    mySprite.description[2][0][0] = Black;
    mySprite.description[2][0][1] = 10;
    mySprite.description[2][0][2] = 10;
    mySprite.description[2][0][3] = Black;
    mySprite.description[2][1][0] = 10;
    mySprite.description[2][1][1] = 10;
    mySprite.description[2][1][2] = 10;
    mySprite.description[2][1][3] = 10;
    mySprite.description[2][2][0] = 10;
    mySprite.description[2][2][1] = 10;
    mySprite.description[2][2][2] = 10;
    mySprite.description[2][2][3] = 10;
    mySprite.description[2][3][0] = Black;
    mySprite.description[2][3][1] = 10;
    mySprite.description[2][3][2] = 10;
    mySprite.description[2][3][3] = Black;
    // bottom layer
    mySprite.description[3][0][0] = Black;
    mySprite.description[3][0][1] = Black;
    mySprite.description[3][0][2] = Black;
    mySprite.description[3][0][3] = Black;
    mySprite.description[3][1][0] = Black;
    mySprite.description[3][1][1] = 10;
    mySprite.description[3][1][2] = 10;
    mySprite.description[3][1][3] = Black;
    mySprite.description[3][2][0] = Black;
    mySprite.description[3][2][1] = 10;
    mySprite.description[3][2][2] = 10;
    mySprite.description[3][2][3] = Black;
    mySprite.description[3][3][0] = Black;
    mySprite.description[3][3][1] = Black;
    mySprite.description[3][3][2] = Black;
    mySprite.description[3][3][3] = Black;


    for (int count = 0; count < 1600; count++) {  //  bounce the ball about 20 times
        mySprite.clearIt(); // clear the sprite from its current location
        if (count % 15 == 0) {  // move horizontally every 20th step
            mySprite.place[0] = mySprite.place[0] + mySprite.motion[0];
            mySprite.place[1] = mySprite.place[1] + mySprite.motion[1];
        }
        if (mySprite.place[2] == 4 || (mySprite.place[2] == 3 && mySprite.motion[2] < 0)) {  // near the high end of motion . . .
            if (count % 17 == 0) {  // move vertically every 17 steps
                mySprite.place[2] = mySprite.place[2] + mySprite.motion[2];
            }
        }
        if ((mySprite.place[2] == 3 && mySprite.motion[2] > 0) || (mySprite.place[2] == 2 && mySprite.motion[2] < 0)) {  // a little lower . . .
            if (count % 10 == 0) {  // move vertically every 10 steps
                mySprite.place[2] = mySprite.place[2] + mySprite.motion[2];
            }
        }
        if ((mySprite.place[2] == 2 && mySprite.motion[2] > 0) || (mySprite.place[2] == 1 && mySprite.motion[2] < 0)) {  // a little lower
            if (count % 7 == 0) {  // move vertically every 7 steps
                mySprite.place[2] = mySprite.place[2] + mySprite.motion[2];
            }
        }
        if ((mySprite.place[2] == 1 && mySprite.motion[2] > 0) || (mySprite.place[2] < 1)) { // near the bottom of motion
            if (count % 5 == 0) {  // move vertically every 5 steps
                mySprite.place[2] = mySprite.place[2] + mySprite.motion[2];
            }
        }
        mySprite.setIt();  // set the sprite in its new location
        if (mySprite.place[0] < 1 && mySprite.motion[0] < 0) { // now do all the boundary checking for edges of the cube
            mySprite.motion[0] = -mySprite.motion[0];    // and change direction when an edge is detected
        }
        if (mySprite.place[1] < 1 && mySprite.motion[1] < 0) {
            mySprite.motion[1] = -mySprite.motion[1];
        }
        if (mySprite.place[2] < 1 && mySprite.motion[2] < 0) {
            mySprite.motion[2] = -mySprite.motion[2];
        }
        if (mySprite.place[0] > 7 - mySprite.myX && mySprite.motion[0] > 0) {
            mySprite.motion[0] = -mySprite.motion[0];
        }
        if (mySprite.place[1] > 7 - mySprite.myY && mySprite.motion[1] > 0) {
            mySprite.motion[1] = -mySprite.motion[1];
        }
        if (mySprite.place[2] > 7 - mySprite.myZ && mySprite.motion[2] > 0) {
            mySprite.motion[2] = -mySprite.motion[2];
        }
        delay(5);  // timing of each step is 10 msec.
    }
    clearCube();
    delay(1000);
}
