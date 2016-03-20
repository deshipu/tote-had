IMAGES=\
	tote.png \
	animate.png \
	leg01.png \
	leg02.png \
	leg03.png \
	leg04.png \
	leg05.png \
	leg06.png \
	body01.png

SIZE=1280,960
COLORSCHEME=BeforeDawn
SCAD=openscad --imgsize=$(SIZE) --projection=p -m make --colorscheme=$(COLORSCHEME) --csglimit=100000

all: images

clean:
	rm -f -- $(IMAGES)

images: $(IMAGES)

%.png: %.scad
	$(SCAD) -o $@ $<

animate.png: animate.scad
	$(SCAD) -o $@ $< --camera=0,0,-50,62,0,321.30,611.97

tote.png: tote.scad
	$(SCAD) -o $@ $< --camera=12.40,-17.13,-29.65,45.90,0,30.60,401.52

leg01.png: leg01.scad
	$(SCAD) -o $@ $< --camera=-1.92,-18.06,-20.22,34.70,0.00,109.00,172.84

leg02.png: leg02.scad
	$(SCAD) -o $@ $< --camera=-0.16,-8.64,-22.91,302.30,0.00,91.50,172.84

leg03.png: leg03.scad
	$(SCAD) -o $@ $< --camera=20.82,7.64,-8.29,227.90,0.00,340.20,140

leg04.png: leg04.scad
	$(SCAD) -o $@ $< --camera=-7.04,-32.28,-40.40,48.70,0.00,27.10,237.09

leg05.png: leg05.scad
	$(SCAD) -o $@ $< --camera=0,0,0,41,0,191,172

leg06.png: leg06.scad
	$(SCAD) -o $@ $< --camera=25,25.69,-25.98,53,0,202,292

body01.png: body01.scad
	$(SCAD) -o $@ $< --camera=-2,0,-12,230,0,253,238
