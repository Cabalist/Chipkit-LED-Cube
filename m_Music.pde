/*  This tab includes 4 routines created by Supertech-IT that each create a special effect driven from incoming music.
    The music hardware described on the website is required, and #define MSGEQ7 must be set to 0x01 to tell the system
    that the hardware is installed.  

*/
void spectrum1 (int iterations, int delayx) {
  int inMode=runMode;
  
  byte rarray [8] = {0,0,8,8,0,0,63,16};
  byte garray [8] = {63,0,32,0,8,32,0,63};
  byte barray [8] = {0,63,0,32,32,0,0,63};
  byte x;
  
  for (int i=0;i<iterations;i++) {
    if (runMode != inMode ) {break;} // drop out if mode changes
     for (int freq=0;freq<7;freq++) {
     int xx = freq;
    
       wall (xx,VU[freq]/114,rarray[freq],garray[freq],barray[freq]); // number from 0 to just under 9 approx for height of wall with colour from RGB array
    }
  
  {zdown(1);}
 if (delayx > 0) {delay (delayx);} // if we aren't running full tilt, delay.
  //clean top layer
    for (byte i=0;i<64;i++){ // 64 LEDs in top layer.
      y=i/8; // calculate the Y axis of the current LED we are clearing
      x=i-y*8; // calculate the X axis of the LED we are clearing
      LED (x,y,7,0,0,0); // clear that LED in the top (7th) layer
    }
  }
 }
 
 void spectrum2 (int iterations, int sdelay) {
  int inMode=runMode;
  for (int times=0; times < iterations;times++) {
    if (runMode != inMode ) {break;} // drop out if mode changes
      
  //clean top row
    for (byte i=0;i<64;i++){
      y=i/8;
      x=i-y*8;
      LED (x,y,7,0,0,0);
    }
    zdown(1);
    fourSquare (0,0,VU[2]/127,32,0,0); // column 4X4 with height of frequency 2 with colour 32(R), 0(G), 0(B)...this is the red column
    fourSquare (4,4,VU[3]/127,16,63,0); // column 4X4 with height of frequency 3 yellow
    fourSquare (0,4,VU[5]/127,0,63,0); // column 4X4 with height of frequency 5 green
    fourSquare (4,0,VU[4]/127,0,0,63); // column 4X4 with height of frequency 4 blue
    
    delay (sdelay);
    // zdown(1);
  }
}

void spectrum3 (int iterations, int delayx) {
  
  byte rarray [8] = {0,0,8,8,0,16,63};
  byte garray [8] = {63,0,32,0,64,63,0};
  byte barray [8] = {0,63,0,32,32,63,0};
  byte x;
  int inMode=runMode;
  
  for (int i=0;i<iterations;i++) {
    if (runMode != inMode ) {break;} // drop out if mode changes
    xback(1);
     for (int freq=0;freq<7;freq++) {
       for (int z=0; z<VU[freq]/103;z++) {
         int yy = freq;
    
         LED (7,yy,z,rarray[freq],garray[freq],barray[freq]); // number from 0 to just under 9 approx
         }
        
     }
    for (int y=0;y<8;y++){
        for (int z=1;z<8;z++){
          for (int c=0;c<3;c++){
            cube [7][y][z-1][c] = cube [7][y][z][c];
          }
        }
      }
        
 if (delayx > 0) {delay (delayx);}
  //clean top row
    for (byte i=0;i<64;i++){
      y=i/8;
      x=i-y*8;
      LED (x,y,7,0,0,0);
    }
  }
 }
 void spectrum4 (int iterations, int sdelay) {
  int inMode=runMode;
  for (int times=0; times < iterations;times++) {
    if (runMode != inMode ) {break;} // drop out if mode changes
      
  //clean top row
    for (byte i=0;i<64;i++){
      y=i/8;
      x=i-y*8;
      LED (x,y,7,0,0,0);
    }
    clearCube();
    // zdown(1);
    fourSquare2 (0,0,VU[2]/127,32,0,0); // column 4X4 with height of frequency 2 with colour 32(R), 0(G), 0(B)...this is the red column
    fourSquare2 (0,4,VU[5]/127,0,63,0); // column 4X4 with height of frequency 5 green
    fourSquare2 (4,0,VU[4]/127,0,0,63); // column 4X4 with height of frequency 4 blue
    fourSquare2 (4,4,VU[3]/127,16,63,0); // column 4X4 with height of frequency 3 yellow
    fourSquare2 (2,2,VU[0]/127,32,63,63); // column 4X4 with height of frequency 0 white
    delay (sdelay);
    // zdown(1);
  }
}

void spectrum5 (int iterations, int delayx) {
  
  byte rarray [8] = {0,0,8,63,0,16,8};
  byte garray [8] = {63,0,32,0,64,63,0};
  byte barray [8] = {0,63,0,0,32,63,32};
  byte x;
  int inMode=runMode;
  
  for (long i=0;i<iterations;i++) {
    if (runMode != inMode ) {break;} // drop out if mode changes
    // xback(1);
    clearCube();
     for (int freq=0;freq<7;freq++) {
       byte zz = VU[freq]/127-.5;
      for (int z=0; z<VU[freq]/127;z++) {
        
         int yy = freq;
          
        LED (7,yy,z,rarray[freq],garray[freq],barray[freq]);
        LED (0,7-yy,z,rarray[freq],garray[freq],barray[freq]);
        LED (yy,0,z,rarray[freq],garray[freq],barray[freq]);
        LED (7-yy,7,z,rarray[freq],garray[freq],barray[freq]);
        
      }
     }
     delay (delayx);
   }
 }
 
 void spectrum6 (int iterations, int sdelay) {
  int inMode=runMode;
  for (int times=0; times < iterations;times++) {
    if (runMode != inMode ) {break;} // drop out if mode changes
      
  //clean top row
    for (byte i=0;i<64;i++){
      y=i/8;
      x=i-y*8;
      LED (x,y,7,0,0,0);
    }
    zdown(1);
    twoSquare (6,0,VU[0]/127,32,0,0); // column 2X2 with height of frequency 0 with colour 32(R), 0(G), 0(B)...this is the red column
    twoSquare (6,4,VU[1]/127,0,63,0); 
    twoSquare (4,2,VU[2]/127,0,0,63); 
    twoSquare (4,6,VU[3]/127,32,63,0); 
    twoSquare (2,0,VU[4]/127,0,63,63); 
    twoSquare (2,4,VU[5]/127,32,0,63); 
    twoSquare (0,3,VU[6]/127,32,63,63);
    
    delay (sdelay);
  }
}

void spectrum7 (long iterations, int delayx, int rSpeed) { // rSpeed = speed of rotation : higher = slower
  
  byte rarray [8] = {0,0,8,63,0,16,8};
  byte garray [8] = {63,0,32,0,64,63,0};
  byte barray [8] = {0,63,0,0,32,63,32};
  byte x;
  int inMode=runMode, rCount = 0;
  byte offset;
  for (int i=0;i<iterations;i++) {
    if (runMode != inMode ) {break;} // drop out if mode changes
    
    rCount ++;
    if (rCount > rSpeed) {rCount = 0;offset ++;} // If the counter reaches limit, reset it and increment the spectrum offset
    if (offset > 7) {offset = 0;}
     clearCube();
    
     for (int freq=0;freq<7;freq++) {
       byte zz = VU[freq]/127-.5;
      for (int z=0; z<VU[freq]/127;z++) {
        
         int yy = freq + offset;
         if (yy > 7) {yy=-7+freq+offset;}
          
        LED (7,yy,z,rarray[freq],garray[freq],barray[freq]);
        LED (0,7-yy,z,rarray[freq],garray[freq],barray[freq]);
        LED (yy,0,z,rarray[freq],garray[freq],barray[freq]);
        LED (7-yy,7,z,rarray[freq],garray[freq],barray[freq]);
        
      }
     }
 delay (delayx);  
 }
 }
 
 void spectrum8 (int iterations, int sdelay) {
  int inMode=runMode;
  int base; 
  for (int times=0; times < iterations; times++) {
    if (runMode != inMode ) {break; } // drop out if mode changes
     //clean top row
    for (byte i=0;i<64;i++){
      y=i/8;
      x=i-y*8;
      LED (x,y,7,0,0,0);
    }
    zdown(1);
    base= (VU[0]+VU[1])/254;
    if (base>4){base=4;}
    for (byte layer=0; layer<8; layer++){  // scan thru each layer
      for (byte column=0; column<8; column++){  // scan thru every column
        for (byte panel=0; panel<8; panel++){  // scan thru every panel
          x= float(column); // convert coordinates to floating point to compute distance from center of cube
          y=float(panel); 
          polar = sqrt((x-3.5)*(x-3.5)+(y-3.5)*(y-3.5)); // Calculate the distance
          if (polar>base){ // if an LED is outside the radius specified by base, turn it off. 
             LED(column, panel, layer,0,0,0);
          }
          else{
           if (column<4 && panel<4) { 
              LED(column, panel,VU[2]/127,63,0,0);}
           if (column>3 && panel<4) { 
              LED(column, panel,VU[3]/127,63,63,0);}
           if (column<4 && panel>3) { 
              LED(column, panel,VU[4]/127,0,63,0);}
           if (column>3 && panel>3) { 
              LED(column, panel,VU[5]/127,0,0,63);}
          }
        }
      }
    }
    delay (sdelay); 
  } 
}

void spectrum9 (int iterations, int xdelay) { 
   int inMode=runMode;
   for (int times = 0; times < iterations; times ++)
   {
     if (runMode != inMode ) {break;} // drop out if mode changes
     clearCube();
     elasticPlane (VU[0]/255, 1, 63,0,0);
     elasticPlane (VU[1]/255, 2, 0,63,0);
     elasticPlane (VU[2]/255, 3, 0,0,63);
     elasticPlane (VU[3]/255, 4, 32,0,63);
     elasticPlane (VU[4]/255, 5, 32,63,0);
     elasticPlane (VU[5]/255, 6, 0,63,63);
     elasticPlane (VU[6]/255, 7, 32,63,63); 
     delay (xdelay); 
   }
 }  
void spectrum10 (int iterations, int xdelay) { 
   int inMode=runMode;
   for (int times = 0; times < iterations; times ++)
   {
     if (runMode != inMode ) {break;} // drop out if mode changes
     clearCube();
     elasticPlane2 (VU[0]/255, 1, 63,0,0);
     elasticPlane2 (VU[1]/255, 2, 0,63,0);
     elasticPlane2 (VU[2]/255, 3, 0,0,63);
     elasticPlane2 (VU[3]/255, 4, 32,0,63);
     elasticPlane2 (VU[4]/255, 5, 32,63,0);
     elasticPlane2 (VU[5]/255, 6, 0,63,63);
     elasticPlane2 (VU[6]/255, 7, 32,63,63); 
     delay (xdelay); 
   }
 }   
 
 
void beat1 (int mycount) { // not a spectrum effect - beat detect effect.
int inMode = runMode, threshold=256;
     for (int counter=0; counter<mycount; counter++){
    if (runMode != inMode ) {break;} // drop out if mode changes

    for (count=0; count<5; count++){  //expand
     show_sphere2();
     beatPause(); // just sit here til next beat comes in or beat changes
      
    }
    for (count=4; count>0; count--){  //contract
      show_sphere2();
      beatPause(); // just sit here til next beat comes in or beat changes
      
    }
  }
  clearCube();
  

}



