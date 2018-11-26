#!/usr/bin/python3
# coding: utf-8

import sys
import jieba
import pytesseract
from PIL import Image

# python3 start.py /tmp/1111.jpg

def is_messy_code(text):
    """
    判断是否有中文乱码;;采用分词的方法, 乱码是不太可能成词的;正常结果一般在2以上, 乱码非常接近1, 可以认为1.2以下就是乱码
    :param text: 
    :return:  若是乱码则返回真，否则返回假。
    """
    if not text or not isinstance(text, str) or len(text) < 5:
        # 不是字符串，或字符数小于5，则不认为是乱码
        return False
    text = ''.join(text.split())  # 去除中间的各种空格
    return (len(text) + 0.1) / (len(jieba.lcut(text)) + 0.1) < 1.2



def main():
    image_file = sys.argv[1]

    # open image
    ret_str = ''
    with Image.open(image_file) as image:
        code = pytesseract.image_to_string(image, lang='chi_sim')
        for txt in code.split('\n'):
            if is_messy_code(txt):
                pass
            else:
                ret_str += '{} \n'.format(txt)
    print(ret_str)


if __name__ == '__main__':
    main()