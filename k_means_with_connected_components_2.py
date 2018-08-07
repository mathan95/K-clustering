# -*- coding: utf-8 -*-
"""
Created on Tue Jul  3 11:29:13 2018

@author: MathanP
"""

import numpy as np
from matplotlib import pyplot as plt
import matplotlib.image as mpimg
import cv2

img=mpimg.imread("dog.jpg")
A=img/255
plt.figure(1)

ish=A.shape
X=np.zeros((ish[0]*ish[1],4),np.float32)
temp_1=np.zeros((ish[0],ish[1]),np.float32)
for i in range(0,ish[0],1):
    for j in range(0,ish[1],1):
        temp_1[i,j]=(i+j)/300
        
temp_1=np.reshape(temp_1,(ish[0]*ish[1]))
A_new=np.reshape(A,(ish[0]*ish[1],ish[2]))

X[:,0:3]=A_new
X[:,3]=temp_1


X_1=np.float32(X)
# Define criteria = ( type, max_iter = 10 , epsilon = 1.0 )
criteria = (cv2.TERM_CRITERIA_MAX_ITER, 50, 1.0)
# Set flags (Just to avoid line break in the code)
flags = cv2.KMEANS_RANDOM_CENTERS
# Apply KMeans
ret,labels,centers = cv2.kmeans(X_1,20,None,criteria,50,flags)

for i in range(0,len(centers),1):
    err=centers[i,0:3]-[0,1,0]
    err=np.sum(np.multiply(err,err))
    if err<0.6:
        centers[i,:]=0

centers=np.uint8(centers*255)

centers=centers[:,0:3]
res = centers[labels.flatten()]
res2 = np.reshape(res,(ish[0],ish[1],ish[2]))
plt.imshow(res2)


