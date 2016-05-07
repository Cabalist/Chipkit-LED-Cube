// In this animation, we create three sprites, then rotate them around themselves while rolling them around the edge of the cube. 
// An interesting effect demonstrating both .roll and .rotate methods of our sprite object class.

void Flip_and_Roll() {
    int mydelay = 250;
    sprite Sprite1(3, 3, 3);  // X and Y dimensions must be equal if we are going to rotate around Z axis.
    Sprite1.place = {1, 1, 1};
    Sprite1.description = {  // just a simple red green green line across 3 layers
            {  // top layer
                    {Red,   Red,   Red},  // 1st column,  3 panels
                    {Red,   Red,   Red},  // 2nd column,  3 panels
                    {Red,   Red,   Red}   // 3rd column,  3 panels
            },
            {  // middle layer
                    {Black, Black, Black},
                    {Black, Black, Black},
                    {Black, Black, Black}
            },
            {  // bottom layer
                    {Black, Black, Black},
                    {Black, Black, Black},
                    {Black, Black, Black}
            },
    };
    sprite Sprite2(3, 3, 3);  // X and Y dimensions must be equal if we are going to rotate around X axis.
    Sprite2.place = {4, 4, 5};
    Sprite2.description = {  // just a simple red green green line across 3 layers
            {  // top layer
                    {Green, Black, Black},
                    {Green, Black, Black},
                    {Green, Black, Black}
            },
            {  // middle layer
                    {Green, Black, Black},
                    {Green, Black, Black},
                    {Green, Black, Black}
            },
            {  // bottom layer
                    {Green, Black, Black},
                    {Green, Black, Black},
                    {Green, Black, Black}
            },
    };
    sprite Sprite3(3, 3, 3);  // X and Y dimensions must be equal if we are going to rotate around X axis.
    Sprite3.place = {1, 4, 3};
    Sprite3.description = {  // just a simple red green green line across 3 layers
            {  // top layer
                    {Blue, Black, Black},
                    {Blue, Black, Black},
                    {Blue, Black, Black}
            },
            {  // middle layer
                    {Blue, Black, Black},
                    {Blue, Black, Black},
                    {Blue, Black, Black}
            },
            {  // bottom layer
                    {Blue, Black, Black},
                    {Blue, Black, Black},
                    {Blue, Black, Black}
            },
    };

    for (int count = 0; count < 15; count++) {
        Sprite1.rotateX(0);
        Sprite2.rotateZ(1);
        Sprite3.rotateZ(1);
        Sprite1.rollZ(0);
        Sprite2.rollZ(1);
        Sprite3.rollZ(0);
        delay(mydelay);
        Sprite1.rotateZ(0);
        Sprite2.rotateY(1);
        delay(mydelay);
        Sprite1.rotateY(0);
        Sprite2.rotateX(0);
        Sprite3.rotateX(0);
        Sprite1.rollZ(0);
        Sprite2.rollZ(1);
        Sprite3.rollZ(0);
        delay(mydelay);
        Sprite1.rotateX(0);
        Sprite2.rotateZ(1);
        delay(mydelay);
        Sprite1.rotateZ(0);
        Sprite2.rotateY(1);
        Sprite3.rotateY(1);
        Sprite1.rollZ(0);
        Sprite2.rollZ(1);
        Sprite3.rollZ(0);
        delay(mydelay);
        Sprite1.rotateY(0);
        Sprite2.rotateX(0);
        delay(mydelay);
    }
    clearCube();
    delay(1000);
}
