import os
# import scikit learn
import pandas as pd
import numpy as np 
import matplotlib.pyplot as plt
#import matplotlib as mpl
#from sklearn import datasets

## alternative methods:
#LV = datasets.load_digits('LasVegas.csv')

os.chdir('/Users/andiedonovan/myProjects/LasVegas/')
lv = pd.read_csv('LasVegas.csv', delimiter=';', encoding = "utf-8", header = 0) 

### figure out how to randomize data: random.random()


# Exploratory Analysis:
#print(lv.data)
#print(lv.target)
#print(lv.digits)
#print(lv.keys)
print(lv.describe()) # statistics
#print(lv.tail(5)) # tail of data
#print(lv.shape)
print(lv.head(5))# head of data

# variables for machine learning

cols = ['Pool', 'Gym', 'Tennis court', 'Spa', 'Casino', 'Free internet', 'Hotel stars']

plt.scatter(lv, x=cols, y='Hotel stars')