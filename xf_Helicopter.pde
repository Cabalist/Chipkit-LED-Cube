/*
This is the new and improved Helicopter!  It takes advantage of the fact that sprites
can now be up to 6x6x6.   It's now 6x6x4 while the old one was 4x4x4.   
The main roter is bigger and actually rotates now. And the tail is longer, so it actually
looks a little more like a helicopter.  There are actually three different subroutines
here working on the sprite, so it is created globally, outside of any of them.  This is
very wasteful of RAM, but I have enough because I have been very careful in all the other 
animations to dispose of sprites when they are finished with. I guess I could have done that
here too. but it's not that easy to create. Also, I would need some global variable to keep track
of where it is as its flying around if I kept distroying it (and losing its position) after every
subroutine. 
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
  delay(3000);
  for (int count=0; count<10; count++){  // make the tail light blink
    blinkRed();
    heli.setIt();
    delay(500);
  }
  for (int count=0; count<19; count++){  // start the rotor turning
    blinkRed(); 
    heli.setIt();
    rotor();
    rotor();
    rotor();
    rotor();
    rotor();  
  }
  for (int count=0; count<40; count++){  // now the helicopter is flying
    heli.bounceIt();
    blinkRed();
    rotor();
    rotor();
    rotor();
    rotor();
    rotor();
    blinkRed();
    rotor();
    rotor();
    rotor();
    rotor();
    rotor();
  }
  if (heli.description[0][3][0]==Black){  // now it's landing
    rotor();  
  }
  for (int count=0; count<9; count++){  // make the roter stop where it started
    blinkRed(); 
    heli.setIt();
    rotor();
    rotor();
    rotor();
    rotor();
    rotor();  
  }
  for (int count=0; count<11; count++){  // rotor stops but tail light still blinks
    blinkRed();
    heli.setIt();
    delay(500);
  }
  delay(3000);  // blinking stops 
  rot=1; 
  blinkMe=0;
  clearCube();  // done - clear the cube
  delay(1000);

}
void rotor(){  // makes the rotor rotate
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
  delay(80);
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

