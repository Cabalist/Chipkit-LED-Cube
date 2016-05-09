######All code and documentation taken from here: http://d2-webdesign.com/cube/index.html


Would you like to write your own animations, like Nick Schulze, for the Chipkit UNO32/uC32? This code is a series of templates that may help.

This code is designed specifically to work with SuperTech-ITs 8x8x8 RGB board, but there isn't any reason why it wouldn’t work with others.

All versions of the template provide tools to help you build your own animations. They all provide the interrupt timer routine to refresh the cube, and they all have a bunch of powerful subroutines to help you get started. If you are an experienced programmer, go ahead and start with Version 5. If you are more of a beginner and want to ease into the more complicated stuff, build your first animation in Version 1, and gradually work your way up the the more complicated stuff in Versions 3, 4, 5, and 6.


This repository is divided into branches.  Each branch is a version of the Doug Domke's RGB LED Cube code for the Chipkit UNO and uC32 prototype boards.

Doug Domke has done a wonderful job of explaining how his code works and dividing it into projects that build on each other's complexity.  

## Table of Animations

Animation | V1 | V2 | V3 | V4 | V5 | V6 | V7 | The Big Show No Music | The Big Show Music | Another Big Show No Music | Another Big Show Music | The Super Big Show No Music | The Super Big Show Music
-----------------: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :-------------------: | :----------------: | :-----------------------: | :--------------------: | :-------------------------: | :----------------------:
        Wild Mouse | X  | X  | X  | X  |    |    |    |           X           |         X          |                           |                        |              X              |            X
           Cyclone |    |    | X  | X  |    |    |    |           X           |         X          |                           |                        |              X              |            X
         Fireworks |    |    | X  | X  | X  |    |    |           X           |         X          |                           |                        |              X              |            X
              Rain |    |    | X  | X  |    |    |    |           X           |         X          |                           |                        |              X              |            X
         Sine wave |    |    | X  | X  |    |    |    |           X           |         X          |                           |                        |              X              |            X
            Sphere |    |    | X  | X  |    |    |    |           X           |         X          |                           |                        |              X              |            X
             Music |    |    |    | X  | X  | X  | X  |                       |         X          |                           |           X            |                             |            X
            Cosine |    |    |    |    | X  |    |    |           X           |         X          |                           |                        |              X              |            X
             Donut |    |    |    |    | X  |    |    |           X           |         X          |                           |                        |              X              |            X
   Random Rotation |    |    |    |    | X  |    |    |           X           |         X          |                           |                        |              X              |            X
   Rotating Cosine |    |    |    |    | X  |    |    |                       |                    |                           |                        |                             |
Rotating Fireworks |    |    |    |    | X  |    |    |                       |                    |                           |                        |                             |
             Rotor |    |    |    |    | X  |    |    |           X           |         X          |                           |                        |              X              |            X
   Simple Rotation |    |    |    |    | X  |    |    |                       |                    |                           |                        |                             |
           Tornado |    |    |    |    | X  |    |    |           X           |         X          |                           |                        |              X              |            X
     Bouncing Ball |    |    |    |    |    | X  |    |                       |                    |                           |                        |                             |
              Eyes |    |    |    |    |    | X  |    |           X           |         X          |                           |                        |              X              |            X
     Flip and Roll |    |    |    |    |    | X  |    |           X           |         X          |                           |                        |              X              |            X
      Flying Boxes |    |    |    |    |    | X  |    |           X           |         X          |                           |                        |              X              |            X
        Helicopter |    |    |    |    |    | X  |    |                       |                    |                           |                        |                             |
       Multi Swirl |    |    |    |    |    | X  |    |           X           |         X          |                           |                        |              X              |            X
       Demo Sprite |    |    |    |    |    | X  |    |                       |                    |                           |                        |                             |
      Single Swirl |    |    |    |    |    | X  |    |           X           |         X          |                           |                        |              X              |            X
      Cube in Cube |    |    |    |    |    |    | X  |           X           |         X          |                           |                        |              X              |            X
      Rolling Ball |    |    |    |    |    |    | X  |           X           |         X          |                           |                        |              X              |            X
      Diamond Wave |    |    |    |    |    |    | X  |           X           |         X          |                           |                        |              X              |            X
        Mysterious |    |    |    |    |    |    | X  |           X           |         X          |                           |                        |              X              |            X
       Random Fall |    |    |    |    |    |    | X  |           X           |         X          |                           |                        |              X              |            X
        Helicopter |    |    |    |    |    |    | X  |           X           |         X          |                           |                        |              X              |            X
    Glitter Ribbon |    |    |    |    |    |    | X  |           X           |         X          |                           |                        |              X              |            X
         Elevators |    |    |    |    |    |    | X  |           X           |         X          |                           |                        |              X              |            X
      The Ornament |    |    |    |    |    |    | X  |           X           |         X          |                           |                        |              X              |            X
              Hula |    |    |    |    |    |    | X  |           X           |         X          |                           |                        |              X              |            X
           Sparkle |    |    |    |    |    |    | X  |           X           |         X          |                           |                        |              X              |            X
             Chaos |    |    |    |    |    |    | X  |           X           |         X          |                           |                        |              X              |            X
           Dribble |    |    |    |    |    |    |    |           X           |         X          |                           |                        |              X              |            X
      Game of Life |    |    |    |    |    |    |    |           X           |         X          |                           |                        |              X              |            X
            Grower |    |    |    |    |    |    |    |                       |                    |                           |                        |              X              |            X
           Paddles |    |    |    |    |    |    |    |                       |                    |             X             |           X            |              X              |            X
           Saddle2 |    |    |    |    |    |    |    |                       |                    |             X             |           X            |              X              |            X
            Saddle |    |    |    |    |    |    |    |                       |                    |             X             |           X            |              X              |            X
        Mini Cubes |    |    |    |    |    |    |    |                       |                    |             X             |           X            |              X              |            X
              Atom |    |    |    |    |    |    |    |                       |                    |             X             |           X            |              X              |            X
      Atom Smasher |    |    |    |    |    |    |    |                       |                    |             X             |           X            |              X              |            X
              Dish |    |    |    |    |    |    |    |                       |                    |             X             |           X            |              X              |            X
         Maze Mice |    |    |    |    |    |    |    |                       |                    |             X             |           X            |              X              |            X
            Swings |    |    |    |    |    |    |    |                       |                    |             X             |           X            |              X              |            X
         Neutrinos |    |    |    |    |    |    |    |                       |                    |             X             |           X            |              X              |            X
            Colors |    |    |    |    |    |    |    |                       |                    |             X             |           X            |              X              |            X
          What the |    |    |    |    |    |    |    |                       |                    |             X             |           X            |              X              |            X
            Angled |    |    |    |    |    |    |    |                       |                    |             X             |           X            |              X              |            X
          Angled 2 |    |    |    |    |    |    |    |                       |                    |             X             |           X            |              X              |            X
           Bouncer |    |    |    |    |    |    |    |                       |                    |             X             |           X            |              X              |            X
     Random Lights |    |    |    |    |    |    |    |                       |                    |             X             |           X            |              X              |            X
       Fireworks 2 |    |    |    |    |    |    |    |                       |                    |                           |                        |              X              |            X



###[Version 1](https://github.com/Cabalist/Chipkit-LED-Cube/tree/Version1)

Its objective is to make programming a cube easy. You don’t need to get involved in how bit angle modulation works or how the data gets loaded into the cube. These are handled for you by the color table and timer interrupts routine.
A single matrix called “cube” controls the content of the cube. You just tell it what color and intensity you want where, and it happens.

Color is controlled by a table which tells our software how to create 8 colors of the rainbow, plus black and white in 5 different intensities. It’s built into the template. It's easy to use because the cube matrix in this case only has one number for each LED.

All the timing interrupt and cube refresh stuff is also build into the template and quietly runs in the background. This routine runs 6 bit BAM (bit angle modulation) and works with the color table to produce all the colors at different intensities.

The Version 1 template comes with a sample application / sketch called WILD MOUSE which demonstrates its use. You can easily remove the sample and replace it with your own experiments.

###[Version 2](https://github.com/Cabalist/Chipkit-LED-Cube/tree/Version2)

The objective of this version is still to make the programmng easy, but we've added the ability to continuously vary the color. In fact, with 6 bit BAM, you can generate 262,144 (64^3) different color combinations. However, for the simple rainbow color wheel we've built in, 192 colors are generated in 4 different intensities (5 including 0 or off)

This new version is not as easy to use as Version 1, mainly because each LED in the cube matrix has 3 variables, one for each of its RGB color components. But if you want to continuously vary color, this is the one for you. Version 2 still allows you to use the same standard named colors as Version I. There's just a small additional step to get them on the cube.

The sample application in this case is just a demo of the color capabilities. It runs the Wild Mouse routine while changing the color continuously. It also sets up the standard named colors that are available in both version 1 and 2, and displays them in the 5 different intensities on one face of the cube.

###[Version 3](https://github.com/Cabalist/Chipkit-LED-Cube/tree/Version3)

This version incorporates all the features of Versions 1 and 2, plus it adds various text handling capabilities, such as the ability to scroll text around the outside faces of the cube. In the main loop, we have various demos of text scrolling. We also call 5 animations (each of which is in its own tab) - the two that were already available with version 2, a new animation called Rain, another new one called Cyclone, and another one called Sine_wave.

There are actually 6 subroutines for scrolling text. The main one "scrollText" allows you to specify the string of text you want to scroll, the 3 RGB components for the color of your text, and 2 or 4 depending on whether you want to scroll around all 4 faces of the cube or just 2. The reason for the 2 face option is that it's easier to read that the 4 side option, because there are lights flashing around in the background in the 4 face option. But, of course, 2 face is only viewable from a limited range of direction. So you have a choice.

Two other scrolling subs are scrollTextStd2 and scrollTextStd4. These allow you to specify a string, and just specify one of our standand colors, like Red, Orange, Aqua, Blue, etc. They display on 2 or 4 faces respectively.

Three other text handling subroutines are scrollThruX and scrollThruY which scroll text through the middle of the cube, and rotate which rotates each character, one at a time, around in the center of the cube.

Another feature in V3 is the ability to substitute your own custom characters in the font table. These custom characters can be assigned a name and inserted into the text stream. See the actual code for some examples.

We also introduce the idea of right-handed and left-handed cubes in this version. Normally you wouldn't need to worry about this, but in the case of text, you know right away if your text is coming out mirror-imaged.

For more information on Version 3, see Version 3 Instructions.

###[Version 4](https://github.com/Cabalist/Chipkit-LED-Cube/tree/Version4)

This version incorporates all the features of Versions 1, 2, and 3, plus it adds the ability to use music to control your cube. It requires some additional circuitry, both to analyize the incoming sound and to switch between the different modes of operation. It includes a number of special effects that make your cube respond to the incoming music source. Both the hardware the sofware to support music come from SuperTech-IT. For more information on Version 4, see Version 4 Instructions.

###[Version 5](https://github.com/Cabalist/Chipkit-LED-Cube/tree/Version5)

This version of the software is all about rotating stuff in the cube. This version does not contain all the software and animations from previous versions. It does, however, contain all the subroutines from previous versions, including the ones that support music. It also has two new animations - one called Cosine and a new fireworks animation - fireWorks.

In this version, we look at various ways to rotate stuff, and we introduce the tools to rotate the entire content of the cube by any amount and at any speed. I've also included demos of everything in the main loop, including two examples of making a moving animation revolve while its running. For more information on Version 5, see Version 5 Instructions.

###[Version 6](https://github.com/Cabalist/Chipkit-LED-Cube/tree/Version6)

Version 6 is all about moving stuff around in the cube. But more importantly, it introduces a new way to program the cube. It's a significant breakthough in my efforts to provide programming tools to cube builders. And because it's so easy to use, I've created a bunch of new animations with it that demonstate its use.

Version 6 takes advantage of object based programming. It gives you the tools to make it all easy. You build objects called sprites by defining their size, shape, and color, then give them a location and place them in the cube. You then have a number of actions you can call to move your sprites around like a single step move, or bounce them off the sides of the cube, or rotate them around the cube, or rotate them around themselves. You can have as many sprites as you want, and they can all move around simultaneously and independently of each other.

###[Version 7](https://github.com/Cabalist/Chipkit-LED-Cube/tree/Version7)

Version 7 is a rather small iteration from Version 6. We've added some new features to the Sprite object class we introduced in Version 6. But mostly, Version 7 is the addition of a bunch of new animations. For more information on Version 7, see Version 7 Instructions.

###The Big Show

The Big Show is a collection of all the animations from all 7 versions of my templates. It's built on the Version 7 platform and contains scrolling text plus 30 different animations. The whole show takes about 14 minutes before repeating. If you are just looking for something to really show off what your cube can do, this is the one from you! Thanks to David Yee, The Big Show now includes SuperTech-IT's music module.

###Another Big Show

For those still using the UNO32, I am releasing these new animations as a new download called Another_Big_Show.

### The Super Big Show
For those of you who have upgraded to the uC32, we have another new download - The Super_Big_Show! It has all the animations in The Big Show and Another Big Show, plus some other stuff. It's 187K of program memory, so it far exceeds the available memory on the UNO32, but on the uC32, there is still plenty of room for future expansion. The Super_Big_Show takes over 25 minutes to run through 49 different animations before starting to repeat.