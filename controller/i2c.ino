#include <Wire.h>
#include "leg.h"


const int SLAVE_ADDRESS = 0x09;
const int MAX_REGS = 12;

volatile int8_t regs[MAX_REGS] = {};
volatile uint8_t address;


void i2c_setup() {
    Wire.begin(SLAVE_ADDRESS);
    Wire.onReceive(receive);
}

void receive(int bytes) {
    address = Wire.read();
    while (Wire.available() && address < MAX_REGS) {
        regs[address] = Wire.read();
        ++address;
    }
}

void i2c_loop() {
    for (int leg = 0; leg < 4; ++leg) {
        move_leg(leg, regs[leg * 3 + 0] + HOME,
                      regs[leg * 3 + 1] + HOME,
                      regs[leg * 3 + 2] - TIBIA);
    }
}
