// This is the new Fireworks animation adapted to rotate around in the cube. 
// Comments here are only about how it's made to rotate.
// This version is a single color, which must be specified
void rFireWork(int x, int y, int mycolor) {
    int mydelay = 80;
    float polar;
    getColor(mycolor, 4);
    for (int layer = 0; layer < 6; layer++) {
        buffer_LED(x, y, layer, 15, 31, 31);  // we are now putting everything in the buffer_cube array
        rotateIt();                          // instead of the cube array.
        buffer_LED(x, y, layer, 0, 0, 0);
    }


    for (int layer = 0; layer < 8; layer++) {
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar < 1) {
                    buffer_LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    buffer_LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    rotateIt();  // and everywhere that we had a pause in the stationary version
    // we now insert our rotate subroutine which you can see below.
    for (int layer = 0; layer < 8; layer++) {
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar < 2) {
                    buffer_LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    buffer_LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    rotateIt();
    for (int layer = 0; layer < 8; layer++) {
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar < 3) {
                    buffer_LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    buffer_LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    rotateIt();  // Having 3 here causes it to stay longer in fully exploded mode.
    rotateIt();
    rotateIt();
    for (int layer = 0; layer < 8; layer++) {
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar == 2) {
                    buffer_LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    buffer_LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    rotateIt();
    for (count = 0; count < 8; count++) {
        rShiftDown();
        rotateIt();
    }
    delay(random(4) * 1000);
}

//This version is multi-colored, adapted for rotation 
void rFireWork2(int x, int y) {

    float polar;
    for (int layer = 0; layer < 6; layer++) {
        buffer_LED(x, y, layer, 15, 31, 31);
        rotateIt();
        buffer_LED(x, y, layer, 0, 0, 0);
    }


    for (int layer = 0; layer < 8; layer++) {
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar < 1) {
                    if (random(2) > 0) { myred = 63; }
                    else { myred = 0; }
                    if (random(2) > 0) { mygreen = 63; }
                    else { mygreen = 0; }
                    if (random(2) > 0) { myblue = 63; }
                    else { myblue = 0; }
                    buffer_LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    buffer_LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    rotateIt();
    for (int layer = 0; layer < 8; layer++) {
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar < 2) {
                    if (random(2) > 0) { myred = 63; }
                    else { myred = 0; }
                    if (random(2) > 0) { mygreen = 63; }
                    else { mygreen = 0; }
                    if (random(2) > 0) { myblue = 63; }
                    else { myblue = 0; }
                    buffer_LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    buffer_LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    rotateIt();
    for (int layer = 0; layer < 8; layer++) {
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar < 3) {
                    if (random(2) > 0) { myred = 63; }
                    else { myred = 0; }
                    if (random(2) > 0) { mygreen = 63; }
                    else { mygreen = 0; }
                    if (random(2) > 0) { myblue = 63; }
                    else { myblue = 0; }
                    buffer_LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    buffer_LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    rotateIt();
    rotateIt();
    rotateIt();
    for (int layer = 0; layer < 8; layer++) {
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar == 2) {
                    if (random(2) > 0) { myred = 63; }
                    else { myred = 0; }
                    if (random(2) > 0) { mygreen = 63; }
                    else { mygreen = 0; }
                    if (random(2) > 0) { myblue = 63; }
                    else { myblue = 0; }
                    buffer_LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    buffer_LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    rotateIt();
    for (count = 0; count < 8; count++) {
        rShiftDown();
        rotateIt();
    }
    delay(random(4) * 1000);
}


void rShiftDown() {  // modified to shift down in the buffer_cube array
    for (int x = 0; x < 8; x++) { // copy content of each layer to the layer below it.
        for (int y = 0; y < 8; y++) {
            for (int z = 1; z < 8; z++) {
                for (int c = 0; c < 3; c++) {
                    buffer_cube[x][y][z - 1][c] = (buffer_cube[x][y][z][c]) / 2;
                    buffer_cube[x][y][z][c] = 0;
                }
            }
        }
    }
}

// This subroutine is a slightly modified version of the rotateAll() subroutine
// It waits much longer that rotateAll's 8 msec. Also doesn't need to clear the cube 
// when it's finished. 
void rotateIt() {
    int mydelay = 60;
    for (byte layer = 0; layer < 8; layer++) {  // scan thru each layer
        rotateLayer(myangle, layer);
    }
    delay(mydelay);  // wait for 1 refresh before clearing cube
    clearCube();
    myangle = myangle + rotation; // increment the angle
    if (myangle > 6.28318) { // and make sure it doesn't overflow
        myangle = 0;
    }
}
