/*  These are items that you probably don't want to mess with unless you really understand them.
    There are currently 2 items here:  
  1) the timer interrupt routine to refresh the cube
  2) the text scrolling core which advances text from one cube face to the next


This timer interrupt refreshes the whole cube, based on data stored in the cube matrix.  It uses 6 bit BAM (bit angle modulation)
 to set the levels of RGB stored in the cube matrix.
 Within the interrupt routine, all output is done using direct port toggling. With this approach, all 8 layers are refreshed in under 6 msec.  
 The LEDs in each layer (if set for max brightness) are on for .64 msec.(the sum of the BAM times).  This interrupt routine is called every 
 8 msec., so the LEDs are on 64% of theoretical best (which would be 1 msec. for each of the 8 layers). 
 */
uint32_t refreshCube(uint32_t currentTime) {
    byte red, green, blue;
    for (byte count = 0; count < 6; count++) {  // BAM counter; each increment doubles the time the LED is on, starting at 5 microsecs.
        digitalWrite(Latch, LOW);  //make sure outputs are latched
        LATDCLR = CLK | SDIR | SDIG | SDIB;
        if (cubeStructure == 0) {  // use this version if your cube is wired normally
            for (byte layer = 0; layer < 8; layer++) {  // scan thru each layer
                for (byte column = 0; column < 8; column++) {  // scan thru every column
                    for (byte panel = 0; panel < 8; panel++) {  // scan thru every panel
                        red = cube[column][7 - panel][layer][0]; // get its red component
                        if ((red & 1 << count) > 0) {  // BAM it and shift it out
                            LATDSET |= SDIR;
                        }
                        green = cube[column][7 - panel][layer][1];  // get its green component
                        if ((green & 1 << count) > 0) {  // BAM it and shift it out
                            LATDSET |= SDIG;
                        }
                        blue = cube[column][7 - panel][layer][2];  // get its blue component
                        if ((blue & 1 << count) > 0) {  // BAM it and shift it out
                            LATDSET |= SDIB;
                        }
                        LATDSET = CLK;  //Clock the data in.
                        _nop();
                        LATDCLR = CLK | SDIR | SDIG | SDIB;
                    }
                }
                LATDSET = LE;  // latch the data
                _nop();
                LATDCLR = LE;
                LATECLR = LAYER[layer]; // turn on layer
                delayMicroseconds((1 << count) * 10);  //here count sets time the layer is on - starting with 10 microsecs and ending at 32*10 or 320 microsecs.
                LATESET = LAYER[layer]; //turn off layer
            }
        }
        else {  // or use this version if your cube is wired so that text looks mirror imaged.
            for (byte layer = 0; layer < 8; layer++) {  // scan thru each layer
                for (byte column = 0; column < 8; column++) {  // scan thru every column
                    for (byte panel = 0; panel < 8; panel++) {  // scan thru every panel
                        red = cube[column][panel][layer][0]; // get its red component
                        if ((red & 1 << count) > 0) {  // BAM it and shift it out

                            LATDSET |= SDIR;
                        }
                        green = cube[column][panel][layer][1];  // get its green component
                        if ((green & 1 << count) > 0) {  // BAM it and shift it out
                            LATDSET |= SDIG;
                        }
                        blue = cube[column][panel][layer][2];  // get its blue component
                        if ((blue & 1 << count) > 0) {  // BAM it and shift it out
                            LATDSET |= SDIB;
                        }
                        LATDSET = CLK;  //Clock the data in.
                        _nop();
                        LATDCLR = CLK | SDIR | SDIG | SDIB;
                    }
                }
                LATDSET = LE;  // latch the data
                _nop();
                LATDCLR = LE;
                LATECLR = LAYER[layer]; // turn on layer
                delayMicroseconds((1 << count) * 10);  //here count sets time the layer is on - starting with 10 microsecs and ending at 32*10 or 320 microsecs.
                LATESET = LAYER[layer]; //turn off layer
            }
        }
    }
    // This next section is SuperTech-IT's music module
    if (MSGEQ7 == 1) {
        // Best not to play around with the timings here - they have been scoped out to be
        // fairly optimal for the chip without introducing too much delay for the cube itself.

        // Routine to constantly keep the Spectrum Analysis Array updated
        digitalWrite(A6, LOW); // chip has been reset - set MSGEQ7 chip reset to low

        for (int mdelay = 0; mdelay < 1200; mdelay++) { _nop(); } // 72uS delay from reset to clock

        for (byte mfreq = 0; mfreq < 7; mfreq++) { // read 7 frequencies
            digitalWrite(A2, LOW); // toggle clock low to allow next freq. read

            for (int mdelay = 0; mdelay < 675; mdelay++) { _nop(); } // 36uS delay for clock settle

            VU[mfreq] = analogRead(A1); // reset and clock must be low, so read value into array at current point
            digitalWrite(A2, HIGH); // toggle clock HIGH to prepare for read

            for (int mdelay = 0; mdelay < 350; mdelay++) { _nop(); } // 18uS pulse width
        }
        digitalWrite(A6, HIGH); // set MSGEQ7 chip reset to high - reset it because we have read all frequencies, and hold it in reset until we need to read it again
        if (VU[1] < threshold) { beat = 0; } // beat detect routine
        if (VU[1] > threshold) { beat = 1; } // beat detect routine
        if (digitalRead(38) == 0) { runMode = 0; } // animation button pressed - set animation mode
        if (digitalRead(A8) == 0) { runMode++; } // increase run mode by 1 if music mode button pressed
        while ((digitalRead(38) == 0) || (digitalRead(A8) == 0)) { _nop(); } // wait here until button is released
        if (runMode > modes) { runMode = 1; } // if we have gone through all the music modes, cycle back to sequenced mode


    }
    return (currentTime + CORE_TICK_RATE * 8);
}

//  This subroutine scrolls the characters being displayed from one cube face to the next.  
//  It is pretty much the guts of text display, and probably should be left alone.   
void scrollOneChar(int xRed, int xGreen, int xBlue, int Mode) {
    for (int shift = 0; shift < 8; shift++) { // Before going to the next character, display the content of the text buffer
        for (int col = 0; col < 45; col++) {     // eight times, each time shifting the content of the text buffer to the left by one LED.
            for (int row = 0; row < 8; row++) {
                text_buffer[col][row] = text_buffer[col + 1][row];
            }
        }
        for (int col = 0; col < 8; col++) {  // Here the text buffer is actually displayed across the 4 walls of the cube
            for (int row = 0; row < 8; row++) {
                if ((text_buffer[col + 29][row] > 0) && (Mode == 4)) {  // Note Mode must be 4 for this wall to display
                    LED(7 - col, 7, row, xRed, xGreen, xBlue);
                }
                if (text_buffer[col + 22][row] > 0) {
                    LED(7, col, row, xRed, xGreen, xBlue);
                }
                if (text_buffer[col + 15][row] > 0) {
                    LED(col, 0, row, xRed, xGreen, xBlue);
                }
                if ((text_buffer[col + 8][row] > 0) && (Mode == 4)) {  // Note Mode must be 4 for this wall to display
                    LED(0, 7 - col, row, xRed, xGreen, xBlue);
                }
            }
        }

        delay(scrollRate / 8); // Wait 100 msec.  before indexing display over one LED to the left
        for (int col = 0; col < 8; col++) {  // Clear all 4 walls before re-writing text buffer to LEDs
            for (int row = 0; row < 8; row++) {
                LED(col, 7, row, 0, 0, 0);
                LED(7, col, row, 0, 0, 0);
                LED(col, 0, row, 0, 0, 0);
                LED(0, col, row, 0, 0, 0);
            }
        }
    }
}


