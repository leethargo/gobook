.PHONY: once spell compilecheck fmtcheck


all:	go.html

go.html: go.pandoc preface.pandoc contributors.pandoc ex-*/*.pandoc
	perl insert go.pandoc | pandoc -N --bibliography=go.bib -s -S -t html -o go.html

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

distclean: clean
	( cd fig; make clean )
	( cd tab; make clean )
	( cd src; make clean )

spell:
	for i in *.tex ex-*/*.tex; do aspell check $$i; done
once:	
	xelatex go.tex

compilecheck:
	@bin/go-lstinputlisting.pl ~/git/gobook   *.tex
	@bin/go-lstinputlisting.pl ~/git/gobook   ex-*/*.tex
	@bin/go-lstinputlisting.pl ~/git/gobook   fig/*.tex
	@rm -f *.6 *.8

fmtcheck:
	@bin/go-lstlisting.pl *.tex
	@bin/go-lstlisting.pl ex-*/*.tex
	@bin/go-lstlisting.pl fig/*.tex
