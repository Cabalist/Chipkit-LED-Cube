// This is a new Fireworks animation

// This version is a single color, which must be specified
// Also must specify the XY coordinates where it will appear
void fireWork(int x, int y, int mycolor) {
    int mydelay = 80;
    float polar;
    getColor(mycolor, 4);
    for (int layer = 0; layer < 6; layer++) { // firework goes up here
        LED(x, y, layer, 15, 31, 31);
        delay(mydelay);
        if (layer == 5) {
            delay(mydelay);  // pauses slightly at the top
        }
        LED(x, y, layer, 0, 0, 0);
    }


    for (int layer = 0; layer < 8; layer++) { // starts to explode
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar < 1) {
                    LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(mydelay);
    for (int layer = 0; layer < 8; layer++) { // continues to explode
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar < 2) {
                    LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(mydelay);
    for (int layer = 0; layer < 8; layer++) { //continues to explode
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar < 3) {
                    LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(mydelay * 3);  //pauses extra time at max expansion
    for (int layer = 0; layer < 8; layer++) {  // then starts to fade
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar == 2) {
                    LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(mydelay);
    for (count = 0; count < 8; count++) {  // now what is left move down slowly
        shiftDown();  // shiftDown also fades the remains as they fall.
        delay(mydelay * 2);
    }
    delay(random(4) * 1000);  // pause a random amount of time before next firework.
}

// This is same routine as above color of each element is set at random.  
void fireWork2(int x, int y) {
    int mydelay = 80;

    float polar;
    for (int layer = 0; layer < 6; layer++) {
        LED(x, y, layer, 15, 31, 31);  // on the way up, it's always white
        delay(mydelay);
        if (layer == 5) {
            delay(mydelay);
        }
        LED(x, y, layer, 0, 0, 0);
    }


    for (int layer = 0; layer < 8; layer++) {
        for (int xx = 0; xx < 8; xx++) {
            for (int yy = 0; yy < 8; yy++) {
                polar = sqrt((xx - x) * (xx - x) + (yy - y) * (yy - y) + (layer - 5) * (layer - 5));
                if (polar < 1) {
                    if (random(2) > 0) { myred = 63; }  // here is where we select colors at random.
                    else { myred = 0; }
                    if (random(2) > 0) { mygreen = 63; }
                    else { mygreen = 0; }
                    if (random(2) > 0) { myblue = 63; }
                    else { myblue = 0; }
                    LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(mydelay);
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
                    LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(mydelay);
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
                    LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(mydelay * 3);
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
                    LED(xx, yy, layer, myred, mygreen, myblue);
                }
                else {
                    LED(xx, yy, layer, 0, 0, 0);
                }
            }
        }
    }
    delay(mydelay);
    for (count = 0; count < 8; count++) {
        shiftDown();
        delay(mydelay * 2);
    }
    delay(random(4) * 1000);
}


void shiftDown() {
    for (int x = 0; x < 8; x++) { // copy content of each layer to the layer below it.
        for (int y = 0; y < 8; y++) {
            for (int z = 1; z < 8; z++) {
                for (int c = 0; c < 3; c++) {
                    cube[x][y][z - 1][c] = (cube[x][y][z][c]) / 2;  // the divide by 2 causes it
                    cube[x][y][z][c] = 0;                        // to fade on the way down.
                }
            }
        }
    }
}

