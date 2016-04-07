from pyb import delay


class Creep:
    speed = 1
    stride = 14
    shift = 8
    shift_steps = 2
    raise_leg = 10
    raise_steps = 3

    def __init__(self, robot):
        self.robot = robot
        self.shift_x = 0
        self.shift_y = 0
        self.on_ground = set(robot.legs)
        self.dx = 0
        self.dy = 1
        self.rotation = 0
        self.spread = 0
        self.height = 0
        self.last_leg = 0

    def move(self):
        for leg in self.on_ground:
            dx = self.dx * leg.x_dir * self.speed
            dy = self.dy * leg.y_dir * self.speed
            leg.move_to(leg.x - dx, leg.y - dy, -self.height)
            leg.rotate_by(-self.rotation * leg.x_dir * leg.y_dir / 2)

    def step(self, leg):
        dx = (leg.x_dir * self.shift - self.shift_x) / self.shift_steps
        dy = (leg.y_dir * self.shift - self.shift_y) / self.shift_steps
        for step in range(self.shift_steps):
            self.robot.move_by(dx, dy, 0)
            self.shift_x += dx
            self.shift_y += dy
            yield
        self.on_ground.remove(leg)
        for step in range(self.raise_steps):
            leg.move_by(0, 0, self.raise_leg)
            yield
        leg.move_to(
            (self.shift_x + self.dx * self.stride) * leg.x_dir + self.spread,
            (self.shift_y + self.dy * self.stride) * leg.y_dir + self.spread,
            self.raise_leg * self.raise_steps - self.height
        )
        yield
        yield
        for step in range(self.raise_steps - 1):
            leg.move_by(0, 0, -self.raise_leg)
            yield
        self.on_ground.add(leg)
        yield

    def step_order(self):
        if abs(self.dy) > abs(self.dx):
            if self.dy > 0:
                return (2, 0, 3, 1)   # forward
            else:
                return (1, 3, 0, 2)   # backward
        elif abs(self.dx) > abs(self.dy):
            if self.dx < 0:
                return (2, 3, 1, 0)   # left
            else:
                return (3, 2, 0, 1)   # right
        elif abs(self.rotation) > 0.001:
            if self.rotation > 0:
                return (1, 2, 3, 0)   # clockwise
            else:
                return (3, 0, 1, 2)   # counter-clockwise
        return (2, 0, 3, 1)   # forward


    def run(self):
        while True:
            leg = self.robot.legs[self.last_leg]
            for frame in self.step(leg):
                self.move()
                self.robot.update()
                delay(40) # 25 FPS
                yield
            self.last_leg = self.step_order()[self.last_leg]
