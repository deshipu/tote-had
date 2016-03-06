#include <Wire.h>


const int SLAVE_ADDRESS = 0x09;


void i2c_setup() {
    Wire.begin(SLAVE_ADDRESS);
    Wire.onReceive(receiveEvent);
}

void receiveEvent(int bytes) {
}

void i2c_loop() {
}
