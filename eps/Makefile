######################################################################
##        Copyright (c) 2016 Carsten Wulff Software, Norway 
## ###################################################################
## Created       : wulff at 2016-11-18
## ###################################################################
##   This program is free software: you can redistribute it and/or modify
##   it under the terms of the GNU General Public License as published by
##   the Free Software Foundation, either version 3 of the License, or
##   (at your option) any later version.
## 
##   This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY; without even the implied warranty of
##   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##   GNU General Public License for more details.
## 
##   You should have received a copy of the GNU General Public License
##   along with this program.  If not, see <http://www.gnu.org/licenses/>.
######################################################################

FIG=fig_prior_art \
	fig_timing \
	fig_diephoto  \
	fig_toplevel \
	fig_simulation \
	fig_dmos \
	fig_dmos_json \
	fig_capacitors_vertical \
	fig_saremx \
	fig_sar_logic \
	fig_core_measurements \
	fig_io10msps \
	fig_wideadcs \
	fig_comparator \
	fig_methodology \
	fig_process

DOEPS = ../bin/doeps
#DOEPS = echo

all:
	$(foreach f, ${FIG}, ${DOEPS} ${f};)

one:
	${DOEPS} 	${FILE}



clean:
	-rm *.bbl
	-rm *.aux
	-rm *.log
	-rm *.blg
	-rm *.eps
	-rm *.dvi
