IMAGES=\
	tote.png \

SIZE=1280,960
SCAD=openscad --imgsize=$(SIZE) --projection=p -m make --colorscheme=BeforeDawn

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
