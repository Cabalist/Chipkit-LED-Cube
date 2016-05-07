
// For this verson of Cosine Animation, we increase its speed by using the cosine lookup table
// that we are already using for the rotation. 
void rotatingCosine(){
  myangle=4.7124;
  clearBufferCube();    // clear the buffer cube
  rotation= 30 * .0174532; // convert angle to radians
  for (count=0; count<12; count++){ 
    if (myangle>6.28318) {
      myangle=0;
    }
    for (int i=0; i<40; i++){   //it takes 40 steps to complete one full cycle
      getColor(i*4, 4); // get a rainbow color.  We need to go through 160 colors over the course of one full cycle. 
      for (byte xx=0; xx<8; xx++){ 
        for (byte yy=0; yy<8; yy++){
          float myNewAngle = (xx/2.23)+(yy/2.23)+(float)i/6.28; // the angle whose cosine we need
          if (myNewAngle>6.28318) {
            myNewAngle = myNewAngle - 6.28318;
          }
          int angleLookup = int(myNewAngle*20 +.5); // use the cosine table instead of calculating it
          z=((byte)(4+sin_cos[angleLookup][1]*4)); // the actual z calculation using lookup table.
          if (z>7) {
            z=7;
          }
          buffer_LED(xx,yy, z, myred,mygreen,myblue); 
        }
      }  
      rotateAll(myangle);  // the actual rotation of the animation
      clearBufferCube();    // clear the buffer cube
    }
    myangle = myangle + rotation; // increment the angle
    if (myangle>6.28318) { // and make sure it doesn't overflow
      myangle=0;
    }
  }
}

