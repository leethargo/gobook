pngs := $(patsubst %.svg,%.png,$(wildcard *.svg))

%.png: %.svg
	inkscape --export-png=$@ $<
#	pdfcrop $@ output.pdf && mv output.pdf $@

all:	${pngs}

clean:  
	rm -f *.png
