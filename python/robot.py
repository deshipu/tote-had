from machine import I2C, Pin
from pyb import delay
import ustruct
import math


I2C_ADDRESS = 0x09


class Leg:
    base = 70  # cm from the center of the robot to the (0,0) of the leg

    def __init__(self, i2c, index, x_dir, y_dir):
        self.index = index
        self.i2c = i2c
        self.x = 0
        self.y = 0
        self.z = 0
        self.x_dir = x_dir
        self.y_dir = y_dir

    def move_to(self, x, y, z):
        self.x = min(127, max(-127, int(x)))
        self.y = min(127, max(-127, int(y)))
        self.z = min(127, max(-127, int(z)))

    def move_by(self, dx=0, dy=0, dz=0):
        self.move_to(self.x + dx, self.y + dy, self.z + dz)

    def rotate_by(self, radians):
        x = self.x + self.base
        y = self.y + self.base
        nx = x * math.cos(radians) - y * math.sin(radians) - self.base
        ny = x * math.sin(radians) + y * math.cos(radians) - self.base
        self.move_to(nx, ny, self.z)


class Robot:
    def __init__(self):
        self.i2c = I2C(sda=Pin(0), scl=Pin(2), freq=10000)
        self.legs = (
            Leg(self.i2c, 0, -1,  1),
            Leg(self.i2c, 1, -1, -1),
            Leg(self.i2c, 2,  1, -1),
            Leg(self.i2c, 3,  1,  1),
        )

    def move_by(self, dx=0, dy=0, dz=0):
        for leg in self.legs:
            leg.move_by(dx * leg.x_dir, dy * leg.y_dir, dz)

    def rotate_by(self, radians):
        for leg in self.legs:
            leg.rotate_by(radians)

    def update(self):
        data = ustruct.pack(
            "Bbbbbbbbbbbbb", 0,
            self.legs[0].x, self.legs[0].y, self.legs[0].z,
            self.legs[1].x, self.legs[1].y, self.legs[1].z,
            self.legs[2].x, self.legs[2].y, self.legs[2].z,
            self.legs[3].x, self.legs[3].y, self.legs[3].z,
        )
        while True:
            try:
                self.i2c.writeto(I2C_ADDRESS, data)
            except OSError:
                print("OSError!")
            else:
                break
            delay(20)
