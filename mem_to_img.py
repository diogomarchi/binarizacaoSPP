

import cv2 as cv
import os 
import numpy as np
from matplotlib import pyplot as plt

WIDTH=8
DEPTH=4096

img = np.ndarray((64, 64), np.int8)


with open("resultado.mem", "r") as mem:
    
    print(mem.readline())
    print(mem.readline())
    print(mem.readline())
    
    
    for i in range(64):
        for j in range(64):
            line = mem.readline().replace("\n", "")            
            val = line.split(": ")[1]
            int_val = int(val,2)
                        
            
            img[i, j] = int_val / 255            
      
    
    print(img)
    
    plt.imshow(img, 'gray')
    plt.show()
    