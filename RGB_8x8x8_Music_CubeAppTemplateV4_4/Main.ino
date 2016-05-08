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

/* This tab has the loop where you can build your own application.  The sample one here contains numerous demos. 
 The first is a demo of the different tools supporting scrolling text. You can scroll text around all four faces or only two faces.
 You can scroll the text through the cube in the X or Y direction.  You can rotate text around in the middle of the cube. 
 Finally, with any of these, you can call the custom characters by their name (they're found in the #define statements) and embed them in your text.
 Then there are three animations called, each of which is in its own tab (or file).   They are:
 pulsing sphere, cyclone, and wild mouse. Enjoy.
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
        if ((runMode == 1) || (musicMode == 8)) { spectrum8(200, 20); } // run if in sequential mode or constant music mode 6
        if (runMode == 1) { clearCube(); } // only clear the cube if we are in sequence mode
        if ((runMode == 1) || (musicMode == 9)) { spectrum9(500, 50); } // run if in sequential mode or constant music mode 8
        if (runMode == 1) { clearCube(); } // only clear the cube if we are in sequence mode
        if ((runMode == 1) || (musicMode == 10)) { spectrum10(200, 50); } // run if in sequential mode or constant music mode 8
        if (runMode == 1) { clearCube(); } // only clear the cube if we are in sequence mode
        if ((runMode == 1) || (musicMode == 11)) { beat1(20); } // run if in sequential mode or constant music mode 8
        if (runMode == 1) { clearCube(); } // only clear the cube if we are in sequence mode
    }


    while (runMode == 0) {
        clearCube(); // in case exiting music mode, clear the cube
        scrollTextStd4("Scrolling Text", Blue);  // scrolling text on 4 faces
        if (runMode > 0) { break; } // drop out if mode changes
        scrollText(Face, 0, 36, 63, 4);  // scrolling a custom character , specifying its color, and that you want it on 4 sides
        if (runMode > 0) { break; } // drop out if mode changes
        scrollThruX("HELLO WORLD!", 63, 0, 0);  //scroll through cube in X direction
        if (runMode > 0) { break; } // drop out if mode changes
        scrollThruY("GOODBYE!", 0, 63, 0); // scroll through cube in Y direction
        if (runMode > 0) { break; } // drop out if mode changes
        scrollTextStd4(Fish "   " Arrow, Blue);  // scroll a couple of custom characters
        if (runMode > 0) { break; } // drop out if mode changes
        scrollText("I" Heart "U!", 63, 0, 0, 4);  // scroll a mix of regular text and custom characters
        if (runMode > 0) { break; } // drop out if mode changes
        rotate("ABC" Star, 0, 63, 0, 2);  //rotate some characters around, picking a color, and calling for 2 rotations
        if (runMode > 0) { break; } // drop out if mode changes
        // fireworks
        scrollTextStd2("FIREWORKS", Yellow);
        fireworks(10, 30, 60);
        if (runMode > 0) { break; } // drop out if mode changes
        // the rain animation
        scrollTextStd2("Rain", Aqua);
        if (runMode > 0) { break; } // drop out if mode changes
        rain(75, 100);
        if (runMode > 0) { break; } // drop out if mode changes
        delay(1000);
        // the pulsing sphere animation
        scrollTextStd2("Pulsing Sphere", Red);
        if (runMode > 0) { break; } // drop out if mode changes
        sphere(15);
        if (runMode > 0) { break; } // drop out if mode changes
        delay(1000);
        // the cyclone animation
        scrollTextStd2("Cyclone", Green);
        if (runMode > 0) { break; } // drop out if mode changes
        cycloneX();
        if (runMode > 0) { break; } // drop out if mode changes
        delay(1000);
        // the wild mouse animation
        scrollTextStd2("Wild Mouse", Blue);
        if (runMode > 0) { break; } // drop out if mode changes
        mouse();
        if (runMode > 0) { break; } // drop out if mode changes
        // the Sine Wave animation
        scrollTextStd2("SINEWAVE", Violet);
        sinewave(25);
        if (runMode > 0) { break; } // drop out if mode changes
        // wait 2 seconds before starting over
        delay(2000);
    }
}







