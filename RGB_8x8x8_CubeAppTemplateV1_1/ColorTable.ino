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

/* This tab contains a color table which has 8 colors of the rainbow plus black and white in 5 different intensities.  
   This table is set up to work with the 6 bit BAM used by our refresh interrupt routine.  
   So data is the Red, Green, and Blue intensities from 0 to 63 for each color and intensity.
   Colors are black, red, orange, yellow, green, aqua, blue, violet, purple, and white.  Intensities are from 0 (full off) to 4 (almost full on).
   The table is ordered so that each color is listed, first at 0 intensity, then listed again at intensity 1, etc.  
   This means a color can be specified as xy where x (10's place) specifies the intensity and y (1's place) specifies the color.  
   It returns the BAM intensities of the 3 component RGBs. So, for example: color 24 gives you the component color intensities for 
   green (color 4) at intensity 2, which in this particular case are 0,15,0 for red, green, and blue.
*/
byte colors[50][3] = {
        {0,  0,  0}, // These first 10 entries are for 0 intensity.  Therefore all 0's.
        {0,  0,  0},
        {0,  0,  0},
        {0,  0,  0},
        {0,  0,  0},
        {0,  0,  0},
        {0,  0,  0},
        {0,  0,  0},
        {0,  0,  0},
        {0,  0,  0},
        {0,  0,  0}, // Black; These next 10 entries are for intensity 1.  BAM components total 5 or 6
        {5,  0,  0}, // Red
        {4,  1,  0}, // Orange
        {3,  2,  0}, // Yellow
        {0,  5,  0}, // Green
        {0,  3,  2}, // Aqua
        {0,  0,  5}, // Blue
        {2,  0,  4}, // Violet
        {3,  0,  2}, // Purple
        {2,  2,  2}, // White
        {0,  0,  0}, // These next 10 are intensity 2.  BAM components total 15
        {15, 0,  0},
        {11, 4,  0},
        {8,  7,  0},
        {0,  15, 0},
        {0,  8,  7},
        {0,  0,  15},
        {5,  0,  10},
        {10, 0,  5},
        {5,  5,  5},
        {0,  0,  0}, // These next 10 are intensity 3.  BAM components total 30
        {30, 0,  0},
        {22, 8,  0},
        {16, 14, 0},
        {0,  30, 0},
        {0,  16, 14},
        {0,  0,  30},
        {10, 0,  20},
        {20, 0,  10},
        {10, 10, 10},
        {0,  0,  0}, // These next 10 are for intensity 4.  BAM components total 60
        {60, 0,  0},
        {44, 16, 0},
        {32, 28, 0},
        {0,  60, 0},
        {0,  32, 28},
        {0,  0,  60},
        {20, 0,  40},
        {40, 0,  20},
        {20, 20, 20},};
