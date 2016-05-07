// This makes a donut revolve in the middle of the cube.
void donut(int mycount) {
   colorCount=0;
  for (int reps=0; reps<mycount; reps++){
    rotation = 10 * .0174532; // convert angle to radians
    getColor(colorCount,4);  // pick a color.  It will gradually change as colorCount increases.
    colorCount = colorCount+1;
    if (colorCount>188){
      colorCount=0;
    }
    for (int layer=0;  layer<8; layer++){ // build the donut on the buffer_cube array.
      for  (int panel=0; panel<8; panel++){
        float mydistance = distance[layer][panel];
        if (mydistance<4){  // make a circle 2 columns wide
          buffer_LED(3, panel, layer, myred,mygreen,myblue);
          buffer_LED(4, panel, layer,myred,mygreen,myblue); 
        }
        if (mydistance<2){  // make the donut hole
          buffer_LED(3, panel, layer,0,0,0);
          buffer_LED(4, panel, layer,0,0,0); 
        }
      }
    }
    for (int count=0; count<5; count++) {  // now rotate it. 
      rotateAll(myangle);  // the actual rotation of the animation
      myangle = myangle + rotation; // increment the angle
      if (myangle>6.28318) { // and make sure it doesn't overflow
        myangle=myangle-6.28318;  //subtract 2 pi radians
      }
    }
  }
  clearBufferCube();
  clearCube();
}

