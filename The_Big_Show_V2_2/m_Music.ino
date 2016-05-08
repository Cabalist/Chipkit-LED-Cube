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

/*  This tab includes 4 routines created by Supertech-IT that each create a special effect driven from incoming music.
    The music hardware described on the website is required, and #define MSGEQ7 must be set to 0x01 to tell the system
    that the hardware is installed.  

*/
void spectrum1(int iterations, int delayx) {
    int VUtop[7] = {0, 0, 0, 0, 0, 0, 0};   // music level refined to a value of 0 to 8 depending on input level and gain, checked to not exceed 8.
    int VUtopb[8] = {0, 0, 0, 0, 0, 0, 0, 0}; // music level with an average frequency between band 0 and 1 for routines needing 8 frequencies.
    int VU[7] = {0, 0, 0, 0, 0, 0, 0};   // music input level global array for 7 frequencies

    int inMode = runMode;

    byte rarray[8] = {0, 0, 8, 8, 0, 0, 63, 16};
    byte garray[8] = {63, 0, 32, 0, 8, 32, 0, 63};
    byte barray[8] = {0, 63, 0, 32, 32, 0, 0, 63};

    for (int i = 0; i < iterations; i++) {
        if (runMode != inMode) { break; } // drop out if mode changes
        readmsgeq7(VUtop, VUtopb, VU);

        for (int freq = 0; freq < 7; freq++) {
            // int xx = freq;
            wall(freq, VUtop[freq], rarray[freq], garray[freq], barray[freq]); // number from 0 to just under 9 approx for height of wall with colour from RGB array
        }

        zdown(1);
        if (delayx) { delay(delayx); } // if we aren't running full tilt, delay.
        //clean top layer
        cleantop();
    }
}

void spectrum2(int iterations, int sdelay) {
    int VUtop[7] = {0, 0, 0, 0, 0, 0, 0};   // music level refined to a value of 0 to 8 depending on input level and gain, checked to not exceed 8.
    int VUtopb[8] = {0, 0, 0, 0, 0, 0, 0, 0}; // music level with an average frequency between band 0 and 1 for routines needing 8 frequencies.
    int VU[7] = {0, 0, 0, 0, 0, 0, 0};   // music input level global array for 7 frequencies

    int inMode = runMode;
    for (int times = 0; times < iterations; times++) {
        if (runMode != inMode) { break; } // drop out if mode changes

        //clean top row
        cleantop();
        zdown(1);
        readmsgeq7(VUtop, VUtopb, VU);

        fourSquare(0, 0, VUtop[3], 32, 0, 0); // column 4X4 with height of frequency 2 with colour 32(R), 0(G), 0(B)...this is the red column
        fourSquare(4, 4, VUtop[4], 16, 63, 0); // column 4X4 with height of frequency 3 yellow
        fourSquare(0, 4, VUtop[5], 0, 63, 0); // column 4X4 with height of frequency 5 green
        fourSquare(4, 0, VUtop[6], 0, 0, 63); // column 4X4 with height of frequency 4 blue

        delay(sdelay);
        // zdown(1);
    }
}

void spectrum3(int iterations, int delayx) {
    int VUtop[7] = {0, 0, 0, 0, 0, 0, 0};   // music level refined to a value of 0 to 8 depending on input level and gain, checked to not exceed 8.
    int VUtopb[8] = {0, 0, 0, 0, 0, 0, 0, 0}; // music level with an average frequency between band 0 and 1 for routines needing 8 frequencies.
    int VU[7] = {0, 0, 0, 0, 0, 0, 0};   // music input level global array for 7 frequencies

    byte rarray[8] = {0, 0, 8, 8, 0, 16, 63};
    byte garray[8] = {63, 0, 32, 0, 64, 63, 0};
    byte barray[8] = {0, 63, 0, 32, 32, 63, 0};

    int inMode = runMode;

    for (int i = 0; i < iterations; i++) {
        if (runMode != inMode) { break; } // drop out if mode changes
        xback(1);
        readmsgeq7(VUtop, VUtopb, VU);

        for (int freq = 0; freq < 7; freq++) {
            for (int z = 0; z < VUtop[freq]; z++) {// draw column to height of frequency
                //int yy = freq;

                LED(7, freq, z, rarray[freq], garray[freq], barray[freq]);
            }
        }
        for (int y = 0; y < 8; y++) {
            for (int z = 1; z < 8; z++) {
                for (int c = 0; c < 3; c++) {
                    cube[7][y][z - 1][c] = cube[7][y][z][c]; // shift the cube back 1 LED
                }
            }
        }

        if (delayx > 0) { delay(delayx); }
        //clean top row
        cleantop();
    }
}


void spectrum4(int iterations, int sdelay) {
    int VUtop[7] = {0, 0, 0, 0, 0, 0, 0};   // music level refined to a value of 0 to 8 depending on input level and gain, checked to not exceed 8.
    int VUtopb[8] = {0, 0, 0, 0, 0, 0, 0, 0}; // music level with an average frequency between band 0 and 1 for routines needing 8 frequencies.
    int VU[7] = {0, 0, 0, 0, 0, 0, 0};   // music input level global array for 7 frequencies

    int inMode = runMode;
    for (int times = 0; times < iterations; times++) {
        if (runMode != inMode) { break; } // drop out if mode changes

        clearCube();
        // zdown(1);
        readmsgeq7(VUtop, VUtopb, VU);

        fourSquare2(0, 0, VUtop[2], 32, 0, 0); // column 4X4 with height of frequency 2 with colour 32(R), 0(G), 0(B)...this is the red column
        fourSquare2(0, 4, VUtop[5], 0, 63, 0); // column 4X4 with height of frequency 5 green
        fourSquare2(4, 0, VUtop[4], 0, 0, 63); // column 4X4 with height of frequency 4 blue
        fourSquare2(4, 4, VUtop[3], 16, 63, 0); // column 4X4 with height of frequency 3 yellow
        fourSquare2(2, 2, VUtop[0], 32, 63, 63); // column 4X4 with height of frequency 0 white
        delay(sdelay);
        // zdown(1);
    }
}


void spectrum5(int iterations, int delayx) {
    int VUtop[7] = {0, 0, 0, 0, 0, 0, 0};   // music level refined to a value of 0 to 8 depending on input level and gain, checked to not exceed 8.
    int VUtopb[8] = {0, 0, 0, 0, 0, 0, 0, 0}; // music level with an average frequency between band 0 and 1 for routines needing 8 frequencies.
    int VU[7] = {0, 0, 0, 0, 0, 0, 0};   // music input level global array for 7 frequencies


    byte rarray[8] = {0, 0, 8, 63, 0, 16, 8};
    byte garray[8] = {63, 0, 32, 0, 64, 63, 0};
    byte barray[8] = {0, 63, 0, 0, 32, 63, 32};

    int inMode = runMode;

    for (int i = 0; i < iterations; i++) {
        if (runMode != inMode) { break; } // drop out if mode changes
        clearCube();
        readmsgeq7(VUtop, VUtopb, VU);

        for (int freq = 0; freq < 7; freq++) {
            byte zz = VUtop[freq];
            for (int z = 0; z < VUtop[freq]; z++) {
                LED(7, freq, z, rarray[freq], garray[freq], barray[freq]); // side 1
                LED(0, 7 - freq, z, rarray[freq], garray[freq], barray[freq]);
                LED(freq, 0, z, rarray[freq], garray[freq], barray[freq]);
                LED(7 - freq, 7, z, rarray[freq], garray[freq], barray[freq]); // side 4
            }
        }
        delay(delayx);
    }
}

void spectrum6(int iterations, int sdelay) {
    int VUtop[7] = {0, 0, 0, 0, 0, 0, 0};   // music level refined to a value of 0 to 8 depending on input level and gain, checked to not exceed 8.
    int VUtopb[8] = {0, 0, 0, 0, 0, 0, 0, 0}; // music level with an average frequency between band 0 and 1 for routines needing 8 frequencies.
    int VU[7] = {0, 0, 0, 0, 0, 0, 0};   // music input level global array for 7 frequencies

    int inMode = runMode;
    for (int times = 0; times < iterations; times++) {
        if (runMode != inMode) { break; } // drop out if mode changes

        //clean top row
        cleantop();
        zdown(1);
        readmsgeq7(VUtop, VUtopb, VU);

        twoSquare(6, 0, VUtop[0], 32, 0, 0); // column 2X2 with height of frequency 0 with colour 32(R), 0(G), 0(B)...this is the red column
        twoSquare(6, 4, VUtop[1], 0, 63, 0);
        twoSquare(4, 2, VUtop[2], 0, 0, 63);
        twoSquare(4, 6, VUtop[3], 32, 63, 0);
        twoSquare(2, 0, VUtop[4], 0, 63, 63);
        twoSquare(2, 4, VUtop[5], 32, 0, 63);
        twoSquare(0, 3, VUtop[6], 32, 63, 63);

        delay(sdelay);
    }
}

void spectrum7(long iterations, int delayx, int rSpeed) { // rSpeed = speed of rotation : higher = slower
    int VUtop[7] = {0, 0, 0, 0, 0, 0, 0};   // music level refined to a value of 0 to 8 depending on input level and gain, checked to not exceed 8.
    int VUtopb[8] = {0, 0, 0, 0, 0, 0, 0, 0}; // music level with an average frequency between band 0 and 1 for routines needing 8 frequencies.
    int VU[7] = {0, 0, 0, 0, 0, 0, 0};   // music input level global array for 7 frequencies


    byte rarray[8] = {0, 0, 8, 63, 0, 16, 8};
    byte garray[8] = {63, 0, 32, 0, 64, 63, 0};
    byte barray[8] = {0, 63, 0, 0, 32, 63, 32};

    int inMode = runMode, rCount = 0;
    byte offset;
    for (int i = 0; i < iterations; i++) {
        if (runMode != inMode) { break; } // drop out if mode changes

        rCount++;
        if (rCount > rSpeed) {
            rCount = 0;
            offset++;
        } // If the counter reaches limit, reset it and increment the spectrum offset
        if (offset > 7) { offset = 0; }
        clearCube();
        readmsgeq7(VUtop, VUtopb, VU);
        for (int freq = 0; freq < 7; freq++) {
            // byte zz = VU[freq]/virtualGain-.5;
            for (int z = 0; z < VUtop[freq]; z++) {

                int yy = freq + offset;
                if (yy > 7) { yy = -7 + freq + offset; }

                LED(7, yy, z, rarray[freq], garray[freq], barray[freq]);
                LED(0, 7 - yy, z, rarray[freq], garray[freq], barray[freq]);
                LED(yy, 0, z, rarray[freq], garray[freq], barray[freq]);
                LED(7 - yy, 7, z, rarray[freq], garray[freq], barray[freq]);

            }
        }
        delay(delayx);
    }
}

void spectrum8(int iterations, int sdelay) {
    int VUtop[7] = {0, 0, 0, 0, 0, 0, 0};   // music level refined to a value of 0 to 8 depending on input level and gain, checked to not exceed 8.
    int VUtopb[8] = {0, 0, 0, 0, 0, 0, 0, 0}; // music level with an average frequency between band 0 and 1 for routines needing 8 frequencies.
    int VU[7] = {0, 0, 0, 0, 0, 0, 0};   // music input level global array for 7 frequencies

    int inMode = runMode;
    int base;
    for (int times = 0; times < iterations; times++) {
        if (runMode != inMode) { break; } // drop out if mode changes
        //clean top row
        cleantop();
        zdown(1);
        readmsgeq7(VUtop, VUtopb, VU);

        base = (VUtop[0] + VUtop[1]) / 2;
        if (base > 4) { base = 4; }
        for (byte layer = 0; layer < 8; layer++) {  // scan thru each layer
            for (byte column = 0; column < 8; column++) {  // scan thru every column
                for (byte panel = 0; panel < 8; panel++) {  // scan thru every panel
                    if (distance[column][panel] > base) { // if an LED is outside the radius specified by base, turn it off.
                        LED(column, panel, layer, 0, 0, 0);
                    }
                    else {
                        if (column < 4 && panel < 4) {
                            LED(column, panel, VU[2] / virtualGain, 63, 0, 0);
                        }
                        if (column > 3 && panel < 4) {
                            LED(column, panel, VU[3] / virtualGain, 63, 63, 0);
                        }
                        if (column < 4 && panel > 3) {
                            LED(column, panel, VU[4] / virtualGain, 0, 63, 0);
                        }
                        if (column > 3 && panel > 3) {
                            LED(column, panel, VU[5] / virtualGain, 0, 0, 63);
                        }
                    }
                }
            }
        }
        delay(sdelay);
    }
}

void spectrum9(int iterations, int xdelay) {
    int VUtop[7] = {0, 0, 0, 0, 0, 0, 0};   // music level refined to a value of 0 to 8 depending on input level and gain, checked to not exceed 8.
    int VUtopb[8] = {0, 0, 0, 0, 0, 0, 0, 0}; // music level with an average frequency between band 0 and 1 for routines needing 8 frequencies.
    int VU[7] = {0, 0, 0, 0, 0, 0, 0};   // music input level global array for 7 frequencies

    int inMode = runMode;
    for (int times = 0; times < iterations; times++) {
        if (runMode != inMode) { break; } // drop out if mode changes
        clearCube();
        readmsgeq7(VUtop, VUtopb, VU);

        elasticPlane(VUtop[0] / 2, 1, 63, 0, 0);
        elasticPlane(VUtop[1] / 2, 2, 0, 63, 0);
        elasticPlane(VUtop[2] / 2, 3, 0, 0, 63);
        elasticPlane(VUtop[3] / 2, 4, 32, 0, 63);
        elasticPlane(VUtop[4] / 2, 5, 32, 63, 0);
        elasticPlane(VUtop[5] / 2, 6, 0, 63, 63);
        elasticPlane(VUtop[6] / 2, 7, 32, 63, 63);
        delay(xdelay);
    }
}

void spectrum10(int iterations, int xdelay) {
    int VUtop[7] = {0, 0, 0, 0, 0, 0, 0};   // music level refined to a value of 0 to 8 depending on input level and gain, checked to not exceed 8.
    int VUtopb[8] = {0, 0, 0, 0, 0, 0, 0, 0}; // music level with an average frequency between band 0 and 1 for routines needing 8 frequencies.
    int VU[7] = {0, 0, 0, 0, 0, 0, 0};   // music input level global array for 7 frequencies

    int inMode = runMode;
    for (int times = 0; times < iterations; times++) {
        if (runMode != inMode) { break; } // drop out if mode changes
        clearCube();
        readmsgeq7(VUtop, VUtopb, VU);

        elasticPlane2(VUtop[0] / 2, 1, 63, 0, 0);
        elasticPlane2(VUtop[1] / 2, 2, 0, 63, 0);
        elasticPlane2(VUtop[2] / 2, 3, 0, 0, 63);
        elasticPlane2(VUtop[3] / 2, 4, 32, 0, 63);
        elasticPlane2(VUtop[4] / 2, 5, 32, 63, 0);
        elasticPlane2(VUtop[5] / 2, 6, 0, 63, 63);
        elasticPlane2(VUtop[6] / 2, 7, 32, 63, 63);
        delay(xdelay);
    }
}

void cleantop() {
    //clean top layer
    for (byte i = 0; i < 8; i++)
        for (byte j = 0; j < 8; j++)
            LED(i, j, 7, 0, 0, 0); // clear that LED in the top (7th) layer
}
