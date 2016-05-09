Reformatted Code

Added GPL License

Fixed bug in LED and buffer_LED

Fixed Array Assignment in code so that it would compile with latest Arduino IDE

Converted all code from .pde -> .ino

***

Version Log

Super_Big_Show_noMusic_V1_0 combines all the animations from The_Big_Show and Another_Big_Show in one large program that only runs on the uC32 ChipKit. No music support.

The_Super_Big_Show_V1.0 combines all the animations from The_Big_Show and Another_Big_Show in one large program that only runs on the uC32 ChipKit. Supports music.

The_Big_Show_noMusic_V1_0 introduces a bunch of new animations without music support.

Another_Big_Show_V1.0 introduces a bunch of new animations with music support,filling the UNO32's program memory.

The_Big_Show_V2.1 makes minor changes in documentation, cleans up some stuff, and adds David Yee's update to the helicopter animation.

The_Big_Show_V2.0 This version of the Big Show adds support the music module. Thanks to David Yee!

The_Big_Show_noMusic_V1_0 This is the compilation of all animations in all versions of the template.

V7.3 This adds three additional animations to Version 7.

V7.2 This adds one additional animation to Version 7. It also adds the ChgIntensity action to the sprite object class, and fixes a couple of minor bugs in some other Sprite object class actions.

V7.1 This just adds an additional 2 animations to Version 7.

V7.0 This version mainly adds a bunch of new animations. But it also adds some minor inprovements and additional features to the sprite object class introduced in Version 6.

V6.1 This adds one new animation - a helicopter buzzing around the cube.

V6.0 This version introduces a new way to program cubes using an object based sprite class. It also contains 7 new animations.

V5.2 This adds 4 additional new animations, all based on our subroutine that rotates the entire cube.

V5.1 This is a big improvement over 5.0. Rotating the whole cube is now brighter and has no flicker.

V5.0 It's all about rotating stuff around in the cube. Also adds two new animaitions, one called Cosine and a new Fireworks animation.

V4.4 Corrects issues with storing data in program memory. See item 1 in Supplementary Instructions

V4.3 Adds three more music effects, and adds the SineWave animation.

V4.2 Adds one more music effect, and makes a minor correction to the implimentation in V4.1

V4.1 hopefully resolves the right-hand vs. left-hand cube issue once and for all. In this version, we put the code to resolve between the two in the refresh timer interrupt itself, thereby simplifing the code everywhere else. Text routines and other stuff no longer need to worry about this issue. Just set the cubeStructure to 0 or 1 to get text scrolling properly and you'll never have to think about it again.

V4.0 Adds music support to your cube and adds 1 new animation. This version requires some added hardware to support driving your cube from music.

V3.7 Corrects issues with storing data in program memory. See item 1 in Supplementary Instructions

V3.6 Adds the SineWave animation

V3.5 hopefully resolves the right-hand vs. left-hand cube issue once and for all. In this version, we put the code to resolve between the two in the refresh timer interrupt itself, thereby simplifing the code everywhere else. Text routines and other stuff no longer need to worry about this issue. Just set the cubeStructure to 0 or 1 to get text scrolling properly and you'll never have to think about it again.

V3.4 Fixes a problem with the rotating text subroutine for right-hand cubes.

V3.3 Fixes a problem with the scrollThruY subroutine for right-hand cubes.

V3.2 Replaces versions 3.1 and 3.1Back by giving user a choice of "right-hand" or left-hand" cube. Also adds several new ways to display text, and adds a new animation.

V3.1Back reverses the characters and the direction of scrolling in case your cube requires that.

V3.1 fixes a minor problem where the last character wasn't quite scrolling off the last wall before disappearing.

V3.0 adds scrolling text capability and has 3 animations in addition to various demos of the scrolling text capability.

V2.3 changes the cube addressing to match the convensional naming of LEDs in cubes, so that X Y and Z in the cube matrix refer to row, panel, and layer respectively.

V2.2 added SuperTech-IT's subroutine - LED(x, y, z, R, G, B) which specifies a particular LED with x,y,and z, and then specifies the color by specifying the 3 RGB color components. This routine then loads it into the cube matrix.

