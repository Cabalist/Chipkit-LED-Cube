
/*
This file contains all the animations from the original Big Show. 
*/
void CubeInCube(){ 
  for (int i=0; i<4; i++) {
    displayCube(6,1,1,1,Blue);
    displayCube(5,1,1,1,Blue+5);
    displayCube(4,1,1,1,Blue+10);
    displayCube(3,1,1,1,Blue+15);
    displayCube(2,1,1,1,Blue+20);
    displayCube(2,1,1,1,Blue+20);
    displayCube(2,1,1,1,Blue+20);
    displayCube(3,1,1,1,Blue+15);
    displayCube(4,1,1,1,Blue+10);
    displayCube(5,1,1,1,Blue+5);
    displayCube(6,1,1,1,Blue);
    displayCube(6,1,1,1,Blue);
  }
  for (int i=0; i<4; i++) {
    displayCube(6,1,1,1,Blue);
    displayCube(5,2,2,1,Blue-15);
    displayCube(4,3,3,1,Blue-30);
    displayCube(3,4,4,1,Blue-45);
    displayCube(2,5,5,1,Blue-60);
    displayCube(2,5,5,1,Blue-60);
    displayCube(2,5,5,1,Blue-60);
    displayCube(3,4,4,1,Blue-45);
    displayCube(4,3,3,1,Blue-30);
    displayCube(5,2,2,1,Blue-15);
    displayCube(6,1,1,1,Blue);
    displayCube(6,1,1,1,Blue);
  }
  for (int i=0; i<4; i++) {
    displayCube(6,1,1,1,Blue);
    displayCube(5,2,1,2,Blue+15);
    displayCube(4,3,1,3,Blue+30);
    displayCube(3,4,1,4,Blue+45);
    displayCube(2,5,1,5,Blue+60);
    displayCube(2,5,1,5,Blue+60);
    displayCube(2,5,1,5,Blue+60);
    displayCube(3,4,1,4,Blue+45);
    displayCube(4,3,1,3,Blue+30);
    displayCube(5,2,1,2,Blue+15);
    displayCube(6,1,1,1,Blue);
    displayCube(6,1,1,1,Blue);
  }
  for (int i=0; i<4; i++) {
    displayCube(6,1,1,1,Blue);
    displayCube(5,1,2,2,Blue-20);
    displayCube(4,1,3,3,Blue-40);
    displayCube(3,1,4,4,Blue-60);
    displayCube(2,1,5,5,Blue-80);
    displayCube(2,1,5,5,Blue-80);
    displayCube(2,1,5,5,Blue-80);
    displayCube(3,1,4,4,Blue-60);
    displayCube(4,1,3,3,Blue-40);
    displayCube(5,1,2,2,Blue-20);
    displayCube(6,1,1,1,Blue);
    displayCube(6,1,1,1,Blue);
  }
  bounceCube(4,1,1,1,Blue);
  clearCube();
  delay(500);
  // This is where the flashing occurs. 
  for (int i=0; i<5; i++){
    //Turn everything ON to white
  for (byte layer=0; layer<8; layer++){  // scan thru each layer
    for (byte column=0; column<8; column++){  // scan thru every column
      for (byte panel=0; panel<8; panel++){  // scan thru every panel
        cube[layer][panel][column][0]=31;
        cube[layer][panel][column][1]=63;
        cube[layer][panel][column][2]=63;
      }
    }
  }
  delay(10);
  //Turn everything off.(Same as clearCube)
  clearCube();
  delay(390);
  }
  delay(1000);
}


void displayCube(int side, int x, int y, int z, int color){
 sprite mySprite(side,side,side); 
 mySprite.outline(color);
 mySprite.place = {x,y,z};
 mySprite.setIt();
 delay(50);
 mySprite.clearIt();
}


void bounceCube(int side, int x, int y, int z, int color){
 sprite mySprite(side,side,side); 
 mySprite.place = {x,y,z};
 mySprite.motion = {1,2,-1}; // gives my sprite an initial direction of motion
  for (count=0; count<66; count++) { // loop around 100 times
    color=color+3;
    if (color>189){color=0;}
    mySprite.outline(color);
    mySprite.bounceIt(); // move the sprite one increment. Reverse direction  if cube's edge is detected.
    delay(95); // wait 1/10th second before next move.
  } // finish the loop
  mySprite.clearIt(); // turn off the sprite since we're done. 
  delay(1000);
}


/*
This animation uses the new .sphere action of the sprite object class to  create a 6 LED diameter sphere where is then rolled around the main cube.  
*/
void RollingBall(){ 
// This created the sprite and rolls it around the cube. 
// The sprite is rotated around the axis, and then 
// gradually moved back and forth on the x axis.
 int color;
 sprite mySprite(6,6,6); 
 mySprite.sphere(color);
 mySprite.place = {-1,1,1};
 for (int x=0; x<95; x++){
    color=color+2;
    if (color>189){color=0;}
      mySprite.sphere(color);
    if (x>15){
      clearCube();
      mySprite.place[0]= 0;
    }
    if (x>30){
      clearCube();
      mySprite.place[0]= 1;
    }
    if (x>45){
      clearCube();
      mySprite.place[0]= 2;
    }
    if (x>60){
      clearCube();
      mySprite.place[0]= 1;
    }
    if (x>75){
      clearCube();
      mySprite.place[0]= 0;
    }
    mySprite.rollX(0);
    delay(50);
  }
 mySprite.clearIt();
  delay(1000);
}


/*
This is a new animation.  Basically two pyramids, one right-side up and an  inverted one below it,
are moved up and down, almost completely through the cube in each direction.  This is a convensional
animation - no sprites or anything fancy!
*/

void DiamondWave() {
  for (int j=0; j<15; j++){  // go up and down 10 times
    colorCount=colorCount+10;  // change color with each pass
    if (colorCount>180) {
      colorCount=10;
    }
    getColor(colorCount,4);
    for (int i=0; i<18; i++){ // moving upward

      for (byte xx=0; xx<8; xx++){ // Here we generate both the upper and  lower pyramid
        for (byte yy=0; yy<8; yy++){ // If actually starts out as a cone, but  flairs out to a square at its widest.
          z= int(i - 9.5 + distance[xx][yy]);
          z1= int(i - 0.5 - distance[xx][yy]);
          if (z>-1 && z<8) {
            LED(xx,yy, z, myred,mygreen,myblue);
          }
          if (z1>-1 && z1<8) {
            LED(xx,yy, z1, myred,mygreen,myblue);
          }
        }
      } 
      delay(40);       // Increase or decrease to change speed of this  animation 
      clearCube();    // clear the cube
    }
    for (int i=16; i>0; i--){ //moving downward

      for (byte xx=0; xx<8; xx++){ // 
        for (byte yy=0; yy<8; yy++){ 
          z= int(i - 9.5 + distance[xx][yy]);
          z1= int(i - 0.5 - distance[xx][yy]);
          if (z>-1 && z<8) {
            LED(xx,yy, z, myred,mygreen,myblue);
          }
          if (z1>-1 && z1<8) {
            LED(xx,yy, z1, myred,mygreen,myblue);
          }
        }
      } 
      delay(40);       // Increase or decrease to change speed of this  animation 
      clearCube();    // clear the cube
    }
  }
   delay(1000);
}


void Mysterious() {
int xpos = 3;
int ypos = 3;
int mydelay = 50;
int myrandom;
  for (int j=0; j<400; j++){
    myrandom=random(8);
    if (myrandom==0){
      xpos++;
    }
    if (myrandom==1){
      xpos--;
    }
    if (myrandom==2){
      ypos++;
    }
    if (myrandom==3){
      ypos--;
    }
    if (xpos<0) {
      xpos=1;
    }
    if (xpos>6) {
      xpos=5;
    }
    if (ypos<0) {
      ypos=1;
    }
    if (ypos>6) {
      ypos=5;
    }
    getColor(mycolor,4);
    mycolor=mycolor-3;
    if (mycolor<1){
      mycolor=189;
    }
    if (xpos > -1 && ypos > -1)
    {
    LED(xpos, ypos, 7, myred, mygreen, myblue);
    LED(xpos+1, ypos, 7, myred, mygreen, myblue);
    LED(xpos, ypos+1, 7, myred, mygreen, myblue);
    LED(xpos+1, ypos+1, 7, myred, mygreen, myblue);
    delay(mydelay);
    }
    for (int x=0;x<8;x++){ // copy content of each layer to the layer below  it.
      for (int y=0;y<8;y++){
        for (int z=1;z<8;z++){
          for (int c=0;c<3;c++){
            cube [x][y][z-1][c] = cube [x][y][z][c];
          }
        }
      }
    }
    
    if (xpos > -1 && ypos > -1)
    {
    LED(xpos, ypos, 7, 0, 0, 0);
    LED(xpos+1, ypos, 7, 0, 0, 0);
    LED(xpos, ypos+1, 7, 0, 0, 0);
    LED(xpos+1, ypos+1, 7, 0, 0, 0);
    }
  }
  clearCube();
  delay(1000);
 }


/*
This is a very simple animation. Not much to it, but a nice effect.  My intent  was mainly to create 
the falling effect, but some people think the best part is the return where  they all rapidly return
to their original position on the top.  Looks like a whole bunch of guns going  off. 
*/
void RandomFall() {
    byte upDown[8][8];
    for (int x=0;x<8;x++){
      for (int y=0;y<8;y++){
        LED (x, y, 7, 63,0,0); 
        upDown[x][y] = 0;
      }
  } 
  delay(500);
  while(count3<64){
    x3= random(8); 
    y3= random(8);
    if (upDown[x3][y3]==0){
      upDown[x3][y3]=1;
      count3++;
      mycolor=16;
      getColor(mycolor, 4);
      for (z=7; z>0; z--){
        LED(x3, y3, z, 0,0,0);
        LED(x3, y3, z-1, myred,mygreen,myblue);
        delay((z*mywait)/5);
        mycolor=mycolor+15;
        getColor(mycolor, 4);
      }
    }
  }
  delay(200);
  count3=0;

  while(count3<64){
    x3= random(8); 
    y3= random(8);
    if (upDown[x3][y3]==1){
      upDown[x3][y3]=0;
      count3++;
      mycolor=91;
      getColor(mycolor, 4);
      for (z=0; z<7; z++){
        LED(x3, y3, z, 0,0,0);
        LED(x3, y3, z+1, myred,mygreen,myblue);
        delay(mywait/5);
        mycolor=mycolor-15;
        getColor(mycolor, 4);
      }
    }
  }
  delay(200);
  count3=0;
  delay(200);
  clearCube();
  delay(1000);
 }

/*
This is the new and improved Helicopter!  It takes advantage of the fact that  sprites
can now be up to 6x6x6.   It's now 6x6x4 while the old one was 4x4x4.   
The main roter is bigger and actually rotates now. And the tail is longer, so  it actually
looks a little more like a helicopter.  There are actually three different  subroutines
here working on the sprite, so it is created globally, outside of any of them.   This is
very wasteful of RAM, but I have enough because I have been very careful in  all the other 
animations to dispose of sprites when they are finished with. I guess I could  have done that
here too. but it's not that easy to create. Also, I would need some global  variable to keep track
of where it is as its flying around if I kept distroying it (and losing its  position) after every
subroutine. 

And thanks to David Yee for some minor improvements which are now included here. 
*/
sprite heli(6,6,4);  // Our sprite is 6 x 6 x 4.
void Helicopter(){
  heli.place = {  // set up its initial location
    2,2,0          };
  heli.motion = {  // set up its initial motion
    1,-1, 1          };
  heli.description = {  // define the shape and color of the helicopter. 
    {  // top layer
      {
        White,  Black, Black, Black, Black, Black          }
      , // 1st column,  6 panels 
      {
        Black,  White, Black, Black, Black, Black                 }
      , // 2nd column,  6 panels
      {
        Black,  Black, White, Black , Black, Black                  }
      , // 3rd column,  6 panels
      {
        Black,  Black, Black, White , Black, Black               }
      , // 4th column,  6 panels
      {
        Black,  Black, Black, Black , White, Black               }
      , // 5th column,  6 panels
      {
        Black,  Black, Black, Black , Black, White               }
      , // 6th column,  6 panels
    }
    ,
    {  // 1st middle layer 
      {
        Black,  Black, Black, Black, Black, Black              }
      , // 1st column,  6panels 
      {
        Black, Black, Black, Black, Black, Black             }
      , // 2nd column,  6 panels
      {
        Black,  Blue, Blue, Blue, Blue, Blue             }
      , // 3rd column,  6 panels
      {
        Black,  Blue, Blue, Blue, Blue, Blue                  }
      , // 4th column,  6 panels
      {
        Black,  Black, Black, Black, Black, Black                  }
      , // 5th column,  6 panels
      {
        Black,  Black, Black, Black, Black, Black                  }
      , // 6th column,  6 panels
    }
    ,
    {  // 2nd middle layer
      {
        Black,  Black, Black, Black, Black, Black                }
      , // 1st column,  6 panels 
      {
        Black,  Black, Black, Black, Black, Black               }
      , // 2nd column,  6 panels
      {
        Black,  Blue, Blue, Black, Black, Black              }
      , //// 3rd column,  6 panels
      {
        Black,  Blue, Blue, Black, Black, Black              }
      , // 4th column,  6 panels
      {
        Black,  Black, Black, Black, Black, Black              }
      , // 5th column,  6 panels
      {
        Black,  Black, Black, Black, Black, Black              }
      ,// 6th column,  6 panels
    }
    ,
    {  // bottom layer
      {
        Black,  Black, Black, Black, Black, Black                 }
      , // 1st column,  6 panels 
      {
        Black,  Black, Black, Black, Black, Black           }
      , // 2nd column,  6 panels
      {
        Blue,  Black, Blue, Black, Black, Black                }
      , // 3rd column,  6 panels
      {
        Blue,  Black, Blue, Black, Black, Black               }
      , // 4th column,  6 panels
      {
        Black,  Black, Black, Black, Black, Black               }
      , // 5th column,  6 panels
      {
        Black,  Black, Black, Black, Black, Black               }
      , // 6th column,  6 panels
    }
    ,
  };
   heli.setIt();  // display helicopter
  delay(1000);
  for (int count=0; count<6; count++){  // make the tail light blink
    blinkRed();
    heli.setIt();
    delay(500);
  }
  for (int count=0; count<5; count++){  // start the rotor turning
    blinkRed(); 
    heli.setIt();
    rotor(160);
  }
  for (int count=0; count<5; count++){  // start the rotor turning
    blinkRed(); 
    heli.setIt();
    rotor(140);
  }
  for (int count=0; count<5; count++){  // start the rotor turning
    blinkRed(); 
    heli.setIt();
    rotor(120);
  }
  for (int count=0; count<5; count++){  // start the rotor turning
    blinkRed(); 
    heli.setIt();
    rotor(100);
  }
  for (int count=0; count<5; count++){  // start the rotor turning
    blinkRed(); 
    heli.setIt();
    rotor(80);
  }  
  for (int count=0; count<5; count++){  // start the rotor turning
    blinkRed(); 
    heli.setIt();
    rotor(50);
  }    
  for (int count=0; count<40; count++){  // now the helicopter is flying
    heli.bounceIt();
    blinkRed();
    rotor(40);
    rotor(40);
    rotor(40);
    rotor(40);
    rotor(40);
    blinkRed();
    rotor(40);
    rotor(40);
    rotor(40);
    rotor(40);
    rotor(40);
  }
  if (heli.description[0][3][0]==Black){  // now it's landing
    rotor(50);  
  }
  for (int count=0; count<5; count++){  // start the rotor turning
    blinkRed(); 
    heli.setIt();
    rotor(80);
  }
  for (int count=0; count<5; count++){  // start the rotor turning
    blinkRed(); 
    heli.setIt();
    rotor(120);
  }
  for (int count=0; count<5; count++){  // start the rotor turning
    blinkRed(); 
    heli.setIt();
    rotor(140);
  }
  for (int count=0; count<5; count++){  // start the rotor turning
    blinkRed(); 
    heli.setIt();
    rotor(160);
  }
  for (int count=0; count<5; count++){  // rotor stops but tail light still  blinks
    blinkRed();
    heli.setIt();
    delay(500);
  }
  delay(1000);  // blinking stops 
  blinkMe=0;
  clearCube();  // done - clear the cube
  delay(1000);
}

void rotor(int delayx){  // makes the rotor rotate
  switch(rot){
  case 1:
    heli.description[0][3][0]=Black;
    heli.description[0][3][1]=Black;
    heli.description[0][3][2]=Black;
    heli.description[0][2][3]=Black;
    heli.description[0][2][4]=Black;
    heli.description[0][2][5]=Black;
    heli.description[0][0][0]=White;
    heli.description[0][1][1]=White;
    heli.description[0][2][2]=White;
    heli.description[0][3][3]=White;
    heli.description[0][4][4]=White;
    heli.description[0][5][5]=White;
    rot=2; 
    break; 
  case 2:
    heli.description[0][0][0]=Black;
    heli.description[0][1][1]=Black;
    heli.description[0][2][2]=Black;
    heli.description[0][3][3]=Black;
    heli.description[0][4][4]=Black;
    heli.description[0][5][5]=Black;
    heli.description[0][5][3]=White;
    heli.description[0][4][3]=White;
    heli.description[0][3][3]=White;
    heli.description[0][2][2]=White;
    heli.description[0][1][2]=White;
    heli.description[0][0][2]=White;
    rot=3;
    break; 
  case 3:
    heli.description[0][5][3]=Black;
    heli.description[0][4][3]=Black;
    heli.description[0][3][3]=Black;
    heli.description[0][2][2]=Black;
    heli.description[0][1][2]=Black;
    heli.description[0][0][2]=Black;
    heli.description[0][5][0]=White;
    heli.description[0][4][1]=White;
    heli.description[0][3][2]=White;
    heli.description[0][2][3]=White;
    heli.description[0][1][4]=White;
    heli.description[0][0][5]=White;
    rot=4;
    break; 
  case 4:
    heli.description[0][5][0]=Black;
    heli.description[0][4][1]=Black;
    heli.description[0][3][2]=Black;
    heli.description[0][2][3]=Black;
   heli.description[0][1][4]=Black;
    heli.description[0][0][5]=Black;
    heli.description[0][3][0]=White;
    heli.description[0][3][1]=White;
    heli.description[0][3][2]=White;
    heli.description[0][2][3]=White;
    heli.description[0][2][4]=White;
    heli.description[0][2][5]=White;
    rot=1;
    break; 
  }
  heli.setIt();
  delay(delayx);
}

void blinkRed(){  // turns tail light on if off, or off if on. 
  if (blinkMe==0){
    blinkMe = 1;
    heli.description[1][2][5]=Blue;
    heli.description[1][3][5]=Blue;
  }
  else {
    blinkMe = 0;
    heli.description[1][2][5]=Red;
    heli.description[1][3][5]=Red;
  }
}

// This is new animation which is a variation on the previous cosine  animation.  In this modification, the cosine function is flattened out 
// to produce a wavy flat sheet moving up and down.  Then we've added in some  sparkle. 

void Glitter_ribbon(){
  for (int j=0; j<15; j++){
    for (int i=0; i<36; i++){   //it takes 36 steps to complete one full cycle
      getColor(i*5, 3); // get a rainbow color.  We need to go through most of  189 colors over the course of one full cycle. 
      for (byte xx=0; xx<8; xx++){
        for (byte yy=0; yy<8; yy++){
          z=((byte)(4+cos((xx/7.23)+(yy/12.23)+(float)i/6.28)*4)); // the  actual z calculation
          if (z>7) {
            z=7;
          }
          if (random(40)==0){
            LED(xx,yy, z, 31,63,63);  // add white flash sparkle 1/40th of the  time.
          }
          else {
            LED(xx,yy, z, myred,mygreen,myblue); 
          }
        }
      } 
      delay(30);       // Increase or decrease to change speed of this  animation 
      clearCube();    // clear the cube
    }
  }
   delay(1000);
}


void Elevators() {
  byte location[8][8][2];  //this array stores the location and direction of  each elevator 
  for (byte xx=0; xx<8; xx++){  // this is the setup routine.
    for (byte yy=0; yy<8; yy++){
      location[xx][yy][0]= random(4); // pick an initial floor
      if (location[xx][yy][0] >0) {location[xx][yy][0]= 10;}  // only ones on  the ground floor are chosen. 
      // other 2/4 of LEDs are banished to the 10th floor where they won't be  seen.  
      location[xx][yy][1]= random(3);  // select an initial direction of  travel: up, down, or stopped. 
      if (location[xx][yy][0]<8)  {  // if it's not on the 10th floor, assign  it a color
        rnd_std_color();
        LED(xx,yy,location[xx][yy][0], myred, mygreen, myblue); // and turn it  on.  
      }
    }
  } 
  delay(2000); // our elevators are all set up and lit up on the ground floor.   
  for (int j=0;  j<250; j++){  // now we put them in motion
    for (byte xx=0; xx<8; xx++){
      for (byte yy=0; yy<8; yy++){
        if (location[xx][yy][0]<8)  { // if it's a valid elevator
          myred=cube[xx][yy][location[xx][yy][0]][0]; // get its color
          mygreen=cube[xx][yy][location[xx][yy][0]][1];
          myblue=cube[xx][yy][location[xx][yy][0]][2];
          LED(xx,yy,location[xx][yy][0],0,0,0); // then erase it from its  current position
          if (random(3)==0){  // 1/3 of the time
            location[xx][yy][1]= random(3);  //change direction: up, down, or  stopped
          }
          if (location[xx][yy][1]==1){ // if it's going up, 
            if (location[xx][yy][0]<7){  // and not already on the top floor
              location[xx][yy][0]=location[xx][yy][0]+1; // move it up one
            }
            else{ // on the top floor?
              location[xx][yy][0]=location[xx][yy][0]-1;  // move down one
              location[xx][yy][1]==2; // change direction to down
            }
          }
          if (location[xx][yy][1]==2){  // if it's going down,
            if (location[xx][yy][0]>0){ // and not already on the ground floor
              location[xx][yy][0]=location[xx][yy][0]-1;  // move it down one
            }
            else{ // on the bottom floor?
              location[xx][yy][0]=location[xx][yy][0]+1; // move up one
              location[xx][yy][1]==1;  //change direction to up
            }
          }
          LED(xx,yy,location[xx][yy][0], myred, mygreen, myblue); // turn on  in new location
        }
      }
    } 
    delay(300-j);  // wait, with animation speeding up as j increases. 
  }
  clearCube();    // clear the cube
  delay(1000);
}


/* This is a new animaiton.  It uses the sprite object class to create an  ornament like object and move it around the cube.
It use a new feature just added to the sprite object class called  ChgIntensity() which allows you to modify the intensity
of the LEDs in your sprite selecting 1-4.   The default intensity is always 4  (max. intensity), but this allows you to 
alter it if you want.
*/

void TheOrnament(){ 
  sprite mySprite(3,3,6); 
  mySprite.description = {  // define the shape and color. 
    {  // top layer
      {
        Black,  Black, Black                     }
      , // 1st column,  3 panels 
      {
        Black,  Red, Black                            }
      , // 2nd column,  3 panels
      {
        Black,  Black, Black                           }
      , // 3rd column,  3 panels
    }
    ,
    {  // 2nd layer
      {
        Black,  Orange, Black                     }
      , // 1st column,  3 panels 
      {
        Orange,  Black, Orange                            }
      , // 2nd column,  3 panels
      {
        Black,  Orange, Black                          }
      , // 3rd column,  3 panels
    }
    ,
    {  // 3rd layer
      {
        Green,  Green, Green                     }
      , // 1st column,  3 panels 
      {
        Green,  Green, Green                            }
      , // 2nd column, 3 panels
      {
        Green,  Green, Green                           }
      , // 3rd column,  3 panels
    }
    ,
    {  // 4th layer
      {
        Blue,  Blue, Blue                     }
      , // 1st column,  3 panels 
      {
        Blue,  Blue, Blue                           }
      , // 2nd column,  3 panels
      {
        Blue,  Blue, Blue                           }
      , // 3rd column,  3 panels
    }
    ,
    {  // 5th layer
      {
        Black,  Purple, Black                     }
      , // 1st column,  3 panels 
      {
        Purple,  Black, Purple                            }
      , // 2nd column,  3 panels
      {
        Black,  Purple, Black                          }
      , // 3rd column,  3 panels
    }
    ,
    {  // 6th layer
      {
        Black,  Black, Black                     }
      , // 1st column,  3 panels 
      {
        Black,  Violet, Black                            }
      , // 2nd column,  3 panels
      {
        Black,  Black, Black                           }
      , // 3rd column,  3 panels
    }
    ,
  };
  mySprite.place = { 3,3,1    };
 for (int j=0; j<7;j++){
  mySprite.ChgIntensity(1);
  mySprite.setIt();
  delay(150);
   mySprite.ChgIntensity(2);
  mySprite.setIt();
 delay(150);
   mySprite.ChgIntensity(3);
  mySprite.setIt();
  delay(150);
   mySprite.ChgIntensity(4);
  mySprite.setIt();
  delay(150);
  mySprite.ChgIntensity(3);
  mySprite.setIt();
  delay(150);
   mySprite.ChgIntensity(2);
  mySprite.setIt();
 delay(150);
 }
 mySprite.ChgIntensity(1);
  mySprite.setIt();
  delay(150);
  mySprite.ChgIntensity(2);
  mySprite.setIt();
 delay(150);
   mySprite.ChgIntensity(3);
  mySprite.setIt();
  delay(150);
  mySprite.ChgIntensity(4);
  mySprite.setIt();
  delay(3000);
  for (int j=0; j<50;j++){
   mySprite.rollZ(1); 
   delay(100);
  }
  clearCube();
  mySprite.place = { 3,3,1    };
  mySprite.motion = {0,0,1};
  for (int j=0; j<28;j++){
  mySprite.bounceIt();
  delay(200);
  }
  for (int j=0; j<50;j++){
   mySprite.ChgIntensity(1+j%4);
   mySprite.rollZ(0); 
   delay(200);
  }
  clearCube();
  mySprite.ChgIntensity(4);
  mySprite.place = { 3,3,1    };
  mySprite.motion = {0,0,1};
  for (int j=0; j<27;j++){
  mySprite.bounceIt();
  delay(200);
  }
  mySprite.clearIt();
  mySprite.place = { 3,3,1    };
  mySprite.ChgIntensity(4);
  mySprite.setIt();
  delay(500);
  mySprite.ChgIntensity(3);
  mySprite.setIt();
 delay(500);
   mySprite.ChgIntensity(2);
  mySprite.setIt();
  delay(500);
  mySprite.ChgIntensity(1);
  mySprite.setIt();
  delay(2000);
  clearCube();
  delay(1000);
}


void Hula(){ 
  colorCount=0; 
  rotation = 10 * .0174532; // convert 10 degree angle to radians
  for (int reps=0; reps<50; reps++){
    for (int z=0; z<8; z++) {  // for each layer
      getColor(colorCount,4);  // pick a color.  It will gradually change as  colorCount increases.
      colorCount = colorCount+3;
      if (colorCount>188){
        colorCount=0;
      }
      // here is the actual animation for one layer and it's compliment (7-z)
      for (int x=0; x<z+1; x++){
        for (int y=0; y<z+1; y++){
          buffer_LED(x, y, 7-z, myred, mygreen, myblue);
        }
      }
      for (int x=0; x<z+1; x++){
        for (int y=0; y<z+1; y++){
          buffer_LED(x, y, z, myred, mygreen, myblue);
        }
      }
      for (int x=1; x<z; x++){
        for (int y=1; y<z; y++){
          buffer_LED(x, y, 7-z, 0, 0,0);
        }
      }
      for (int x=1; x<z; x++){
        for (int y=1; y<z; y++){
          buffer_LED(x, y, z, 0, 0,0);
        }
      }
    }
    // Now we rotate the new formation 90 degrees. (9 * 10 degrees)
    for (int count=0; count<9; count++) {  // now rotate it. 
      rotateAll(myangle);  // the actual rotation of the animation
      myangle = myangle + rotation; // increment the angle
      if (myangle>6.28318) { // and make sure it doesn't overflow
        myangle=myangle-6.28318;  //subtract 2 pi radians
      }
    }
  }
  clearBufferCube();
  clearCube();
  delay(1000);
}


// this code creates flash effects. We turn on a random LED every 10 msec.
// each LED once on stays on through one complete loop or 30 msec. 
void Sparkle() {
  getColor(White, 4);  //flashes are white
  for (int j=0; j<200; j++){  // go around 75 times
    int newx1, newy1, newz1, newx2, newy2, newz2, newx3, newy3, newz3; //  locations for 3 LEDs that are on at one time
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


// This is new animation derived from the elevator animation.  Just messing  with the 
// elevator's code created this interesting effect.

void Chaos() {
  for (int k=0; k<15; k++){
    byte location[8][8][2];  //this array stores the location and direction of  each column 
    for (byte xx=0; xx<8; xx++){  // this is the setup routine.
      for (byte yy=0; yy<8; yy++){
        location[xx][yy][0]= random(7);
        if (location[xx][yy][0] >0) {
          location[xx][yy][0]= 10;
        }  // only ones at layer 0 are chosen. 
        // other 3/4 of LEDs are banished to the 10th layer where they won't  be seen.  
        location[xx][yy][1]= random(3);  // select an initial direction of  travel: up, down, or stopped. 
        if (location[xx][yy][0]<8)  {  // if it's not on the 10th level,  assign it a color
          LED(xx,yy,location[xx][yy][0], myred, mygreen, myblue); // and turn  it on.  
        }
      }
    } 

    for (int j=0;  j<50; j++){  // now we put them in motion
      getColor(mycolor,4);
      mycolor=mycolor-1;
      if (mycolor<1){
        mycolor=189;
      }
      for (byte xx=0; xx<8; xx++){
        for (byte yy=0; yy<8; yy++){
          if (location[xx][yy][0]<8)  { // if it's a valid location (not 10th  layer
            if (random(3)==0){  // 1/3 of the time
              location[xx][yy][1]= random(3);  //change direction: up, down,  or stopped
              for (int z=0; z<8; z++) { // at this time erase everything in  this xx,yy column
                LED(xx,yy,z,0,0,0);
              }
            }
            if (location[xx][yy][1]==1){ // if it's going up, 
              if (location[xx][yy][0]<7){  // and not already on the top floor
                location[xx][yy][0]=location[xx][yy][0]+1; // move it up one
              }
              else{ // on the top floor?
                location[xx][yy][0]=location[xx][yy][0]-1;  // move down one
                location[xx][yy][1]==2; // change direction to down
              }
            }
            if (location[xx][yy][1]==2){  // if it's going down,
              if (location[xx][yy][0]>0){ // and not already on the ground  floor
                location[xx][yy][0]=location[xx][yy][0]-1;  // move it down  one
              }
              else{ // on the bottom floor?
                location[xx][yy][0]=location[xx][yy][0]+1; // move up one
                location[xx][yy][1]==1;  //change direction to up
              }
            }
            LED(xx,yy,location[xx][yy][0], myred, mygreen, myblue); // turn on  in new location
          }
        }
      } 
      delay(30); // this moves pretty fast
    }
    clearCube();    // clear the cube
  }
  delay(1000);
}


// This animation is similar to the single swirl except our sprites are 2 x 2  x 2 in size.  They are just as easy to create as our single LED sprites, 
// and are much easier to track as they move about in the cube. 

void Multi_Swirl() {
   sprite LED1(2,2,2);  //create 6 sprites
  LED1.colorIt(Yellow);
  LED1.place = {5,4,3};
  LED1.motion = {1,-2,1};

  sprite LED2(2,2,2);
  LED2.colorIt(Green);
  LED2.place = {3,4,5};
  LED2.motion = {2,1,-2};
  
  sprite LED3(2,2,2);
  LED3.colorIt(Blue);
  LED3.place = {2,6,3};
  LED3.motion = {1,-1,-1};
   
  sprite LED4(2,2,2);
  LED4.colorIt(Violet);
  LED4.place = {5,1,2};
  LED4.motion = {2,1,-1};
 
  sprite LED5(2,2,2);
  LED5.colorIt(Orange);
  LED5.place = {1,2,3};
  LED5.motion = {1,1,2};

  sprite LED6(2,2,2);
  LED6.colorIt(Red);
  LED6.place = {5,1,2};
  LED6.motion = {2,1,-1};

  for (int count=0; count<150; count++) {  //now bounce all these sprites  around in the cube
    LED1.bounceIt();
    LED2.bounceIt();
    LED3.bounceIt();
    LED4.bounceIt();
    LED5.bounceIt();
    LED6.bounceIt();
    delay(125); // delay 125msec between each movement. 
  }
  LED1.clearIt();
  LED2.clearIt();
  LED3.clearIt();
  LED4.clearIt();
  LED5.clearIt();
  LED6.clearIt();
  delay(1000);
}


// In this animation, we create three sprites, then rotate them around  themselves while rolling them around the edge of the cube. 
// An interesting effect demonstating both .roll and .rotate methods of our  sprite object class.

void Flip_and_Roll(){
 int mydelay = 250;
  sprite Sprite1(3,3,3);  // X and Y dimensions must be equal if we are going  to rotate around Z axis.   
  Sprite1.place= {1,1,1};
  Sprite1.description = {  // just a simple red green green line across 3  layers
		    {  // top layer
			{Red,  Red, Red},  // 1st column,  3 panels 
			{Red,  Red, Red},  // 2nd column,  3 panels
			{Red,  Red, Red}   // 3rd column,  3 panels
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
  sprite Sprite2(3,3,3);  // X and Y dimensions must be equal if we are going  to rotate around X axis.   
  Sprite2.place= {4,4,5};
  Sprite2.description = {  // just a simple red green green line across 3  layers
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
  sprite Sprite3(3,3,3);  // X and Y dimensions must be equal if we are going  to rotate around X axis.   
  Sprite3.place= {1,4,3};
  Sprite3.description = {  // just a simple red green green line across 3  layers
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
 
for (int count=0; count<15; count++){
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


// This animation creates red, green, and blue boxes. Then it rolls one around  the edge of the cube around the X axis, one is rolled around the Y axis,
// and one is rolled around the Z axis.  Creates an interesting effect. 
void FlyingBoxes() {
  sprite mySprite(3,3,3); // this creates a sprite called mySprite with  dimensions 2x2x2 LEDs.
  mySprite.colorIt(Green);
  mySprite.place = {3,5,3}; // locate it in the lower, back corner of the cube
  mySprite.setIt(); // actually puts it in the cube, turning on the LEDs. 
  mySprite.motion = {2,1,1}; // gives my sprite an initial direction of motion
  
  sprite mySprite2(3,3,3); // this creates a sprite called mySprite with  dimensions 2x2x2 LEDs.
  mySprite2.colorIt(Red);
  mySprite2.place = {0,3,2}; // locate it in the lower, back corner of the  cube
  mySprite2.setIt(); // actually puts it in the cube, turning on the LEDs. 
  mySprite2.motion = {2,1,1}; // gives my sprite an initial direction of  motion
  
  sprite mySprite3(3,3,3); // this creates a sprite called mySprite with  dimensions 2x2x2 LEDs.
  mySprite3.colorIt(Blue);
  mySprite3.place = {4,2,4}; // locate it in the lower, back corner of the  cube
  mySprite3.setIt(); // actually puts it in the cube, turning on the LEDs. 
  mySprite3.motion = {2,1,1}; // gives my sprite an initial direction of  motion
  
  for (count=0; count<250; count++) { // loop around 100 times
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


// this is the pulsing sphere animation.
void Pulsing_Sphere(int mycount){
  for (int counter=0; counter<mycount; counter++){
    for (count=0; count<5; count++){  //expand
      show_sphere();
    }
    for (count=4; count>0; count--){  //contract
      show_sphere();
    }
  }
  delay(1000);
}


void show_sphere(){ // draw the sphere and change its color
  for (byte layer=0; layer<8; layer++){  // scan thru each layer
    for (byte column=0; column<8; column++){  // scan thru every column
      for (byte panel=0; panel<8; panel++){  // scan thru every panel
        x= float(layer); // convert coordinates to floating point to compute  distance from center of cube
        y= float(panel); 
        z= float(column); 
        float polar = sqrt((x-3.5)*(x-3.5)+(y-3.5)*(y-3.5)+(z-3.5)*(z-3.5)); //  Calculate the distance
        if (polar<count){ // if an LED is inside the radius specified by  count, turn it on. 
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


void Sinewave(int repeat) {
  for (int reps =0; reps<repeat; reps++){
    for (int i=0; i<80; i++){   //it takes 40 steps to complete one full cycle
      getColor(i*2, 4); // get a rainbow color.  We need to go through all 189  color over the course of one full cycle. 
      for (byte xx=0; xx<4; xx++){ // for 1 quadrant of the cube
        for (byte yy=0; yy<4; yy++){
          // the next line is the guts of the calculation, where the z value  is calculated both as a function of i and distance 
          // from center of cube.  The calculation is time consuming, so we  calculate it for only one quadrant and 
          // then reflect it onto the other 3 quadrants.
          z=((byte)((4+sin(sqrt((3.5-xx)*(3.5-xx)+(3.5-yy)*(3.5- yy))/1.3+(float)i/12)*4))); // the actual z calculation
          LED(xx,yy, z, myred,mygreen,myblue); // put z into the proper place  for each position in quadrant 1
          LED(7-xx,7-yy, z, myred,mygreen,myblue); // put z into the proper  place for each position in quatrant 3
          LED(7-xx,yy, z, myred,mygreen,myblue);  // put z into the proper  place for each position in quatrant 2
          LED(xx,7-yy, z, myred,mygreen,myblue);  // put z into the proper  place for each position in quatrant 4  
        }
      } 
          delay(8);       // Increase or decrease to change speed of this  animation 
          clearCube();    // clear the cube
    }
  }
  clearCube();
   delay(1000);
}


// This is the cyclone animation. 

void Cyclone(){
    for (int mycolors=0; mycolors<190; mycolors= mycolors+15){ //get a color  from color wheel
      int color2= mycolors+95;  // get a color from the opposite side of color  wheel
      if (color2>189){
        color2=color2-189;
      }
      getColor(mycolors, 4);  // set up the top layer with these colors
      cyclone[0][0]=myred;
      cyclone[0][1]=mygreen;
      cyclone[0][2]=myblue;
      cyclone[1][0]=myred;
      cyclone[1][1]=mygreen;
      cyclone[1][2]=myblue;
      getColor(color2, 4);
      cyclone[10][0]=myred;
      cyclone[10][1]=mygreen;
      cyclone[10][2]=myblue;
      cyclone[11][0]=myred;
      cyclone[11][1]=mygreen;
      cyclone[11][2]=myblue;
      for (int count=0; count<duration; count++){ // send them through a full  rotation
        cyclone1();
      }
    }
    clearCube();
     delay(1000);
  }

void cyclone1(){  // actually display in LEDs
  LED (4,0,7,cyclone[0][0],cyclone[0][1],cyclone[0][2]);
  LED (3,0,7,cyclone[1][0],cyclone[1][1],cyclone[1][2]);
  LED (2,1,7,cyclone[2][0],cyclone[2][1],cyclone[2][2]);
  LED (1,1,7,cyclone[3][0],cyclone[3][1],cyclone[3][2]);
  LED (1,2,7,cyclone[4][0],cyclone[4][1],cyclone[4][2]);
  LED (0,3,7,cyclone[5][0],cyclone[5][1],cyclone[5][2]);
  LED (0,4,7,cyclone[6][0],cyclone[6][1],cyclone[6][2]);
  LED (1,5,7,cyclone[7][0],cyclone[7][1],cyclone[7][2]);
  LED (1,6,7,cyclone[8][0],cyclone[8][1],cyclone[8][2]);
  LED (2,6,7,cyclone[9][0],cyclone[9][1],cyclone[9][2]);
  LED (3,7,7,cyclone[10][0],cyclone[10][1],cyclone[10][2]);
  LED (4,7,7,cyclone[11][0],cyclone[11][1],cyclone[11][2]);
  LED (5,6,7,cyclone[12][0],cyclone[12][1],cyclone[12][2]);
  LED (6,6,7,cyclone[13][0],cyclone[13][1],cyclone[13][2]);
  LED (6,5,7,cyclone[14][0],cyclone[14][1],cyclone[14][2]);
  LED (7,4,7,cyclone[15][0],cyclone[15][1],cyclone[15][2]);
  LED (7,3,7,cyclone[16][0],cyclone[16][1],cyclone[16][2]);
  LED (6,2,7,cyclone[17][0],cyclone[17][1],cyclone[17][2]);
  LED (6,1,7,cyclone[18][0],cyclone[18][1],cyclone[18][2]);
  LED (5,1,7,cyclone[19][0],cyclone[19][1],cyclone[19][2]);
  
  for (int x=0;x<8;x++){ // copy content of each layer to the layer below it.
    for (int y=0;y<8;y++){
      for (int z=1;z<8;z++){
        for (int c=0;c<3;c++){
          cube [x][y][z-1][c] = cube [x][y][z][c];
        }
      }
    }
  }
 
  for (int counter=duration-1; counter>-1; counter--){ // rotate the content  in the cyclone matrix by one
    cyclone[counter+1][0]=cyclone[counter][0];
    cyclone[counter+1][1]=cyclone[counter][1];
    cyclone[counter+1][2]=cyclone[counter][2];
  }
  cyclone[0][0]=cyclone[duration][0];
  cyclone[0][1]=cyclone[duration][1];
  cyclone[0][2]=cyclone[duration][2]; 

  delay (55);  // wait 55 msec before moving to next position. 
}

void Rain(int times){
  for (int count=0; count<times; count++){
    lightOne();   // load 5 colored LEDs into the top layer
    lightOne();
    lightOne();
    lightOne();
    lightOne();
    delay(100);  // wait 1/10 second
    for (int x=0;x<8;x++){
      for (int y=0;y<8;y++){
        for (int z=1;z<8;z++){
          for (int c=0;c<3;c++){
            cube [x][y][z-1][c] = cube [x][y][z][c];  // shift everything in  the cube down one
          }
        }
        for (int c=0;c<3;c++){
          cube [x][y][7][c] = 0;  // and clear the top layer
        } 
      }
    }
  }
  clearCube();
   delay(1000);
}


void lightOne() {
  int RED = 0;
  int GREEN = 0;
  int BLUE = 0;
  if (random(2)){  // red is on or off
    RED=63;
  }
  if (random(2)){  // green is on or off
    GREEN =63;
  }
  if (random(2)){  // blue is on or off
    BLUE=63;
  }
  LED (random(8), random(8), 7, RED,GREEN,BLUE); // light an LED in the top  layer with a random color
}


//This is the wild mouse animation

void Mouse1(){
  dir = 1;
  byte currentColor[3] = {0,0,0};
  xx=7;  
  yy= 7;  
  zz=7;
  xyz=1; 
  for (int myloop; myloop<760; myloop= myloop+2){
    LED(xx,yy,zz,currentColor[0],currentColor[1],currentColor[2]);  //light up  the current position with current color 
    xx1=xx; 
    yy1=yy; 
    zz1=zz; 
    switch(xyz){   
    case 1: // moving across layers
      if (dir == 1){ // if moving higher?
        xx++;
        if (xx>7){ // Did we hit an edge on the high end?
          xx=7;
          xyz=2; // if so, change direction
          if (yy<4){ // in new direction, move toward the middle
            dir = 1;
          }
          else {
            dir =-1;
          }
        }
      }
      if (dir == -1){  // if moving lower?
        xx--;
        if (xx<0) { // Did we hit an edge on the low end?
          xx=0;
          xyz=3;   // if so, change direction
          if (zz<4){  // in new direction, move toward the middle
            dir = 1;
          }
          else {
            dir =-1;
          }
        }
      }

      if (random(5) == 0){  // one in 5 times, change move dimension in the  middle of the cube
        if (random(2) == 0){  // which way to change dimension?
          xyz=2;  // move across panels 
        }
        else {
          xyz=3;  // move across columns
        }
      }
      break;

    case 2: // moving across panels  (similar to above)
      if (dir == 1){
        yy++;

        if (yy>7){
          yy=7; 
          xyz=3; 
          if (zz<4){
            dir = 1;
          }
          else {
            dir =-1;
          }
        }
      }
      if (dir == -1){
        yy--;
        if (yy<0) {
          yy=0;
          xyz=1; 
          if (xx<4){
            dir = 1;
          }
          else {
            dir =-1;
          }
        }
      }

      if (random(5) == 0){
        if (random(2) == 0){
          xyz=3;
        }
        else {
          xyz=1;
        }
      } 
      break;
    case 3:  // moving across columns, similar to above
      if (dir == 1){
        zz++;
        if (zz>7){
          zz=7; 
          xyz=1; 
          if (xx<4){
            dir = 1;
          }
          else {
            dir =-1;
          }
        }
      }
      if (dir == -1){
        zz--;
        if (zz<0) {
          zz=0;
          xyz=2; 
          if (yy<4){
            dir = 1;
          }
          else {
            dir =-1;
          }
        }
      }

      if (random(5) == 0){
        if (random(2) == 0){
          xyz=1;
        }
        else {
          xyz=2;
        }
      }
      break;
    } 

    history[historyCount][0]= xx1;  // move the current position into the  history so we can control the trail
    history[historyCount][1]= yy1;
    history[historyCount][2]= zz1;
    history[historyCount][3]= currentColor[0];
    history[historyCount][4]= currentColor[1];
    history[historyCount][5]= currentColor[2];

    tempCount2 = historyCount+1;  // move ahead in the history by one, which  is last position in the trail
    if (tempCount2==24){
      tempCount2=0;
    }
    history[tempCount2][3]= 0;    // and set in to all zeros.
    history[tempCount2][4]= 0;
    history[tempCount2][5]= 0;


    for (int mycount=0; mycount<24; mycount++){  // update the cube with new  trail data
      xx1=history[mycount][0];
      yy1=history[mycount][1];
      zz1=history[mycount][2];
      LED(xx1,yy1,zz1,history[mycount][3],history[mycount][4],history [mycount][5]);
    }

    historyCount++;
    if (historyCount>23){ // keep the history counter in bounds
      historyCount = 0; 
    }
    if (tempCount==4){ // update the every 4th time through
      getColor(mycolor, 4);
      currentColor[0] = myred;
      currentColor[1] = mygreen;
      currentColor[2] = myblue;
      mycolor++;
      if (mycolor>189){ // keep the color in bounds
        mycolor = 0;
      }
      tempCount = 0;
    }
    tempCount++;
    delay (30);  // delay to control speed
  }

  for (int mycount=0; mycount<24; mycount++){  // Clear the trail
    xx1=history[mycount][0];
    yy1=history[mycount][1];
    zz1=history[mycount][2];
    LED(xx1,yy1,zz1,0,0,0);
  }
  clearCube();  // Clear the cube
   delay(1000);
}


// This is a new Fireworks animation
// This version is a single color, which must be specified
// Also must specify the XY coordinates where it will appear
void Fireworks() {
  fireWork(3,4, Blue);
  fireWork2(3,5);
  fireWork(7,2, White);
  fireWork(4,4, Red);
  fireWork2(5,4);
  fireWork(3,3, Green);
  fireWork(2,5, White);
  delay(1000);
}
void fireWork(int x,int y, int mycolor){
  int mydelay = 80;
  float polar;
  getColor(mycolor,4);
  for (int layer=0; layer<6; layer++) { // firework goes up here
    LED(x,y, layer, 15, 31, 31);
    delay(mydelay);
    if (layer==5){
      delay(mydelay);  // pauses slightly at the top
    }
    LED(x,y, layer, 0, 0, 0);
  }
  

  for (int layer=0; layer<8; layer++) { // starts to explode
    for (int xx=0; xx<8; xx++){
      for (int yy=0; yy<8; yy++){
        polar = sqrt((xx-x)*(xx-x)+(yy-y)*(yy-y)+(layer-5)*(layer-5));
        if (polar <1){
          LED(xx, yy, layer, myred, mygreen, myblue);
        }
        else {
          LED(xx, yy, layer,0,0,0);
        }
      }
    }
  }
  delay(mydelay);
  for (int layer=0; layer<8; layer++) { // continues to explode
    for (int xx=0; xx<8; xx++){
      for (int yy=0; yy<8; yy++){
        polar = sqrt((xx-x)*(xx-x)+(yy-y)*(yy-y)+(layer-5)*(layer-5));
        if (polar <2){
          LED(xx, yy, layer, myred, mygreen, myblue);
        }
        else {
          LED(xx, yy, layer,0,0,0);
        }
      }
    }
  }
  delay(mydelay);
  for (int layer=0; layer<8; layer++) { //continues to explode
    for (int xx=0; xx<8; xx++){
      for (int yy=0; yy<8; yy++){
        polar = sqrt((xx-x)*(xx-x)+(yy-y)*(yy-y)+(layer-5)*(layer-5));
        if (polar <3){
          LED(xx, yy, layer, myred, mygreen, myblue);
        }
        else {
          LED(xx, yy, layer,0,0,0);
        }
      }
    }
  }
 delay(mydelay*3);  //pauses extra time at max expansion
  for (int layer=0; layer<8; layer++) {  // then starts to fade
    for (int xx=0; xx<8; xx++){
      for (int yy=0; yy<8; yy++){
        polar = sqrt((xx-x)*(xx-x)+(yy-y)*(yy-y)+(layer-5)*(layer-5));
        if (polar == 2){
          LED(xx, yy, layer, myred, mygreen, myblue);
        }
        else {
          LED(xx, yy, layer,0,0,0);
        }
      }
    }
  }
  delay(mydelay); 
  for (count=0; count<8; count++){  // now what is left move down slowly 
    shiftDown();  // shiftDown also fades the remains as they fall.
    delay(mydelay*2);
  }
  delay(random(4)*1000);  // pause a random amount of time before next  firework. 
}


// This is same routine as above color of each element is set at random.  
void fireWork2(int x,int y){
  int mydelay = 80;
  
  float polar;
  for (int layer=0; layer<6; layer++) {
    LED(x,y, layer, 15, 31, 31);  // on the way up, it's always white
    delay(mydelay);
    if (layer==5){
      delay(mydelay);
    }
    LED(x,y, layer, 0, 0, 0);
  }
  

  for (int layer=0; layer<8; layer++) {
    for (int xx=0; xx<8; xx++){
      for (int yy=0; yy<8; yy++){
        polar = sqrt((xx-x)*(xx-x)+(yy-y)*(yy-y)+(layer-5)*(layer-5));
        if (polar <1){
          if (random(2)>0) {myred=63;}  // here is where we select colors at  random. 
          else {myred=0;}
          if (random(2)>0) {mygreen=63;}
          else {mygreen=0;}
          if (random(2)>0) {myblue=63;}
          else {myblue=0;}
          LED(xx, yy, layer, myred, mygreen, myblue);
        }
        else {
          LED(xx, yy, layer,0,0,0);
        }
      }
    }
  }
  delay(mydelay);
  for (int layer=0; layer<8; layer++) {
    for (int xx=0; xx<8; xx++){
      for (int yy=0; yy<8; yy++){
        polar = sqrt((xx-x)*(xx-x)+(yy-y)*(yy-y)+(layer-5)*(layer-5));
        if (polar <2){
          if (random(2)>0) {myred=63;}
          else {myred=0;}
          if (random(2)>0) {mygreen=63;}
          else {mygreen=0;}
          if (random(2)>0) {myblue=63;}
          else {myblue=0;}
          LED(xx, yy, layer, myred, mygreen, myblue);
        }
        else {
          LED(xx, yy, layer,0,0,0);
        }
      }
    }
  }
  delay(mydelay);
  for (int layer=0; layer<8; layer++) {
    for (int xx=0; xx<8; xx++){
      for (int yy=0; yy<8; yy++){
        polar = sqrt((xx-x)*(xx-x)+(yy-y)*(yy-y)+(layer-5)*(layer-5));
        if (polar <3){
          if (random(2)>0) {myred=63;}
          else {myred=0;}
          if (random(2)>0) {mygreen=63;}
          else {mygreen=0;}
          if (random(2)>0) {myblue=63;}
          else {myblue=0;}
          LED(xx, yy, layer, myred, mygreen, myblue);
        }
        else {
          LED(xx, yy, layer,0,0,0);
        }
      }
    }
  }
 delay(mydelay*3);
  for (int layer=0; layer<8; layer++) {
    for (int xx=0; xx<8; xx++){
      for (int yy=0; yy<8; yy++){
        polar = sqrt((xx-x)*(xx-x)+(yy-y)*(yy-y)+(layer-5)*(layer-5));
        if (polar == 2){
          if (random(2)>0) {myred=63;}
          else {myred=0;}
          if (random(2)>0) {mygreen=63;}
          else {mygreen=0;}
          if (random(2)>0) {myblue=63;}
          else {myblue=0;}
          LED(xx, yy, layer, myred, mygreen, myblue);
        }
        else {
          LED(xx, yy, layer,0,0,0);
        }
      }
    }
  }
  delay(mydelay); 
  for (count=0; count<8; count++){
    shiftDown();
    delay(mydelay*2);
  }
  delay(random(4)*1000);
}



void shiftDown(){
  for (int x=0;x<8;x++){ // copy content of each layer to the layer below it.
    for (int y=0;y<8;y++){
      for (int z=1;z<8;z++){
        for (int c=0;c<3;c++){
          cube [x][y][z-1][c] = (cube [x][y][z][c]) >> 1;  // the divide by 2  causes it 
          cube [x][y][z][c] = 0;                           // to fade on the way  down. 
        }
      }
    }
  }
}


// This makes a donut revolve in the middle of the cube.
void Donut(int mycount) {
   colorCount=0;
  for (int reps=0; reps<mycount; reps++){
    rotation = 10 * .0174532; // convert angle to radians
    getColor(colorCount,4);  // pick a color.  It will gradually change as  colorCount increases.
    colorCount = colorCount+1;
    if (colorCount>188){
      colorCount=0;
    }
    for (int layer=0;  layer<8; layer++){ // build the donut on the  buffer_cube array.
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
  delay(1000);
}


// this anamation sort of looks like a tornado.  is gets faster as it goes,  eventually
// picking up yellew debris in its center, which turns red as it gets faster. 
void Tornado(){
  rotation = 12 * .0174532; // convert angle to radians - this is slow speed
  buffer_LED(1,1,7,0,0,63);  // this sets up the tornato
  buffer_LED(0,4,6,0,0,63);
  buffer_LED(2,5,5,0,0,63);
  buffer_LED(3,6,4,0,0,63);
  buffer_LED(5,5,3,0,0,63);
  buffer_LED(5,4,2,0,0,63);
  buffer_LED(4,4,1,0,0,63);
  buffer_LED(4,3,0,0,0,63);
  buffer_LED(6,6,7,0,63,0);
  buffer_LED(7,4,6,0,63,0);
  buffer_LED(5,2,5,0,63,0);
  buffer_LED(4,2,4,0,63,0);
  buffer_LED(2,2,3,0,63,0);
  buffer_LED(2,4,2,0,63,0);
  buffer_LED(3,3,1,0,63,0);
  buffer_LED(3,4,0,0,63,0);
  for (int count=0; count<400; count++){
    if (count>100) { // this speeds up the rotation
      rotation = 23 * .0174532;
    }
    if (count>200) { // this speeds up the rotation again
      rotation = 30 * .0174532;
      buffer_LED(5,2,7,31,63,0);  //this adds the yellow debris
      buffer_LED(4,2,6,31,63,0);
      buffer_LED(2,2,5,31,63,0);
      buffer_LED(3,3,4,31,63,0);
      buffer_LED(4,4,3,31,63,0);
    }
    if (count>300) { // this speeds up the rotation again
      rotation = 37 * .0174532; // this adds the red debris
      buffer_LED(5,3,7,31,0,0);
      buffer_LED(4,3,6,31,0,0);
      buffer_LED(3,2,5,31,0,0);
      buffer_LED(4,4,4,31,0,0);
      buffer_LED(3,3,3,31,0,0);
    }
    rotateAll(myangle);  // the actual rotation of the animation
    myangle = myangle + rotation; // increment the angle
    if (myangle>6.28318) { // and make sure it doesn't overflow
      myangle=myangle-6.28318;
    }
  }
  clearBufferCube();
  clearCube();
  delay(1000);
}

// The animation creates some interesting stuff to rotate around in the cube
void Rotor(int reps, int myspeed) {
  rotation = myspeed * .0174532; // convert angle to radians
  for (int mycount=0; mycount<reps; mycount++){ // create the first pattern
  for (byte layer=0; layer<8; layer++){
    buffer_LED(7,7-layer,layer, 63,63,0);
    buffer_LED(6,7-layer,layer, 63,0,63);
    buffer_LED(1,layer,layer, 0,63,0);
    buffer_LED(0,layer,layer, 0,0,63);
  }
  for (int count=0; count<90; count++){ // rotate it
    rotateAll(myangle);  // the actual rotation of the animation
    myangle = myangle + rotation; // increment the angle
    if (myangle>6.28318) { // and make sure it doesn't overflow
      myangle=0;
    }
  }
  clearBufferCube();
  for (byte layer=0; layer<8; layer++){  // create the second pattern
    buffer_LED(6,7-layer,layer, 63,63,0);
    buffer_LED(5,7-layer,layer, 63,0,63);
    buffer_LED(2,layer,layer, 0,63,0);
    buffer_LED(1,layer,layer, 0,0,63);
  }
  for (int count=0; count<90; count++){  // rotate it
    rotateAll(myangle);  // the actual rotation of the animation
    myangle = myangle + rotation; // increment the angle
    if (myangle>6.28318) { // and make sure it doesn't overflow
      myangle=0;
    }
  }
  clearBufferCube();
  for (byte layer=0; layer<8; layer++){  // create the third pattern
    buffer_LED(5,7-layer,layer, 63,63,0);
    buffer_LED(4,7-layer,layer, 63,0,63);
    buffer_LED(3,layer,layer, 0,63,0);
    buffer_LED(2,layer,layer, 0,0,63);
  }
  for (int count=0; count<90; count++){ // rotate it
    rotateAll(myangle);  // the actual rotation of the animation
    myangle = myangle + rotation; // increment the angle
    if (myangle>6.28318) { // and make sure it doesn't overflow
      myangle=0;
    }
  }
  rotation = -rotation;
  for (int count=0; count<90; count++){  // now rotate the third pattern  backward
    rotateAll(myangle);  // the actual rotation of the animation
    myangle = myangle + rotation; // increment the angle
    if (myangle<=0) {  // don't let angle overflow
      myangle=6.28318;
    }
  }
  clearBufferCube(); // reload the 2nd pattern
  for (byte layer=0; layer<8; layer++){
    buffer_LED(6,7-layer,layer, 63,63,0);
    buffer_LED(5,7-layer,layer, 63,0,63);
    buffer_LED(2,layer,layer, 0,63,0);
    buffer_LED(1,layer,layer, 0,0,63);
  }
  for (int count=0; count<90; count++){ // rotate it backward
    rotateAll(myangle);  // the actual rotation of the animation
    myangle = myangle + rotation; // increment the angle
    if (myangle<=0) {  // don't let angle overflow
      myangle=6.28318;
    }
  }
  clearBufferCube();
   for (byte layer=0; layer<8; layer++){  // reload the first pattern
    buffer_LED(7,7-layer,layer, 63,63,0);
    buffer_LED(6,7-layer,layer, 63,0,63);
    buffer_LED(1,layer,layer, 0,63,0);
    buffer_LED(0,layer,layer, 0,0,63);
  }
  for (int count=0; count<90; count++){ // rotate it backward
    rotateAll(myangle);  // the actual rotation of the animation
    myangle = myangle + rotation; // increment the angle
    if (myangle<=0) {  // don't let angle overflow
      myangle=6.28318;
    }
  }
  for (byte layer=0; layer<8; layer++){  // now add a reversed version of the  first pattern
    buffer_LED(7,layer,layer, 63,63,0);  // we didn't clear the buffer so both  patterns are there together
    buffer_LED(6,layer,layer, 63,0,63);
    buffer_LED(1,7-layer,layer, 0,63,0);
    buffer_LED(0,7-layer,layer, 0,0,63);
  }
  for (int count=0; count<90; count++){  // not rotate it forward
    rotateAll(myangle);  // the actual rotation of the animation
    myangle = myangle + rotation; // increment the angle
    if (myangle<=0) {  // don't let angle overflow
      myangle=6.28318;
    }
  }
  rotation = -rotation;
  for (int count=0; count<90; count++){  // and rotate it backwards
    rotateAll(myangle);  // the actual rotation of the animation
    myangle = myangle + rotation; // increment the angle
    if (myangle>6.28318) { // and make sure it doesn't overflow
      myangle=0;
    }
  }
  }
  clearBufferCube();
  clearCube();
   delay(1000);
}


// This animation is similar to the sinewave animation, but instead of running  the sine 
// from the middle outward, it displays across the diagonal of the cube. While  it uses
// the cosine, it could just as easily be done with sine. 
void Cosine(int myNumber){  // myNumber is number of iterations of this  animation
  for (count=0; count<myNumber; count++){  
    for (int i=0; i<40; i++){   //it takes 40 steps to complete one full cycle
      getColor(i*4, 4); // get a rainbow color.  We need to go through 160  colors over the course of one full cycle.  
      for (byte xx=0; xx<8; xx++){ 
        for (byte yy=0; yy<8; yy++){
          z=((byte)(4+cos((xx/2.23)+(yy/2.23)+(float)i/6.28)*4)); // the  actual z calculation
          if (z>7) { // this is necessary because a one spot the cos is  actually one
            z=7;     // and tries to set z at 8.
          }
          LED(xx,yy, z, myred,mygreen,myblue); 
        }
      } 
      delay(20);       // Increase or decrease to change speed of this  animation 
      clearCube();    // clear the cube
    }
  }
   delay(1000);
}



// this animation turns random LEDs on while rotating them around in the cube
// after a while we change the color and then change it again. 

void RandomRotation(int myspeed) {
  colorCount= 0; 
  rotation = myspeed * .0174532; // convert angle to radians
  getColor(Blue, 4); // start with blue
  for (int reps=0; reps<80; reps++){
    colorCount++;
    buffer_LED(1+random(6),1+random(6),random(8) ,myred,mygreen,myblue);  //  this is the LED we light
    // we don't light the outside  corners of the cube because they will  disappear as they are rotated
    buffer_LED(random(8),random(8),random(8) ,0,0,0); // we turn off 5 LEDs at  random for every one we
    buffer_LED(random(8),random(8),random(8) ,0,0,0);  // turn on, so that we  never have more than 20
    buffer_LED(random(8),random(8),random(8) ,0,0,0);  // of the LEDs lit at  any time
    buffer_LED(random(8),random(8),random(8) ,0,0,0);
    buffer_LED(random(8),random(8),random(8),0,0,0);
    for (int count=0; count<25; count++){   // now rotate the whole thing
      rotateAll(myangle);  // the actual rotation of the animation
      myangle = myangle + rotation; // increment the angle
      if (myangle>6.28318) { // and make sure it doesn't overflow
        myangle=myangle-6.28318;
      }
    }
    if (colorCount > 20){  // after a while change color
      getColor(Violet, 4); 
    }
    if (colorCount > 40){  // after some more time, change color again.
      getColor(Aqua, 4); 
    }
  }
  clearBufferCube();
  clearCube();
   delay(1000);
}

// In this demo we are rotating a simple sprite around itself.  There is one  restriction that must
// be observed.  The sprite must have equal dimensions in the plane in which  its rotating, i.e. if we are 
// going to use rotateX on a sprite, that sprites Y and Z dimensions must be  equal.  See Sprite1 as an
// example. 
void Eyes() { 
  int mydelay = 200;
  sprite Sprite1(4,4,4);  // X and Y dimensions must be equal if we are going  to rotate around Z axis.   
  Sprite1.place = {0,0,3};
  Sprite1.motion = {1,2, -1};
  Sprite1.description = {  // just a simple red green green line across 3  layers
		    {  // top layer
			{Black,  Black, Black, Black}, // 1st column,  4  panels 
			{Black,  Red, Red, Black}, // 2nd column,  4 panels
			{Black,  Red, Red, Black}, // 3rd column,  4 panels
                        {Black,  Black, Black, Black}, // 4th column,  4  panels
		    },
		    {  // middle layer
			{Black,  Red, Red, Black}, // 1st column,  4 panels 
			{Red,  Red, Red, Red}, // 2nd column,  4 panels
			{Red,  Red, Red, Red}, // 3rd column,  4 panels
                        {Black,  Red, Red, Black}, // 4th column,  4 panels
		    },
                    {  // 2nd middle layer
			{Black,  Red, Red, Black}, // 1st column,  4 panels 
			{Red,  Red, Red, Red}, // 2nd column,  4 panels
			{Red,  Red, Red, Red}, // 3rd column,  4 panels
                        {Black,  Red, Red, Black}, // 4th column,  4 panels
		    },
	            {  // bottom layer
			{Black,  Black, Black, Black}, // 1st column,  4  panels 
			{Black,  Red, Red, Black}, // 2nd column,  4 panels
			{Black,  Red, Red, Black}, // 3rd column,  4 panels
                        {Black,  Black, Black, Black}, // 4th column,  4  panels
		    },
		 };
  Sprite1.description[1][1][0] = Blue;
  Sprite1.description[1][2][0] = Blue;

    for (int count=0; count<100; count++){
      Sprite1.rollZ(0);
      if (count%4 == 0){
        Sprite1.rotateZ(1);
      }
    delay(mydelay);
  }
  Sprite1.clearIt();
  delay(1000);
}


// In this animation, we create a bunch of single LED sprites, then introduce  them one at a time
// bouncing around the inside of the cube.  

void Single_Swirl() {
  sprite LED1(1,1,1);
  LED1.colorIt(Yellow);
  LED1.place = {5,4,3};
  LED1.motion = {1,-2,1};
  
  sprite LED2(1,1,1);
  LED2.colorIt(Green);
  LED2.place = {3,4,5};
  LED2.motion = {1,1,-2};
  
  sprite LED3(1,1,1);
  LED3.colorIt(Blue);
  LED3.place = {2,6,3};
  LED3.motion = {1,-1,-2};
  
  sprite LED4(1,1,1);
  LED4.colorIt(Violet);
  LED4.place = {5,1,2};
  LED4.motion = {2,1,-1};
  
  sprite LED5(1,1,1);
  LED5.colorIt(Orange);
  LED5.place = {1,2,3};
  LED5.motion = {1,1,2};
  
  for (int count=0; count<225; count++) {  //now bounce all there sprites  around in the cube
    LED1.bounceIt();
    if (count>30) {
    LED2.bounceIt();}
    if (count>60) {
    LED3.bounceIt();}
    if (count>90) {
    LED4.bounceIt();}
    if (count>120) {
    LED5.bounceIt();}
    delay(125); // delay 125msec between each movement. 
  }
  LED1.clearIt();
  LED2.clearIt();
  LED3.clearIt();
  LED4.clearIt();
  LED5.clearIt();
   delay(1000);
}


/* This animation simulates a bouncing ball.  The timing for lateral movements  is constant, but the movement up and down is timed to resemble how the 
ball would bounce under the influence of gravity. This animation requires that  we duplicate the .move and .bounce actions of the sprite class modifying them
to account for gravity.  For example, .bounce automatically checks for the  edge of the cube and reverses direction, but in this case, we have to do it  manually. 
*/
void Basketball_Dribble(){
  sprite mySprite(4,4,4);  // Our ball is 4 x 4 x 4.  
  mySprite.place = {  // set up its initial location
    1,2,4  };
  mySprite.motion = {  // set up its initial motion
    -1,1, -1  };
  mySprite.description = {  // define the shape and color of a red ball. 
    {  // top layer
      {
        Black,  Black, Black, Black      }
      , // 1st column,  4 panels 
      {
        Black, 10,10, Black      }
      , // 2nd column,  4 panels
      {
        Black,  10,10, Black      }
      , // 3rd column,  4 panels
      {
        Black,  Black, Black, Black      }
      , // 4th column,  4 panels
    }
    ,
    {  // middle layer
      {
        Black,  10,10, Black      }
      , // 1st column,  4 panels 
      {
        10,10, 10,10      }
      , // 2nd column,  4 panels
      {
        10,10, 10,10      }
      , // 3rd column,  4 panels
      {
        Black, 10,10, Black      }
      , // 4th column,  4 panels
    }
    ,
    {  // 2nd middle layer
      {
        Black, 10,10, Black      }
      , // 1st column,  4 panels 
      {
       10,10, 10,10      }
      , // 2nd column,  4 panels
      {
        10,10, 10,10      }
      , // 3rd column,  4 panels
      {
        Black,  10,10, Black      }
      , // 4th column,  4 panels
    }
    ,
    {  // bottom layer
      {
        Black,  Black, Black, Black      }
      , // 1st column,  4 panels 
      {
        Black,  10,10, Black      }
      , // 2nd column,  4 panels
      {
        Black,  10,10, Black      }
      , // 3rd column,  4 panels
      {
        Black,  Black, Black, Black      }
      , // 4th column,  4 panels
    }
    ,
  };

  for (int count=0; count<1600; count++) {  //  bounce the ball about 20 times
    mySprite.clearIt(); // clear the sprite from its current location
    if (count%15==0) {  // move horizonally every 20th step
      mySprite.place[0]=mySprite.place[0]+mySprite.motion[0];
      mySprite.place[1]=mySprite.place[1]+mySprite.motion[1];
    }
    if (mySprite.place[2]==4 || (mySprite.place[2]==3 && mySprite.motion[2] <0)){  // near the high end of motion . . .
      if (count%17==0) {  // move vertically every 17 steps
        mySprite.place[2]=mySprite.place[2]+mySprite.motion[2];
      }
    }
    if ((mySprite.place[2]==3 && mySprite.motion[2]>0) || (mySprite.place[2] ==2 && mySprite.motion[2]<0)){  // a little lower . . .
      if (count%10==0) {  // move vertically every 10 steps 
        mySprite.place[2]=mySprite.place[2]+mySprite.motion[2];
      }
    }
    if ((mySprite.place[2]==2 && mySprite.motion[2]>0) || (mySprite.place[2] ==1 && mySprite.motion[2]<0)){  // a little lower
      if (count%7==0) {  // move vertially every 7 steps
        mySprite.place[2]=mySprite.place[2]+mySprite.motion[2];
      }
    }
    if ((mySprite.place[2]==1 && mySprite.motion[2]>0) || (mySprite.place[2] <1)){ // near the bottom of motion
      if (count%5==0) {  // move vertically every 5 steps
        mySprite.place[2]=mySprite.place[2]+mySprite.motion[2];
      }
    }
    mySprite.setIt();  // set the sprite in its new location 
    if (mySprite.place[0]<1 && mySprite.motion[0]<0){ // now do all the  boundary checking for edges of the cube
      mySprite.motion[0]=-mySprite.motion[0];    // and change direction when  an edge is detected 
    }
    if (mySprite.place[1]<1 && mySprite.motion[1]<0){
      mySprite.motion[1]=-mySprite.motion[1];
    }
    if (mySprite.place[2]<1 && mySprite.motion[2]<0){
      mySprite.motion[2]=-mySprite.motion[2];
    }
    if (mySprite.place[0]>7-mySprite.myX && mySprite.motion[0]>0){
      mySprite.motion[0]=-mySprite.motion[0];
    }
    if (mySprite.place[1]>7-mySprite.myY && mySprite.motion[1]>0){
      mySprite.motion[1]=-mySprite.motion[1];
    }
    if (mySprite.place[2]>7-mySprite.myZ && mySprite.motion[2]>0){
      mySprite.motion[2]=-mySprite.motion[2];
    }
    delay(5);  // timing of each step is 10 msec. 
  }
  clearCube();
   delay(1000);
  }
  
  
/* This is the Conway Game of Life in 3D.  It's a simulation of life called a cellular automation.  
 Each LED in the cube represents a potential life.  A newborn life is represented by a violet LED.  
 A life lasting more than a single generation is represented by a blue LED. A recently deceased life
 is represented by a dull red LED.  
 
 The simulation starts with some random births near the center of the cube.  The simulation 
 than proceeds with up to a maximum of 150 generations. Each new generation is based on these rules:
 1. A dead cell (LED) with exactly 4 living neighbors is born into the next generation. 
 2. A live cell with exactly 4 living neighbors continues to life to the next generation. 
 3. A cell with less than 4 or more than 4 neighbors dies in the next generation. 
 
 This version is slightly different than the one I published separately.  Since we are only 
 showing 3 generations here, I increased the number of starting live cells to insure a
 sustainable colony.  */

void GameOfLife(){ 
  for (int simruns=0; simruns<5; simruns++){
    int myspeed = 10; // This is where you set the speed. It is basically the number of generations per second. 
    for (byte layer=2; layer<8; layer++){  // This is where we set up a random pattern of living cells
      for (byte column=2; column<6; column++){  
        for (byte panel=2; panel<6; panel++){  
          if (random(2)==0){
            cube[column][panel][layer][2]= 63;
            cube[column][panel][layer][0]= 33;
          }
        }
      }
    }
    delay(3000/myspeed);  // showing the initial birth pattern here.  
    for (int counter=0; counter<150; counter++){ // this is the generation counter
      clearBufferCube();  //  BufferCube is where we will temporarily store result for the next generation. 
      int kill=0; // kill is where we count the number of living cells.  When 0, we end the simulation.
      // This next part is where we find the number of live neighbors for each cell
      for (byte layer=0; layer<8; layer++){  // scan thru each layer
        for (byte column=0; column<8; column++){  // scan thru every column
          for (byte panel=0; panel<8; panel++){  // scan thru every panel
            int count=0;  // This is the count of neighbors.
            for (int i=-1; i<2; i++){  // 
              for (int j=-1; j<2; j++){  // 
                for (int k=-1; k<2; k++){  // 
                  if (column+j<8 && column+j>-1 && panel+k<8 && panel+k>-1 && layer+i<8 && layer+i>-1 ) {
                    if (cube[layer+i][column+j][panel+k][2]>0) {
                      count++;  // increment count for each neighbor found. 
                    }
                  }
                }
              }
            }
            if (cube[layer][column][panel][2]>0) {
              count--;  // don't count yourself as a neighbor
            }
            // Then here we light the LEDs based on new birth, continuing to live, recently dead or dead.
            if (count==4){  // if the number of neighbors is 4
              // and we are within the boundaries of the cube
              if (column<8 && column>-1 && panel<8 && panel>-1 && layer<8 && layer>-1 ) {
                buffer_cube[layer][column][panel][2]=63;  // make it alive
                if (cube[layer][column][panel][2]==0){  // if its newly born
                  buffer_cube[layer][column][panel][0]=33; //make it violet
                }
                kill++;  // increment living cell counter
              }
            }
            else {  // if not 4 neighbors, make it dead
              buffer_cube[layer][column][panel][2]=0;
              buffer_cube[layer][column][panel][0]=0;
              if (cube[layer][column][panel][2]>0){  // if it was alive
                buffer_cube[layer][column][panel][0]=3; // make it dull red. 
              }
            }
          }
        }
      }
      // Now we transfer the next generation result to the cube.
      clearCube(); // clear the cube and transfer the the content of the BufferCube
      // to the cube. 
      for (byte layer=0; layer<8; layer++){  
        for (byte column=0; column<8; column++){ 
          for (byte panel=0; panel<8; panel++){  
            cube[column][panel][layer][2]= buffer_cube[column][panel][layer][2];
            cube[column][panel][layer][0]= buffer_cube[column][panel][layer][0];
          }
        }
      }
      if (kill==0 && xx==0) {  // if all remaining cells are dead, pause
        delay(10000/myspeed);
      }
      if (kill>0) {  // if there are living cells, wait the desired time
        delay(1000/myspeed);  // between generations.    
        xx=0; // clear a flag that says everyone is dead
      }
      else {
        xx=1;
      }  // set the flag if everyone is dead
    }  // end of generation loop
    if (xx==0) {  // if we got through all 150 generations with live cells
      clearCube();  // clear the cube
      delay(10000/myspeed);  // short pause before starting over. 
    }
  }
  delay (1000);
}

