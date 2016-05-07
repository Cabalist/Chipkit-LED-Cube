VERSION 6

Version 6 is all about moving stuff around in the cube. But more importantly, it introduces a new way to program the cube. It's a significant breakthough in my efforts to provide programming tools to cube builders. And because it's so easy to use, I've created a bunch of new animations with it that demonstate its use.

Version 6 takes advantage of object based programming. It gives you the tools to make it all easy. You build objects called sprites by defining their size, shape, and color, then give them a location and place them in the cube. You then have a number of actions you can call to move your sprites around like a single step move, or bounce them off the sides of the cube, or rotate them around the cube, or rotate them around themselves. You can have as many sprites as you want, and they can all move around simultaneously and independently of each other.

INSTRUCTIONS FOR VERSION 6
Version 6 is all about moving stuff around in the cube. But more importantly, it introduces a new way to program the cube. It's a significant breakthough in my efforts to provide programming tools to cube builders. And because it's so easy to use, I've created a bunch of new animations with it that demonstate its use.

Like all previous versions, Version 6 still contains all the subroutines (including music support) from previous versions. However, you may not want to use them when you see how easy it is to use this new system.

Version 6 takes advantage of object based programming. It gives you the tools to make it all easy. You build objects called sprites by defining their size, shape, and color, then give them a location and place them in the cube. You then have a number of actions you can call to move your sprites around like a single step move, or bounce them off the sides of the cube, or rotate them around the cube, or rotate them around themselves. You can have as many sprites as you want, and they can all move around simultaneously and independently of each other.

At the heart of Version 6 is the sprite object class. It is an encapsulated set of tools. You don't need to understand the code inside this object. You just need to learn how to use its various properties and actions.

First, to create an object and place it in your cube, you put this code in the main loop:
sprite mySprite(2,2,2); // this creates a sprite called mySprite with dimensions 2x2x2 LEDs.
mySprite.colorIt(Green); // makes my new sprite green.
mySprite.place = {1,2,1}; // locate it in the lower, back corner of the cube
mySprite.setIt(); // actually puts it in the cube, turning on the LEDs.

Now we can move our sprite around. For example, let's move it around in the cube, bouncing it off the walls as it moves. To do that, all we need to do is the following:
mySprite.motion = {2,1,1}; // gives my sprite an initial direction of motion
for (count=0; count<100; count++) { // loop around 100 times
mySprite.bounceIt(); // move the sprite one increment. Reverse direction if cube's edge is detected.
delay(100); // wait 1/10th second before next move.
} // finish the loop
mySprite.clearIt(); // turn off the sprite since we're done.

The simple illustration above using mySprite is the first thing you will see when you run the Version 6 on your cube. You might be wondering why we had to use a loop in the example above. Why not just build that loop into our bounce action. That's because we want the capability to bounce many sprites at a time. So our program contains an external loop, which could be bouncing 1 sprite, but could just as easily be bouncing 10 at once.

In our illustration above we defined a sprite that was 2x2x2 LEDs and then colored all 8 LEDs green. That makes it very easy to define our sprite, but we can define much more complex structures using the .description property. This is an array with the color of each LED in the sprite, including Black for those you want off. So a sprite may have shape and be multi-colored - you just have to take the time to define it.

Now, here is a list of all the members of the sprite class:
Constuctor:
sprite MySprite - this creates a new class object called MyStrite or any other name of your choosing.
Properties:
(MySprite).description - is a 4x4x4 array containing the color-wheel color (or Standard Colors) for each LED in the sprite.
The 4x4x4 defines the maximum size of the sprite, but it can be 1,1,1 (a single LED) or 2,2,2, or 1,2,4, i.e. whatever
shape you want.
.place - is a 3 integer location representing the X, Y, Z coordinates of the lower corner postion of the sprite.
.motion - is a 3 integer vector representing the X, Y, Z direction the sprite is moving in.
Methods (or Actions):
.setIt - this displays the sprite in the cube at it's specified place
.clearIt - this clears it from its present place (turns off all LEDs)
.colorIt - this colors all LEDs within the boundaries of the sprite in a single specified color
.moveIt - this moves the sprite one step in its specified motion direction, clearing it where it was, and set it in its new location.
.bounceIt - this moves the sprite one step and checks for cube edges; if one is detected, the motion is reversed in the direction of that edge.
These next 6 items take a 0 argument for clockwise, and a 1 argument for counter-clockwise. And the last three, which rotate the sprite itself, are meaningly unless you have defined a particular shape and/ or color scheme to your sprite.
.rollX - rolls the sprite around the edge of the cube around the X axis in single steps.
.rollY - rolls the sprite around the edge of the cube around the Y axis in single steps.
.rollZ - rolls the sprite around the edge of the cube around the Z axis in single steps.
.rotateX - rotates the sprite on its own X axis by 90 degrees.
.rotateY - rotates the sprite on its own Y axis by 90 degrees.
.rotateZ - rotates the sprite on its own Z axis by 90 degrees.

For additional information on all the members of the sprite object class, see the examples in the Version 6 code. For additional information on all the other subroutines available in Version 6, please see instructions for Versions 3, 4, and 5.