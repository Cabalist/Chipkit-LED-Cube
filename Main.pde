/* This tab/file contains the primary loop which controls the logic for switching 
   between music mode and animations, between different music modes,
   and a list of the animations being exicuted. 
 */
void loop() {
  while (runMode > 0) {
    byte musicMode = runMode-1; // musicMode set to make it easier to tell which routine number is running.
    clearCube(); // if jumping out of animation, clear cube

      if ((runMode == 1) || (musicMode == 1)) {
      spectrum1 (1000,20);
    } // run if in sequential mode or constant music mode 1
    if (runMode == 1) {
      clearCube();
    } // only clear the cube if we are in sequence mode
    if ((runMode == 1) || (musicMode == 2)) {
      spectrum2 (500,20);
    } // run if in sequential mode or constant music mode 2
    if (runMode == 1) {
      clearCube();
    } // only clear the cube if we are in sequence mode
    if ((runMode == 1) || (musicMode == 3)) {
      spectrum3 (500,20);
    } // run if in sequential mode or constant music mode 3
    if (runMode == 1) {
      clearCube();
    } // only clear the cube if we are in sequence mode
    if ((runMode == 1) || (musicMode == 4)) {
      spectrum4 (500,50);
    } // run if in sequential mode or constant music mode 4
    if (runMode == 1) {
      clearCube();
    } // only clear the cube if we are in sequence mode
    if ((runMode == 1) || (musicMode == 5)) {
      spectrum5 (500,20);
    } // run if in sequential mode or constant music mode 5
    if (runMode == 1) {
      clearCube();
    } // only clear the cube if we are in sequence mode
    if ((runMode == 1) || (musicMode == 6)) {
      spectrum6 (1000,20);
    } // run if in sequential mode or constant music mode 6
    if (runMode == 1) {
      clearCube();
    } // only clear the cube if we are in sequence mode
    if ((runMode == 1) || (musicMode == 7)) {
      spectrum7 (500,20,5);
    } // run if in sequential mode or constant music mode 7
    if (runMode == 1) {
      clearCube();
    } // only clear the cube if we are in sequence mode
    if ((runMode == 1) || (musicMode == 8)) {
      spectrum8 (200,20);
    } // run if in sequential mode or constant music mode 8
    if (runMode == 1) {
      clearCube();
    } // only clear the cube if we are in sequence mode
    if ((runMode == 1) || (musicMode == 9)) {
      spectrum9 (500,50);
    } // run if in sequential mode or constant music mode 9
    if (runMode == 1) {
      clearCube();
    } // only clear the cube if we are in sequence mode
    if ((runMode == 1) || (musicMode == 10)) {
      spectrum10 (200,50);
    } // run if in sequential mode or constant music mode 10
    if (runMode == 1) {
      clearCube();
    } // only clear the cube if we are in sequence mode
  }


  while (runMode == 0) {
    clearCube(); // in case exiting music mode, clear the cube
    if (MSGEQ7 ==1) {
      // Option to switch to music mode is here.
      scrollTextStd2("PRESS BUTTON NOW FOR MUSIC. . . . . .", Violet);
      if (runMode > 0) {
        break;
      } // drop out if mode changes
      // wait 1 second before starting over
      delay(1000);
    }
    
    // Here is the list of animations running in this sketch/program.
    scrollTextStd2("WELCOME TO ANOTHER BIG SHOW.", Blue);
    grower();
    paddles();
    saddle2();
    saddle();
    miniCubes();
    atom();
    atomSmasher();
    dish();
    mazemice();
    swings();
    neutrinos();
    colors();
    whatThe();
    angled();
    angled2();
    bouncer();
    randomLights(); 
  }
}

