main="manuscript"

PDFLATEX = pdflatex
BIBTEX   = bibtex

all: pdf view clean

pdf:
	$(PDFLATEX) $(main)
	$(BIBTEX) $(main)
	$(PDFLATEX) $(main)
	$(PDFLATEX) $(main)

ps: pdf
	@pdf2ps $(main).pdf $(main).ps

view: ps
	@open $(main).pdf &> /dev/null &

clean:
	@rm -f *.dvi *.ps *.aux *.log *.bbl *.blg *~ *.bak *.out
