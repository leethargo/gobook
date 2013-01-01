pngs := $(patsubst %.svg,%.png,$(wildcard *.svg))

%.png: %.svg
	inkscape -D --export-area-snap --export-png=$@ $<
#	pdfcrop $@ output.pdf && mv output.pdf $@

all:	${pngs}

clean:  
	rm -f *.png
