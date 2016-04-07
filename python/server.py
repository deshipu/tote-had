import socket
import math

from robot import Robot
from gait import Creep


def main():
    sock = socket.socket()
    addr = socket.getaddrinfo("0.0.0.0", 1010)[0][4]
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    sock.setblocking(False)
    sock.bind(addr)
    sock.listen(0)

    robot = Robot()
    gait = Creep(robot)

    while True:
        client, addr = sock.accept()
        client.setblocking(False)
        for frame in gait.run():
            command = client.read(1)
            if command == b' ':
                gait.dx = 0
                gait.dy = 0
                gait.rotation = 0
            elif command == b'w':
                gait.dy = min(3, gait.dy + 0.25)
            elif command == b's':
                gait.dy = max(-3, gait.dy - 0.25)
            elif command == b'a':
                gait.rotation = min(math.pi/90, gait.rotation + math.pi/360)
            elif command == b'd':
                gait.rotation = max(-math.pi/90, gait.rotation - math.pi/360)



