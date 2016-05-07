/* This timer interrupt refreshes the whole cube, based on data stored in the cube matrix.  It uses 6 bit BAM (bit angle modulation)
   to set the levels of RGB stored in the cube matrix. The color and intensity data stored in the cube matrix are decoded into 
   individual RGB intensities by looking them up in the colors matrix.  
   
   Within the interrupt routine, all output is done using direct port toggling. With this approach, all 8 layers are refreshed in under 6 msec.  
   The LEDs in each layer (if set for max brightness) are on for .64 msec.(the sum of the BAM times).  This interrupt routine is called every 
   8 msec., so the LEDs are on 64% of theoretical best (which would be 1 msec. for each of the 8 layers).
*/
uint32_t refreshCube(uint32_t currentTime) {
    byte mycolor, red, green, blue;
    for (byte count = 0;
         count < 6; count++) {  // BAM counter; each increment doubles the time the LED is on, starting at 5 microsecs.
        digitalWrite(Latch, LOW);  //make sure outputs are latched
        LATDCLR = CLK | SDIR | SDIG | SDIB;
        for (byte layer = 0; layer < 8; layer++) {  // scan thru each layer
            for (byte column = 0; column < 8; column++) {  // scan thru every column
                for (byte panel = 0; panel < 8; panel++) {  // scan thru every panel

                    mycolor = cube[layer][panel][column];  //look up color for this position in cube
                    red = colors[mycolor][0]; // get its red component
                    if ((red & 1 << count) > 0) {  // BAM it and shift it out

                        LATDSET |= SDIR;
                    }
                    green = colors[mycolor][1];  // get its green component
                    if ((green & 1 << count) > 0) {  // BAM it and shift it out
                        LATDSET |= SDIG;
                    }
                    blue = colors[mycolor][2];  // get its blue component
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
            delayMicroseconds((1 << count) *
                              10);  //here count sets time the layer is on - starting with 10 microseconds and ending at 32*10 or 320 msecs.
            LATESET = LAYER[layer]; //turn off layer
        }
    }
    return (currentTime + CORE_TICK_RATE * 8);
}
