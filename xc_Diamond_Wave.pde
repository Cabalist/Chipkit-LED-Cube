/*
This is a new animation.  Basically two pyramids, one right-side up and an inverted one below it,
are moved up and down, almost completely through the cube in each direction. This is a convensional
animation - no sprites or anything fancy!
*/

void DiamondWave() {
  for (int j=0; j<10; j++){  // go up and down 10 times
    colorCount=colorCount+10;  // change color with each pass
    if (colorCount>180) {
      colorCount=10;
    }
    getColor(colorCount,4);
    for (int i=0; i<18; i++){ // moving upward

      for (byte xx=0; xx<8; xx++){ // Here we generate both the upper and lower pyramid
        for (byte yy=0; yy<8; yy++){ // If actually starts out as a cone, but flairs out to a square at its widest.
          z= int(i - 9.5 + sqrt((3.5-xx)*(3.5-xx)+(3.5-yy)*(3.5-yy)));
          z1= int(i - 0.5 - sqrt((3.5-xx)*(3.5-xx)+(3.5-yy)*(3.5-yy)));
          if (z>-1 && z<8) {
            LED(xx,yy, z, myred,mygreen,myblue);
          }
          if (z1>-1 && z1<8) {
            LED(xx,yy, z1, myred,mygreen,myblue);
          }
        }
      } 
      delay(40);       // Increase or decrease to change speed of this animation 
      clearCube();    // clear the cube
    }
    for (int i=16; i>0; i--){ //moving downward

      for (byte xx=0; xx<8; xx++){ // 
        for (byte yy=0; yy<8; yy++){ 
          z= int(i - 9.5 + sqrt((3.5-xx)*(3.5-xx)+(3.5-yy)*(3.5-yy)));
          z1= int(i - 0.5 - sqrt((3.5-xx)*(3.5-xx)+(3.5-yy)*(3.5-yy)));
          if (z>-1 && z<8) {
            LED(xx,yy, z, myred,mygreen,myblue);
          }
          if (z1>-1 && z1<8) {
            LED(xx,yy, z1, myred,mygreen,myblue);
          }
        }
      } 
      delay(40);       // Increase or decrease to change speed of this animation 
      clearCube();    // clear the cube
    }
  }
   delay(1000);
}

