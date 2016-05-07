VERSION 3

This version incorporates all the features of Versions 1 and 2, plus it adds various text handling capabilities, such as the ability to scroll text around the outside faces of the cube. In the main loop, we have various demos of text scrolling. We also call 5 animations (each of which is in its own tab) - the two that were already available with version 2, a new animation called Rain, another new one called Cyclone, and another one called Sine_wave.

There are actually 6 subroutines for scrolling text. The main one "scrollText" allows you to specify the string of text you want to scroll, the 3 RGB components for the color of your text, and 2 or 4 depending on whether you want to scroll around all 4 faces of the cube or just 2. The reason for the 2 face option is that it's easier to read that the 4 side option, because there are lights flashing around in the background in the 4 face option. But, of course, 2 face is only viewable from a limited range of direction. So you have a choice.

Two other scrolling subs are scrollTextStd2 and scrollTextStd4. These allow you to specify a string, and just specify one of our standard colors, like Red, Orange, Aqua, Blue, etc. They display on 2 or 4 faces respectively.

Three other text handling subroutines are scrollThruX and scrollThruY which scroll text through the middle of the cube, and rotate which rotates each character, one at a time, around in the center of the cube.

Another feature in V3 is the ability to substitute your own custom characters in the font table. These custom characters can be assigned a name and inserted into the text stream. See the actual code for some examples.

We also introduce the idea of right-handed and left-handed cubes in this version. Normally you would not need to worry about this, but in the case of text, you know right away if your text is coming out mirror-imaged.

INSTRUCTIONS FOR VERSION 3

Version 3.7 is the latest version and an extension of Version 2. It adds the capability to scroll text and display text in a number of ways.

There are actually 6 subroutines for scrolling text. The main one "scrollText" allows you to specify the string of text you want to scroll, the 3 RGB components for the color of your text, and 2 or 4 depending on whether you want to scroll around all 4 faces of the cube or just 2. The reason for the 2 face option is that it's easier to read than the 4 side option, because there are lights flashing around in the background in the 4 face option. But, of course, 2 face is only viewable from a limited range of direction. So you have a choice. You can also set the speed at which text scrolls. It's set in the first tab by #define scrollRate.

Two other scrolling subs are scrollTextStd2 and scrollTextStd4. These allow you to specify a string, and just specify one of our standard colors, like Red, Orange, Aqua, Blue, etc. They display on 2 or 4 faces respectively.

There are also three other text subroutines: scrollThruX and scrollThruY allow you to scroll text through the middle of the cube from front to back, in the X and Y directions respectively. The rotate subroutine lets you rotate text in the middle of the cube and specify the number of rotations each character makes before moving to the next character.

In my work with SuperTech-IT, we found that you can build a right-handed cube or a left-handed cube. This doesn't matter normally, but when displaying text, it matters a lot. Let's say SuperTech-IT's board or a Nick cube that's wired properly is called right-handed. If you build a cube that's left-handed (as several people have done, including me), you'll find mirror images of the text that are scrolling backwards. So there is now a line in the front end of the code: "#define cubeStructure 0" If you have a SuperTech-IT board, leave it at 0. But if you find that your text mirror-imaged, set it to 1 or anything other than 0 to fix the problem.

I have divided up my Version 3.7 template into 11 files or tabs in the IDE:

The basic tab, with the name of the application, sets up global variables, and contains the setup() routine where everything gets initialized. The cube matrix is defined here, which is where we store the current status of the cube. The cube matrix stores the status of each LED in the cube: [layer 0-7] [panel 0-7] [column 0-7] Data at each location is three intensities for RGB from 0 to 63. I have also defined some standard color names here, so while you can refer to a color by its number, for these standard colors, you can also refer to them by name, for example, Red, Orange, Yellow, Green, Aqua, Blue, Violet, Purple, White, Black.

The Font_Table tab is where the font data is stored. It's a big table so it's placed in program memory to avoid using limited RAM space to store it. The individual characters in the font are already expanded so they are ready to display. Also, they are turned on there side so that they are ready to scroll. I have marked several characters in the font table as characters you probably won't use. You can substitute your own custom characters for these. Then give your custom character a name and use a #define statement to translate the name to the character you're substituting it for. There are several examples in our V3.2 code.

The Main tab is where the main loop() is located. It's where you create your own application. It currently contains various demos of text scrolling. It also calls 5 animations (each of which is in its own tab) - the two that were already available with version 2 and three new animations called Rain, Cyclone, and Sine_wave.

The m_Cyclone tab is where the Cyclone animation is stored as a subroutine. I placed the "m" before the animation name just to keep the animations showing up in the IDE next to the Main tab.

The m_Fireworks tab is SuperTech-IT's fireworks animation is stored as a subroutine.

The m_Mouse tab is where the Wild Mouse animation is stored as a subroutine.

The m_Rain tab is where the Rain animation is stored as a subroutine.

The m_Sinewave tab is where the Sinewave animation is stored as a subroutine.

The m-Sphere tab is where the Pulsing Sphere animation is stored as a subroutine.



The Subroutines tab is where subroutines are located that can be called by other users. It currently contains 9 subroutines.
--1) The LED sub provides the ability to light any particular LED at a specified location with specified 3 RGB color components.

--2)The getColor(color, intensity) subroutine manages a simple color wheel generating 189 colors of the rainbow, plus white and black, at 5 different intensities (including 0). You give it one of those 191 colors, specify the intensity, and it comes back with the three RGB components that must be stored in the cube matrix. It returns them in global variables myred, mygreen, and myblue.

--3) The clearCube() subroutine simply clears the cube, turning off all LEDs.

--4) The scrollText() subroutine allows you to specify the string of text you want to scroll, the 3 RGB components for the color of your text, and 2 or 4 faces of the cube.

--5) The scrollThruX sub lets you specify a string of text to be scrolled, specify its 3 RGB color components, and pass it through the middle of the cube from back to front in the X direction. (The scrollUpX subroutine is used by scrollThruX.)

--6) The scrollThruY sub lets you specify a string of text to be scrolled, specify its 3 RGB color components, and pass it through the middle of the cube from back to front in the X direction. (The scrollUpY subroutine is used by scrollThruX.)

--7) The scrollTextStd2() subroutine allows you to specify a string, and just specify one of our standard colors on 2 faces

--8) The scrollTextStd4() subroutine allows you to specify a string, and just specify one of our standard colors on 4 faces

--9) The rotate() sub lets you specify a string of text to be used, specify its 3 RGB color components, and then it rotates the characters, one at a time, in the center of the cube.



The Behind the Scenes tab is where a couple of subroutines are located that aren't directly callable by other users.
--1) The refreshCube timer interrupt which refreshes the cube every 8 milliseconds. It works completely in the background to keep your cube updated to match the content of the cube matrix. It uses 6 bit BAM (bit angle modulation) and works with the color table to produce the colors at different intensities.

--2) The scrollOneChar subroutine - it's the core subroutine for scrolling. It advances the text from one cube face to the next and handles the actual display on the cube faces.