from machine import I2C, Pin
import ustruct


class Robot:
    I2C_ADDRESS = 0x09

    def __init__(self):
        self.i2c = I2C(sda=Pin(0), scl=Pin(2))

    def leg_move_to(self, leg, x, y, z):
        data = ustruct.pack("Bbbbb", 4 * leg, 1, x, y, z)
        while True:
            try:
                self.i2c.writeto(self.I2C_ADDRESS, data)
            except OSError:
                pass
            else:
                break
