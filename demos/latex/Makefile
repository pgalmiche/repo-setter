PDF_FILE := demo.pdf
all: $(PDF_FILE)
$(PDF_FILE): demo.tex
	pdflatex $<
	bibtex $(basename $<)
	pdflatex $<
	pdflatex $<
clean:
	rm -f *.bcf *.run.xml *.aux *.bbl *.blg *.log *.out *.nav *.snm *.toc $(PDF_FILE)
