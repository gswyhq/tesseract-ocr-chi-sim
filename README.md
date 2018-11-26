
从图像中提取中文文字

构建镜像：
`docker build -t gswyhq/tesseract-ocr-chi-sim -f Dockerfile  . `

使用构建的镜像提取文本：
`docker run -v $PWD:/tmp --rm -it gswyhq/tesseract-ocr-chi-sim tesseract 1111.jpg result -l chi_sim+eng`
