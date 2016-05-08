/* * 8X8X8 RGB QUBE SOFTWARE - Code to control the SuperTech-IT 8x8x8 RGB LED Cube
 * Copyright (C) 2014, 2015, 2016 Doug Domke, Norman Skinner
 *
 * This file is part of 8X8X8 RGB QUBE SOFTWARE.
 *
 * 8X8X8 RGB QUBE SOFTWARE is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * 8X8X8 RGB QUBE SOFTWARE is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with 8X8X8 RGB QUBE SOFTWARE.  If not, see <http://www.gnu.org/licenses/>.
 */

/* This is the Super Big Show for the ChipKit uC32 only.   It requires 187K of program memory, exceeding the 128K limit of the UNO32!
   It contains all the animations from The Big Show and Another Big Show, plus SuperTech-IT's fireworks.  It also fully supports 
   the Music Option.  Occasionally we will add additional new animations to subsequent releases, as the uC32 has lots of program
   memory to spare!  This is 49 animations running 25 minutes before repeating!

   This tab/file contains the primary loop which controls the logic for switching 
   between music mode and animations, between different music modes,
   and a list of the animations being executed.
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
    fireworks2(15, 30, 60);
    Cosine(10);
    RandomRotation(15);
    Eyes();
    Single_Swirl();
    Basketball_Dribble();
    GameOfLife();

}

