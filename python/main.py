import network
import server

wlan = network.WLAN(network.STA_IF)
ap = network.WLAN(network.AP_IF)
while not wlan.isconnected() and not ap.isconnected():
    pass

server.main()
