// This animation creates red, green, and blue boxes. Then it rolls one around the edge of the cube around the X axis, one is rolled around the Y axis,
// and one is rolled around the Z axis.  Creates an interesting effect. 
void FlyingBoxes() {
    sprite mySprite(3, 3, 3); // this creates a sprite called mySprite with dimensions 2x2x2 LEDs.
    mySprite.colorIt(Green);
    mySprite.place = {3, 5, 3}; // locate it in the lower, back corner of the cube
    mySprite.setIt(); // actually puts it in the cube, turning on the LEDs.
    mySprite.motion = {2, 1, 1}; // gives my sprite an initial direction of motion

    sprite mySprite2(3, 3, 3); // this creates a sprite called mySprite with dimensions 2x2x2 LEDs.
    mySprite2.colorIt(Red);
    mySprite2.place = {0, 3, 2}; // locate it in the lower, back corner of the cube
    mySprite2.setIt(); // actually puts it in the cube, turning on the LEDs.
    mySprite2.motion = {2, 1, 1}; // gives my sprite an initial direction of motion

    sprite mySprite3(3, 3, 3); // this creates a sprite called mySprite with dimensions 2x2x2 LEDs.
    mySprite3.colorIt(Blue);
    mySprite3.place = {4, 2, 4}; // locate it in the lower, back corner of the cube
    mySprite3.setIt(); // actually puts it in the cube, turning on the LEDs.
    mySprite3.motion = {2, 1, 1}; // gives my sprite an initial direction of motion

    for (count = 0; count < 250; count++) { // loop around 100 times
        mySprite.rollX(1);
        mySprite2.rollZ(1);
        mySprite3.rollY(0);
        delay(100); // wait 1/10th second before next move.
    }
    mySprite.clearIt(); // turn off the sprite since we're done.
    mySprite2.clearIt(); // turn off the sprite since we're done.
    mySprite3.clearIt(); // turn off the sprite since we're done.
    delay(1000);
}
