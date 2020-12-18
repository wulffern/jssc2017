######################################################################
## FMakefile
## Created at    : Sun Jan 17 22:01:58 2010
## Modified at   :  Sun Jan 17 22:01:59 2010
## URL           : $HeadURL$ 
## Author        : $Author$
## Revision      : $Revision$
######################################################################




DOC=jssc2016

latex:
	-rm ${DOC}.pdf
	latex ${DOC}
	bibtex ${DOC}
	latex ${DOC}
	latex ${DOC}
	dvipdf ${DOC}

ieee:
	pdflatex ${DOC}
	bibtex	${DOC}
	pdflatex ${DOC}
	pdflatex ${DOC}

gray:
	gs -sOutputFile=${DOC}_gray.pdf -sDEVICE=pdfwrite -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dCompatibilityLevel=1.4 -dNOPAUSE -dBATCH ${DOC}.pdf

clean:
	-rm *.bbl
	-rm *.aux
	-rm *.log
	-rm *.blg
	-rm *.dvi
	-rm *.fff
	-rm *.lof
	-rm *.lot
	-rm *.ttt

