/*  This is where the main loop is, and where you can build your own applications.   
 
 What is currently here is some demos of our sprite class objects.  The sprite class itself is at the bottom of the Tables_Classes tab. 
 The sprite class builds objects of variable size, shape, and color that can be moved around the cube.
 
 A sprite object has the following properties: 
 .description: this is an array of minimum size 1,1,1 and max size 4,4,4. 
 It sets the color (or lack of color) for each LED within the sprite. So it defines both the shape and color.
 It may be a single LED (1,1,1) or as much as 1/4 of the cube (4,4,4)
 .colorIt(color) is an alternative to building a description array. It turns the entire area of the sprite one color.    
 .place: this is the location of the lower corner of the sprite.  It's a 3 number array specifying an X, Y, Z position.
 .motion: this is the direction the sprite will move when asked to move.  It's a 3 number array specifying the speed of movement in X,Y,Z directions. 
 It will usually be a 0, +-1, or +-2 to get smooth movement within the cube. 
 
 A sprite object also has some methods (or actions) it can take:
 .setIt:  this displays your spite in the cube at its specified place
 .clearIt:  this removes your sprite from the cube
 .moveIt: this moves your sprite one step in the direction specified by motion
 .bounceIt: similar to moveIt, but tests for cube boundaries and reverses course when an edge of the cube is detected. 
 
 Sprites are created using the sprite constuctor, like this: 
 sprite MySprite(1,2,3); 
 where MySprite is the name of this particular instance of the object/class, and the 1,2,3 specifies its size in the X,Y,and Z directions.
 So a sprite could be a single LED, like:
 sprite LED1(1,1,1);
 */
void loop(){
  simple_demos(); 
  delay(1000);
  single_swirl();
  delay(1000);
  multi_swirl(); 
  delay(1000);
  eyes();
  delay(1000);
  flip_and_roll();
  delay(1000);
  flyingBoxes();
  delay(1000);
  bouncing_ball();
  delay(1000); 
  helicopter();
  delay(1000);

}
