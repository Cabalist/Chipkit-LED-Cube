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

/* This is the Conway Game of Life in 3D.  It's a simulation of life called a cellular automation.  
 Each LED in the cube represents a potential life.  A newborn life is represented by a violet LED.  
 A life lasting more than a single generation is represented by a blue LED. A recently deceased life
 is represented by a dull red LED.  
 
 The simulation starts with some random births near the center of the cube.  The simulation 
 than proceeds with up to a maximum of 150 generations. Each new generation is based on these rules:
 1. A dead cell (LED) with exactly 4 living neighbors is born into the next generation. 
 2. A live cell with exactly 4 living neighbors continues to life to the next generation. 
 3. A cell with less than 4 or more than 4 neighbors dies in the next generation. 
 
 This version is slightly different than the one I published separately.  Since we are only 
 showing 3 generations here, I increased the number of starting live cells to insure a
 sustainable colony.  */

void GameOfLife() {
    for (int simruns = 0; simruns < 3; simruns++) {
        int myspeed = 10; // This is where you set the speed. It is basically the number of generations per second.
        for (byte layer = 2; layer < 8; layer++) {  // This is where we set up a random pattern of living cells
            for (byte column = 2; column < 6; column++) {
                for (byte panel = 2; panel < 6; panel++) {
                    if (random(2) == 0) {
                        cube[column][panel][layer][2] = 63;
                        cube[column][panel][layer][0] = 33;
                    }
                }
            }
        }
        delay(3000 / myspeed);  // showing the initial birth pattern here.
        for (int counter = 0; counter < 150; counter++) { // this is the generation counter
            clearBufferCube();  //  BufferCube is where we will temporarily store result for the next generation.
            int kill = 0; // kill is where we count the number of living cells.  When 0, we end the simulation.
            // This next part is where we find the number of live neighbors for each cell
            for (byte layer = 0; layer < 8; layer++) {  // scan thru each layer
                for (byte column = 0; column < 8; column++) {  // scan thru every column
                    for (byte panel = 0; panel < 8; panel++) {  // scan thru every panel
                        int count = 0;  // This is the count of neighbors.
                        for (int i = -1; i < 2; i++) {  //
                            for (int j = -1; j < 2; j++) {  //
                                for (int k = -1; k < 2; k++) {  //
                                    if (column + j < 8 && column + j > -1 && panel + k < 8 && panel + k > -1 && layer + i < 8 && layer + i > -1) {
                                        if (cube[layer + i][column + j][panel + k][2] > 0) {
                                            count++;  // increment count for each neighbor found.
                                        }
                                    }
                                }
                            }
                        }
                        if (cube[layer][column][panel][2] > 0) {
                            count--;  // don't count yourself as a neighbor
                        }
                        // Then here we light the LEDs based on new birth, continuing to live, recently dead or dead.
                        if (count == 4) {  // if the number of neighbors is 4
                            // and we are within the boundaries of the cube
                            if (column < 8 && column > -1 && panel < 8 && panel > -1 && layer < 8 && layer > -1) {
                                buffer_cube[layer][column][panel][2] = 63;  // make it alive
                                if (cube[layer][column][panel][2] == 0) {  // if its newly born
                                    buffer_cube[layer][column][panel][0] = 33; //make it violet
                                }
                                kill++;  // increment living cell counter
                            }
                        }
                        else {  // if not 4 neighbors, make it dead
                            buffer_cube[layer][column][panel][2] = 0;
                            buffer_cube[layer][column][panel][0] = 0;
                            if (cube[layer][column][panel][2] > 0) {  // if it was alive
                                buffer_cube[layer][column][panel][0] = 3; // make it dull red.
                            }
                        }
                    }
                }
            }
            // Now we transfer the next generation result to the cube.
            clearCube(); // clear the cube and transfer the the content of the BufferCube
            // to the cube.
            for (byte layer = 0; layer < 8; layer++) {
                for (byte column = 0; column < 8; column++) {
                    for (byte panel = 0; panel < 8; panel++) {
                        cube[column][panel][layer][2] = buffer_cube[column][panel][layer][2];
                        cube[column][panel][layer][0] = buffer_cube[column][panel][layer][0];
                    }
                }
            }
            if (kill == 0 && xx == 0) {  // if all remaining cells are dead, pause
                delay(10000 / myspeed);
            }
            if (kill > 0) {  // if there are living cells, wait the desired time
                delay(1000 / myspeed);  // between generations.
                xx = 0; // clear a flag that says everyone is dead
            }
            else {
                xx = 1;
            }  // set the flag if everyone is dead
        }  // end of generation loop
        if (xx == 0) {  // if we got through all 150 generations with live cells
            clearCube();  // clear the cube
            delay(10000 / myspeed);  // short pause before starting over.
        }
    }
    delay(1000);
}
