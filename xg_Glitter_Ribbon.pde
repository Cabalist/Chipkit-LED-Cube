// This is new animation which is a variation on the previous cosine animation.  In this modification, the cosine function is flattened out 
// to produce a wavy flat sheet moving up and down.  Then we've added in some sparkle. 

void Glitter_ribbon() {
    for (int j = 0; j < 10; j++) {
        for (int i = 0; i < 36; i++) {   //it takes 36 steps to complete one full cycle
            getColor(i * 5, 3); // get a rainbow color.  We need to go through most of 189 colors over the course of one full cycle.
            for (byte xx = 0; xx < 8; xx++) {
                for (byte yy = 0; yy < 8; yy++) {
                    z = ((byte)(4 + cos((xx / 7.23) + (yy / 12.23) + (float) i / 6.28) * 4)); // the actual z calculation
                    if (z > 7) {
                        z = 7;
                    }
                    if (random(40) == 0) {
                        LED(xx, yy, z, 31, 63, 63);  // add white flash sparkle 1/40th of the time.
                    }
                    else {
                        LED(xx, yy, z, myred, mygreen, myblue);
                    }
                }
            }
            delay(30);       // Increase or decrease to change speed of this animation
            clearCube();    // clear the cube
        }
    }
    delay(1000);
}

