
FROM thomasweise/docker-texlive-full:latest

RUN apt-get update && apt-get install -y git

WORKDIR /home
RUN git clone https://github.com/wulffern/jssc2017.git
WORKDIR /home/jssc2017
RUN git submodule init
RUN git submodule update
