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

/* This is the Big Show, Version 2.  It is the work of David Yee (email: david.yee.grd.stat@aya.yale.edu).   
It combines the original Big Show, Version 1 with SuperTech-It's music support, which was 
first introduced in Version 4 of the template software. David has also cleaned up some bugs in 
my sprite object class.  Thanks to David, it runs a little cleaner now.  Please note that the cube/software 
will NOT work at all if the music module is not present or malfunctioning.
 */

void loop() {
    while (runMode > 0) {
        byte musicMode = runMode - 1; // musicMode set to make it easier to tell which routine number is running.
        clearCube(); // if jumping out of animation, clear cube

        if ((runMode == 1) || (musicMode == 1)) { spectrum1(1000, 20); } // run if in sequential mode or constant music mode 1
        if (runMode == 1) { clearCube(); } // only clear the cube if we are in sequence mode
        if ((runMode == 1) || (musicMode == 2)) { spectrum2(500, 20); } // run if in sequential mode or constant music mode 2
        if (runMode == 1) { clearCube(); } // only clear the cube if we are in sequence mode
        if ((runMode == 1) || (musicMode == 3)) { spectrum3(500, 20); } // run if in sequential mode or constant music mode 3
        if (runMode == 1) { clearCube(); } // only clear the cube if we are in sequence mode
        if ((runMode == 1) || (musicMode == 4)) { spectrum4(500, 50); } // run if in sequential mode or constant music mode 4
        if (runMode == 1) { clearCube(); } // only clear the cube if we are in sequence mode
        if ((runMode == 1) || (musicMode == 5)) { spectrum5(500, 20); } // run if in sequential mode or constant music mode 5
        if (runMode == 1) { clearCube(); } // only clear the cube if we are in sequence mode
        if ((runMode == 1) || (musicMode == 6)) { spectrum6(1000, 20); } // run if in sequential mode or constant music mode 6
        if (runMode == 1) { clearCube(); } // only clear the cube if we are in sequence mode
        if ((runMode == 1) || (musicMode == 7)) { spectrum7(500, 20, 5); } // run if in sequential mode or constant music mode 7
        if (runMode == 1) { clearCube(); } // only clear the cube if we are in sequence mode
        if ((runMode == 1) || (musicMode == 8)) { spectrum8(200, 20); } // run if in sequential mode or constant music mode 8
        if (runMode == 1) { clearCube(); } // only clear the cube if we are in sequence mode
        if ((runMode == 1) || (musicMode == 9)) { spectrum9(500, 50); } // run if in sequential mode or constant music mode 9
        if (runMode == 1) { clearCube(); } // only clear the cube if we are in sequence mode
        if ((runMode == 1) || (musicMode == 10)) { spectrum10(200, 50); } // run if in sequential mode or constant music mode 10
        if (runMode == 1) { clearCube(); } // only clear the cube if we are in sequence mode
    }


    while (runMode == 0) {
        clearCube(); // in case exiting music mode, clear the cube
        if (musicActive == 1) {
            // Option to switch to music mode is here.
            scrollTextStd2("PRESS BUTTON NOW FOR MUSIC. . . . . .", Violet);
            if (runMode > 0) { break; } // drop out if mode changes
            // wait 1 second before starting over
            delay(1000);
        }
        scrollTextStd2("HELLO. WELCOME TO THE BIG SHOW.", Red);
        CubeInCube();
        RollingBall();
        DiamondWave();
        Mysterious();
        RandomFall();
        Helicopter();
        Glitter_ribbon();
        Elevators();
        TheOrnament();
        Hula();
        Sparkle();
        Chaos();
        Multi_Swirl();
        Flip_and_Roll();
        FlyingBoxes();
        Pulsing_Sphere(12);
        Sinewave(20);
        Cyclone();
        Rain(100);
        Mouse1();
        Fireworks();
        Donut(100);
        Tornado();
        Rotor(1, 12);
        Cosine(6);
        RandomRotation(15);
        Eyes();
        Single_Swirl();
        Basketball_Dribble();
        GameOfLife();


    }
}







