/* This application / sketch uses 8 x 8 x 8 Cube Application Template, Version 7.0  © 2014 by Doug Domke
 Downloads of this and upcoming versions, along with detailed instructions, are available at: http://d2-webdesign.com/cube  
 Anyone is free to use this template to create and publish their own applications / sketches, but PLEASE USE THE 2 LINES ABOVE in your work.
 
 This is for the Chipkit UNO32, and assumes you are using a SuperTech-IT 8x8x8 RGB Board.  It's similar to Nick Schulze's Chipkit software,
 but is somewhat simpler, and easier to work with, when generating your own application.  The pinouts for this implementation are the same as 
 Nick's published pinouts, where the red data line is pin 7 and the blue data line is pin 9. (This is different than Nick's actual software, 
 where the red and blue are actually reversed from his pinout diagram.)
 
 This tab sets up pin connections and cube structure, defines global variables, and contains the setup subroutine.  
 */
 
// The following notes are from David Yee and provides on the changes he contributed: 
// 130604 
// 130808
// Remove programs that don't work so well, beat 1, beat 2, remove delays from 
// big picture. remove redundant programs.  Changed the rolly def on the sprite class.
// moved global variables into mystery.  shiftdown is redundant.
// 131880
// eliminate some sqrt out of music using distance.
// take msgeq7 code out of interrupt and modify all music.
// 130540
// 130496 variable beat taken out - backed up

// one of the following failed on rain when testing
// 130536 updown[][] eliminated
// 130504  currentColor [] eliminated.
// 130492  history and historycount eliminated.  Note replaceing sprite.clearit calls with clearCube made it bigger.
// 130360  mycase variable eliminated and getcolor modified.  Division replaced with  >> 1

// try updown, currencolor and mycase , test and save.
//  130360 Note that eliminating history and historycount did nothing.  BACKUP
//130364  Currentclor on the blok now.
// 130456 getting rid of currentcolor.   Test, record pass and save.  Testing  BACKUP


// create cleartop for music stuff, optimize music and port over other changes made for mega.
//  129816
//  129764  optimize m-fireworks, cleaned out music code.  Testing now BACKUP
//  129748  Got rid of thrreshold global variable 129748
//  129768  added back vitualgain calc in readmsg
//  129712  used clearcube to clear cube throughout the big show.  Same code.


// The definitions and variables below are part of the template.  DO NOT MODIFY
// the following definitions are for the direct port toggling used in the cube refresh interrupt routine. 
#define OE 0x0001
#define SDIR 0x0200  // red data is pin 7
#define SDIG 0x0400  // green data is pin 8
#define SDIB 0x0008  // blue data is pin 9
#define CLK 0x0004
#define LE 0x00002
const uint8_t LAYER[8] = {
  0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};

// These are standard colors which can be called by name when using the getColor subroutine.
#define Black	191
#define Red	0
#define Orange	21
#define Yellow	40
#define Green	63
#define Aqua	85
#define Blue	127
#define Violet	148
#define Purple	169
#define White	190
// These define custom characters that have been substituted 
// in the font table, so that they can be called by name
#define Omega "*"
#define Arrow "#"
#define X "%"
#define ifi "&"
#define TG "'"
#define CommodoreSymbol "("
#define Heart ")"
#define Face "/"
#define ST ":"
#define Star ";"
#define SpaceInvader "<"
#define Fish ">"

#define scrollRate 800  // this is the time in msec. to scroll from one character to the next. 
// you can modify this to make text scroll faster or slower. 
#define musicActive 1  // set this to 1 if you want the option at startup to activate Music Mode (Default)
// set it to 0 if you to deactivate music mode and skip scrolling the "PRESS BUTTON NOW FOR MUSIC. . . ." 
#define cubeStructure 0  // if your cube is built on SuperTech-IT's board, or if you followed Nick's instructions exactly, 
// leave this as 0.   But if you accidentally built your cube as a mirror image of these, which several of us have done, you 
// will need to change this to 1 to get your text scrolling correctly.

//These next 6 items support SuperTech-IT's music module
#define MSGEQ7 0x01   // define if music module exists (1) or not (0)
int virtualGain = 127; // define initial gain status until it is read from A5 - used in readmsgeq7 and spectrum8.
int runMode = 0; // runMode 0 = animations. 1=cycle through music modes. 2 or higher indicates which nusic mode to run and stay in.
int modes = 11; // The number of total music modes there are. Don't forget to add 1 for the sequence mode - so if there are 3 modes of music, this has to be 4
//int beat = 0; // global beat detect = 1 during beat, otherwise 0.
//int threshold = 900; // this is the threshold from 0 to 1023 of how high the bass must be to consider it a "beat"

// the following are for referencing the pins by chip-kit pin number. 
const int Clock = 6;
const int Enable = 3;
const int Latch = 5;
const int Gain = A5; // pin where gain pot is
const int myLayer[8] ={
  26,27,28,29,30,31,32,33};
//  The cube matrix below stores the status of each LED in the cube
//  [column 0-7] [panel 0-7] [layer 0-7] [red, green, blue color components]
//  Each of the 3 color components can vary from 0 to 63, giving us approx. 250,000 possible color variations
byte cube[8][8][8][3];
byte buffer_cube[8][8][8][3];
float myangle, myangle2, rotation; // used by the rotation routines

byte text_buffer[46][8];  //where font-based text is stored temporarily while it's being scrolled.
byte myred, mygreen, myblue;
int offset; 
int incomingByte = 0; 
//int temp;
// The variales below are part of the sample application(s) running in the Main loop.   They may be deleted when you create
// your own application.
float count;
float x,y,z, z1;
int colorCount;
#define duration 20
int cyclone[duration+1][3];
int xx, yy, zz;      // x, y, and z coordinants for current position 
int xx1, yy1, zz1;   // temporary place to store coordinants as thery're changing
// byte currentColor[3];    // Current color being stored.
int dir;             // Current direction of motion - forward or back
int xyz;             // Current dimension of motion, as accross layers, across panels, or across columns
int history[24][6];  // Where the trail is stored - 3 position markers, and the color.
int historyCount;    // Position counter for the trail
int tempCount, tempCount2, mycount2;   // misc. temporary variables
int counter, mycolor  ;
int x3, y3, z3,count3, mywait=50; 

int blinkMe; 
int rot = 1;


//**********************************************************************************************************
//**********************************************************************************************************
//**********************************************************************************************************
//**********************************************************************************************************

void setup() { 
  // This portion of setup sets up the IO.  DO NOT MODIFY.
  for (int x=3; x<10; x++){   
    pinMode(x, OUTPUT); 
  }  

  for (int x=26; x<34; x++){   
    pinMode(x, OUTPUT); 
    digitalWrite(x, HIGH); 
  }
  digitalWrite(Latch, LOW );
  digitalWrite(Clock, LOW );
  digitalWrite(Enable, LOW );
  
   if (MSGEQ7 == 1) { // leave this stuff alone if the module is not present
   // This stuff sets up pins for SuperTech-ITs music module. 
   pinMode (A1,INPUT); // where we read the analog MSGEQ7's output
   pinMode (A2, OUTPUT); // MSGEQ7 strobe line
   pinMode (A5, INPUT); // Virtual Gain potentiometer
   pinMode (A6, OUTPUT); // MSGEQ7 RESET line
   pinMode (A8, INPUT); // music mode button
   pinMode (38, INPUT); // animation mode button
   digitalWrite (A6, HIGH); // on startup put the MSGEQ7 in reset mode
   digitalWrite (A2, HIGH); // Ready the active low strobe for first reading on strobe toggle after reset low
   }
   //  end MSGEQ7 prep

  attachCoreTimerService(refreshCube);

  // This portion of setup is for the sample application running in the Main loop. It may be deleted when you create 
  // your own application, and replaced with your own setup instructions.   
  dir = 1;
  xx=7;  
  yy= 7;  
  zz=7;
  xyz=1; 
}










