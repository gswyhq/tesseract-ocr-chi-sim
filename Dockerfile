FROM ubuntu:18.04

WORKDIR /tmp

RUN apt-get update && apt-get -y install tesseract-ocr

RUN apt-get -y install wget

RUN wget -t 0 -c https://raw.githubusercontent.com/tesseract-ocr/tessdata/master/chi_sim.traineddata -O /usr/share/tesseract-ocr/4.00/tessdata/chi_sim.traineddata

CMD ["/bin/bash"]

# root@6c6656292234:~# tesseract --version
# tesseract 4.0.0-beta.1

# root@3edc811f24fc:~# tesseract 1111.jpg result -l chi_sim

#  `docker build --no-cache -t gswyhq/tesseract-ocr-chi-sim -f Dockerfile  . `

# `docker run -v $PWD:/tmp --rm -it gswyhq/tesseract-ocr-chi-sim tesseract /tmp/1111.jpg /tmp/result -l chi_sim+eng`
