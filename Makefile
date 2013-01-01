.PHONY: once spell compilecheck fmtcheck


all:	go.html

go.html: *.pandoc ex-*/*.pandoc
	perl insert go.pandoc | pandoc --toc --chapters -N --bibliography=go.bib -c go.css -s -S -t html5 -o go.html

.fig:	fig/*.svg
	( cd fig; make all )
	touch .fig

.tab:	
	( cd tab; make all )
	touch .tab

clean:
	rm -f go.lol go.aux *.log map.log go.pdf go.bbl go.blg go.toc go.ind go.lot go.lof go.loe
	rm -f go.ilg go.idx go.lgpl missfont.log doc_data.txt go.ex .fig .tab
	rm -f go.code
	rm -f go.html

distclean: clean
	( rm .fig; cd fig; make clean )
	( rm .tab; cd tab; make clean )
	( cd src; make clean )

compilecheck:
	@bin/go-lstinputlisting.pl ~/git/gobook   *.tex
	@bin/go-lstinputlisting.pl ~/git/gobook   ex-*/*.tex
	@bin/go-lstinputlisting.pl ~/git/gobook   fig/*.tex
	@rm -f *.6 *.8

fmtcheck:
	@bin/go-lstlisting.pl *.tex
	@bin/go-lstlisting.pl ex-*/*.tex
	@bin/go-lstlisting.pl fig/*.tex
