/*
This animation uses the new .sphere action of the sprite object class to create a 6 LED diameter sphere where is then rolled around the main cube.  
*/
void RollingBall() {
// This created the sprite and rolls it around the cube. 
// The sprite is rotated around the axis, and then 
// gradually moved back and forth on the x axis.
    int color;
    sprite mySprite(6, 6, 6);
    mySprite.sphere(color);
    mySprite.place = {-1, 1, 1};
    for (int x = 0; x < 95; x++) {
        color = color + 2;
        if (color > 189) { color = 0; }
        mySprite.sphere(color);
        if (x > 15) {
            clearCube();
            mySprite.place[0] = 0;
        }
        if (x > 30) {
            clearCube();
            mySprite.place[0] = 1;
        }
        if (x > 45) {
            clearCube();
            mySprite.place[0] = 2;
        }
        if (x > 60) {
            clearCube();
            mySprite.place[0] = 1;
        }
        if (x > 75) {
            clearCube();
            mySprite.place[0] = 0;
        }
        mySprite.rollX(0);
        delay(50);
    }
    mySprite.clearIt();
    delay(500);
}



