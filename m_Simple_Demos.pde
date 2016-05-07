// In this animation, we demo the sprite class by creating a couple of simple sprites and moving them about the cube. 
void simple_demos() {
  sprite mySprite(2,2,2); // this creates a sprite called mySprite with dimensions 2x2x2 LEDs.
  sprite Sprite1(3,3,3);  
  sprite Sprite2(3,3,3);  
  
  mySprite.colorIt(Green); // makes my new sprite green.
    
  Sprite1.description = {  // this is the description of our Sprite 1
		    {  // top layer
			{Black, Black, Black},  // 1st column,  3 panels 
			{Black, Red, Black},  // 2nd column,  3 panels
			{Black, Black, Black}   // 3rd column,  3 panels
		    },
		    {  // middle layer
			{Black, Green, Black},  
			{Green, Green, Green},
			{Black, Green, Black}
		    },
	            {  // bottom layer
			{Black, Black, Black},  
			{Black, Red, Black},  
			{Black, Black, Black} 
		    },
		 };
  Sprite2.description = {  // this is the description of our Sprite 2
		    {  // top layer
			{Black, Blue, Black},  // 1st column,  3 panels 
			{Blue,  Blue, Blue},  // 2nd column,  3 panels
			{Black,  Blue, Black}   // 3rd column,  3 panels
		    },
		    {  // middle layer
			{Blue, Black, Blue},  
			{Black, Blue, Black},
			{Blue,Black, Blue}
		    },
	            {  // bottom layer
			{Black, Blue, Black}, 
			{Blue, Blue, Blue},
			{Black, Blue, Black}
		    },
		 };

  mySprite.place = {1,2,1}; // locate it in the lower, back corner of the cube
  Sprite1.place = {5,2,5};  // Here we specify the initial location of Sprite 1
  Sprite1.motion = {-1,1,-1}; // Here we specify motion of Sprite 1

  Sprite2.place = {0,1,0};  // Here we specify the initial location of Sprite 2
  Sprite2.motion = {1,2,-1};   // Here we specify motion of Sprite 2
  
  mySprite.setIt(); // actually puts it in the cube, turning on the LEDs.
  delay(2000);
  
  mySprite.motion = {2,1,1}; // gives my sprite an initial direction of motion
  for (count=0; count<100; count++) { // loop around 100 times
    mySprite.bounceIt(); // move the sprite one increment. Reverse direction if cube's edge is detected.
    delay(100); // wait 1/10th second before next move.
  } // finish the loop
  mySprite.clearIt(); // turn off the sprite since we're done. 

  Sprite1.setIt();
  delay(500);
  Sprite1.moveIt();
  delay(500);
  Sprite1.moveIt();
  delay(500);
  Sprite1.moveIt();
  delay(2000);
  Sprite1.motion = {1,-1,1};   // reverse direction
  Sprite1.moveIt();
  delay(500);
  Sprite1.moveIt();
  delay(500);
  Sprite1.moveIt();
  delay(2000);
  Sprite1.clearIt();  // cleanup by removing our sprites when done. 
  
  Sprite2.setIt();
  delay(1000);
  for (int count=0; count<10; count++) { // display Sprite 2
    Sprite2.setIt();
    delay(300);
    Sprite2.description[1][1][1]=White;  // make its center LED blink Red
    Sprite2.setIt();
    delay(300);
    Sprite2.description[1][1][1]=Blue;
  }
  Sprite2.description[1][1][1]=White;     // Make center Red
  for (int count=0; count<45; count++) { // now bounce it around in the cube
    Sprite2.bounceIt();
    delay(150);
  }  
  Sprite2.clearIt();  // now cleanup by removing Sprite 2
}
