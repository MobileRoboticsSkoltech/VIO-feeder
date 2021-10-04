import pandas as pd 
import sys


data = pd.read_csv('../evaluation/f_'+str(sys.argv[1])+'_monoi.txt', sep=" ", header = None)
data[0] /= 10**9
data.to_csv('../evaluation/f_'+str(sys.argv[1])+'_monoi.txt', header=None, index=None, sep=' ', mode='a')
