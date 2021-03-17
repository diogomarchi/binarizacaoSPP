

import cv2 as cv
import os 
import numpy as np
import time

im = cv.imread("placa_64x64.jpg")

gray = cv.cvtColor(im, cv.COLOR_BGR2GRAY)

start = time.time()

i = 0
j = 0
for i in range(64):
    for j in range(64):
        
        if gray[i,j] < 128:
            gray[i, j] = 0
        else:
            gray[i, j] = 255
        
        j += 1
       
    i += 1   
    
end = time.time()
print(end - start)