FROM ubuntu:18.04

WORKDIR /tmp

RUN apt-get update && apt-get install -y tesseract-orc

RUN apt-get -y install wget

RUN wget -t 0 -c https://raw.githubusercontent.com/tesseract-ocr/tessdata/master/chi_sim.traineddata -o /usr/share/tesseract-ocr/4.00/tessdata/

CMD ["/bin/bash"]

# root@3edc811f24fc:~# tesseract 1111.jpg result -l chi_sim

#  `docker build -t gswyhq/tesseract-orc-chi-sim -f Dockerfile  . `

# `docker run -v $PWD:/tmp --rm -it gswyhq/tesseract-orc-chi-sim tesseract 1111.jpg result -l chi_sim+eng`
