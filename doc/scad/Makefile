IMAGES=\
	tote.png \

SIZE=1280,960
SCAD=openscad --imgsize=$(SIZE) --projection=p -m make

all: images

clean:
	rm -f -- $(IMAGES)

images: $(IMAGES)

%.png: %.scad
	$(SCAD) -o $@ $<

tote.png: tote.scad
	$(SCAD) -o $@ $< --camera=12.40,-17.13,-29.65,45.90,0,30.60,401.52
