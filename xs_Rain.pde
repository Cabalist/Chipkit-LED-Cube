void Rain(int times) {
    for (int count = 0; count < times; count++) {
        lightOne();   // load 5 colored LEDs into the top layer
        lightOne();
        lightOne();
        lightOne();
        lightOne();
        delay(100);  // wait 1/10 second
        for (int x = 0; x < 8; x++) {
            for (int y = 0; y < 8; y++) {
                for (int z = 1; z < 8; z++) {
                    for (int c = 0; c < 3; c++) {
                        cube[x][y][z - 1][c] = cube[x][y][z][c];  // shift everything in the cube down one
                    }
                }
                for (int c = 0; c < 3; c++) {
                    cube[x][y][7][c] = 0;  // and clear the top layer
                }
            }
        }
    }
    clearCube();
    delay(1000);
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
