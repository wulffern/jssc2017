
# JSSC - a paper
Back in 2016 I was invited to Journal of Solid State Circuits with the paper "A Compiled 9-bit 20-MS/s 3.5-fJ/conv.step SAR ADC in 28-nm FDSOI for Bluetooth
Low Energy Receivers" based on an ESSCIRC publication that we did that year.

This is the latex files I used to generate that paper.

At the time I wrote this paper, I really went all in, and tried to make all
graphics really shine. That meant all
figures, including the layout was generated either directly to eps, or to tikz.

However, to generate the tikz code, and the eps from the layout you need
ciccreator installed, and you need latex, and epstool and a buch of other stuff.
Also, turns out the way I made eps, as JSSC requires embedded fonts, does not
work in texlive 2020 (dvips is broken somehow), which mean, I could not even
make the latex on my mac anymore.

The cool thing, however, is that since 2016, things have evolved, and Docker has
arrived (https://www.docker.com), which makes the setup much, much easier. 

So, if you want to make the pdf, clone this repo, cd to the `docker` folder, and
run `make`


## Status

| Version | Changelog | Comment |
| :-: | :-: | :-: |
| 0.2.0 | Fix bounding box for figures with layout | |
| 0.1.0 | Initial release | The bounding box for some of the EPS is fubar, don't know why|
