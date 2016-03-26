from machine import delay


class Creep:
    speed = 0.75
    stride = 14
    shift = 8
    shift_steps = 2
    raise_leg = 10
    raise_steps = 2
    next_leg = (
        (2, 0, 3, 1),   # forward
        (1, 3, 0, 2),   # backward
        (1, 2, 3, 0),   # clockwise
        (3, 0, 1, 2),   # counter-clockwise
        (2, 3, 1, 0),   # left
        (3, 2, 0, 1),   # right
    )

    def __init__(self, robot):
        self.robot = robot
        self.shift_x = 0
        self.shift_y = 0
        self.on_ground = list(robot.legs)
        self.dx = 0
        self.dy = 1
        self.rotation = 0
        self.spread = 0
        leg = robot.legs[0]
        self.height = leg.tibia
        self.last_leg = 0

    def move(self):
        for leg in self.on_ground:
            dx = self.dx * leg.x_dir * self.speed
            dy = self.dy * leg.y_dir * self.speed
            leg.move_to(leg.x - dx, leg.y - dy, -self.height)
            #leg.rotate_by(-self.rotation * leg.x_dir * leg.y_dir / 2)
        delay(25)

    def step(self, leg):
        dx = (leg.x_dir * self.shift - self.shift_x) / self.shift_steps
        dy = (leg.y_dir * self.shift - self.shift_y) / self.shift_steps
        for step in range(self.shift_steps):
            self.robot.move_by(dx, dy, 0)
            self.shift_x += dx
            self.shift_y += dy
            self.move()
        self.on_ground.remove(leg)
        for step in range(self.raise_steps):
            leg.move_by(0, 0, self.raise_leg)
            self.move()
        leg.move_to(
            leg.home + (self.shift_x + self.dx *
                        self.stride) * leg.x_dir + self.spread,
            leg.home + (self.shift_y + self.dy *
                        self.stride) * leg.y_dir + self.spread,
            self.raise_leg * self.raise_steps - self.height
        )
        self.move()
        self.move()
        for step in range(self.raise_steps - 1):
            leg.move_by(0, 0, -self.raise_leg)
            self.move()
        self.on_ground.append(leg)
        self.move()

    def run(self, steps):
        for step in range(steps):
            leg = self.robot.legs[self.last_leg]
            self.step(leg)
            self.last_leg = self.next_leg[0][self.last_leg]
