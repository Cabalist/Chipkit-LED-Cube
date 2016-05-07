// This animation is similar to the sinewave animation, but instead of running the sine 
// from the middle outward, it displays across the diagonal of the cube. While it uses
// the cosine, it could just as easily be done with sine. 
void cosine(int myNumber) {  // myNumber is number of iterations of this animation
    for (count = 0; count < myNumber; count++) {
        for (int i = 0; i < 40; i++) {   //it takes 40 steps to complete one full cycle
            getColor(i * 4, 4); // get a rainbow color.  We need to go through 160 colors over the course of one full cycle.
            for (byte xx = 0; xx < 8; xx++) {
                for (byte yy = 0; yy < 8; yy++) {
                    z = ((byte)(4 + cos((xx / 2.23) + (yy / 2.23) + (float) i / 6.28) * 4)); // the actual z calculation
                    if (z > 7) { // this is necessary because a one spot the cos is actually one
                        z = 7;     // and tries to set z at 8.
                    }
                    LED(xx, yy, z, myred, mygreen, myblue);
                }
            }
            delay(20);       // Increase or decrease to change speed of this animation
            clearCube();    // clear the cube
        }
    }
}

