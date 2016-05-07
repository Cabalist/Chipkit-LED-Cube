VERSION 1

Its objective is to make programming a cube easy. You don’t need to get involved in how bit angle modulation works or how the data gets loaded into the cube. These are handled for you by the color table and timer interrupts routine.
A single matrix called “cube” controls the content of the cube. You just tell it what color and intensity you want where, and it happens.

Color is controlled by a table which tells our software how to create 8 colors of the rainbow, plus black and white in 5 different intensities. It’s built into the template. It's easy to use because the cube matrix in this case only has one number for each LED.

All the timing interrupt and cube refresh stuff is also built into the template and quietly runs in the background. This routine runs 6 bit BAM (bit angle modulation) and works with the color table to produce all the colors at different intensities.

The Version 1 template comes with a sample application / sketch called WILD MOUSE which demonstrates its use. You can easily remove the sample and replace it with your own experiments.


INSTRUCTIONS FOR VERSION 1

I have divided up my Version 1 template into 4 files or tabs in the IDE:

The basic tab, with the name of the application, sets up global variables, and contains the setup() routine where everything gets initialized. The cube matrix is defined here, which is where we store the current status of the cube. The cube matrix stores the status of each LED in the cube: [layer 0-7] [panel 0-7] [column 0-7] Data at each location is a color in the Color Table. I have also defined color names here, so while you can just refer to a color by its number, you can also refer to it as, for example, Aqua3 if you want aqua of intensity 3.

The Main tab is where the main loop() is located and any other subroutines you develop to support your application. It currently contains my sample application WILD MOUSE, but you can replace it with your own.

The Color Table tab has the BAM table which sets up colors and intensities for bit angle modulation. This table has the 8 colors of the rainbow plus black and white in 5 different intensities - a total of 50 different combinations of color and intensity. It is set up to work with the 6 bit BAM used by our refresh interrupt routine. So data is the Red, Green, and Blue intensities from 0 to 63 for each color and intensity. Colors are black, red, orange, yellow, green, aqua, blue, violet, purple, and white. Intensities are from 0 (full off) to 4 (almost full on).

The table is ordered so that each color is listed, first at 0 intensity, then listed again at intensity 1, etc. Since there are 10 colors, this means a color can be specified as xy where x (10's place) specifies the intensity and y (1's place) specifies the color. It returns the BAM intensities of the 3 component RGBs. So, for example: color 24 gives you the component color intensities for green (color 4) at intensity 2, which in this particular case are 0,15,0 for red, green, and blue. But handling the individual RGB color intensities is handled automatically by the refresh interrupt routine. All you need to do is put the number of the table entry into the cube matrix and that color and intensity show up on your cube.

The 8 colors plus black and white can also be called out by name and intensity directly, such as Aqua4 for the brightest aqua or Orange1 for the dimmest orange.

The Subs tab is where my subroutines are located. The only one there now in Version 1 is the timer interrupt which refreshes the cube every 8 milliseconds. It works completely in the background to keep your cube updated to match the content of the cube matrix. It uses 6 bit BAM (bit angle modulation) and works with the color table to produce the colors at different intensities.
Please see the template itself for further instructions. It's very well commented to help you get your bearings.