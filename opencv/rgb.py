import cv2
import numpy as np
'''
Numpy usa opencv para la representación de imágenes com matrices.
Cuando leemos una imagen en opencv, el orden de los colores es BGR (azul, verde, rojo), pero si 
queremos modificar estos valores de estos canales lo convertimos en 
una matriz BGR.
'''

# bgr = np.zeros((300,300,3),dtype=np.uint8)
# bgr[:,:,:] = (255,0,100) 

# cv2.imshow('BGR',bgr)
# cv2.waitKey(0)
# cv2.destroyAllWindows()


bgr = cv2.imread('data/loro.jpg')
# canal1 = bgr[:,:,0]
# canal2 = bgr[:,:,1]
# canal3 = bgr[:,:,2]
canal1,canal2,canal3 = cv2.split(bgr)
cv2.imshow('Imagen en BGR',np.hstack([canal1,canal2,canal3]))

rgb = cv2.cvtColor(bgr,cv2.COLOR_BGR2RGB)
canal1 = rgb[:,:,0]
canal2 = rgb[:,:,1]
canal3 = rgb[:,:,2]
print(rgb[:,:,0])
cv2.imshow('Imagen en RGB',np.hstack([canal1,canal2,canal3]))

cv2.waitKey(0)
cv2.destroyAllWindows()