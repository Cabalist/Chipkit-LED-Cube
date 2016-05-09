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

// This is a new Fireworks animation
// This version is a single color, which must be specified
// Also must specify the XY coordinates where it will appear
void Fireworks() {
    fireWork(3, 4, Blue);
    fireWork2(3, 5);
    fireWork(7, 2, White);
    fireWork(4, 4, Red);
    fireWork2(5, 4);
    fireWork(3, 3, Green);
    fireWork(2, 5, White);
    delay(1000);
}

void fireWork(int x, int y, int mycolor) {
    int mydelay = 80;
    float polar;
    getColor(mycolor, 4);
    for (int layer = 0; layer < 6; layer++) { // firework goes up here
        LED(x, y, layer, 15, 31, 31);
        delay(mydelay);
        if (layer == 5) {
            delay(mydelay);  // pauses slightly at the top
        }
        LED(x, y, layer, 0, 0, 0);
    }


    for (int layer = 0; layer < 8; layer++) { // starts to explode
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar < 1) {
                    LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(mydelay);
    for (int layer = 0; layer < 8; layer++) { // continues to explode
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar < 2) {
                    LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(mydelay);
    for (int layer = 0; layer < 8; layer++) { //continues to explode
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar < 3) {
                    LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(mydelay * 3);  //pauses extra time at max expansion
    for (int layer = 0; layer < 8; layer++) {  // then starts to fade
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar == 2) {
                    LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(mydelay);
    for (count = 0; count < 8; count++) {  // now what is left move down slowly
        shiftDown();  // shiftDown also fades the remains as they fall.
        delay(mydelay * 2);
    }
    delay(random(4) * 1000);  // pause a random amount of time before next firework.
}

// This is same routine as above color of each element is set at random.  
void fireWork2(int x, int y) {
    int mydelay = 80;

    float polar;
    for (int layer = 0; layer < 6; layer++) {
        LED(x, y, layer, 15, 31, 31);  // on the way up, it's always white
        delay(mydelay);
        if (layer == 5) {
            delay(mydelay);
        }
        LED(x, y, layer, 0, 0, 0);
    }


    for (int layer = 0; layer < 8; layer++) {
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar < 1) {
                    if (random(2) > 0) { myred = 63; }  // here is where we select colors at random.
                    else { myred = 0; }
                    if (random(2) > 0) { mygreen = 63; }
                    else { mygreen = 0; }
                    if (random(2) > 0) { myblue = 63; }
                    else { myblue = 0; }
                    LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(mydelay);
    for (int layer = 0; layer < 8; layer++) {
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar < 2) {
                    if (random(2) > 0) { myred = 63; }
                    else { myred = 0; }
                    if (random(2) > 0) { mygreen = 63; }
                    else { mygreen = 0; }
                    if (random(2) > 0) { myblue = 63; }
                    else { myblue = 0; }
                    LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(mydelay);
    for (int layer = 0; layer < 8; layer++) {
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar < 3) {
                    if (random(2) > 0) { myred = 63; }
                    else { myred = 0; }
                    if (random(2) > 0) { mygreen = 63; }
                    else { mygreen = 0; }
                    if (random(2) > 0) { myblue = 63; }
                    else { myblue = 0; }
                    LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(mydelay * 3);
    for (int layer = 0; layer < 8; layer++) {
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar == 2) {
                    if (random(2) > 0) { myred = 63; }
                    else { myred = 0; }
                    if (random(2) > 0) { mygreen = 63; }
                    else { mygreen = 0; }
                    if (random(2) > 0) { myblue = 63; }
                    else { myblue = 0; }
                    LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(mydelay);
    for (count = 0; count < 8; count++) {
        shiftDown();
        delay(mydelay * 2);
    }
    delay(random(4) * 1000);
}


void shiftDown() {
    for (int x = 0; x < 8; x++) { // copy content of each layer to the layer below it.
        for (int y = 0; y < 8; y++) {
            for (int z = 1; z < 8; z++) {
                for (int c = 0; c < 3; c++) {
                    cube[x][y][z - 1][c] = (cube[x][y][z][c]) / 2;  // the divide by 2 causes it
                    cube[x][y][z][c] = 0;                        // to fade on the way down.
                }
            }
        }
    }
}
