#!/usr/bin/env python
# -*- coding: utf-8 -*-

import socket
import sys

import pygame


pygame.init()
pygame.display.set_mode((100, 100))

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((sys.argv[1], 1010))
sock.setblocking(False)

while True:
    event = pygame.event.wait()
    if event.type == pygame.KEYDOWN:
        key = event.key
        if key == pygame.K_UP:
            sock.send("w")
        elif key == pygame.K_DOWN:
            sock.send("s")
        elif key == pygame.K_LEFT:
            sock.send("a")
        elif key == pygame.K_RIGHT:
            sock.send("d")
        elif key == pygame.K_SPACE:
            sock.send(" ")
        elif key == pygame.K_ESCAPE:
            break
    elif event.type == pygame.QUIT:
        break
sock.close()
