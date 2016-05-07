// this animation turns random LEDs on while rotating them around in the cube
// after a while we change the color and then change it again. 

void RandomRotation(int myspeed) {
    colorCount = 0;
    rotation = myspeed * .0174532; // convert angle to radians
    getColor(Blue, 4); // start with blue
    for (int reps = 0; reps < 80; reps++) {
        colorCount++;
        buffer_LED(1 + random(6), 1 + random(6), random(8), myred, mygreen, myblue);  // this is the LED we light
        // we don't light the outside  corners of the cube because they will disappear as they are rotated
        buffer_LED(random(8), random(8), random(8), 0, 0, 0); // we turn off 5 LEDs at random for every one we
        buffer_LED(random(8), random(8), random(8), 0, 0, 0);  // turn on, so that we never have more than 20
        buffer_LED(random(8), random(8), random(8), 0, 0, 0);  // of the LEDs lit at any time
        buffer_LED(random(8), random(8), random(8), 0, 0, 0);
        buffer_LED(random(8), random(8), random(8), 0, 0, 0);
        for (int count = 0; count < 25; count++) {   // now rotate the whole thing
            rotateAll(myangle);  // the actual rotation of the animation
            myangle = myangle + rotation; // increment the angle
            if (myangle > 6.28318) { // and make sure it doesn't overflow
                myangle = myangle - 6.28318;
            }
        }
        if (colorCount > 20) {  // after a while change color
            getColor(Violet, 4);
        }
        if (colorCount > 40) {  // after some more time, change color again.
            getColor(Aqua, 4);
        }
    }
    clearBufferCube();
    clearCube();
    delay(1000);
}


