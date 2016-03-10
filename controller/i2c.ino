#include <Wire.h>
#include "leg.h"


const int SLAVE_ADDRESS = 0x09;
const int MAX_REGS = 16;
volatile int8_t regs[MAX_REGS] = {};
volatile uint8_t address;


void i2c_setup() {
    Wire.begin(SLAVE_ADDRESS);
    Wire.onReceive(receive);
}

void receive(int bytes) {
    address = Wire.read();
    while (Wire.available()) {
        regs[address] = Wire.read();
        ++address;
        if (address >= MAX_REGS) {
            return;
        }
    }
}

void i2c_loop() {
    for (int leg = 0; leg < 3; ++leg) {
        if (regs[leg * 4]) {
            move_leg(leg, regs[leg * 4 + 1],
                          regs[leg * 4 + 2],
                          regs[leg * 4 + 3]);
            regs[leg * 4] = 0;
        }
    }
}
