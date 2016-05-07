/* The tab has the loop where you can build your own application.  The sample one here is called 
 WILD MOUSE. It's a little like Nick's Snake annimation. This moves a light around in the cube, 
 changing its color as it goes.  Its speed changes and it leaves a fading trail behind it.   
 */

void loop() {

  for (int myspeed=500; myspeed>30; myspeed--){ // Ramp the speed up
    move(myspeed);
  } 
  for (int myspeed=30; myspeed<500; myspeed++){ // Ramp the speed down
    move(myspeed);
  }
}


void move(int myspeed){ // This subroutine is where we actually move our "mouse" around. 
  switch(xyz){     
  case 1: // moving across layers
    cube[xx][yy][zz]= currentColor; //light up the current position with current color
    xx1=xx; 
    yy1=yy; 
    zz1=zz; 

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

    if (random(5) == 0){  // one in 5 times, change move dimension in the middle of the cube
      if (random(2) == 0){  // which way to change dimension?
        xyz=2;  // move across panels 
      }
      else {
        xyz=3;  // move across columns
      }
    }
    break;

  case 2: // moving across panels  (similar to above)
    cube[xx][yy][zz]= currentColor;
    xx1=xx; 
    yy1=yy; 
    zz1=zz; 
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
    cube[xx][yy][zz]= currentColor;
    xx1=xx; 
    yy1=yy; 
    zz1=zz; 
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
  delay (myspeed/10);  // delay to control speed
  history[historyCount][0]= xx1;  // move the current position into the history so we can control the trail
  history[historyCount][1]= yy1;
  history[historyCount][2]= zz1;
  history[historyCount][3]= currentColor;

  mycount2++;
  if (mycount2==4){  // every forth movement. take a piece of the trail and diminish its brightness by 1 intensity level
    for (int mycount=0; mycount<24; mycount++){
      if (history[mycount][3]>10){
        history[mycount][3]= history[mycount][3]-10;
      }
    }
    mycount2=0;
  }

  for (int mycount=0; mycount<24; mycount++){  // update the cube with new trail data
    xx1=history[mycount][0];
    yy1=history[mycount][1];
    zz1=history[mycount][2];
    cube[xx1][yy1][zz1]= history[mycount][3];
  }

  historyCount++;
  if (historyCount>23){ // keep the history counter in bounds
    historyCount = 0; 
  }
  colorCount++;  // increase the colorCount - how many times this color was used
  if (colorCount>100){  //keep in bounds - 0 to 99
    colorCount=0;
  }
  if (colorCount == 0){  // if colorCount returns to 0?
    currentColor++;     // change color
    if (currentColor == 50){  //keep the colors in bounds
      currentColor = 41;
    }
  } 
}
























