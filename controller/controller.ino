#include "misc.h"
#include "servos.h"
#include "leg.h"
#include "i2c.h"

void setup() {
    servo_setup();
    i2c_setup();
}

void loop() {
    delay(100);
    i2c_loop();
}
