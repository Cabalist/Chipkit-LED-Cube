void rain(int times, int rdelay) {
    for (int count = 0; count < times; count++) {
        if (runMode > 0) { break; } // drop out if mode changes
        zdown(1); // shift whole cube down 1 layer
        //clean top layer
        for (byte i = 0; i < 64; i++) { // 64 LEDs in top layer.
            y = i / 8; // calculate the Y axis of the current LED we are clearing
            x = i - y * 8; // calculate the X axis of the LED we are clearing
            LED(x, y, 7, 0, 0, 0); // clear that LED in the top (7th) layer
        }
        lightOne();   // load 5 colored LEDs into the top layer
        lightOne();
        lightOne();
        lightOne();
        lightOne();
        delay(rdelay);  // wait 1/10 second

    }
    clearCube();
}

void lightOne() {
    int RED = 0;
    int GREEN = 0;
    int BLUE = 0;
    if (random(2)) {  // red is on or off
        RED = 63;
    }
    if (random(2)) {  // green is on or off
        GREEN = 63;
    }
    if (random(2)) {  // blue is on or off
        BLUE = 63;
    }
    LED(random(8), random(8), 7, RED, GREEN, BLUE); // light an LED in the top layer with a random color
}


