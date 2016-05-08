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

// This animation is similar to the single swirl except our sprites are 2 x 2 x 2 in size.  They are just as easy to create as our single LED sprites, 
// and are much easier to track as they move about in the cube. 

void Multi_Swirl() {
    sprite LED1(2, 2, 2);  //create 6 sprites
    LED1.colorIt(Yellow);
    LED1.place = {5, 4, 3};
    LED1.motion = {1, -2, 1};

    sprite LED2(2, 2, 2);
    LED2.colorIt(Green);
    LED2.place = {3, 4, 5};
    LED2.motion = {2, 1, -2};

    sprite LED3(2, 2, 2);
    LED3.colorIt(Blue);
    LED3.place = {2, 6, 3};
    LED3.motion = {1, -1, -1};

    sprite LED4(2, 2, 2);
    LED4.colorIt(Violet);
    LED4.place = {5, 1, 2};
    LED4.motion = {2, 1, -1};

    sprite LED5(2, 2, 2);
    LED5.colorIt(Orange);
    LED5.place = {1, 2, 3};
    LED5.motion = {1, 1, 2};

    sprite LED6(2, 2, 2);
    LED6.colorIt(Red);
    LED6.place = {5, 1, 2};
    LED6.motion = {2, 1, -1};

    for (int count = 0; count < 150; count++) {  //now bounce all these sprites around in the cube
        LED1.bounceIt();
        LED2.bounceIt();
        LED3.bounceIt();
        LED4.bounceIt();
        LED5.bounceIt();
        LED6.bounceIt();
        delay(125); // delay 125msec between each movement.
    }
    LED1.clearIt();
    LED2.clearIt();
    LED3.clearIt();
    LED4.clearIt();
    LED5.clearIt();
    LED6.clearIt();
    delay(1000);
}
