// this code creates flash effects. We turn on a random LED every 10 msec.
// each LED once on stays on through one complete loop or 30 msec. 
void Sparkle() {
  getColor(White, 4);  //flashes are white
  for (int j=0; j<200; j++){  // go around 75 times
    int newx1, newy1, newz1, newx2, newy2, newz2, newx3, newy3, newz3; // locations for 3 LEDs that are on at one time
    newx1=random(8);
    newy1=random(8);
    newz1=random(8);
    LED(newx1, newy1, newz1, myred, mygreen, myblue); // create the first
    delay(10);
    LED(newx2, newy2, newz2, 0, 0, 0);  // turn off the second
    newx2=random(8);
    newy2=random(8);
    newz2=random(8);
    LED(newx2, newy2, newz2, myred, mygreen, myblue);  // create the second
    delay(10);
    LED(newx3, newy3, newz3, 0, 0, 0); // turn off the third
    newx3=random(8);
    newy3=random(8);
    newz3=random(8);
    LED(newx3, newy3, newz3, myred, mygreen, myblue);  // create the third
    delay(10);
    LED(newx1, newy1, newz1, 0, 0, 0);  // turn off the first
  }
  clearCube();
  delay(1000);
}

