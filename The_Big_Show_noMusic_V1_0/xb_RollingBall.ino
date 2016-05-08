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
This animation uses the new .sphere action of the sprite object class to create a 6 LED diameter sphere where is then rolled around the main cube.  
*/
void RollingBall() {
// This created the sprite and rolls it around the cube. 
// The sprite is rotated around the axis, and then 
// gradually moved back and forth on the x axis.
    int color;
    sprite mySprite(6, 6, 6);
    mySprite.sphere(color);
    mySprite.place = {-1, 1, 1};
    for (int x = 0; x < 95; x++) {
        color = color + 2;
        if (color > 189) { color = 0; }
        mySprite.sphere(color);
        if (x > 15) {
            clearCube();
            mySprite.place[0] = 0;
        }
        if (x > 30) {
            clearCube();
            mySprite.place[0] = 1;
        }
        if (x > 45) {
            clearCube();
            mySprite.place[0] = 2;
        }
        if (x > 60) {
            clearCube();
            mySprite.place[0] = 1;
        }
        if (x > 75) {
            clearCube();
            mySprite.place[0] = 0;
        }
        mySprite.rollX(0);
        delay(50);
    }
    mySprite.clearIt();
    delay(1000);
}



