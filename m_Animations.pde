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

/*  This is where are animation code is sorted and the subroutines
which support them (subroutines that are not generic and only
support a single animation. */


// As the name implies, this forms a dish, which changes
// color and floats around using the full cube rotation
void dish() {
    mycolor = 0;
    getColor(mycolor, 4);
    for (int j = 0; j < 8; j++) {
        for (byte x = 0; x < 8; x++) {
            for (byte y = 0; y < 8; y++) {
                buffer_LED(x, y, ((x * x) + (y * y)) / 12, myred, mygreen, myblue);
            }
        }
        mycolor = mycolor + 30;
        manage_color();
        rotateCube(1 + random(3), 15);
        for (byte x = 0; x < 8; x++) {
            for (byte y = 0; y < 8; y++) {
                buffer_LED(x, y, ((x * x) + (y * y)) / 12, myred, mygreen, myblue);
            }
        }
        mycolor = mycolor + 30;
        manage_color();
        rotateCube(1 + random(3), -15);
    }
    clearCube();
    clearBufferCube();
    delay(1000);
}

// This is a rotating saddle or hyperbolic paraboloid.  It was originally suppose
// to increase and decrease in amplitude as it rotated.  But I forgot to clear
// the buffer_cube array after each rotation and the result was a cool mixture
// of colors.  I decided to leave it that way.  If you uncomment the clear
// buffer_cube you will see another version, but I like this better.
void saddle() {
    float myZ;
    int z;
    manage_color();
    for (int j = 0; j < 5; j++) {
        for (byte x = 0; x < 8; x++) {  // scan thru each x
            for (byte y = 0; y < 8; y++) {  // scan thru every y
                myZ = (x - 3.5) * (x - 3.5) - (y - 3.5) * (y - 3.5);
                z = int(3.5 + (myZ) / (3 + j));
                buffer_LED(x, y, z, myred, mygreen, myblue);
            }
        }
        manage_color();
        rotateCube(1, 10);
        //  clearBufferCube();
    }
    for (int j = 5; j > -1; j--) {
        for (byte x = 0; x < 8; x++) {  // scan thru each x
            for (byte y = 0; y < 8; y++) {  // scan thru every y
                myZ = (x - 3.5) * (x - 3.5) - (y - 3.5) * (y - 3.5);
                z = int(3.5 + (myZ) / (3 + j));
                buffer_LED(x, y, z, myred, mygreen, myblue);
            }
        }
        manage_color();
        rotateCube(1, -10);
        //  clearBufferCube();
    }
    for (int j = 0; j < 5; j++) {
        for (byte x = 0; x < 8; x++) {  // scan thru each x
            for (byte y = 0; y < 8; y++) {  // scan thru every y
                myZ = (x - 3.5) * (x - 3.5) - (y - 3.5) * (y - 3.5);
                z = int(3.5 + (myZ) / (3 + j));
                buffer_LED(x, y, z, myred, mygreen, myblue);
            }
        }
        manage_color();
        rotateCube(1, 10);
        //  clearBufferCube();
    }
    clearCube();
    clearBufferCube();
    delay(1000);
}

// A simple animation with a panel changing color and rotating.
void colors() {
    for (int j = 0; j < 25; j++) {
        for (int z = 0; z < 8; z++) {
            getColor(mycolor, 4);
            for (int x = 0; x < 8; x++) {
                buffer_LED(x, x, z, myred, mygreen, myblue);
            }
            mycolor = mycolor + 20;
            if (mycolor > 189) {
                mycolor = 0;
            }
        }
        mycolor = count;
        count = count + 10;
        if (count == 190) {
            count = 0;
        }
        rotateCube(1, 15);
    }
    clearCube();
    clearBufferCube();
    delay(1000);
}

// This is the original version of the saddle routine where the clear buffer_cube
// is left in, giving our saddle a single slowly changing color.
void saddle2() {
    float myZ;
    int z;
    manage_color();
    for (byte x = 0; x < 8; x++) {  // scan thru each x
        for (byte y = 0; y < 8; y++) {  // scan thru every y
            myZ = (x - 3.5) * (x - 3.5) - (y - 3.5) * (y - 3.5);
            z = int(3.5 + (myZ) / (15));
            buffer_LED(x, y, z, myred, mygreen, myblue);
        }
    }
    manage_color();
    rotateCube(1, -10);
    clearBufferCube();
    for (int j = 5; j > -1; j--) {
        for (byte x = 0; x < 8; x++) {  // scan thru each x
            for (byte y = 0; y < 8; y++) {  // scan thru every y
                myZ = (x - 3.5) * (x - 3.5) - (y - 3.5) * (y - 3.5);
                z = int(3.5 + (myZ) / (3 + j));
                buffer_LED(x, y, z, myred, mygreen, myblue);
            }
        }
        manage_color();
        rotateCube(1, -10);
        clearBufferCube();
    }
    for (byte x = 0; x < 8; x++) {  // scan thru each x
        for (byte y = 0; y < 8; y++) {  // scan thru every y
            myZ = (x - 3.5) * (x - 3.5) - (y - 3.5) * (y - 3.5);
            z = int(3.5 + (myZ) / (3));
            buffer_LED(x, y, z, myred, mygreen, myblue);
        }
    }
    manage_color();
    rotateCube(5, -10);
    clearBufferCube();

    for (int j = 0; j < 5; j++) {
        for (byte x = 0; x < 8; x++) {  // scan thru each x
            for (byte y = 0; y < 8; y++) {  // scan thru every y
                myZ = (x - 3.5) * (x - 3.5) - (y - 3.5) * (y - 3.5);
                z = int(3.5 + (myZ) / (3 + j));
                buffer_LED(x, y, z, myred, mygreen, myblue);
            }
        }
        manage_color();
        rotateCube(1, -10);
        clearBufferCube();
    }
    manage_color();
    for (byte x = 0; x < 8; x++) {  // scan thru each x
        for (byte y = 0; y < 8; y++) {  // scan thru every y
            myZ = (x - 3.5) * (x - 3.5) - (y - 3.5) * (y - 3.5);
            z = int(3.5 + (myZ) / (15));
            buffer_LED(x, y, z, myred, mygreen, myblue);
        }
    }
    manage_color();
    rotateCube(1, -10);
    clearBufferCube();
    clearCube();
    clearBufferCube();
    delay(1000);
}


void manage_color() {
    mycolor = mycolor + 10;
    if (mycolor > 189) {
        mycolor = 0;
    }
    getColor(mycolor, 4);
}

/*  Atom is my version of Nick Schulze's Atom animation.  There are a lot of things
going on here.  The animation operates in a small set of only 20 columns, represented by
atomTable.  We basically operate around these 20 columns using index i. We step
through the animation with index k, first with k increasing and then with k decreasing.
More positions are lit as k increases. The real action is in which layer each of Atom's
columns is lit up. There is a linear vertical component called p which varies between
0 and 3, and sinewave component controlled by both j(the offset of i) and k.  Together
j and k give us a double sinewave that slowly processes around the cube.
*/
// This is the main Atom routine
void atom() {
    int j, p = 1, up_down;
    int mySpeed = 40;
    mycolor = 0;
    for (int k = 0; k < 20; k++) {  // at first k is increasing
        if (up_down == 0) {  // up_down controls the direction of the linear vertical offset
            p++;
        }
        else {
            p--;
        }
        if (p < 1) {
            up_down = 0;
        }
        if (p > 2) {
            up_down = 1;
        }
        for (int i = 0; i < 20; i++) {  // i steps us through the 20 columns being used
            j = i + 0;  // j is the offset of i for the different lit positions, starting with 0 offset.
            if (j > 19) {
                j = j - 20;
            }
            manage_color2();  // routine that manages color
            // the next line is where the first atom shown gets its position
            LED(atomTable[j][0], atomTable[j][1], 2 + p + int(3 * sin(((j - k) * 12.56) / 20)), myred, myblue, mygreen);
            if (k > 3) {  // if k is >3, then the 2nd atom is shown
                j = i - 3;
                if (j < 0) {
                    j = j + 20;
                }
                manage_color2();
                // the next line is where the 2nd atom shown gets its position
                LED(atomTable[j][0], atomTable[j][1], 2 + p + int(3 * sin(((j - k) * 12.56) / 20)), myred, myblue, mygreen);
            }
            if (k > 6) {
                j = i - 6;
                if (j < 0) {
                    j = j + 20;
                }
                manage_color2();
                LED(atomTable[j][0], atomTable[j][1], 2 + p + int(3 * sin(((j - k) * 12.56) / 20)), myred, myblue, mygreen);
            }
            if (k > 9) {
                j = i - 9;
                if (j < 0) {
                    j = j + 20;
                }
                manage_color2();
                LED(atomTable[j][0], atomTable[j][1], 2 + p + int(3 * sin(((j - k) * 12.56) / 20)), myred, myblue, mygreen);
            }
            if (k > 12) {
                j = i - 12;
                if (j < 0) {
                    j = j + 20;
                }
                manage_color2();
                LED(atomTable[j][0], atomTable[j][1], 2 + p + int(3 * sin(((j - k) * 12.56) / 20)), myred, myblue, mygreen);
            }
            if (k > 15) {
                j = i - 15;
                if (j < 0) {
                    j = j + 20;
                }
                manage_color2();
                LED(atomTable[j][0], atomTable[j][1], 2 + p + int(3 * sin(((j - k) * 12.56) / 20)), myred, myblue, mygreen);
            }
            if (k > 18) {
                j = i - 18;
                if (j < 0) {
                    j = j + 20;
                }
                manage_color2();
                LED(atomTable[j][0], atomTable[j][1], 2 + p + int(3 * sin(((j - k) * 12.56) / 20)), myred, myblue, mygreen);
            }
            delay(mySpeed);
            clearAtom();  //clears the cube, but only the columns being used.
        }
        mycolor = mycolor + (k * 8); // k is used to offset the color in addition to changing as we go through
        getColor(mycolor, 4);  // the various positions.
    }
    for (int k = 18; k > 0; k--) {  // Now we do it all over again with k declining
        if (up_down == 0) {
            p++;
        }
        else {
            p--;
        }
        if (p < 1) {
            up_down = 0;
        }
        if (p > 2) {
            up_down = 1;
        }
        for (int i = 0; i < 20; i++) {
            j = i + 0;
            if (j > 19) {
                j = j - 20;
            }
            manage_color2();
            LED(atomTable[j][0], atomTable[j][1], 2 + p + int(3 * sin(((j - k) * 12.56) / 20)), myred, myblue, mygreen);
            if (k > 3) {
                j = i - 3;
                if (j < 0) {
                    j = j + 20;
                }
                manage_color2();
                LED(atomTable[j][0], atomTable[j][1], 2 + p + int(3 * sin(((j - k) * 12.56) / 20)), myred, myblue, mygreen);
            }
            if (k > 6) {
                j = i - 6;
                if (j < 0) {
                    j = j + 20;
                }
                manage_color2();
                LED(atomTable[j][0], atomTable[j][1], 2 + p + int(3 * sin(((j - k) * 12.56) / 20)), myred, myblue, mygreen);
            }
            if (k > 9) {
                j = i - 9;
                if (j < 0) {
                    j = j + 20;
                }
                manage_color2();
                LED(atomTable[j][0], atomTable[j][1], 2 + p + int(3 * sin(((j - k) * 12.56) / 20)), myred, myblue, mygreen);
            }
            if (k > 12) {
                j = i - 12;
                if (j < 0) {
                    j = j + 20;
                }
                manage_color2();
                LED(atomTable[j][0], atomTable[j][1], 2 + p + int(3 * sin(((j - k) * 12.56) / 20)), myred, myblue, mygreen);
            }
            if (k > 15) {
                j = i - 15;
                if (j < 0) {
                    j = j + 20;
                }
                manage_color2();
                LED(atomTable[j][0], atomTable[j][1], 2 + p + int(3 * sin(((j - k) * 12.56) / 20)), myred, myblue, mygreen);
            }
            if (k > 18) {
                j = i - 18;
                if (j < 0) {
                    j = j + 20;
                }
                manage_color2();
                LED(atomTable[j][0], atomTable[j][1], 2 + p + int(3 * sin(((j - k) * 12.56) / 20)), myred, myblue, mygreen);
            }
            delay(mySpeed);
            clearAtom();
        }
        mycolor = mycolor + (k);
        getColor(mycolor, 4);
    }
    delay(1000);
}

// This changes colors for Atom
void manage_color2() {
    getColor(mycolor, 4);
    mycolor = mycolor + 2;
    if (mycolor > 189) { mycolor = 0; }
}

// This little routine clears the cube, but for speed,
// it only operates on the specific columns used by Atom
void clearAtom() {
    for (byte j = 0; j < 20; j++) {
        for (byte layer = 0; layer < 8; layer++) {
            cube[int(atomTable[j][0])][int(atomTable[j][1])][layer][0] = 0;
            cube[int(atomTable[j][0])][int(atomTable[j][1])][layer][1] = 0;
            cube[int(atomTable[j][0])][int(atomTable[j][1])][layer][2] = 0;
        }
    }
}

// This is the series of calls to the SwingAll subroutine.
void swings() {
    int myTime = 25;

    swingAll("1f", "xx", "xx", myTime);
    swingAll("4f", "xx", "xx", myTime);
    swingAll("3f", "xx", "xx", myTime);
    swingAll("2f", "xx", "xx", myTime);
    swingAll("2r", "xx", "xx", myTime);
    swingAll("3r", "xx", "xx", myTime);
    swingAll("4r", "xx", "xx", myTime);
    swingAll("1r", "xx", "xx", myTime);
    swingAll("pfy", "xx", "xx", myTime);
    swingAll("pry", "xx", "xx", myTime);

    swingAll("xx", "1f", "xx", myTime);
    swingAll("xx", "4f", "xx", myTime);
    swingAll("xx", "3f", "xx", myTime);
    swingAll("xx", "2f", "xx", myTime);
    swingAll("xx", "2r", "xx", myTime);
    swingAll("xx", "3r", "xx", myTime);
    swingAll("xx", "4r", "xx", myTime);
    swingAll("xx", "1r", "xx", myTime);
    swingAll("xx", "pfx", "xx", myTime);
    swingAll("xx", "prx", "xx", myTime);

    swingAll("xx", "xx", "1f", myTime);
    swingAll("xx", "xx", "4f", myTime);
    swingAll("xx", "xx", "3f", myTime);
    swingAll("xx", "xx", "2f", myTime);
    swingAll("xx", "xx", "2r", myTime);
    swingAll("xx", "xx", "3r", myTime);
    swingAll("xx", "xx", "4r", myTime);
    swingAll("xx", "xx", "1r", myTime);
    swingAll("xx", "xx", "pfx", myTime);
    swingAll("xx", "xx", "prx", myTime);

    myTime = 35;
    swingAll("2r", "xx", "1f", myTime);
    swingAll("3r", "xx", "4f", myTime);
    swingAll("4r", "xx", "3f", myTime);
    swingAll("1r", "xx", "2f", myTime);
    swingAll("1f", "xx", "1f", myTime);
    swingAll("4f", "xx", "4f", myTime);
    swingAll("3f", "xx", "3f", myTime);
    swingAll("2f", "xx", "2f", myTime);

    swingAll("xx", "1f", "2r", myTime);
    swingAll("xx", "4f", "3r", myTime);
    swingAll("xx", "3f", "4r", myTime);
    swingAll("xx", "2f", "1r", myTime);
    swingAll("xx", "1f", "1f", myTime);
    swingAll("xx", "4f", "4f", myTime);
    swingAll("xx", "3f", "3f", myTime);
    swingAll("xx", "2f", "2f", myTime);

    swingAll("2r", "1f", "xx", myTime);
    swingAll("3r", "4f", "xx", myTime);
    swingAll("4r", "3f", "xx", myTime);
    swingAll("1r", "2f", "xx", myTime);
    swingAll("1f", "2r", "xx", myTime);
    swingAll("4f", "3r", "xx", myTime);
    swingAll("3f", "4r", "xx", myTime);
    swingAll("2f", "1r", "xx", myTime);

    myTime = 45;
    swingAll("1f", "1f", "1f", myTime);
    swingAll("4f", "4f", "4f", myTime);
    swingAll("3f", "3f", "3f", myTime);
    swingAll("2f", "2f", "2f", myTime);

    swingAll("2r", "pfx", "3r", myTime);
    swingAll("2f", "prx", "3f", myTime);

    swingAll("1f", "1f", "1f", myTime);
    swingAll("4f", "4f", "4f", myTime);
    swingAll("3f", "3f", "3f", myTime);
    swingAll("2f", "2f", "2f", myTime);
    swingAll("1f", "1f", "1f", myTime);
    swingAll("4f", "4f", "4f", myTime);

    swingAll("4r", "pfz", "3r", myTime);
    swingAll("4f", "prz", "3f", myTime);

    swingAll("3f", "3f", "3f", myTime);
    swingAll("2f", "2f", "2f", myTime);
    swingAll("1f", "1f", "1f", myTime);
    swingAll("4f", "4f", "4f", myTime);
    swingAll("3f", "3f", "3f", myTime);
    swingAll("2f", "2f", "2f", myTime);
    swingAll("2r", "1f", "1f", myTime);
    swingAll("3r", "4f", "4f", myTime);
    swingAll("4r", "3f", "3f", myTime);

    swingAll("pfy", "3r", "3r", myTime);
    swingAll("pry", "3f", "3f", myTime);

    swingAll("1r", "2f", "2f", myTime);
    swingAll("2r", "1f", "1f", myTime);
    swingAll("3r", "4f", "4f", myTime);
    swingAll("4r", "3f", "3f", myTime);
    swingAll("1r", "2f", "2f", myTime);
    swingAll("2r", "2r", "1f", myTime);

    swingAll("prz", "2f", "1r", myTime);
    swingAll("pfz", "2r", "1f", myTime);

    swingAll("3r", "3r", "4f", myTime);
    swingAll("4r", "4r", "3f", myTime);
    swingAll("1r", "1r", "2f", myTime);
    swingAll("2r", "2r", "1f", myTime);

    swingAll("2f", "2f", "prx", myTime);
    swingAll("2r", "2r", "pfx", myTime);

    swingAll("3r", "3r", "4f", myTime);
    swingAll("4r", "4r", "3f", myTime);
    swingAll("1r", "1r", "2f", myTime);
    swingAll("2r", "2r", "2r", myTime);
    swingAll("3r", "3r", "3r", myTime);
    swingAll("4r", "4r", "4r", myTime);

    swingAll("4f", "4f", "pry", myTime);
    swingAll("4r", "4r", "pfy", myTime);

    swingAll("1r", "1r", "1r", myTime);
    swingAll("2r", "2r", "2r", myTime);
    swingAll("3r", "3r", "3r", myTime);
    swingAll("4r", "4r", "4r", myTime);
    swingAll("1r", "1r", "1r", myTime);

    myTime = 35;
    swingAll("2r", "1f", "xx", myTime);
    swingAll("3r", "4f", "xx", myTime);
    swingAll("4r", "3f", "xx", myTime);
    swingAll("1r", "2f", "xx", myTime);
    swingAll("1f", "2r", "xx", myTime);
    swingAll("4f", "3r", "xx", myTime);
    swingAll("3f", "4r", "xx", myTime);
    swingAll("2f", "1r", "xx", myTime);

    myTime = 25;
    swingAll("1f", "xx", "xx", myTime);
    swingAll("4f", "xx", "xx", myTime);
    swingAll("3f", "xx", "xx", myTime);
    swingAll("2f", "xx", "xx", myTime);
    swingAll("2r", "xx", "xx", myTime);
    swingAll("3r", "xx", "xx", myTime);
    swingAll("4r", "xx", "xx", myTime);
    swingAll("1r", "xx", "xx", myTime);

    swingAll("xx", "1f", "xx", myTime);
    swingAll("xx", "4f", "xx", myTime);
    swingAll("xx", "3f", "xx", myTime);
    swingAll("xx", "2f", "xx", myTime);
    swingAll("xx", "2r", "xx", myTime);
    swingAll("xx", "3r", "xx", myTime);
    swingAll("xx", "4r", "xx", myTime);
    swingAll("xx", "1r", "xx", myTime);

    swingAll("xx", "xx", "1f", myTime);
    swingAll("xx", "xx", "4f", myTime);
    swingAll("xx", "xx", "3f", myTime);
    swingAll("xx", "xx", "2f", myTime);
    swingAll("xx", "xx", "2r", myTime);
    swingAll("xx", "xx", "3r", myTime);
    swingAll("xx", "xx", "4r", myTime);
    swingAll("xx", "xx", "1r", myTime);
    delay(1000);
}

// This is a subroutine that swings three sheets of LEDs from one face of the cube to another.  The string input
// tells the routine the corner which we are going to swing from, and direction of
// rotation.  The time input in milliseconds between steps (25 is pretty fast; 200 is pretty slow).
// It also has some options to sent the sheet straight across the cube instead of swinging. These
// start with a p and then specify the direction and plane of movement.
void swingAll(String RedString, String GreenString, String BlueString, int myTime) {

    for (int i = 0; i < 8; i++) {
        for (int z = 0; z < 8; z++) {
            for (int x = 0; x < 8; x++) {
                // do it all around the z axis
                if (BlueString == "1r") {
                    BlueLED(x, diagonal[x][i], z);
                }
                else if (BlueString == "1f") {
                    BlueLED(diagonal[7 - x][i], 7 - x, z);
                }
                else if (BlueString == "2f") {
                    BlueLED(x, 7 - diagonal[x][i], z);
                }
                else if (BlueString == "2r") {
                    BlueLED(diagonal[7 - x][i], x, z);
                }
                else if (BlueString == "3r") {
                    BlueLED(7 - x, 7 - diagonal[x][i], z);
                }
                else if (BlueString == "3f") {
                    BlueLED(7 - diagonal[7 - x][i], x, z);
                }
                else if (BlueString == "4f") {
                    BlueLED(7 - x, diagonal[x][i], z);
                }
                else if (BlueString == "4r") {
                    BlueLED(7 - diagonal[7 - x][i], 7 - x, z);
                }
                else if (BlueString == "pfy") {
                    BlueLED(x, i / 2, z);
                }
                else if (BlueString == "pry") {
                    BlueLED(x, 7 - (i / 2), z);
                }
                else if (BlueString == "pfx") {
                    BlueLED(i / 2, x, z);
                }
                else if (BlueString == "prx") {
                    BlueLED(7 - (i / 2), x, z);
                }
                // now do it all again around the x axis
                if (RedString == "1r") {
                    RedLED(z, x, diagonal[x][i]);
                }
                else if (RedString == "1f") {
                    RedLED(z, diagonal[7 - x][i], 7 - x);
                }
                else if (RedString == "2f") {
                    RedLED(z, x, 7 - diagonal[x][i]);
                }
                else if (RedString == "2r") {
                    RedLED(z, diagonal[7 - x][i], x);
                }
                else if (RedString == "3r") {
                    RedLED(z, 7 - x, 7 - diagonal[x][i]);
                }
                else if (RedString == "3f") {
                    RedLED(z, 7 - diagonal[7 - x][i], x);
                }
                else if (RedString == "4f") {
                    RedLED(z, 7 - x, diagonal[x][i]);
                }
                else if (RedString == "4r") {
                    RedLED(z, 7 - diagonal[7 - x][i], 7 - x);
                }
                else if (RedString == "pfy") {
                    RedLED(x, i / 2, z);
                }
                else if (RedString == "pry") {
                    RedLED(x, 7 - (i / 2), z);
                }
                else if (RedString == "pfz") {
                    RedLED(x, z, i / 2);
                }
                else if (RedString == "prz") {
                    RedLED(x, z, 7 - (i / 2));
                }
                // now do it all again around the y axis
                if (GreenString == "1r") {
                    GreenLED(x, z, diagonal[x][i]);
                }
                else if (GreenString == "1f") {
                    GreenLED(diagonal[7 - x][i], z, 7 - x);
                }
                else if (GreenString == "2f") {
                    GreenLED(x, z, 7 - diagonal[x][i]);
                }
                else if (GreenString == "2r") {
                    GreenLED(diagonal[7 - x][i], z, x);
                }
                else if (GreenString == "3r") {
                    GreenLED(7 - x, z, 7 - diagonal[x][i]);
                }
                else if (GreenString == "3f") {
                    GreenLED(7 - diagonal[7 - x][i], z, x);
                }
                else if (GreenString == "4f") {
                    GreenLED(7 - x, z, diagonal[x][i]);
                }
                else if (GreenString == "4r") {
                    GreenLED(7 - diagonal[7 - x][i], z, 7 - x);
                }
                else if (GreenString == "pfx") {
                    GreenLED(i / 2, x, z);
                }
                else if (GreenString == "prx") {
                    GreenLED(7 - (i / 2), x, z);
                }
                else if (GreenString == "pfz") {
                    GreenLED(x, z, i / 2);
                }
                else if (GreenString == "prz") {
                    GreenLED(x, z, 7 - (i / 2));
                }
            }
        }
        delay(myTime);
        clearCube();
    }

    for (int i = 6; i > -1; i--) {
        for (int z = 0; z < 8; z++) {
            for (int x = 0; x < 8; x++) {
                // do it all around the z axis
                if (BlueString == "1r") {
                    BlueLED(diagonal[x][i], x, z);
                }
                else if (BlueString == "1f") {
                    BlueLED(7 - x, diagonal[7 - x][i], z);
                }
                else if (BlueString == "2f") {
                    BlueLED(diagonal[x][i], 7 - x, z);
                }
                else if (BlueString == "2r") {
                    BlueLED(7 - x, 7 - diagonal[7 - x][i], z);
                }
                else if (BlueString == "3r") {
                    BlueLED(7 - diagonal[x][i], 7 - x, z);
                }
                else if (BlueString == "3f") {
                    BlueLED(x, 7 - diagonal[7 - x][i], z);
                }
                else if (BlueString == "4f") {
                    BlueLED(7 - diagonal[x][i], x, z);
                }
                else if (BlueString == "4r") {
                    BlueLED(x, diagonal[7 - x][i], z);
                }
                else if (BlueString == "pfy") {
                    BlueLED(x, 3 + (7 - i) / 2, z);
                }
                else if (BlueString == "pry") {
                    BlueLED(x, 4 - (7 - i) / 2, z);
                }
                else if (BlueString == "pfx") {
                    BlueLED(3 + (7 - i) / 2, x, z);
                }
                else if (BlueString == "prx") {
                    BlueLED(4 - (7 - i) / 2, x, z);
                }
                // now do it all again around the x axis
                if (RedString == "1r") {
                    RedLED(z, diagonal[x][i], x);
                }
                else if (RedString == "1f") {
                    RedLED(z, 7 - x, diagonal[7 - x][i]);
                }
                else if (RedString == "2f") {
                    RedLED(z, diagonal[x][i], 7 - x);
                }
                else if (RedString == "2r") {
                    RedLED(z, 7 - x, 7 - diagonal[7 - x][i]);
                }
                else if (RedString == "3r") {
                    RedLED(z, 7 - diagonal[x][i], 7 - x);
                }
                else if (RedString == "3f") {
                    RedLED(z, x, 7 - diagonal[7 - x][i]);
                }
                else if (RedString == "4f") {
                    RedLED(z, 7 - diagonal[x][i], x);
                }
                else if (RedString == "4r") {
                    RedLED(z, x, diagonal[7 - x][i]);
                }
                else if (RedString == "pfy") {
                    RedLED(x, 3 + (7 - i) / 2, z);
                }
                else if (RedString == "pry") {
                    RedLED(x, 4 - (7 - i) / 2, z);
                }
                else if (RedString == "pfz") {
                    RedLED(x, z, 3 + (7 - i) / 2);
                }
                else if (RedString == "prz") {
                    RedLED(x, z, 4 - (7 - i) / 2);
                }

                // now do it all again around the y axis
                if (GreenString == "1r") {
                    GreenLED(diagonal[x][i], z, x);
                }
                else if (GreenString == "1f") {
                    GreenLED(7 - x, z, diagonal[7 - x][i]);
                }
                else if (GreenString == "2f") {
                    GreenLED(diagonal[x][i], z, 7 - x);
                }
                else if (GreenString == "2r") {
                    GreenLED(7 - x, z, 7 - diagonal[7 - x][i]);
                }
                else if (GreenString == "3r") {
                    GreenLED(7 - diagonal[x][i], z, 7 - x);
                }
                else if (GreenString == "3f") {
                    GreenLED(x, z, 7 - diagonal[7 - x][i]);
                }
                else if (GreenString == "4f") {
                    GreenLED(7 - diagonal[x][i], z, x);
                }
                else if (GreenString == "4r") {
                    GreenLED(x, z, diagonal[7 - x][i]);
                }
                else if (GreenString == "pfx") {
                    GreenLED(3 + (7 - i) / 2, x, z);
                }
                else if (GreenString == "prx") {
                    GreenLED(4 - (7 - i) / 2, x, z);
                }
                else if (GreenString == "pfz") {
                    GreenLED(x, z, 3 + (7 - i) / 2);
                }
                else if (GreenString == "prz") {
                    GreenLED(x, z, 4 - (7 - i) / 2);
                }
            }
        }

        delay(myTime);
        clearCube();
    }
}

void RedLED(int x, int y, int z) {
    cube[x][y][z][0] = 63;
}

void GreenLED(int x, int y, int z) {
    cube[x][y][z][1] = 63;
}

void BlueLED(int x, int y, int z) {
    cube[x][y][z][2] = 63;
}


/* Suppose your cube was a sub-atomic particle detector, capable of
   displaying the tracks of neutrinos zipping around everywhere. Watch
   as a burst of neutrinos reaches your cube.  */
void neutrinos() {
    counter = 0;
    zing(4, 7, 7, 0, -1, -1, White);
    delay(1000);
    for (int q = 0; q < 25; q++) {
        if (q < 13) { counter++; }
        else { counter--; }
        zing(0, 5, 5, 1, 1, -1, White);
        zing(0, 7, 1, 1, -1, 1, Blue);
        zing(4, 7, 7, 0, -1, -1, Green);
        zing(5, 0, 6, 0, 1, -1, Purple);
        zing(0, 0, 0, 1, 1, 1, Aqua);
        zing(7, 1, 7, -1, 1, -1, White);
        zing(0, 5, 5, 1, 1, -1, White);
        zing(2, 0, 0, 1, 1, 1, Orange);
        zing(2, 7, 1, 1, -1, 1, Blue);
        zing(6, 7, 2, 0, -1, 1, Purple);
        zing(6, 0, 6, -1, 1, -1, Red);
        zing(2, 5, 7, 1, 1, -1, White);
        zing(3, 2, 7, 0, 0, -1, Yellow);
    }
    delay(1000);
    zing(4, 7, 7, 0, -1, -1, White);
    delay(1000);
}


void zing(int x, int y, int z, int xm, int ym, int zm, int mycolor) {
    getColor(mycolor, 4);
    int newx = x, newy = y, newz = z;
    for (int p = 0; p < 8; p++) {
        if (newx > -1 && newx < 8 && newy > -1 && newy < 8 && newz > -1 && newz < 8) {
            LED(newx, newy, newz, myred, mygreen, myblue);
            delay(25);
            LED(newx, newy, newz, 0, 0, 0);
        }
        newx = newx + xm;
        newy = newy + ym;
        newz = newz + zm;
    }
    delay(random(2000 / (counter * 3 + 1)));
}

// whatThe is the result of a simple experiment. The idea was have each layer going around
// (using the atom table) at a different speed. A lot of work just to end up with a
// simple animation.  Then let's try to put everything back by reversing the process.
// That doesn't quite work.  I had to fudge it a little.  But here it is.
void whatThe() {
    mycolor = 0;
    getColor(mycolor, 4);
    for (int k = 0; k < 6; k++) {
        byte index0 = 0, index1 = 0, index2 = 0, index3 = 0, index4 = 0, index5 = 0, index6 = 0, index7 = 0;
        for (int j = 0; j < 1000; j++) {
            if (j % 20 == 0) { index0++; }
            if (index0 > 19) { index0 = 0; }
            LED(atomTable[index0][0], atomTable[index0][1], 0, myred, myblue, mygreen);
            if (j % 19 == 0) { index1++; }
            if (index1 > 19) { index1 = 0; }
            LED(atomTable[index1][0], atomTable[index1][1], 1, myred, myblue, mygreen);
            if (j % 18 == 0) { index2++; }
            if (index2 > 19) { index2 = 0; }
            LED(atomTable[index2][0], atomTable[index2][1], 2, myred, myblue, mygreen);
            if (j % 17 == 0) { index3++; }
            if (index3 > 19) { index3 = 0; }
            LED(atomTable[index3][0], atomTable[index3][1], 3, myred, myblue, mygreen);
            if (j % 16 == 0) { index4++; }
            if (index4 > 19) { index4 = 0; }
            LED(atomTable[index4][0], atomTable[index4][1], 4, myred, myblue, mygreen);
            if (j % 15 == 0) { index5++; }
            if (index5 > 19) { index5 = 0; }
            LED(atomTable[index5][0], atomTable[index5][1], 5, myred, myblue, mygreen);
            if (j % 14 == 0) { index6++; }
            if (index6 > 19) { index6 = 0; }
            LED(atomTable[index6][0], atomTable[index6][1], 6, myred, myblue, mygreen);
            if (j % 13 == 0) { index7++; }
            if (index7 > 19) { index7 = 0; }
            LED(atomTable[index7][0], atomTable[index7][1], 7, myred, myblue, mygreen);
            mycolor = mycolor + 5;
            if (mycolor > 189) { mycolor = 0; }
            getColor(mycolor, 4);
            if (j % 10 < 1) {
                delay(25 + 25 / (j / 100 + 10));
                clearAtom();
            }
        }
        for (int j = 1000; j < 3000; j++) {
            if (j % 16 == 0) { index0++; }
            if (index0 > 19) { index0 = 0; }
            LED(atomTable[index0][0], atomTable[index0][1], 0, myred, myblue, mygreen);
            if (j % 16 == 0) { index1++; }
            if (index1 > 19) { index1 = 0; }
            LED(atomTable[index1][0], atomTable[index1][1], 1, myred, myblue, mygreen);
            if (j % 16 == 0) { index2++; }
            if (index2 > 19) { index2 = 0; }
            LED(atomTable[index2][0], atomTable[index2][1], 2, myred, myblue, mygreen);
            if (j % 16 == 0) { index3++; }
            if (index3 > 19) { index3 = 0; }
            LED(atomTable[index3][0], atomTable[index3][1], 3, myred, myblue, mygreen);
            if (j % 16 == 0) { index4++; }
            if (index4 > 19) { index4 = 0; }
            LED(atomTable[index4][0], atomTable[index4][1], 4, myred, myblue, mygreen);
            if (j % 16 == 0) { index5++; }
            if (index5 > 19) { index5 = 0; }
            LED(atomTable[index5][0], atomTable[index5][1], 5, myred, myblue, mygreen);
            if (j % 16 == 0) { index6++; }
            if (index6 > 19) { index6 = 0; }
            LED(atomTable[index6][0], atomTable[index6][1], 6, myred, myblue, mygreen);
            if (j % 16 == 0) { index7++; }
            if (index7 > 19) { index7 = 0; }
            LED(atomTable[index7][0], atomTable[index7][1], 7, myred, myblue, mygreen);
            mycolor = mycolor + 5;
            if (mycolor > 189) { mycolor = 0; }
            getColor(mycolor, 4);
            if (j % 10 < 1) {
                delay(25);
                clearAtom();
            }
        }

        for (int j = 3000; j < 4150; j++) {
            if (j % 13 == 0) { index0++; }
            if (index0 > 19) { index0 = 0; }
            LED(atomTable[index0][0], atomTable[index0][1], 0, myred, myblue, mygreen);
            if (j % 14 == 0) { index1++; }
            if (index1 > 19) { index1 = 0; }
            LED(atomTable[index1][0], atomTable[index1][1], 1, myred, myblue, mygreen);
            if (j % 15 == 0) { index2++; }
            if (index2 > 19) { index2 = 0; }
            LED(atomTable[index2][0], atomTable[index2][1], 2, myred, myblue, mygreen);
            if (j % 16 == 0) { index3++; }
            if (index3 > 19) { index3 = 0; }
            LED(atomTable[index3][0], atomTable[index3][1], 3, myred, myblue, mygreen);
            if (j % 17 == 0) { index4++; }
            if (index4 > 19) { index4 = 0; }
            LED(atomTable[index4][0], atomTable[index4][1], 4, myred, myblue, mygreen);
            if (j % 18 == 0) { index5++; }
            if (index5 > 19) { index5 = 0; }
            LED(atomTable[index5][0], atomTable[index5][1], 5, myred, myblue, mygreen);
            if (j % 19 == 0) { index6++; }
            if (index6 > 19) { index6 = 0; }
            LED(atomTable[index6][0], atomTable[index6][1], 6, myred, myblue, mygreen);
            if (j % 20 == 0) { index7++; }
            if (index7 > 19) { index7 = 0; }
            LED(atomTable[index7][0], atomTable[index7][1], 7, myred, myblue, mygreen);
            mycolor = mycolor + 5;
            if (mycolor > 189) { mycolor = 0; }
            getColor(mycolor, 4);
            if (j % 10 < 1) {
                delay(25);
                clearAtom();
            }
        }
        clearAtom();
        for (int j = 0; j < 8; j++) {
            LED(2, 0, j, myred, myblue, mygreen);
        }
        delay(100);
    }
    clearAtom();
    delay(1000);
}

/* Angled is simple - a diagonal plane running from one corner
of the cube to the opposite corner is rotated.  Variations include
multiple planes and different colors.
 */

void angled() {
    getColor(Blue, 4);
    for (int z = 0; z < 8; z++) {
        for (int x = 0; x < 8; x++) {
            for (int y = 0; y < 8; y++) {
                if (x + y == 2 * z) {
                    buffer_LED(x, y, z, myred, mygreen, myblue);
                }
            }
        }
    }
    rotateCube(5, 5);
    for (int j = 0; j < 25; j++) {
        mycolor = mycolor + 5;
        if (mycolor > 189) {
            mycolor = 0;
        }
        int my2ndColor = mycolor + 85;
        if (my2ndColor > 189) {
            my2ndColor = 0;
        }
        getColor(mycolor, 4);
        for (int z = 0; z < 8; z++) {
            for (int x = 0; x < 8; x++) {
                for (int y = 0; y < 8; y++) {
                    if (x + y == 2 * z) {
                        buffer_LED(x, y, z, myred, mygreen, myblue);
                    }
                }
            }
        }
        if (j < 5 || j > 14) {
            getColor(my2ndColor, 4);
        }
        else {
            getColor(mycolor, 4);
        }
        for (int z = 0; z < 8; z++) {
            for (int x = 0; x < 8; x++) {
                for (int y = 0; y < 8; y++) {
                    if (x + y == 2 * z) {
                        if (j < 10 || j > 20) {
                            buffer_LED(x, 7 - y, z, myred, mygreen, myblue);
                        }
                        if (j > 9) {
                            buffer_LED(7 - x, 7 - y, z, myred, mygreen, myblue);
                        }
                    }
                }
            }
        }

        rotateCube(1, 5);
        if (j < 20) { clearBufferCube(); }
    }
    clearCube();
    clearBufferCube();
    delay(1000);
}

// Bouncer is some simple effects based on the sprite object class and its bounce action.
void bouncer() {
    bouncer2();
    bouncer3();
    bouncer1();
    delay(1000);
}

// This version of bouncer has 3 sprites bouncing around the cube while changing colors
void bouncer1() {
    sprite mySprite1(2, 2, 2);
    sprite mySprite2(2, 2, 2);
    sprite mySprite3(2, 2, 2);
    mySprite1.place = {1, 2, 3};
    mySprite2.place = {0, 4, 4};
    mySprite3.place = {4, 4, 0};
    mySprite1.motion = {1, 2, 1};
    mySprite2.motion = {1, -1, -2};
    mySprite3.motion = {-2, -1, -1};
    for (int j = 0; j < 200; j++) {
        mycolor = mycolor + 5;
        if (mycolor > 100) { mycolor = 0; }
        mySprite1.colorIt(mycolor);
        mySprite2.colorIt(mycolor + 40);
        mySprite3.colorIt(mycolor + 80);
        mySprite1.bounceIt();
        delay(50);
        mySprite2.bounceIt();
        delay(50);
        mySprite3.bounceIt();
        delay(50);
    }
    mySprite1.clearIt();
    mySprite2.clearIt();
    mySprite3.clearIt();

}

// This bouncer has a red, green, and blue sprite bouncing back and forth, each in their own
// plane.  It gets faster and faster as it goes.
void bouncer2() {
    sprite mySprite1(2, 2, 2);
    mySprite1.colorIt(Red);
    mySprite1.place = {0, 2, 3};
    mySprite1.motion = {1, 0, 0};
    sprite mySprite2(2, 2, 2);
    mySprite2.colorIt(Green);
    mySprite2.place = {5, 2, 4};
    mySprite2.motion = {0, 1, 0};
    sprite mySprite3(2, 2, 2);
    mySprite3.colorIt(Blue);
    mySprite3.place = {2, 4, 4};
    mySprite3.motion = {0, 0, 1};
    for (int j = 0; j < 210; j++) {
        mySprite1.bounceIt();
        delay(50 - j / 5);
        if (j > 36) {
            mySprite2.bounceIt();
        }
        delay(50 - j / 5);
        if (j > 72) {
            mySprite3.bounceIt();
        }
        delay(50 - j / 5);
    }
    mySprite1.clearIt();
    mySprite2.clearIt();
    mySprite3.clearIt();
}

//  This is a transition between the first two version.  It's a white ball that fades.
void bouncer3() {
    sprite mySprite1(6, 6, 6);
    mySprite1.sphere(White);
    mySprite1.place = {1, 1, 1};
    mySprite1.setIt();
    delay(150);
    for (int j = 3; j > -1; j--) {
        mySprite1.setIt();
        delay(150);
        mySprite1.ChgIntensity(j);
    }
    mySprite1.clearIt();
    delay(500);
}

byte const growTable[4][4] = {
        {3, 4, 0, 0,},
        {2, 5, 3, 4,},
        {1, 6, 2, 5,},
        {0, 7, 1, 6,},
};

//  This animation is based on the grow routine below that builds boxes
//  We create a bunch of interesting effects by rapidly changing the boxes.
void grower() {
    for (int q = 0; q < 15; q++) {
        mycolor = mycolor + 10;
        if (mycolor > 189) { mycolor = 0; }
        grow(0, mycolor, 100);
        grow(1, mycolor, 100);
        grow(2, mycolor, 100);
        grow(3, mycolor, 100);
        delay(100);
        mycolor = mycolor + 10;
        if (mycolor > 189) { mycolor = 0; }
        grow(2, mycolor, 100);
        grow(1, mycolor, 100);
        grow(0, mycolor, 100);
        delay(100);
        if (q % 2) { clearCube(); }
    }
    for (int q = 0; q < 15; q++) {
        if (q % 2) { mycolor = 85; }
        else { mycolor = 0; }
        grow(0, mycolor, 100);
        grow(1, mycolor, 100);
        grow(2, mycolor, 100);
        grow(3, mycolor, 100);
        delay(100);
        grow(2, mycolor, 100);
        grow(1, mycolor, 100);
        grow(0, mycolor, 100);
        delay(100);
        if (q % 2 == 1) {
            clearCube();
        }
    }
    for (int q = 0; q < 15; q++) {
        mycolor = White;
        grow(0, mycolor, 100);
        grow(1, mycolor, 50);
        grow(2, mycolor, 50);
        grow(3, mycolor, 100);
        clearCube();
        grow(2, mycolor, 50);
        clearCube();
        grow(1, mycolor, 50);
        clearCube();
    }
    delay(1000);
}

// this routine builds the outline of a box in the center of the cube.
//  You can specify is size, color and how long it exists.
//
void grow(int sz, int color, int time) {
    getColor(color, 4);
    for (int x = growTable[sz][0]; x < growTable[sz][1] + 1; x++) {
        for (int y = growTable[sz][0]; y < growTable[sz][1] + 1; y++) {
            for (int z = growTable[sz][0]; z < growTable[sz][1] + 1; z++) {
                LED(x, y, z, myred, mygreen, myblue);
            }
        }
    }
    if (sz > 0) {
        for (int x = growTable[sz][2]; x < growTable[sz][3] + 1; x++) {
            for (int y = growTable[sz][2]; y < growTable[sz][3] + 1; y++) {
                for (int z = growTable[sz][2]; z < growTable[sz][3] + 1; z++) {
                    LED(x, y, z, 0, 0, 0);
                }
            }
        }
    }
    delay(time);
}

// Another animations using the sprite object class
// More boxes, but not concentric. These just pop into
// and out of existence with different colors and sizes.
void miniCubes() {
    sprite mysprite1(2, 2, 2);
    sprite mysprite2(3, 3, 3);
    sprite mysprite3(2, 2, 2);
    for (int j = 0; j < 50; j++) {
        get_std_color();
        mysprite1.outline(mycolor);
        mysprite1.place[0] = random(7);
        mysprite1.place[1] = random(7);
        mysprite1.place[2] = random(7);
        mysprite1.setIt();
        delay(200 - j * 3);

        get_std_color();
        mysprite2.outline(mycolor);
        mysprite2.place[0] = random(6);
        mysprite2.place[1] = random(6);
        mysprite2.place[2] = random(6);
        mysprite2.setIt();
        delay(200 - j * 3);

        get_std_color();
        mysprite3.outline(mycolor);
        mysprite3.place[0] = random(7);
        mysprite3.place[1] = random(7);
        mysprite3.place[2] = random(7);
        mysprite3.setIt();
        delay(200 - j * 3);
        mysprite1.clearIt();
        mysprite2.clearIt();
        mysprite3.clearIt();
    }
    delay(1000);
}

// this is used to assign a standard color to a sprite
// by randomly putting a standard color's number in mycolor.
void get_std_color() {
    int colorit = random(8) + 1;
    switch (colorit) {
        case 1:
            mycolor = Red;
            break;
        case 2:
            mycolor = Yellow;
            break;
        case 3:
            mycolor = Green;
            break;
        case 4:
            mycolor = Blue;
            break;
        case 5:
            mycolor = Purple;;
            break;
        case 6:
            mycolor = Violet;
            break;
        case 7:
            mycolor = Orange;
            break;
        case 8:
            mycolor = Aqua;
            break;
        default:
            mycolor = Black;;
    }
}

// This probably holds the record for my simplest animation
void randomLights() {
    // first we select standard colors
    for (int k = 0; k < 12; k++) {
        rnd_std_color();
        for (int j = 0; j < 256; j++) {
            LED(random(8), random(8), random(8), myred, mygreen, myblue);
            LED(random(8), random(8), random(8), 0, 0, 0);
            LED(random(8), random(8), random(8), 0, 0, 0);
            LED(random(8), random(8), random(8), 0, 0, 0);
            LED(random(8), random(8), random(8), 0, 0, 0);
            LED(random(8), random(8), random(8), 0, 0, 0);
            LED(random(8), random(8), random(8), 0, 0, 0);
            delay(8);
        }
    }
    clearCube();
    delay(250);
    mycolor = 0;
    // then we scan through the colors of the rainbow.
    for (int k = 0; k < 35; k++) {
        mycolor = mycolor + 5;
        if (mycolor > 189) { mycolor = 0; }
        getColor(mycolor, 4);
        for (int j = 0; j < 70; j++) {
            LED(random(8), random(8), random(8), myred, mygreen, myblue);
            LED(random(8), random(8), random(8), 0, 0, 0);
            LED(random(8), random(8), random(8), 0, 0, 0);
            LED(random(8), random(8), random(8), 0, 0, 0);
            LED(random(8), random(8), random(8), 0, 0, 0);
            LED(random(8), random(8), random(8), 0, 0, 0);
            LED(random(8), random(8), random(8), 0, 0, 0);
            delay(8);
        }
    }
    mycolor = 170;
    // Finally we hang out in the blue/ violet/ purple area of the
    // spectrum and try to create an effect something like northern lights.
    for (int k = 0; k < 40; k++) {
        if (random(2)) {
            mycolor = mycolor + 5;
            if (mycolor > 189) { mycolor = 180; }
        }
        else {
            mycolor = mycolor - 5;
            if (mycolor < 140) { mycolor = 150; }
        }
        getColor(mycolor, 4);
        for (int j = 0; j < 50; j++) {
            LED(random(8), random(8), random(8), myred, mygreen, myblue);
            LED(random(8), random(8), random(8), 0, 0, 0);
            LED(random(8), random(8), random(8), 0, 0, 0);
            LED(random(8), random(8), random(8), 0, 0, 0);
            LED(random(8), random(8), random(8), 0, 0, 0);
            LED(random(8), random(8), random(8), 0, 0, 0);
            LED(random(8), random(8), random(8), 0, 0, 0);
            delay(8);
        }
    }
    clearCube();
    delay(1000);
}

/*  Paddles basically steals from two other animations.  It uses the
    same separate color drivers as the Swings animation, and it is based
    on the Simple_Rotation scheme introduced in template version 5, where
    we were rotating a red arrow. In this version, we changed the arrow
    and inverted what is lit up creating something like a frame with
    a hollow center.  Then for each color, we rotate around a different
    axis.  */
void paddles() {
    int rotations = 1, mydelay = 35;
    // This is a pattern to be rotated. It can be anything fitting in an 8x8 panel.
    // But for this animation, we are displaying its inverse, so red is dark.
    int const myPattern[8][8] = {
            {Black, Black, Black, Black, Black, Black, Black, Black,},
            {Black, Black, Red,   Red,   Red,   Red,   Black, Black,},
            {Black, Red,   Red,   Red,   Red,   Red,   Red,   Black,},
            {Black, Red,   Red,   Black, Black, Red,   Red,   Black,},
            {Black, Red,   Red,   Black, Black, Red,   Red,   Black,},
            {Black, Red,   Red,   Red,   Red,   Red,   Red,   Black,},
            {Black, Black, Red,   Red,   Red,   Red,   Black, Black,},
            {Black, Black, Black, Black, Black, Black, Black, Black,},
    };
    // This is the table that tells Y how to move for each X as we move though 45 degrees.
    int const table[32] = {
            0, 1, 2, 3, 4, 5, 6, 7, 1, 1, 2, 3, 4, 5, 6, 6, 2, 2, 3, 3, 4, 4, 5, 5, 3, 3, 3, 3, 4, 4, 4, 4};
    for (int j = 0; j < 35; j++) {
        if (j > 5) { mydelay = 45; }
        if (j > 10) { mydelay = 55; }
        if (j > 24) { mydelay = 45; }
        if (j > 29) { mydelay = 35; }
        for (int x = 0; x < rotations; x++) {  // move first 45 degrees
            for (int count = 0; count < 4; count++) {
                for (int layer = 0; layer < 8; layer++) {
                    for (int x = 0; x < 8; x++) {
                        if (myPattern[layer][x] > 0) {
                            if (j < 25) {
                                RedLED(x, table[count * 8 + x], layer);
                            }
                            if (j > 5 && j < 30) {
                                GreenLED(layer, x, table[count * 8 + x]);
                            }
                            if (j > 10) {
                                BlueLED(table[count * 8 + x], layer, x);
                            }
                        }
                    }
                }
                delay(mydelay);
                clearCube();
            }
            for (int count = 0; count < 4; count++) {  // move second 45 degrees
                for (int layer = 0; layer < 8; layer++) {
                    for (int x = 0; x < 8; x++) {
                        if (myPattern[layer][x] > 0) {
                            if (j < 25) {
                                RedLED(x, table[31 - (count * 8 + x)], layer);
                            }
                            if (j > 5 && j < 30) {
                                GreenLED(layer, x, table[31 - (count * 8 + x)]);
                            }
                            if (j > 10) {
                                BlueLED(table[31 - (count * 8 + x)], layer, x);
                            }
                        }
                    }
                }
                delay(mydelay);
                clearCube();
            }

            for (int count = 1; count < 4; count++) {  // move third 45 degrees
                for (int layer = 0; layer < 8; layer++) {
                    for (int x = 0; x < 8; x++) {
                        if (myPattern[layer][x] > 0) {  //???
                            if (j < 25) {
                                RedLED(table[count * 8 + x], 7 - x, layer);
                            }
                            if (j > 5 && j < 30) {
                                GreenLED(layer, table[count * 8 + x], 7 - x);
                            }
                            if (j > 10) {
                                BlueLED(7 - x, layer, table[count * 8 + x]);
                            }
                        }
                    }
                }
                delay(mydelay);
                clearCube();
            }

            for (int count = 0; count < 3; count++) {  // move fourth 45 degrees
                for (int layer = 0; layer < 8; layer++) {
                    for (int x = 0; x < 8; x++) {
                        if (myPattern[layer][x] > 0) {
                            if (j < 25) {
                                RedLED(table[31 - (count * 8 + x)], 7 - x, layer);
                            }
                            if (j > 5 && j < 30) {
                                GreenLED(layer, table[31 - (count * 8 + x)], 7 - x);
                            }
                            if (j > 10) {
                                BlueLED(7 - x, layer, table[31 - (count * 8 + x)]);
                            }
                        }
                    }
                }
                delay(mydelay);
                clearCube();
            }

            for (int count = 0; count < 4; count++) {  // move fifth 45 degrees
                for (int layer = 0; layer < 8; layer++) {
                    for (int x = 0; x < 8; x++) {
                        if (myPattern[layer][x] > 0) {
                            if (j < 25) {
                                RedLED(x, table[count * 8 + x], layer);
                            }
                            if (j > 5 && j < 30) {
                                GreenLED(layer, x, table[count * 8 + x]);
                            }
                            if (j > 10) {
                                BlueLED(table[count * 8 + x], layer, x);
                            }
                        }
                    }
                }
                delay(mydelay);
                clearCube();
            }

            for (int count = 1; count < 4; count++) {  // move sixth 45 degrees
                for (int layer = 0; layer < 8; layer++) {
                    for (int x = 0; x < 8; x++) {
                        if (myPattern[layer][x] > 0) {
                            if (j < 25) {
                                RedLED(x, table[31 - (count * 8 + x)], layer);
                            }
                            if (j > 5 && j < 30) {
                                GreenLED(layer, x, table[31 - (count * 8 + x)]);
                            }
                            if (j > 10) {
                                BlueLED(table[31 - (count * 8 + x)], layer, x);
                            }
                        }
                    }
                }
                delay(mydelay);
                clearCube();
            }

            for (int count = 1; count < 4; count++) {  // move seventh 45 degrees
                for (int layer = 0; layer < 8; layer++) {
                    for (int x = 0; x < 8; x++) {
                        if (myPattern[layer][x] > 0) {
                            if (j < 25) {
                                RedLED(table[count * 8 + x], 7 - x, layer);
                            }
                            if (j > 5 && j < 30) {
                                GreenLED(layer, table[count * 8 + x], 7 - x);
                            }
                            if (j > 10) {
                                BlueLED(7 - x, layer, table[count * 8 + x]);
                            }
                        }
                    }
                }
                delay(mydelay);
                clearCube();
            }
            for (int count = 0; count < 3; count++) {  // move last 45 degrees
                for (int layer = 0; layer < 8; layer++) {
                    for (int x = 0; x < 8; x++) {
                        if (myPattern[layer][x] > 0) {
                            if (j < 25) {
                                RedLED(table[31 - (count * 8 + x)], 7 - x, layer);
                            }
                            if (j > 5 && j < 30) {
                                GreenLED(layer, table[31 - (count * 8 + x)], 7 - x);
                            }
                            if (j > 10) {
                                BlueLED(7 - x, layer, table[31 - (count * 8 + x)]);
                            }
                        }
                    }
                }
                delay(mydelay);
                clearCube();
            }
        }
    }
    clearCube();
    delay(1000);
}

/* Angled2 is another diagonal plane animation.  Variations include
 multiple planes and different colors.
 */

void angled2() {
    mycolor = 0;
    for (int j = 0; j < 80; j++) {
        int mydelay = 100;
        angledx(mycolor, j);
        delay(mydelay);
        clearCube();
        angledy(mycolor, j);
        delay(mydelay);
        clearCube();
        angledz(mycolor, j);
        delay(mydelay);
        clearCube();
        mycolor = mycolor - 5;
        if (mycolor < 0) {
            mycolor = 185;
        }
    }
    clearCube();
    delay(1000);
}

void angledx(int color, int mycount) {
    getColor(color, 4);
    for (int z = 0; z < 8; z++) {
        for (int x = 0; x < 8; x++) {
            for (int y = 0; y < 8; y++) {
                if (x + y == 2 * z) {
                    if (mycount < 40) {
                        LED(x, y, z, myred, mygreen, myblue);
                    }
                    else {
                        LED(x, y, 7 - z, myred, mygreen, myblue);
                    }
                }
            }
        }
    }
}


void angledy(int color, int mycount) {
    getColor(color, 4);
    for (int z = 0; z < 8; z++) {
        for (int x = 0; x < 8; x++) {
            for (int y = 0; y < 8; y++) {
                if (x + y == 2 * z) {
                    if (mycount < 40) {
                        LED(y, z, x, myred, mygreen, myblue);
                    }
                    else {
                        LED(y, z, 7 - x, myred, mygreen, myblue);
                    }
                }
            }
        }
    }
}

void angledz(int color, int mycount) {
    getColor(color, 4);
    for (int z = 0; z < 8; z++) {
        for (int x = 0; x < 8; x++) {
            for (int y = 0; y < 8; y++) {
                if (x + y == 2 * z) {
                    if (mycount < 40) {
                        LED(z, x, y, myred, mygreen, myblue);
                    }
                    else {
                        LED(z, x, 7 - y, myred, mygreen, myblue);
                    }
                }
            }
        }
    }
}

// MazeMice is derived from my previous Mouse animation.  There are three
// mice this time, and the "tails" are much shorter. Nothing fancy, but
// a lot of repetitious code!
void mazemice() {
    int dir1 = 1, dir2 = 1, dir3 = 1;
    int xx1 = 7, xx2 = 7, xx3 = 7, xx11, xx12, xx13, xx21, xx22, xx23, xx31, xx32, xx33;
    int yy1 = 7, yy2 = 7, yy3 = 7, yy11, yy12, yy13, yy21, yy22, yy23, yy31, yy32, yy33;
    int zz1 = 7, zz2 = 7, zz3 = 7, zz11, zz12, zz13, zz21, zz22, zz23, zz31, zz32, zz33;
    int xyz1 = 1, xyz2 = 1, xyz3 = 1;
    for (int myloop; myloop < 820; myloop = myloop + 2) {
        LED(xx1, yy1, zz1, 31, 63, 0);
        LED(xx2, yy2, zz2, 0, 63, 63);
        LED(xx3, yy3, zz3, 31, 0, 63);
        if (myloop > 4) {
            LED(xx11, yy11, zz11, 5, 10, 0);
            LED(xx21, yy21, zz21, 0, 10, 10);
            LED(xx31, yy31, zz31, 5, 0, 10);
            LED(xx12, yy12, zz12, 2, 4, 0);
            LED(xx22, yy22, zz22, 0, 4, 4);
            LED(xx32, yy32, zz32, 2, 0, 4);
        }
        delay(75);
        //  LED(xx1,yy1,zz1,0,0,0);
        //  LED(xx2,yy2,zz2,0,0,0);
        //  LED(xx3,yy3,zz3,0,0,0);
        if (myloop > 4) {
            LED(xx13, yy13, zz13, 0, 0, 0);
            LED(xx23, yy23, zz23, 0, 0, 0);
            LED(xx33, yy33, zz33, 0, 0, 0);
        }
        xx13 = xx12;
        yy13 = yy12;
        zz13 = zz12;
        xx12 = xx11;
        yy12 = yy11;
        zz12 = zz11;
        xx11 = xx1;
        yy11 = yy1;
        zz11 = zz1;
        xx23 = xx22;
        yy23 = yy22;
        zz23 = zz22;
        xx22 = xx21;
        yy22 = yy21;
        zz22 = zz21;
        xx21 = xx2;
        yy21 = yy2;
        zz21 = zz2;
        xx33 = xx32;
        yy33 = yy32;
        zz33 = zz32;
        xx32 = xx31;
        yy32 = yy31;
        zz32 = zz31;
        xx31 = xx3;
        yy31 = yy3;
        zz31 = zz3;
        // For Red, everything is 1
        switch (xyz1) {
            case 1: // moving across layers
                if (dir1 == 1) { // if moving higher?
                    xx1++;
                    if (xx1 > 7) { // Did we hit an edge on the high end?
                        xx1 = 7;
                        xyz1 = 2; // if so, change direction
                        if (yy1 < 4) { // in new direction, move toward the middle
                            dir1 = 1;
                        }
                        else {
                            dir1 = -1;
                        }
                    }
                }
                if (dir1 == -1) {  // if moving lower?
                    xx1--;
                    if (xx1 < 0) { // Did we hit an edge on the low end?
                        xx1 = 0;
                        xyz1 = 3;   // if so, change direction
                        if (zz1 < 4) {  // in new direction, move toward the middle
                            dir1 = 1;
                        }
                        else {
                            dir1 = -1;
                        }
                    }
                }

                if (random(5) == 0) {  // one in 5 times, change move dimension in the  middle of the cube
                    if (random(2) == 0) {  // which way to change dimension?
                        xyz1 = 2;  // move across panels
                    }
                    else {
                        xyz1 = 3;  // move across columns
                    }
                }
                break;

            case 2: // moving across panels  (similar to above)
                if (dir1 == 1) {
                    yy1++;

                    if (yy1 > 7) {
                        yy1 = 7;
                        xyz1 = 3;
                        if (zz1 < 4) {
                            dir1 = 1;
                        }
                        else {
                            dir1 = -1;
                        }
                    }
                }
                if (dir1 == -1) {
                    yy1--;
                    if (yy1 < 0) {
                        yy1 = 0;
                        xyz1 = 1;
                        if (xx1 < 4) {
                            dir1 = 1;
                        }
                        else {
                            dir1 = -1;
                        }
                    }
                }

                if (random(5) == 0) {
                    if (random(2) == 0) {
                        xyz1 = 3;
                    }
                    else {
                        xyz1 = 1;
                    }
                }
                break;
            case 3:  // moving across columns, similar to above
                if (dir1 == 1) {
                    zz1++;
                    if (zz1 > 7) {
                        zz1 = 7;
                        xyz1 = 1;
                        if (xx1 < 4) {
                            dir1 = 1;
                        }
                        else {
                            dir1 = -1;
                        }
                    }
                }
                if (dir1 == -1) {
                    zz1--;
                    if (zz1 < 0) {
                        zz1 = 0;
                        xyz1 = 2;
                        if (yy1 < 4) {
                            dir1 = 1;
                        }
                        else {
                            dir1 = -1;
                        }
                    }
                }

                if (random(5) == 0) {
                    if (random(2) == 0) {
                        xyz1 = 1;
                    }
                    else {
                        xyz1 = 2;
                    }
                }
                break;
        }
        // For Green, everything is 2
        switch (xyz2) {
            case 1: // moving across layers
                if (dir2 == 1) { // if moving higher?
                    xx2++;
                    if (xx2 > 7) { // Did we hit an edge on the high end?
                        xx2 = 7;
                        xyz2 = 2; // if so, change direction
                        if (yy2 < 4) { // in new direction, move toward the middle
                            dir2 = 1;
                        }
                        else {
                            dir2 = -1;
                        }
                    }
                }
                if (dir2 == -1) {  // if moving lower?
                    xx2--;
                    if (xx2 < 0) { // Did we hit an edge on the low end?
                        xx2 = 0;
                        xyz2 = 3;   // if so, change direction
                        if (zz1 < 4) {  // in new direction, move toward the middle
                            dir2 = 1;
                        }
                        else {
                            dir2 = -1;
                        }
                    }
                }

                if (random(5) == 0) {  // one in 5 times, change move dimension in the  middle of the cube
                    if (random(2) == 0) {  // which way to change dimension?
                        xyz2 = 2;  // move across panels
                    }
                    else {
                        xyz2 = 3;  // move across columns
                    }
                }
                break;

            case 2: // moving across panels  (similar to above)
                if (dir2 == 1) {
                    yy2++;

                    if (yy2 > 7) {
                        yy2 = 7;
                        xyz2 = 3;
                        if (zz2 < 4) {
                            dir2 = 1;
                        }
                        else {
                            dir2 = -1;
                        }
                    }
                }
                if (dir2 == -1) {
                    yy2--;
                    if (yy2 < 0) {
                        yy2 = 0;
                        xyz2 = 1;
                        if (xx2 < 4) {
                            dir2 = 1;
                        }
                        else {
                            dir2 = -1;
                        }
                    }
                }

                if (random(5) == 0) {
                    if (random(2) == 0) {
                        xyz2 = 3;
                    }
                    else {
                        xyz2 = 1;
                    }
                }
                break;
            case 3:  // moving across columns, similar to above
                if (dir2 == 1) {
                    zz2++;
                    if (zz2 > 7) {
                        zz2 = 7;
                        xyz2 = 1;
                        if (xx2 < 4) {
                            dir2 = 1;
                        }
                        else {
                            dir1 = -1;
                        }
                    }
                }
                if (dir2 == -1) {
                    zz2--;
                    if (zz2 < 0) {
                        zz2 = 0;
                        xyz2 = 2;
                        if (yy2 < 4) {
                            dir2 = 1;
                        }
                        else {
                            dir2 = -1;
                        }
                    }
                }

                if (random(5) == 0) {
                    if (random(2) == 0) {
                        xyz2 = 1;
                    }
                    else {
                        xyz2 = 2;
                    }
                }
                break;
        }
        // For Blue everything is 3
        switch (xyz3) {
            case 1: // moving across layers
                if (dir3 == 1) { // if moving higher?
                    xx3++;
                    if (xx3 > 7) { // Did we hit an edge on the high end?
                        xx3 = 7;
                        xyz3 = 2; // if so, change direction
                        if (yy3 < 4) { // in new direction, move toward the middle
                            dir3 = 1;
                        }
                        else {
                            dir3 = -1;
                        }
                    }
                }
                if (dir3 == -1) {  // if moving lower?
                    xx3--;
                    if (xx3 < 0) { // Did we hit an edge on the low end?
                        xx3 = 0;
                        xyz3 = 3;   // if so, change direction
                        if (zz3 < 4) {  // in new direction, move toward the middle
                            dir3 = 1;
                        }
                        else {
                            dir3 = -1;
                        }
                    }
                }

                if (random(5) == 0) {  // one in 5 times, change move dimension in the  middle of the cube
                    if (random(2) == 0) {  // which way to change dimension?
                        xyz3 = 2;  // move across panels
                    }
                    else {
                        xyz3 = 3;  // move across columns
                    }
                }
                break;

            case 2: // moving across panels  (similar to above)
                if (dir3 == 1) {
                    yy3++;

                    if (yy3 > 7) {
                        yy3 = 7;
                        xyz3 = 3;
                        if (zz3 < 4) {
                            dir3 = 1;
                        }
                        else {
                            dir3 = -1;
                        }
                    }
                }
                if (dir3 == -1) {
                    yy3--;
                    if (yy3 < 0) {
                        yy3 = 0;
                        xyz3 = 1;
                        if (xx3 < 4) {
                            dir3 = 1;
                        }
                        else {
                            dir3 = -1;
                        }
                    }
                }

                if (random(5) == 0) {
                    if (random(2) == 0) {
                        xyz3 = 3;
                    }
                    else {
                        xyz3 = 1;
                    }
                }
                break;
            case 3:  // moving across columns, similar to above
                if (dir3 == 1) {
                    zz3++;
                    if (zz3 > 7) {
                        zz3 = 7;
                        xyz3 = 1;
                        if (xx3 < 4) {
                            dir3 = 1;
                        }
                        else {
                            dir3 = -1;
                        }
                    }
                }
                if (dir3 == -1) {
                    zz3--;
                    if (zz3 < 0) {
                        zz3 = 0;
                        xyz3 = 2;
                        if (yy3 < 4) {
                            dir3 = 1;
                        }
                        else {
                            dir3 = -1;
                        }
                    }
                }

                if (random(5) == 0) {
                    if (random(2) == 0) {
                        xyz3 = 1;
                    }
                    else {
                        xyz3 = 2;
                    }
                }
                break;
        }

    }
    clearCube();  // Clear the cube
    delay(1000);
}

/* Atom Smasher is a simple animation where two "particles" moving in the Atom table positions
   eventual collide in an explosion.
 */
void atomSmasher() {
    mycolor = 0;
    for (int j = 0; j < 5; j++) {
        for (int k = 0; k < 2; k++) {
            for (int i = 0; i < 20; i++) {
                getColor(mycolor + 80, 4);
                LED(atomTable[19 - i][0], atomTable[19 - i][1], 0, myred, mygreen, myblue);
                delay(30);
                LED(atomTable[19 - i][0], atomTable[19 - i][1], 0, 0, 0, 0);
            }
        }
        for (int z = 15; z > 8; z--) {
            for (int i = 0; i < 20; i++) {
                getColor(mycolor, 4);
                LED(atomTable[i][0], atomTable[i][1], z / 2, myred, mygreen, myblue);

                getColor(mycolor + 80, 4);
                LED(atomTable[19 - i][0], atomTable[19 - i][1], 8 - z / 2, myred, mygreen, myblue);
                delay(30);
                if (i == 9 && z == 9) {
                    explode();
                    break;
                }
                LED(atomTable[i][0], atomTable[i][1], z / 2, 0, 0, 0);
                LED(atomTable[19 - i][0], atomTable[19 - i][1], 8 - z / 2, 0, 0, 0);
            }
        }
        mycolor = mycolor + 20;
        if (mycolor > 189) { mycolor = 0; }
        delay(500);
    }
    clearCube();
    delay(1000);
}

void explode() {
    for (count = 0; count < 9; count++) {  //expand
        show_sphere3();
    }
    clearCube();
    getColor(White, 1);
    for (int p = 0; p < 20; p++) {
        LED(random(3) + 3, random(3) + 3, random(3) + 3, myred, mygreen, myblue);
    }
    for (int p = 0; p < 7; p++) {
        delay(200);
        zdown(1);
    }
}

void show_sphere3() { // draw the sphere and change its color
    getColor(White, 4);
    float polar;
    for (int layer = 0; layer < 8; layer++) {  // scan thru each layer
        for (byte column = 0; column < 8; column++) {  // scan thru every column
            for (byte panel = 0; panel < 8; panel++) {  // scan thru every panel
                x = float(layer); // convert coordinates to floating point to compute distance from center of cube
                y = float(panel);
                z = float(column);
                polar = sqrt((x - 4) * (x - 4) + (y - 6) * (y - 6) + (z - 6) * (z - 6)); // Calculate the distance
                if (polar < count && column < 8 && panel < 8 && layer > -1 && layer < 8) { // if an LED is inside the radius specified by count, turn it on.
                    LED(column, panel, layer, myred, mygreen, myblue);
                }
            }
        }
    }
}


