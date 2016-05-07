// This is my version of the well known sinewave animation.  I have tried to keep it simple and understandable. 
void sinewave(int repeat) {

    for (int reps = 0; reps < repeat; reps++) {
        for (int i = 0; i < 80; i++) {   //it takes 40 steps to complete one full cycle
            getColor(i * 2, 4); // get a rainbow color.  We need to go through all 189 color over the course of one full cycle.
            for (byte xx = 0; xx < 4; xx++) { // for 1 quadrant of the cube
                for (byte yy = 0; yy < 4; yy++) {
                    // the next line is the guts of the calculation, where the z value is calculated both as a function of i and distance
                    // from center of cube.  The calculation is time consuming, so we calculate it for only one quadrant and
                    // then reflect it onto the other 3 quadrants.
                    z = ((byte)((4 + sin(sqrt((3.5 - xx) * (3.5 - xx) + (3.5 - yy) * (3.5 - yy)) / 1.3 + (float) i / 12) * 4))); // the actual z calculation
                    LED(xx, yy, z, myred, mygreen, myblue); // put z into the proper place for each position in quadrant 1
                    LED(7 - xx, 7 - yy, z, myred, mygreen, myblue); // put z into the proper place for each position in quadrant 3
                    LED(7 - xx, yy, z, myred, mygreen, myblue);  // put z into the proper place for each position in quadrant 2
                    LED(xx, 7 - yy, z, myred, mygreen, myblue);  // put z into the proper place for each position in quadrant 4
                }
            }
            delay(5);       // Increase or decrease to change speed of this animation
            clearCube();    // clear the cube
        }
    }
    clearCube();
}



