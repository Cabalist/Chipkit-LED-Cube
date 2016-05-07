VERSION 2

The objective of this version is still to make the programming easy, but we've added the ability to continuously vary the color. In fact, with 6 bit BAM, you can generate 262,144 (64^3) different color combinations. However, for the simple rainbow color wheel we've built in, 192 colors are generated in 4 different intensities (5 including 0 or off)

This new version is not as easy to use as Version 1, mainly because each LED in the cube matrix has 3 variables, one for each of its RGB color components. But if you want to continuously vary color, this is the one for you. Version 2 still allows you to use the same standard named colors as Version I. There's just a small additional step to get them on the cube.

The sample application in this case is just a demo of the color capabilities. It runs the Wild Mouse routine while changing the color continuously. It also sets up the standard named colors that are available in both version 1 and 2, and displays them in the 5 different intensities on one face of the cube.


INSTRUCTIONS FOR VERSION 2

Version 2 is a little harder to use than Version I. That's because three pieces of data have to be handled for each LED in the cube. There are three color components for RGB with intensities of 0 to 63. (in Version I we used a single value and the cube refresh software looked up the color components in the Color Table.) But this version does give us the ability to make smooth color transitions and generate thousands of color combinations.

I have divided up my Version 2 template into 3 files or tabs in the IDE:

The basic tab, with the name of the application, sets up global variables, and contains the setup() routine where everything gets initialized. The cube matrix is defined here, which is where we store the current status of the cube. The cube matrix stores the status of each LED in the cube: [layer 0-7] [panel 0-7] [column 0-7] Data at each location is three intensities for RGB from 0 to 63. I have also defined some standard color names here, so while you can refer to a color by its number, for these standard colors, you can also refer to them by name, for example, Red, Orange, Yellow, Green, Aqua, Blue, Violet, Purple, White, Black.

The Main tab is where the main loop() is located and any other subroutines you develop to support your application. It currently contains my color demo routine, but you can replace it with your own. My demo runs the Wild Mouse routine from Version 1 while changing the color continuously. It also sets up the standard named colors that are available in both version 1 and 2, and displays them in the 5 different intensities on one face of the cube. It just switches back and forth between these two modes.

The Subs tab where my subroutines are located. It currently contains three subroutines.

--1) The refreshCube timer interrupt which refreshes the cube every 8 milliseconds. It works completely in the background to keep your cube updated to match the content of the cube matrix. It uses 6 bit BAM (bit angle modulation) and works with the color table to produce the colors at different intensities.

--2) The getColor(color, intensity) subroutine manages a simple color wheel generating 189 colors of the rainbow, plus white and black, at 5 different intensities (including 0). You give it one of those 191 colors, specify the intensity, and it comes back with the three RGB components that must be stored in the cube matrix. It returns them in global variables myred, mygreen, and myblue.

--3) The clearCube() subroutine simply clears the cube, turning off all LEDs.
Please see the template itself for further instructions. It's very well commented to help you get your bearings.