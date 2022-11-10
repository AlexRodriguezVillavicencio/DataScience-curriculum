import gzip
import os
from os.path import isfile, join
import numpy as np
import matplotlib.pyplot as plt 

mnist_path = './data/mnist_raw/'

# listamos los archivos contenidos en la ruta
def list_file(mnist_path):
    return [join(mnist_path,f) for f in os.listdir(mnist_path) if isfile(join(mnist_path,f))]


# traemos las rutas de las imagenes
def get_images(mnist_path):
    for f in list_file(mnist_path=mnist_path):
        if 'train-images' in f:
            with gzip.open(f,'rb') as data:
                _ = int.from_bytes(data.read(4),'big')
                num_images = int.from_bytes(data.read(4),'big')
                rows = int.from_bytes(data.read(4),'big')
                cols = int.from_bytes(data.read(4),'big')
                train_images = data.read()
                x_train = np.frombuffer(train_images, dtype=np.uint8)
                x_train = x_train.reshape((num_images,rows,cols))
        elif 'train-labels' in f:
            with gzip.open(f,'rb') as data:
                train_labels = data.read()[8:]
                y_train = np.frombuffer(train_labels,dtype=np.uint8)
        elif 't10k-images' in f:
            with gzip.open(f,'rb') as data:
                _ = int.from_bytes(data.read(4),'big')
                num_images = int.from_bytes(data.read(4),'big')
                rows = int.from_bytes(data.read(4),'big')
                cols = int.from_bytes(data.read(4),'big')
                train_images = data.read()
                x_test = np.frombuffer(train_images, dtype=np.uint8)
                x_test = x_test.reshape((num_images,rows,cols))
        elif 't10k-labels' in f:
            with gzip.open(f,'rb') as data:
                test_labels = data.read()[8:]
                y_test = np.frombuffer(test_labels,dtype=np.uint8)
    
    return x_train,y_train,x_test,y_test

# imagenes
def plot_number(image):
    plt.imshow(image.squeeze(),cmap=plt.get_cmap('gray'))
    plt.axis('off')