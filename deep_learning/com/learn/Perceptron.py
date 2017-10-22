# coding=UTF-8
'''
Created on 2017年10月22日

@author: xunin
'''
import numpy as np
import matplotlib.pyplot as plt

#输入数据
X = np.array([[1,3,3],
              [1,4,3],
              [1,1,1]])

#标签
Y = ([1,1,-1])

#权值初始化，1行3列，取值范围-1到1
W = (np.random.random(3)-0.5)*2
print(W)

#学习率设置
lr = 0.11

#计算迭代次数
n = 0

#神经网络输出
O = 0

def update():
    global X,Y,W,lr,n
    n+=1
    O = np.sign(np.dot(X,W.T))
    W_C = lr*((Y-O.T).dot(X)/int(X.shape[0]))
    W = W + W_C
for __ in range(100):
    update()#更新权值
    print(W)#打印当前权值
    print(n)#打印迭代次数
    O = np.sign(np.dot(X,W.T))
    if(O == Y.T).all():
        print("Finished")
        print("ecpoch",n)
        break
#正权值
x1 = [3,4]
y1 = [3,3]
#负权值
x2 = [1]
y2 = [1]

#计算分界线的斜率及截距
k = -W[1]/W[2]
d = -W[0]/W[2]

xdata = np.linspace(0,5)

plt.figimage()
plt.plot(xdata,xdata*k+d,'r')
plt.plot(x1,y1,'bo')
plt.plot(x2,y2,'yo')
plt.show()
