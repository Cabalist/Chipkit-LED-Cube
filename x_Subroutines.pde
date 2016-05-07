/* There are currently 16 subroutines here:
 1) The LED sub provides the ability to light any particular LED at a specified location with specified 3 RGB color components. 
 2) The getColor sub the selects colors of the rainbow by number and intensity
 3) The clearCube sub that clears the cube and turn all LEDs off. 
 4) The scrollText sub lets you specify a string of text to be scrolled, specify its 3 RGB color conponents, and whether to display on 2 or 4 faces of the cube. 
 5) The scrollThruX sub lets you specify a string of text to be scrolled, specify its 3 RGB color conponents, 
    and pass it through the middle of the cube from back to front in the X direction.  The scrollUpX subroutine is used by scrollThruX.
 6) The scrollThruY sub lets you specify a string of text to be scrolled, specify its 3 RGB color conponents,
    and pass it through the middle of the cube from back to front in the X direction.  The scrollUpY subroutine is used by scrollThruX.
 7) The scrollTextStd2 sub lets you specify a string and standard color for display on 2 faces of the cube
 8) The scrollTextStd4 sub lets you specify a string and standard color for display on 4 faces of the cube
 9) The rotate sub lets you specify a string of text to be used, specify its 3 RGB color conponents, 
    and then it rotates the characters, one at a time, in the center of the cube.
    
These next 7 are additions by SuperTech-IT    
10) zdown - shift entire cube down (times) layer(s)
11) wall - make a "wall" at position X, Y high
12) fourSquare - draw a pillar at x,y with height z, color R,G,B
13) fillCube - This subroutine fills the cube with a color
14) xback - shift entire cube back (times) layer(s)
15) fourSquare2  - draw a square at x,y at height z, color R,G,B   
16) twoSquare - draws a 2X2 pillar at x,y with height z, color R,G,B

**********/

 
//  This subroutine is very straight forward.  You specify a particular LED with x,y,and z.  Then specify the color by specifying
//  the 3 RGB color components.  This routine then loads it into the cube matrix.  Thanks to SuperTech-IT for suggesting this subroutine
void LED(int x,int y,int z,int R,int G,int B) {
  if (R>63){
    R=63;
  }
  if (G>63){
    G=63;
  }
  if (G>63){
    G=63;
  }
  cube[x][y][z][0]=R;
  cube[x][y][z][1]=G;
  cube[x][y][z][2]=B;
}

/* getColor is a subroutine to get 189 colors of the rainbow. It starts at 0 for Red and steps through yellows, greens, aguas, blues, 
 purples,etc. ending at 189.  190 specifies white, and anything above that specifies black (all off).   Intensities are 1 through 4 with
 4 the brightest.  0 intensity is all off.  There's no color wheel math here - just two colors mixed with a combined intensity = 63. Then
 for lower intensities, with each step down in intensity, all three color intensities are divided by 2. 
 
 A few standard colors my be specified by their names: Black, Red, Orange, Yellow, Green, Aqua, Blue, Violet, Purple,
 and White.  Intensities for these standard colors are also 0 (full off) to 4 (brightest).
 
 It sets up the RGB color components for the selected color in global variables myred, mygreen, and myblue. These can then be transferred to the cube array.  
 */
void getColor(int color, int intensity) {
  if (color<64){
    mygreen = color;
    myred = 63-mygreen;
    myblue = 0;
  }
  if ((color>63)&& (color<127)){
    myblue = color-63;
    mygreen = 63-myblue;
    myred = 0;
  }
  if ((color>126)&& (color<190)){
    myred = color-127;
    myblue = 63-myred;
    mygreen = 0;
  }
  if (color==190){
    myred = 63;
    myblue = 63;
    mygreen = 63;
  }
  if (color>190){
    myred = 0;
    myblue = 0;
    mygreen = 0;
  }

  if (intensity <5){
    myred=myred >> 1;
    mygreen=mygreen >> 1;
    myblue=myblue >> 1;
  }
  if (intensity <4){
    myred=myred >> 1;
    mygreen=mygreen >> 1;
    myblue=myblue >> 1;
  }
  if (intensity <3){
    myred=myred >> 1;
    mygreen=mygreen >> 1;
    myblue=myblue >> 1;
  }
  if (intensity <2){
    myred=myred >> 1;
    mygreen=mygreen >> 1;
    myblue=myblue >> 1;
  }
  if (intensity <1){
    myred=0;
    mygreen=0;
    myblue=0;
  }
}
// gradually change the color, always keeping it in bounds. 
// specify the amount of chg, from 1 to 20
void chgColor(int amt){
  mycolor= mycolor+amt; 
      if (mycolor > 189){
        mycolor=0;
      }
}

// This subroutine turns off every LED in the cube.
void clearCube(){
  for (byte layer=0; layer<8; layer++){  // scan thru each layer
    for (byte column=0; column<8; column++){  // scan thru every column
      for (byte panel=0; panel<8; panel++){  // scan thru every panel
        cube[layer][panel][column][0]=0;
        cube[layer][panel][column][1]=0;
        cube[layer][panel][column][2]=0;
      }
    }
  }
}

/* This subroutine scrolls text around the outside walls of the cube.  You first specify a string of text up to 120 characters long. 
 Then specify its color as red, green, blue components.  Finally specify Mode, which is 2 for scolling on only 2 walls of the 
 or 4 for scrolling on all 4 walls. Speed of scrolling is defined by scrollRate in the first tab.  
 */
void scrollText(char mystring[120], int xRed, int xGreen, int xBlue, int Mode){
  for (int xxx=0; xxx<120; xxx++){ // This "for" loop processes the incoming string one character at a time
  if (runMode > 0) {break;} // drop out if mode changes
    incomingByte= mystring[xxx];
    if (incomingByte == '\0'){ // if end of string is found,.
      for (int count=0; count<4; count++){ // scroll the last character off the cube
        scrollOneChar(xRed, xGreen, xBlue, Mode);
      }
      delay(1000);  // wait 1 second and exit the loop
      break;
    }
    offset= (incomingByte-32)*8;  // convert one character in the string into font code
    for (int col=0; col<8; col++){
      for (int row=0; row<8; row++){
        if (pgm_read_byte_near(&myfont[offset+col][row])>0) {
          text_buffer[col+37][row]=1;  // and put it into the text buffer in the last position.
        }
      }
    }
    // This moves the characters around the cube,   It's in behind the scenes. 
    scrollOneChar(xRed, xGreen, xBlue, Mode);  
  }
  for (int col=0; col<46; col++){  // when we are all finished with this string, clear the text buffer. 
    for (int row=0; row<8; row++){
      text_buffer[col][row]=0;
    }
  }
}

// This is a simplified text scrolling routine that require only an input string and a specified standard 
// color like Red, Orange, White, etc.  Scrolls text on 2 sides of cube. 
void scrollTextStd2(char mystring[120], int xColor){
  getColor(xColor, 4);
  scrollText(mystring, myred, mygreen, myblue, 2);
}

// This is a simplified text scrolling routine that require only an input string and a specified standard 
// color like Red, Orange, White, etc.  Scrolls text on 4 sides of cube. 
void scrollTextStd4(char mystring[120], int xColor){
  getColor(xColor, 4);
  scrollText(mystring, myred, mygreen, myblue, 4);
}

/* This subroutine scrolls text toward you through the cube changing X   You first specify a string of text up to 120 characters long. 
 Then specify its color as red, green, blue components.  Speed of scrolling is defined by scrollRate in the first tab.  
 */
void scrollThruX(char mystring[120], int xRed, int xGreen, int xBlue){
  for (int xxx=0; xxx<120; xxx++){ // This "for" loop processes the incoming string one character at a time
  if (runMode > 0) {break;} // drop out if mode changes
    incomingByte= mystring[xxx];
    if (incomingByte == '\0'){ // if end of string is found,.
      for (int count=0; count<4; count++){ // scroll the last character off the cube
        scrollUpX();
      }
      delay(1000);  // wait 1 second and exit the loop
      break;
    }
    offset= (incomingByte-32)*8;  // convert one character in the string into font code

      for (int panel=0; panel<8; panel++){
        for (int row=0; row<8; row++){
          if (pgm_read_byte_near(&myfont[offset+panel][row])>0) {
            LED(0, panel, row, xRed, xGreen, xBlue);  // and put it into the text buffer in the last position.
          }
        }
      }


    // This moves the characters through the cube,  
    scrollUpX();
    scrollUpX();   
    scrollUpX();
    scrollUpX();
    scrollUpX();
    if (runMode > 0) {break;} // drop out if mode changes
  }
}

//This subroutine scrolls text toward you through the cube changing Y   You first specify a string of text up to 120 characters long.

// Then specify its color as red, green, blue components.  Speed of scrolling is defined by scrollRate in the first tab.  
void scrollThruY(char mystring[120], int xRed, int xGreen, int xBlue){
  for (int xxx=0; xxx<120; xxx++){ // This "for" loop processes the incoming string one character at a time
    if (runMode > 0) {break;} // drop out if mode changes
    incomingByte= mystring[xxx];
    if (incomingByte == '\0'){ // if end of string is found,.
      for (int count=0; count<4; count++){ // scroll the last character off the cube
        scrollUpY();
      }
      delay(1000);  // wait 1 second and exit the loop
      break;
    }
    offset= (incomingByte-32)*8;  // convert one character in the string into font code

      for (int col=0; col<8; col++){
        for (int row=0; row<8; row++){
          if (pgm_read_byte_near(&myfont[offset+col][row])>0) {
            LED(col, 7, row, xRed, xGreen, xBlue);  // and put it into the text buffer in the last position.
          }
        }
      }
    // This moves the characters through the cube,  
    scrollUpY();
    scrollUpY();   
    scrollUpY();
    scrollUpY();
    scrollUpY();
  }
}


// this routine pulls the contents of the cube forward one position on the X axis
void scrollUpX(){
  delay(scrollRate/8);
  for (int panel=0; panel<8; panel++){
    for (int row=0; row<8; row++){
      for (int myX=7; myX>0; myX--){
        cube[myX][panel][row][0]=cube[myX-1][panel][row][0]; // move cube content by one LED in +X direction
        cube[myX][panel][row][1]=cube[myX-1][panel][row][1];
        cube[myX][panel][row][2]=cube[myX-1][panel][row][2]; 

      }
      cube[0][panel][row][0]=0; // and turn off X(0)
      cube[0][panel][row][1]=0;
      cube[0][panel][row][2]=0; 
    }
  }
}

// this routine pulls the contents of the cube forward one position on the Y axis
void scrollUpY(){
  delay(scrollRate/8);

    for (int col=0; col<8; col++){
      for (int row=0; row<8; row++){
        for (int myY=1; myY<8; myY++){
          cube[col][myY-1][row][0]=cube[col][myY][row][0]; // move cube content by one LED in +X direction
          cube[col][myY-1][row][1]=cube[col][myY][row][1];
          cube[col][myY-1][row][2]=cube[col][myY][row][2]; 
        }
        cube[col][7][row][0]=0; // and turn off X(0)
        cube[col][7][row][1]=0;
        cube[col][7][row][2]=0; 
      }
    }

}
// This routine rotates the characters around in the center of the cube, one at a time.  You can specify a color by its RGB conponents,
// and the number of rotations before moving on to the next character. 
void rotate(char mystring[120], int xRed, int xGreen, int xBlue, int numRotations){
  for (int xxx=0; xxx<120; xxx++){ // This "for" loop processes the incoming string one character at a time
    if (runMode > 0) {break;} // drop out if mode changes
    incomingByte= mystring[xxx];
    if (incomingByte == '\0'){ // if end of string is found,.
      delay(1000);  // wait 1 second and exit the loop
      break;
    }
    for (int col=0; col<46; col++){  //  clear the text buffer. 
      for (int row=0; row<8; row++){
        text_buffer[col][row]=0;
      }
    }
    offset= (incomingByte-32)*8;  // convert one character in the string into font code

      for (int col=0; col<8; col++){
        for (int row=0; row<8; row++){
          if (pgm_read_byte_near(&myfont[offset+col][row])>0) {
            text_buffer[col][row]=1;  // and put it into the text buffer.
          }
        }
      }
   
    for (int rotations=0; rotations<numRotations; rotations++) { // display in the 1st position
      for (int panel=0; panel<7; panel++){
        for (int row=0; row<8; row++){
          if (text_buffer[panel][row]>0) {
            LED(3, panel+1, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
            LED(4, panel+1, row, xRed, xGreen, xBlue);  
          }
        }
      }
      delay (scrollRate/4); // wait fot display
      clearCube(); // clear the cube
      for (int panel=0; panel<7; panel++){  // rotate it 45 degrees
        float mypanel = 1+ float(panel)/1.414; // shrink the character by sqr(2), as the diagonal is sqr(2) wider than the side of cube
        int panelx= int(mypanel);              // by doing this, the character maintains its approx size through the diagonals
        for (int row=0; row<8; row++){         // even though some distortion occurs. 
          if (text_buffer[panel][row]>0) {
            LED(panelx+1, panelx+1, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
            LED(panelx+1, panelx+1, row, xRed, xGreen, xBlue);  
          }
        }
      }
      delay (scrollRate/4);
      clearCube();

      for (int panel=0; panel<7; panel++){ // rotate it another 45 degrees
        for (int row=0; row<8; row++){
          if (text_buffer[panel][row]>0) {
            LED(panel+1, 3, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
            LED(panel+1, 4, row, xRed, xGreen, xBlue);  
          }
        }
      }
      delay (scrollRate/4);
      clearCube();

      for (int panel=0; panel<7; panel++){  // rotate it 45 degrees
        float mypanel = 1+ float(panel)/1.414;
        int panelx= int(mypanel);
        for (int row=0; row<8; row++){
          if (text_buffer[panel][row]>0) {
            LED(panelx+1, 6-panelx, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
            LED(panelx+1, 6-panelx, row, xRed, xGreen, xBlue);  
          }
        }
      }
      delay (scrollRate/4);
      clearCube();
      for (int panel=0; panel<7; panel++){  // rotate it another 45 degrees
        for (int row=0; row<8; row++){
          if (text_buffer[panel][row]>0) {
            LED(3, 6-panel, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
            LED(4, 6-panel, row, xRed, xGreen, xBlue);  
          }
        }
      }
      delay (scrollRate/4);
      clearCube();
      for (int panel=0; panel<7; panel++){  // rotate it 45 degrees
        float mypanel = 1+ float(panel)/1.414;
        int panelx= int(mypanel);
        for (int row=0; row<8; row++){
          if (text_buffer[panel][row]>0) {     
            LED(6-panelx, 6-panelx, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
            LED(6-panelx, 6-panelx, row, xRed, xGreen, xBlue);  
          }
        }
      }
      delay (scrollRate/4);
      clearCube();
      for (int panel=0; panel<7; panel++){  // rotate it another 45 degrees
        for (int row=0; row<8; row++){
          if (text_buffer[panel][row]>0) {
            LED(6-panel, 3, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
            LED(6-panel, 4, row, xRed, xGreen, xBlue);  
          }
        }
      }
      delay (scrollRate/4);
      clearCube();
      for (int panel=0; panel<7; panel++){  // rotate it 45 degrees
        float mypanel = 1+ float(panel)/1.414;
        int panelx= int(mypanel);
        for (int row=0; row<8; row++){
          if (text_buffer[panel][row]>0) {
            LED(6-panelx, panelx+1, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
            LED(6-panelx, panelx+1, row, xRed, xGreen, xBlue);  
          }
        }
      }
      delay (scrollRate/4);
      clearCube();
    }
    for (int panel=0; panel<7; panel++){  // on last rotation, show finally in its original position
      for (int row=0; row<8; row++){
        if (text_buffer[panel][row]>0) {
          LED(3, panel+1, row, xRed, xGreen, xBlue); // and put it into the middle of the cube
          LED(4, panel+1, row, xRed, xGreen, xBlue);  
        }
      }
    }
    delay (scrollRate/4);
    clearCube();
    delay (500);
  }
}  


void zdown (int times) { //shift entire cube down (times) layer(s)
  for (int i=0;i<times;i++) {
    for (int x=0;x<8;x++){
      for (int y=0;y<8;y++){
        for (int z=1;z<8;z++){
          for (int c=0;c<3;c++){
            cube [x][y][z-1][c] = cube [x][y][z][c];
          }
        }
      }
    }
  }
}



// The next four routines are for rotation of the entire content of the cube

// This routine rotates the content in the buffer_cube by a full revolution 
// the specified number rotations in steps of specified stepAngle in degrees.
// The higher the stepAngle, the faster it will rotate.  
void rotateCube(int times, int stepAngle){
  rotation= stepAngle * .0174532; // convert rotate to radians
  int steps = (int)((6.28318/abs(rotation))*times)+1;
  for (int x=0; x<steps; x++){
    myangle = myangle + rotation;
    if (rotation>0 && myangle>6.28318) {
      myangle=0;
    }
    if (rotation<0 && myangle<=0) {
      myangle=6.28318;
    }
    rotateAll(myangle);
  }
  clearCube();
}

 // This routine rotates all layers by the specified angle and transfers it to the cube.
void rotateAll(float myangle) {
  for (byte layer=0; layer<8; layer++){
    rotateLayer(myangle,layer);
  }
}
 
 // This routine rotates one layer in the buffer_cube by the specified angle and transfers it 
 // to the cube.  It rotates the entire layer using polar coordinates.  Math is facilitated 
 // using the tables that are found after the font table in the Font_Table tab.  
void rotateLayer(float myangle, int layer) { 
     for (byte column=0; column<8; column++){  // clear this layer before proceeding
       for (byte panel=0; panel<8; panel++){ 
          cube[column][panel][layer][0]= 0;
          cube[column][panel][layer][1]= 0;
          cube[column][panel][layer][2]= 0;
       } 
     }
    for (byte column=0; column<8; column++){  // scan thru every column
      for (byte panel=0; panel<8; panel++){  // scan thru every panel
        float mydistance = distance[column][panel];
        float myNewAngle = angle[column][panel] + myangle;
        if (myNewAngle>6.28318) {
          myNewAngle = myNewAngle - 6.28318;
        }
        int angleLookup = int(myNewAngle*20 +.5);
        int newColumn = int(4 + (sin_cos[angleLookup][0]*mydistance));
        int newPanel = int(4 + (sin_cos[angleLookup][1]*mydistance));
        if (newColumn<8 && newColumn>-1 && newPanel<8 && newPanel>-1) {
          cube[newColumn][newPanel][layer][0]= buffer_cube[column][panel][layer][0];
          cube[newColumn][newPanel][layer][1]= buffer_cube[column][panel][layer][1];
          cube[newColumn][newPanel][layer][2]= buffer_cube[column][panel][layer][2];
        }
      }
    }
}

// This subroutine randomly picks one of 8 standard colors and loads it 
// into global variables myred, mygreen, and myblue for display.
void rnd_std_color(){
  int colorit= random(8)+1;
  switch(colorit){
  case 1:
    getColor(Red,4);
    break;
  case 2:
    getColor(Yellow,4);
    break;
  case 3:
    getColor(Green,4);
    break;
  case 4:
    getColor(Blue,4);
    break;
  case 5:
    getColor(Purple,4);
    break;
  case 6:
    getColor(Violet,4);
    break;
  case 7:
    getColor(Orange,4);
    break;
  case 8:
    getColor(Aqua,4);
    break;
  default: 
    getColor(Black,0);  
  }
}


void clearBufferCube(){
  for (byte layer=0; layer<8; layer++) // scan thru each layer
  for (byte column=0; column<8; column++)  // scan thru every column
      for (byte panel=0; panel<8; panel++){  // scan thru every panel
          buffer_cube[layer][panel][column][0]=0;
          buffer_cube[layer][panel][column][1]=0;
          buffer_cube[layer][panel][column][2]=0;
          }
}


 
 void wall (byte x,byte y, byte R, byte G, byte B) // make a "wall" at position X, Y high
{
  byte w;
  byte z;
  for (z=0;z < y;z++)
  for (w=0;w < 8;w++)
      LED (w,x,z,R,G,B);
}


void fourSquare (byte x, byte y, byte z, byte R, byte G, byte B){ //draw a pillar at x,y with height z, colour R,G,B
  if (x>4) {x=4;}
  if (y>4) {y=4;}
  if (R>63) {R=63;}
  if (G>63) {G=63;}
  if (B>63) {B=63;}
  
  if (z>0) {
  for (byte zz=0; zz<z; zz++)
  for (byte xx=0; xx<4; xx++) 
  for (byte yy=0; yy<4; yy++) 
      LED (x+xx, y+yy, zz,R,G,B);
  } 
}


void fillCube(byte R, byte G, byte B){  // This subroutine fills the cube with a colour
  for (byte z=0; z<8; z++){  // scan thru each layer
    for (byte x=0; x<8; x++){  // scan thru every column
      for (byte y=0; y<8; y++){  // scan thru every panel
        LED(x,y,z,R,G,B);
      }
    }
  }
}


void xback (int times) {  //shift entire cube back (times) layer(s)
  for (int i=0;i<times;i++) {
    for (int x=0;x<7;x++){
      for (int y=0;y<8;y++){
        for (int z=0;z<8;z++){
          for (int c=0;c<3;c++){
            cube [x][y][z][c] = cube [x+1][y][z][c];
          }
        }
      }
    }
  }
}

void fourSquare2 (byte x, byte y, byte z, byte R, byte G, byte B){ //draw a square at x,y at height z, colour R,G,B
  if (x>4) {x=4;}
  if (y>4) {y=4;}
  if (R>63) {R=63;}
  if (G>63) {G=63;}
  if (B>63) {B=63;} 
  for (byte xx=0;xx<4;xx++) {
    for (byte yy=0;yy<4;yy++) {
      LED (x+xx, y+yy, z-1,R,G,B);
     }
  }
}

void twoSquare (byte x, byte y, byte z, byte R, byte G, byte B){ //draw a 2X2 pillar at x,y with height z, colour R,G,B
  if (x>6) {x=6;}
  if (y>6) {y=6;}
  if (R>63) {R=63;}
  if (G>63) {G=63;}
  if (B>63) {B=63;}
  
  if (z>0) {
  for (byte zz=0; zz<z;zz++){
    for (byte xx=0;xx<2;xx++) {
      for (byte yy=0;yy<2;yy++) {
        LED (x+xx, y+yy, zz,R,G,B);
        }
      }
    }
  } 
}


void elasticPlane (byte pwidth, byte pheight, byte R, byte G, byte B) {
  for (int xx = 4-pwidth; xx < (4+pwidth); xx++)
  for (int yy = 4-pwidth; yy < (4+pwidth); yy++)
      LED (xx,yy,pheight,R,G,B);
}

void elasticPlane2 (byte pwidth, byte pheight, byte R, byte G, byte B) {
  for (int xx = 0; xx < 8; xx++) 
  for (int yy = 0; yy < 8; yy++)
      if (distance[xx][yy]<pwidth){ // if an LED is inside the radius specified by base, turn it on. 
        LED(xx, yy, pheight, R, G, B);
      }
}

// This isn't being called but deleting it increases program size.
void show_sphere2(){ // draw the sphere and change its color
 int inMode2 = runMode;
  for (byte layer=0; layer<8; layer++){  // scan thru each layer
  if (runMode != inMode2 ) {break;} // drop out if mode changes
    for (byte column=0; column<8; column++){  // scan thru every column
      for (byte panel=0; panel<8; panel++){  // scan thru every panel
        x= float(layer); // convert coordinates to floating point to compute distance from center of cube
        y= float(panel); 
        z= float(column); 
        float polar = sqrt((x-3.5)*(x-3.5)+(y-3.5)*(y-3.5)+(z-3.5)*(z-3.5)); // Calculate the distance
        if (polar<count){ // if an LED is inside the radius specified by count, turn it on. 
          LED(column, panel, layer, myred, mygreen, myblue);
        }
        else{  // otherwise turn it off
          LED(column, panel, layer,0,0,0);
        }
      }
    } 
  }
  delay(75);  // control speed
  colorCount = colorCount + 12;  // increment color wheel by twelve
  if (colorCount > 189){  // keep color wheel colors in bounds
    colorCount =0;
  }
  getColor(colorCount, 3); // get the color wheel color for next pass
}

//  Just like LED except for the buffer array used for rotations.
void buffer_LED(int x,int y,int z,int R,int G,int B) {
  if (R>63){
    R=63;
  }
  if (G>63){
    G=63;
  }
  if (G>63){
    G=63;
  }
  buffer_cube[x][y][z][0]=R;
  buffer_cube[x][y][z][1]=G;
  buffer_cube[x][y][z][2]=B;
}















