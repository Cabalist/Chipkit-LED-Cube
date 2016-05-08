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

/* There are currently four subroutines here:
   1) The refreshCube timer interrupt that refreshes the cube automatically every 8 msec.
   2) The LED sub provides the ability to light any particular LED at a specified location with specified 3 RGB color components. 
   3) The getColor sub the selects colors of the rainbow by number and intensity
   4) The clearCube sub tht clears the cube and turn all LEDs off. 
 
 
 This timer interrupt refreshes the whole cube, based on data stored in the cube matrix.  It uses 6 bit BAM (bit angle modulation)
 to set the levels of RGB stored in the cube matrix.
 Within the interrupt routine, all output is done using direct port toggling. With this approach, all 8 layers are refreshed in under 6 msec.  
 The LEDs in each layer (if set for max brightness) are on for .64 msec.(the sum of the BAM times).  This interrupt routine is called every 
 8 msec., so the LEDs are on 64% of theoretical best (which would be 1 msec. for each of the 8 layers). 
 */
uint32_t refreshCube(uint32_t currentTime) {
    byte red, green, blue;
    for (byte count = 0; count < 6; count++) {  // BAM counter; each increment doubles the time the LED is on, starting at 5 microsecs.
        digitalWrite(Latch, LOW);  //make sure outputs are latched
        LATDCLR = CLK | SDIR | SDIG | SDIB;
        for (byte layer = 0; layer < 8; layer++) {  // scan thru each layer
            for (byte column = 0; column < 8; column++) {  // scan thru every column
                for (byte panel = 0; panel < 8; panel++) {  // scan thru every panel
                    red = cube[column][panel][layer][0]; // get its red component
                    if ((red & 1 << count) > 0) {  // BAM it and shift it out
                        LATDSET |= SDIR;
                    }
                    green = cube[column][panel][layer][1];  // get its green component
                    if ((green & 1 << count) > 0) {  // BAM it and shift it out
                        LATDSET |= SDIG;
                    }
                    blue = cube[column][panel][layer][2];  // get its blue component
                    if ((blue & 1 << count) > 0) {  // BAM it and shift it out
                        LATDSET |= SDIB;
                    }
                    LATDSET = CLK;  //Clock the data in.
                    _nop();
                    LATDCLR = CLK | SDIR | SDIG | SDIB;
                }
            }
            LATDSET = LE;  // latch the data
            _nop();
            LATDCLR = LE;
            LATECLR = LAYER[layer]; // turn on layer
            delayMicroseconds((1 << count) * 10);  //here count sets time the layer is on - starting with 10 microsecs and ending at 32*10 or 320 microsecs.
            LATESET = LAYER[layer]; //turn off layer
        }
    }
    return (currentTime + CORE_TICK_RATE * 8);
}

/* First, thanks to SuperTech-IT for suggesting this subroutine. 
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
 purples, etc. ending at 189.  190 specifies white, and anything above that specifies black (all off).   Intensities are 1 through 4 with
 4 the brightest.  0 intensity is all off.  There's no color wheel math here - just two colors mixed with a combined intensity = 63. Then
 for lower intensities, with each step down in intensity, all three color intensities are divided by 2.
 
 A few standard colors may be specified by their names: Black, Red, Orange, Yellow, Green, Aqua, Blue, Violet, Purple,
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


