VERSION 7

Version 7 is a rather small iteration from Version 6. We've added some new features to the Sprite object class we introduced in Version 6. But mostly, Version 7 is the addition of a bunch of new animations.

INSTRUCTIONS FOR VERSION 7

Version 7 is not really a new version. It is more of a container for a bunch of new animations. However, I have made a few modifications and additions to the sprite class of movable objects introduced in Version 6, and added one subroutine.

So first, let's discuss these changes to the sprite object class. In Version 6, sprite objects had a max size of 4x4x4. In this new version, the max size is increased to 6x6x6. (These larger sprites use a lot of RAM memory since each LED in a sprite can be assigned it's own color. So it is important to not have a bunch of them existing all at once. See Supplementary Instructions, Item2 2 and 3 for details on RAM management.)

There are three new actions added to the sprite object class. In Version 6, one such action was .colorIt(). It was a quick way to fill an entire sprite with a single color. Now, in Version 7, we have two additional actions similar to .colorIt():
.outline(color) - colors in just the outline of the sprite, showing just the edges of a cube or box. This action is demonstrated in the new animation Cube in Cube.
.sphere(color) - colors in a sphere the size of the sprite. The sprite should have all 3 dimensions the same for this to work correctly. This action is demonstrated in the new animation Rolling Ball. It works best with big sprites like 5x5x5 or 6x6x6.

.ChgIntensity() is yet another new sprite action. This allows you to change the intensity of the LEDs in your sprite to something other than max (4). You can set it 1,2,3, or 4, allowing you to make your spite fade or pulsate. This action is demonstrated in a new animation called TheOrnament.
Now in addition to the three new animations mentioned above, Version 7 also includes several new conventional animations:

Diamond Wave is a new animation consisting of a pyramid with an inverted pyramid just below it. The two together move up and down the length of the cube producing a new and original animation.

Mysterious is another new animation that floats around at the top of the cube with a tail following it around going to the bottom of the cube.

Random Fall is another new animation. It has random LEDs falling from the top of the cube to the bottom, changing color as they fall. When all have fallen, they are very quickly returned to the top in a similar fashion.

Glitter Ribbon is another new animation. It is derived from my previous Cosine animation, but we've flattened out the cosine to form a moving ribbon, then added some glitter by flashing an LED white in a few places.

Elevator turns your cube into an 8 story office building with 16 elevators operational and all very busy. With this animation, we've also added one new subroutine to the subroutine list: rnd_std_color() will randomly load one of our 8 standard colors.

Hula is combination of a simple animation and the rotation of it to produce an effect similar to the waist of a hula dancer.

Sparkle is a very simple animation where a ramdom LED lights up white every 10 msec. and stays on for 30 msec.

Chaos is a variation of the elevator animation. Just messing around with the elevator code produced this interesting effect.

Finally, we have a new version of the Helicoper animation we introduced in Version 6. This one takes advantage of the new 6x6x6 spite size, giving us somthing that looks a little more like an actual helicopter - the top roter is larger and rotates more realistically. Also, the tail is longer.

For additional information on all the members of the sprite object class, see the instructions for Version 6. For additional information on all the other subroutines available in Version 7, please see instructions for Versions 3, 4, and 5.

