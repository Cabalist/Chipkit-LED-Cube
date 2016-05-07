/* This application / sketch uses 8 x 8 x 8 Cube Application Template, Version 1.0  © 2014 by Doug Domke
   Downloads of this and upcoming versions, along with detailed instructions, are available at: http://d2-webdesign.com/cube  
   Anyone is free to use this template to create and publish their own applications / sketches, but PLEASE USE THE 2 LINES ABOVE in your work.
   
   This is for the Chipkit UNO32, and assumes you are using a SuperTech-IT 8x8x8 RGB Board.  It's similar to Nick Schulze's Chipkit software,
   but is somewhat simpler, and easier to work with, when generating your own appliction.  The pinouts for this implementation are the same as 
   Nick's published pinouts, where the red data line is pin 7 and the blue data line is pin 9. (This is different than Nick's actual software,
   where the red and blue are actually reversed from his pinout diagram.)

   This tab sets up pin connections, defines global variables, and contains the setup subroutine.  
*/
// The definitions and variables below are part of the template.  DO NOT MODIFY
// the following definitions are for the direct port toggling used in the cube refresh interrupt routine. 
#define OE 0x0001
#define SDIR 0x0200  // red data is pin 7
#define SDIG 0x0400  // green data is pin 8
#define SDIB 0x0008  // blue data is pin 9
#define CLK 0x0004
#define LE 0x00002
const uint8_t LAYER[8] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};

// I usually just refer to a color by its number, but these definitions let you call them by name and intensity. 
// Black is black (all off) so just one intensity - 0.
#define Black0	 0
#define Red1	11
#define Orange1	12
#define Yellow1	13
#define Green1	14
#define Aqua1	15
#define Blue1	16
#define Violet1	17
#define Purple1	18
#define White1	19
#define Red2	21
#define Orange2	22
#define Yellow2	23
#define Green2	24
#define Aqua2	25
#define Blue2	26
#define Violet2	27
#define Purple2	28
#define White2	29
#define Red3	31
#define Orange3	32
#define Yellow3	33
#define Green3	34
#define Aqua3	35
#define Blue3	36
#define Violet3	37
#define Purple3	38
#define White3	39
#define Red4	41
#define Orange4	42
#define Yellow4	43
#define Green4	44
#define Aqua4	45
#define Blue4	46
#define Violet4	47
#define Purple4	48
#define White4	49

// the following are for referencing the pins by chip-kit pin number. 
const int Clock = 6;
const int Enable = 3;
const int Latch = 5;
const int myLayer[8] = {26, 27, 28, 29, 30, 31, 32, 33};
//  The cube matrix below stores the status of each LED in the cube
//  [layer 0-7]  [panel 0-7]  [column 0-7] 
//  Data at each location is a color in the Color Table.
//  For example: a 24 says we want green (color 4) at intensity 2
//  at this location. The Color Table will then translate 24 into BAM intensities
//  for each red, green, and blue component of the selected color.
byte cube[8][8][8];

// The variables below are part of the sample application running in the Main loop.   They may be deleted when you create your own application.

int xx, yy, zz;      // x, y, and z coordinates for current position
int xx1, yy1, zz1;   // temporary place to store coordinates as they're changing
int currentColor;    // Current color being stored.
int dir;             // Current direction of motion - forward or back
int xyz;             // Current dimension of motion, as across layers, across panels, or across columns
int history[24][4];  // Where the trail is stored - 3 position markers, and the color.
int historyCount;    // Position counter for the trail
int tempCount, colorCount, mycount2;   // misc. temporary variables


void setup() {
    // This portion of setup sets up the IO.  DO NOT MODIFY.
    for (int x = 3; x < 10; x++) {
        pinMode(x, OUTPUT);
    }

    for (int x = 26; x < 34; x++) {
        pinMode(x, OUTPUT);
        digitalWrite(x, HIGH);
    }
    digitalWrite(Latch, LOW);
    digitalWrite(Clock, LOW);
    digitalWrite(Enable, LOW);

    attachCoreTimerService(refreshCube);

    // This portion of setup is for the sample application running in the Main loop. It may be deleted when you create
    // your own application, and replaced with your own setup instructions.
    dir = 1;
    currentColor = Green4;
    xx = 7;
    yy = 7;
    zz = 7;
    xyz = 1;
}
























