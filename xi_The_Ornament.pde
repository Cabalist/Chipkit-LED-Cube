/* This is a new animaiton.  It uses the sprite object class to create an ornament like object and move it around the cube.
It use a new feature just added to the sprite object class called ChgIntensity() which allows you to modify the intensity
of the LEDs in your sprite selecting 1-4.   The default intensity is always 4 (max. intensity), but this allows you to 
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
  delay(2000);
}
