

import cv2 as cv
import os 
import numpy as np

WIDTH=8
DEPTH=4096

def cabecalho ():
    str_ret = ""
    str_ret += "-- begin_signature\n"
    str_ret += "-- ROM\n"
    str_ret += "-- end_signature\n"
    str_ret += "WIDTH="+str(WIDTH) + ";\n"
    str_ret += "DEPTH="+str(DEPTH) + ";\n"
    str_ret += "ADDRESS_RADIX=UNS;\n"
    str_ret += "DATA_RADIX=BIN;\n\n"
    str_ret += "CONTENT BEGIN\n"
    
    print(str_ret)
    
    return str_ret
    

def rodape():
    str_ret = ""
    str_ret += "\nEND;\n"
    
    print(str_ret)
    
    return str_ret
    
im = cv.imread("placa_64x64.jpg")

gray = cv.cvtColor(im, cv.COLOR_BGR2GRAY)

ret,thresh1 = cv.threshold(img,127,255,cv.THRESH_BINARY)


index = 0
with open("image.mif", "w") as mif:
    
    mif.writelines(cabecalho())

    for linha in gray:
        for pixel in linha:
            bin_value = bin(pixel).replace("0b", "")
            bin_value = bin_value.zfill(WIDTH)           
                        
            mif.writelines(str(DEPTH - index - 1) + ": " + bin_value + "; \n")
           
            print(DEPTH - index - 1, ": ", bin_value)
            index += 1
    
    
    mif.writelines(rodape())