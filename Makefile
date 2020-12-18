######################################################################
## FMakefile
## Created at    : Sun Jan 17 21:57:27 2010
## Modified at   :  Sun Jan 17 21:57:28 2010
## URL           : $HeadURL$ 
## Author        : $Author$
## Revision      : $Revision$
######################################################################


LIB = lib/
TEX = ../tex
EPS= ../eps
PDF = pdf/
DVIEPS = ../bin/doeps

CIC= ../ciccreator
ANALOGICUS= ../analogicus

.PHONY: eps delivery	 pdf

all: sarimg adcimg diimg sartex sim eps latex texpdf

texpdf:
	cd ${LIB}; ${MAKE} DOC=jssc2016 ieee gray

clean:
	cd ${LIB}; ${MAKE} clean
	cd eps; ${MAKE} clean
	-rm -rf pdf

eps:
	cd eps; ${MAKE} all
	cp graphics/wulff.eps graphics/trond.eps eps

latex:
	cd ${LIB}; ${MAKE} latex DOC=jssc2016

texpdfgray:
	cd ${LIB}; ${MAKE} gray DOC=jssc2016



allfigslist:
	cd ${PDF}; cat ../tex/compiled.sar.tex| egrep includegraphics |perl -ne ' s#^.*includegraphics.*{##ig; s#}+$$##ig; print $$_;'

sim:
	cd simulation_results; ${MAKE}

imgana:
	cd eps; ${CIC}/bin/cic2eps ${ANALOGICUS}/${CELL}.json ${CIC}/examples/tech_eps.json ${CELL}
	cd ${PDF}; epstopdf ../eps/${CELL}.eps -o ../pdf/${CELL}.pdf

sarimg:
	-mkdir pdf
	cd eps; ${CIC}/bin/cic2eps ${ANALOGICUS}/ALGIC001_SAR9B_CV.json ${CIC}/examples/tech_eps.json ALGIC001_SAR9B_CV
	cd ${PDF}; epstopdf ../eps/ALGIC001_SAR9B_CV.eps -o ../pdf/ALGIC001_SAR9B_CV.pdf
	cd eps; ${CIC}/bin/cic2eps ${CIC}/examples/SAR_ESSCIRC16_28N.json ${CIC}/examples/tech_eps.json SAR9B_EV
	cd ${PDF}; epstopdf ../eps/SAR9B_EV.eps -o ../pdf/SAR9B_EV.pdf

diimg:
	cd eps; ${CIC}/bin/cic2eps ${ANALOGICUS}/ALGIC003_STDLIB.json ${CIC}/examples/tech_eps.json DI_1V8_ST28N
	cd ${PDF}; epstopdf ../eps/DI_1V8_ST28N.eps -o ../pdf/DI_1V8_ST28N.pdf

adcimg:
	${MAKE} imgana CELL=ALGIC004_SAR9BXL_CV
	${MAKE} imgana CELL=ALGIC005_SAR9BXLC_CV
	${MAKE} imgana CELL=ALGIC006_SAR9B_CV

sartex:
	cd tex; ${CIC}/bin/cic2tikz ${CIC}/examples/legend.json ${CIC}/examples/tech_tikz_opaque.json legend
	cd tex; ${CIC}/bin/cic2tikz ${ANALOGICUS}/ALGIC001_SAR9B_CV.json ${CIC}/examples/tech_tikz_opaque.json SAR_ESSCIRC16_28N
	cat tex/SAR_ESSCIRC16_28N.tex | ./bin/fixtex > tex/SAR_ESSCIRC16_28N.tex_temp
	mv -f tex/SAR_ESSCIRC16_28N.tex_temp tex/SAR_ESSCIRC16_28N.tex

DATE = $(shell date +%Y-%m-%d)

DELI= delivery/wulff_${DATE}

delivery:
	-mkdir ${DELI}
	-rm -rf ${DELI}
	-rm delivery/wulff_${DATE}.zip
	cd lib;	../bin/delivery jssc2016.tex ../${DELI}
	mv ${DELI}/jssc2016.tex ${DELI}/FINAL_VERSION_TWOCOLUMN.tex
	cd ${DELI}; make
	cd ${DELI}; make DOC=FINAL_VERSION_TWOCOLUMN
	cd ${DELI}; make clean
	cd delivery; zip -r wulff_${DATE}.zip wulff_${DATE}
