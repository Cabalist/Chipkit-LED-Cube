/* This tab has the loop where you can build your own application.  The sample one here contains 4 demos. 
 The first is a demo of the different tools supporting scrolling text. You can scroll text around all four faces or only two faces.
 You can scroll the text through the cube in the X or Y direction.  You can rotate text around in the middle of the cube. 
 Finally, with any of these, you can call the custom characters by their name (they're found in the #define statemnents) and imbed them in your text. 
 Then there are three animations called, each of which is in its own tab (or file).   They are:
 pulsing sphere, cyclone, and wild mouse. Enjoy.
 */

void loop() {
  scrollTextStd4("Scrolling Text", Blue);  // scrolling text on 4 faces
  scrollText(Face, 0,36,63, 4);  // scrolling a custom caracter , specifying its color, and that you want it on 4 sides 
  scrollThruX("HELLO!", 63,0,0);  //scroll through cube in X direction
  scrollThruY("GOODBYE!", 0,63,0); // scroll through cube in Y direction
  scrollTextStd4(Fish "   " Arrow, Blue);  // scroll a couple of custom characters
  scrollText("I " Heart " U!", 63,0,0, 4);  // scroll a mix of regular text and custom characters
  rotate("ABC" Star, 0,63,0,2);  //rotate some characters around, picking a color, and calling for 2 rotations
  // the rain animation
  scrollTextStd2("Rain", Aqua); 
  rain(75);
  delay(1000);
  // the pulsing sphere animation
  scrollTextStd2("Pulsing Sphere", Red);
  sphere(15);
  delay(1000);
  // the cyclone animation
  scrollTextStd2("Cyclone", Green);
  cycloneX();
  delay(1000);
  // the wild mouse animation 
  scrollTextStd2("Wild Mouse", Blue); 
  mouse();
    // fireworks
  scrollTextStd2("FIREWORKS", Yellow);
  fireworks (10,30,60);
    //the Sinewave animation
  scrollTextStd2("SINEWAVE", Violet);
  sinewave(25);
  // wait 2 seconds before starting over
  delay(2000);
}








