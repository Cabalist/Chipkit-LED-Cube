/* This is the Super Big Show for the ChipKit uC32 only.   It requires 187K of program mamory, exceeding the 128K limit of the UNO32!
   It contains all the animations from The Big Show and Another Big Show, plus SuperTech-IT's fireworks.  It also fully supports 
   the Music Option.  Occationally we will add additional new animations to subsequent releases, as the uC32 has lots of program
   momory to spare!  This is 49 animations running 25 minutes befor repeating!

   This tab/file contains the primary loop which controls the logic for switching 
   between music mode and animations, between different music modes,
   and a list of the animations being exicuted. 
 */
void loop() {
    
    // Here is the list of animations running in this sketch/program.
    scrollTextStd2("WELCOME TO THE SUPER BIG SHOW.", Blue);
    CubeInCube();
    grower();
    RollingBall();
    paddles();
    DiamondWave();
    saddle2();
    Mysterious();
    saddle();
    RandomFall();
    miniCubes();
    Helicopter();
    atom();
    Glitter_ribbon();
    Elevators();
    TheOrnament();
    atomSmasher();
    Hula();
    dish();
    Sparkle();
    mazemice();
    Chaos();
    swings();
    Multi_Swirl(); 
    neutrinos();
    Flip_and_Roll();
    colors();
    FlyingBoxes();
    whatThe();
    Pulsing_Sphere(12);
    angled();
    Sinewave(20);
    angled2();
    Cyclone();
    bouncer();
    Rain(100); 
    randomLights();
    Mouse1();
    Fireworks();
    Donut(100); 
    Tornado();
    Rotor(1, 12);
    fireworks2 (15,30,60);
    Cosine(10);  
    RandomRotation(15);
    Eyes(); 
    Single_Swirl();
    Basketball_Dribble();
    GameOfLife();
    
}

