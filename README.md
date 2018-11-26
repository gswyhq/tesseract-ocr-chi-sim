
从图像中提取中文文字

构建镜像：

`docker build --no-cache -t gswyhq/tesseract-ocr-chi-sim-alpine -f Dockerfile-alpine  .`

使用构建的镜像提取文本：

`docker run -v $PWD:/tmp --rm -it gswyhq/tesseract-ocr-chi-sim-alpine tesseract /tmp/1111.jpg /tmp/result -l chi_sim+eng`

或 `docker run -v $PWD:/tmp --rm -it gswyhq/tesseract-ocr-chi-sim-alpine python3 /root/start.py /tmp/1111.jpg`
