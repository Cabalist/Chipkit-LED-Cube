// In this animation, we create a bunch of single LED sprites, then introduce them one at a time
// bouncing around the inside of the cube.  

void single_swirl() {
    sprite LED1(1, 1, 1);
    LED1.colorIt(Yellow);
    LED1.place = {5, 4, 3};
    LED1.motion = {1, -2, 1};

    sprite LED2(1, 1, 1);
    LED2.colorIt(Green);
    LED2.place = {3, 4, 5};
    LED2.motion = {1, 1, -2};

    sprite LED3(1, 1, 1);
    LED3.colorIt(Blue);
    LED3.place = {2, 6, 3};
    LED3.motion = {1, -1, -2};

    sprite LED4(1, 1, 1);
    LED4.colorIt(Violet);
    LED4.place = {5, 1, 2};
    LED4.motion = {2, 1, -1};

    sprite LED5(1, 1, 1);
    LED5.colorIt(Orange);
    LED5.place = {1, 2, 3};
    LED5.motion = {1, 1, 2};

    for (int count = 0; count < 150; count++) {  //now bounce all there sprites around in the cube
        LED1.bounceIt();
        if (count > 30) {
            LED2.bounceIt();
        }
        if (count > 60) {
            LED3.bounceIt();
        }
        if (count > 90) {
            LED4.bounceIt();
        }
        if (count > 120) {
            LED5.bounceIt();
        }
        delay(125); // delay 125msec between each movement.
    }
    LED1.clearIt();
    LED2.clearIt();
    LED3.clearIt();
    LED4.clearIt();
    LED5.clearIt();
}
