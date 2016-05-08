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

/* There are currently 9 subroutines here:
 1) The LED sub provides the ability to light any particular LED at a specified location with specified 3 RGB color components. 
 2) The getColor sub the selects colors of the rainbow by number and intensity
 3) The clearCube sub that clears the cube and turn all LEDs off. 
 4) The scrollText sub lets you specify a string of text to be scrolled, specify its 3 RGB color components, and whether to display on 2 or 4 faces of the cube.
 5) The scrollThruX sub lets you specify a string of text to be scrolled, specify its 3 RGB color components,
 and pass it through the middle of the cube from back to front in the X direction.  The scrollUpX subroutine is used by scrollThruX.
 6) The scrollThruY sub lets you specify a string of text to be scrolled, specify its 3 RGB color components,
 and pass it through the middle of the cube from back to front in the X direction.  The scrollUpY subroutine is used by scrollThruX.
 7) The scrollTextStd2 sub lets you specify a string and standard color for display on 2 faces of the cube
 8) The scrollTextStd4 sub lets you specify a string and standard color for display on 4 faces of the cube
 9) The rotate sub lets you specify a string of text to be used, specify its 3 RGB color components,
 and then it rotates the characters, one at a time, in the center of the cube.
 
 First, thanks to SuperTech-IT for suggesting this first subroutine. 
 Very straight forward.  You specify a particular LED with x,y,and z.  Then specify the color by specifying the 3 RGB color components.
 This routine then loads it into the cube matrix.  
 */

void LED(int x, int y, int z, int R, int G, int B) {
    if (R > 63) {
        R = 63;
    }
    if (G > 63) {
        G = 63;
    }
    if (B > 63) {
        B = 63;
    }
    cube[x][y][z][0] = R;
    cube[x][y][z][1] = G;
    cube[x][y][z][2] = B;
}

/* getColor is a subroutine to get 189 colors of the rainbow. It starts at 0 for Red and steps through yellows, greens, aquas, blues,
 purples,etc. ending at 189.  190 specifies white, and anything above that specifies black (all off).   Intensities are 1 through 4 with
 4 the brightest.  0 intensity is all off.  There's no color wheel math here - just two colors mixed with a combined intensity = 63. Then
 for lower intensities, with each step down in intensity, all three color intensities are divided by 2. 
 
 A few standard colors my be specified by their names: Black, Red, Orange, Yellow, Green, Aqua, Blue, Violet, Purple,
 and White.  Intensities for these standard colors are also 0 (full off) to 4 (brightest).
 
 It sets up the RGB color components for the selected color in global variables myred, mygreen, and myblue. These can then be transferred to the cube array.  
 */
void getColor(int color, int intensity) {

    if (color < 64) {
        mycase = 1;
    }
    if ((color > 63) && (color < 127)) {
        mycase = 2;
    }
    if ((color > 126) && (color < 190)) {
        mycase = 3;
    }
    if (color == 190) {
        mycase = 4;
    }
    if (color > 190) {
        mycase = 5;
    }
    switch (mycase) {
        case 1:
            mygreen = color;
            myred = 63 - mygreen;
            myblue = 0;
            break;
        case 2:
            myblue = color - 63;
            mygreen = 63 - myblue;
            myred = 0;
            break;
        case 3:
            myred = color - 127;
            myblue = 63 - myred;
            mygreen = 0;
            break;
        case 4:
            myred = 63;
            myblue = 63;
            mygreen = 63;
            break;
        case 5:
            myred = 0;
            myblue = 0;
            mygreen = 0;
            break;
    }
    if (intensity < 5) {
        myred = myred / 2;
        mygreen = mygreen / 2;
        myblue = myblue / 2;
    }
    if (intensity < 4) {
        myred = myred / 2;
        mygreen = mygreen / 2;
        myblue = myblue / 2;
    }
    if (intensity < 3) {
        myred = myred / 2;
        mygreen = mygreen / 2;
        myblue = myblue / 2;
    }
    if (intensity < 2) {
        myred = myred / 2;
        mygreen = mygreen / 2;
        myblue = myblue / 2;
    }
    if (intensity < 1) {
        myred = 0;
        mygreen = 0;
        myblue = 0;
    }
}

// This subroutine turns off every LED in the cube.
void clearCube() {
    for (byte layer = 0; layer < 8; layer++) {  // scan thru each layer
        for (byte column = 0; column < 8; column++) {  // scan thru every column
            for (byte panel = 0; panel < 8; panel++) {  // scan thru every panel
                cube[layer][panel][column][0] = 0;
                cube[layer][panel][column][1] = 0;
                cube[layer][panel][column][2] = 0;
            }
        }
    }
}

/* This subroutine scrolls text around the outside walls of the cube.  You first specify a string of text up to 120 characters long. 
 Then specify its color as red, green, blue components.  Finally specify Mode, which is 2 for scrolling on only 2 walls of the
 or 4 for scrolling on all 4 walls. Speed of scrolling is defined by scrollRate in the first tab.  
 */
void scrollText(char mystring[120], int xRed, int xGreen, int xBlue, int Mode) {
    for (int xxx = 0; xxx < 120; xxx++) { // This "for" loop processes the incoming string one character at a time
        incomingByte = mystring[xxx];
        if (incomingByte == '\0') { // if end of string is found,.
            for (int count = 0; count < 4; count++) { // scroll the last character off the cube
                scrollOneChar(xRed, xGreen, xBlue, Mode);
            }
            delay(1000);  // wait 1 second and exit the loop
            break;
        }
        offset = (incomingByte - 32) * 8;  // convert one character in the string into font code
        for (int col = 0; col < 8; col++) {
            for (int row = 0; row < 8; row++) {
                if (myfont[offset + col][row] > 0) {
                    text_buffer[col + 37][row] = 1;  // and put it into the text buffer in the last position.
                }
            }
        }
        // This moves the characters around the cube,   It's in behind the scenes.
        scrollOneChar(xRed, xGreen, xBlue, Mode);
    }
    for (int col = 0; col < 46; col++) {  // when we are all finished with this string, clear the text buffer.
        for (int row = 0; row < 8; row++) {
            text_buffer[col][row] = 0;
        }
    }
}

// This is a simplified text scrolling routine that require only an input string and a specified standard 
// color like Red, Orange, White, etc.  Scrolls text on 2 sides of cube. 
void scrollTextStd2(char mystring[120], int xColor) {
    getColor(xColor, 4);
    scrollText(mystring, myred, mygreen, myblue, 2);
}

// This is a simplified text scrolling routine that require only an input string and a specified standard 
// color like Red, Orange, White, etc.  Scrolls text on 4 sides of cube. 
void scrollTextStd4(char mystring[120], int xColor) {
    getColor(xColor, 4);
    scrollText(mystring, myred, mygreen, myblue, 4);
}

/* This subroutine scrolls text toward you through the cube changing X   You first specify a string of text up to 120 characters long. 
 Then specify its color as red, green, blue components.  Speed of scrolling is defined by scrollRate in the first tab.  
 */
void scrollThruX(char mystring[120], int xRed, int xGreen, int xBlue) {
    for (int xxx = 0; xxx < 120; xxx++) { // This "for" loop processes the incoming string one character at a time
        incomingByte = mystring[xxx];
        if (incomingByte == '\0') { // if end of string is found,.
            for (int count = 0; count < 4; count++) { // scroll the last character off the cube
                scrollUpX();
            }
            delay(1000);  // wait 1 second and exit the loop
            break;
        }
        offset = (incomingByte - 32) * 8;  // convert one character in the string into font code

        for (int panel = 0; panel < 8; panel++) {
            for (int row = 0; row < 8; row++) {
                if (myfont[offset + panel][row] > 0) {
                    LED(0, panel, row, xRed, xGreen, xBlue);  // and put it into the text buffer in the last position.
                }
            }
        }


        // This moves the characters through the cube,
        scrollUpX();
        scrollUpX();
        scrollUpX();
        scrollUpX();
        scrollUpX();
    }
}

//This subroutine scrolls text toward you through the cube changing Y   You first specify a string of text up to 120 characters long.

// Then specify its color as red, green, blue components.  Speed of scrolling is defined by scrollRate in the first tab.  
void scrollThruY(char mystring[120], int xRed, int xGreen, int xBlue) {
    for (int xxx = 0; xxx < 120; xxx++) { // This "for" loop processes the incoming string one character at a time
        incomingByte = mystring[xxx];
        if (incomingByte == '\0') { // if end of string is found,.
            for (int count = 0; count < 4; count++) { // scroll the last character off the cube
                scrollUpY();
            }
            delay(1000);  // wait 1 second and exit the loop
            break;
        }
        offset = (incomingByte - 32) * 8;  // convert one character in the string into font code

        for (int col = 0; col < 8; col++) {
            for (int row = 0; row < 8; row++) {
                if (myfont[offset + col][row] > 0) {
                    LED(col, 7, row, xRed, xGreen, xBlue);  // and put it into the text buffer in the last position.
                }
            }
        }

        // This moves the characters through the cube,
        scrollUpY();
        scrollUpY();
        scrollUpY();
        scrollUpY();
        scrollUpY();
    }
}


// this routine pulls the contents of the cube forward one position on the X axis
void scrollUpX() {
    delay(scrollRate / 8);
    for (int panel = 0; panel < 8; panel++) {
        for (int row = 0; row < 8; row++) {
            for (int myX = 7; myX > 0; myX--) {
                cube[myX][panel][row][0] = cube[myX - 1][panel][row][0]; // move cube content by one LED in +X direction
                cube[myX][panel][row][1] = cube[myX - 1][panel][row][1];
                cube[myX][panel][row][2] = cube[myX - 1][panel][row][2];
            }
            cube[0][panel][row][0] = 0; // and turn off X(0)
            cube[0][panel][row][1] = 0;
            cube[0][panel][row][2] = 0;
        }
    }
}

// this routine pulls the contents of the cube forward one position on the Y axis
void scrollUpY() {
    delay(scrollRate / 8);
    for (int col = 0; col < 8; col++) {
        for (int row = 0; row < 8; row++) {
            for (int myY = 1; myY < 8; myY++) {
                cube[col][myY - 1][row][0] = cube[col][myY][row][0]; // move cube content by one LED in +X direction
                cube[col][myY - 1][row][1] = cube[col][myY][row][1];
                cube[col][myY - 1][row][2] = cube[col][myY][row][2];
            }
            cube[col][7][row][0] = 0; // and turn off X(0)
            cube[col][7][row][1] = 0;
            cube[col][7][row][2] = 0;
        }
    }
}

// This routine rotates the characters around in the center of the cube, one at a time.  You can specify a color by its RGB component
// and the number of rotations before moving on to the next character. 
void rotate(char mystring[120], int xRed, int xGreen, int xBlue, int numRotations) {
    for (int xxx = 0; xxx < 120; xxx++) { // This "for" loop processes the incoming string one character at a time
        incomingByte = mystring[xxx];
        if (incomingByte == '\0') { // if end of string is found,.
            delay(1000);  // wait 1 second and exit the loop
            break;
        }
        for (int col = 0; col < 46; col++) {  //  clear the text buffer.
            for (int row = 0; row < 8; row++) {
                text_buffer[col][row] = 0;
            }
        }
        offset = (incomingByte - 32) * 8;  // convert one character in the string into font code

        for (int col = 0; col < 8; col++) {
            for (int row = 0; row < 8; row++) {
                if (myfont[offset + col][row] > 0) {
                    text_buffer[col][row] = 1;  // and put it into the text buffer.
                }
            }
        }

        for (int rotations = 0; rotations < numRotations; rotations++) { // display in the 1st position
            for (int panel = 0; panel < 7; panel++) {
                for (int row = 0; row < 8; row++) {
                    if (text_buffer[panel][row] > 0) {
                        LED(3, panel + 1, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
                        LED(4, panel + 1, row, xRed, xGreen, xBlue);
                    }
                }
            }
            delay(scrollRate / 4); // wait fot display
            clearCube(); // clear the cube
            for (int panel = 0; panel < 7; panel++) {  // rotate it 45 degrees
                float mypanel = 1 + float(panel) /
                                    1.414; // shrink the character by sqr(2), as the diagonal is sqr(2) wider than the side of cube
                int panelx = int(
                        mypanel);              // by doing this, the character maintains its approx size through the diagonals
                for (int row = 0; row < 8; row++) {         // even though some distortion occurs.
                    if (text_buffer[panel][row] > 0) {
                        LED(panelx + 1, panelx + 1, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
                        LED(panelx + 1, panelx + 1, row, xRed, xGreen, xBlue);
                    }
                }
            }
            delay(scrollRate / 4);
            clearCube();

            for (int panel = 0; panel < 7; panel++) { // rotate it another 45 degrees
                for (int row = 0; row < 8; row++) {
                    if (text_buffer[panel][row] > 0) {
                        LED(panel + 1, 3, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
                        LED(panel + 1, 4, row, xRed, xGreen, xBlue);
                    }
                }
            }
            delay(scrollRate / 4);
            clearCube();

            for (int panel = 0; panel < 7; panel++) {  // rotate it 45 degrees
                float mypanel = 1 + float(panel) / 1.414;
                int panelx = int(mypanel);
                for (int row = 0; row < 8; row++) {
                    if (text_buffer[panel][row] > 0) {
                        LED(panelx + 1, 6 - panelx, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
                        LED(panelx + 1, 6 - panelx, row, xRed, xGreen, xBlue);
                    }
                }
            }
            delay(scrollRate / 4);
            clearCube();
            for (int panel = 0; panel < 7; panel++) {  // rotate it another 45 degrees
                for (int row = 0; row < 8; row++) {
                    if (text_buffer[panel][row] > 0) {
                        LED(3, 6 - panel, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
                        LED(4, 6 - panel, row, xRed, xGreen, xBlue);
                    }
                }
            }
            delay(scrollRate / 4);
            clearCube();
            for (int panel = 0; panel < 7; panel++) {  // rotate it 45 degrees
                float mypanel = 1 + float(panel) / 1.414;
                int panelx = int(mypanel);
                for (int row = 0; row < 8; row++) {
                    if (text_buffer[panel][row] > 0) {
                        LED(6 - panelx, 6 - panelx, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
                        LED(6 - panelx, 6 - panelx, row, xRed, xGreen, xBlue);
                    }
                }
            }
            delay(scrollRate / 4);
            clearCube();
            for (int panel = 0; panel < 7; panel++) {  // rotate it another 45 degrees
                for (int row = 0; row < 8; row++) {
                    if (text_buffer[panel][row] > 0) {
                        LED(6 - panel, 3, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
                        LED(6 - panel, 4, row, xRed, xGreen, xBlue);
                    }
                }
            }
            delay(scrollRate / 4);
            clearCube();
            for (int panel = 0; panel < 7; panel++) {  // rotate it 45 degrees
                float mypanel = 1 + float(panel) / 1.414;
                int panelx = int(mypanel);
                for (int row = 0; row < 8; row++) {
                    if (text_buffer[panel][row] > 0) {
                        LED(6 - panelx, panelx + 1, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
                        LED(6 - panelx, panelx + 1, row, xRed, xGreen, xBlue);
                    }
                }
            }
            delay(scrollRate / 4);
            clearCube();
        }
        for (int panel = 0; panel < 7; panel++) {  // on last rotation, show finally in its original position
            for (int row = 0; row < 8; row++) {
                if (text_buffer[panel][row] > 0) {
                    LED(3, panel + 1, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
                    LED(4, panel + 1, row, xRed, xGreen, xBlue);
                }
            }
        }
        delay(scrollRate / 4);
        clearCube();
        delay(500);
    }
}  
















