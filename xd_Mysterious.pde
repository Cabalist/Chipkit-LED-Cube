int xpos = 3;
int ypos = 3;
int mydelay = 50;
int myrandom;

void Mysterious() {
    for (int j = 0; j < 300; j++) {
        myrandom = random(8);
        if (myrandom == 0) {
            xpos++;
        }
        if (myrandom == 1) {
            xpos--;
        }
        if (myrandom == 2) {
            ypos++;
        }
        if (myrandom == 3) {
            ypos--;
        }
        if (xpos < 0) {
            xpos = 1;
        }
        if (xpos > 6) {
            xpos = 5;
        }
        if (ypos < 0) {
            ypos = 1;
        }
        if (ypos > 6) {
            ypos = 5;
        }
        getColor(mycolor, 4);
        mycolor = mycolor - 3;
        if (mycolor < 1) {
            mycolor = 189;
        }
        LED(xpos, ypos, 7, myred, mygreen, myblue);
        LED(xpos + 1, ypos, 7, myred, mygreen, myblue);
        LED(xpos, ypos + 1, 7, myred, mygreen, myblue);
        LED(xpos + 1, ypos + 1, 7, myred, mygreen, myblue);
        delay(mydelay);

        for (int x = 0; x < 8; x++) { // copy content of each layer to the layer below it.
            for (int y = 0; y < 8; y++) {
                for (int z = 1; z < 8; z++) {
                    for (int c = 0; c < 3; c++) {
                        cube[x][y][z - 1][c] = cube[x][y][z][c];
                    }
                }
            }
        }
        LED(xpos, ypos, 7, 0, 0, 0);
        LED(xpos + 1, ypos, 7, 0, 0, 0);
        LED(xpos, ypos + 1, 7, 0, 0, 0);
        LED(xpos + 1, ypos + 1, 7, 0, 0, 0);
    }
    clearCube();
}

