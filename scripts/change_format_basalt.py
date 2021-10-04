import pandas as pd
import sys
import numpy as np

data = pd.read_csv('../evaluation/trajectory.csv', header = None)
data.drop(index=data.index[0], 
        axis=0, 
        inplace=True)
data=data.astype(float)
print(data)

data[0] /= 10**9

data.to_csv('../evaluation/f_'+str(sys.argv[1])+'_monoi.txt', header=None, index=None, sep=' ', mode='a')
