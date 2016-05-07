/* This tab has the loop where you can build your own application.  What is here now is a demo for Version 5,
 which is all about rotating the content of the cube.  We have demos of several different rotation schemes.
 1) A previously introduced way to rotate text from Version 3.
 2) A new way to rotate the content of a single plane placed on the diagonal of the cube.  This can be used
 to rotate text characters or anything else that can be placed in a single plane. 
 3) A new system for rotating the entire content of the cube. This system is a little slower, but allows for 
 full rotation of anything, includes a moving animation.  What is to be rotated is placed in buffer_cube.
 The software rotates it and places it in the cube matrix for display. This system uses polar coordinates
 to rotate the content of a layer, converting it back to XY coordinates and finding the nearest LED. Anything
 can be placed in the buffer_cube, including a running animation. Since this system has to rotate each layer,
 it is possible to rotate different layers at different speeds or even in opposite directions. The demos 
 below will show all of this.    
 */

void loop() {
    // This first item is just the revolving text we presented earlier in Version 3
    // It rotates text in 45 degree steps and narrows the letters on the diagonal to hold
    // their width constant.
    rotateText("ABC", 0, 0, 63, 1);
    delay(1000);
    // This is another way to rotate anything in a single plane, such as text.  It's very fast
    // and smooth, but widens whatever you're displaying when on the diagonals.
    simple_rotation(6, 40);
    // Now comes several demos of our full blown polar coordinate revolving routines.
    loadTestPattern();  // puts a test pattern in the buffer_cube matrix to demo rotation routines.
    rotateCube(4, 10);  // rotate the cube 4 rotations in 10 degree steps clockwise.
    delay(100);
    rotateCube(4, -10);  // rotate the cube 4 rotations in 10 degree steps counter-clockwise.
    delay(1000);
    // This shows how we can change the speed of rotation by changing the rotation angle
    for (int count = 3; count < 14; count++) {  // speed up
        rotateCube(1, 3 * count);
    }
    for (int count = 13; count > 2; count--) {  // slow down
        rotateCube(1, 3 * count);
    }
    delay(1000);

    // This next demo uses a lower level subroutine to rotate individual layers in opposite directions
    rotation = 10 * .0174532; // convert angle to radians
    for (int x = 0; x < 360; x++) {  // step through 360 rotations of 10 degrees each for 10 revolutions
        myangle = myangle + rotation;  // rotate clockwise
        myangle2 = myangle2 - rotation / 2; // rotate counter-clockwise at half speed
        if (myangle > 6.28318) {  // don't let angle overflow
            myangle = 0;
        }
        if (myangle2 <= 0) {  // don't let angle overflow
            myangle2 = 6.28318;
        }
        rotateLayer(myangle, 7);  //rotate top layer clockwise
        rotateLayer(myangle2, 4);  // rotate middle two layers counter-clockwise
        rotateLayer(myangle2, 3);
        rotateLayer(myangle, 0);  //rotate bottom layer clockwise
    }
    clearCube();
    delay(1000);

    // Non-rotating Cosine Animation
    cosine(4);
    // Now the rotating Cosine Animation
    rotatingCosine();
    clearCube();    // clear the cube
    delay(1000);

    // Fireworks
    fireWork(3, 4, Blue);
    fireWork2(3, 5);
    fireWork(7, 2, White);
    fireWork(4, 4, Red);
    fireWork2(5, 4);
    fireWork(3, 3, Green);
    fireWork(2, 5, White);
    //  Now the rotating Fireworks
    rotation = 15 * .0174532;  // convert angle to radians
    rFireWork(3, 6, Blue);
    rFireWork2(6, 5);
    rFireWork(7, 2, White);
    rFireWork(4, 2, Red);
    rFireWork2(5, 4);
    rFireWork(6, 3, Green);
    rFireWork(2, 6, White);
    delay(1000);
    // Next are 4 new animations that make use of our system that rotates the entire cube
    donut(150);
    delay(1000);
    rotor(1, 12);
    delay(1000);
    randomRotation(15);
    delay(1000);
    tornado();
    delay(1000);
}






















