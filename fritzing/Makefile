FRITZING=fritzing
PCBS=pcb-had.zip

all: $(PCBS)

clean:
	rm -f $(PCBS)
	rm -rf gerber

%.zip: %.fzz
	mkdir -p gerber
	$(FRITZING) $< -gerber gerber
	mv gerber/$*_contour.gm1 gerber/$*_outline.gbr
	zip -0 -m -j $@ gerber/*
	rmdir --ignore-fail-on-non-empty gerber
