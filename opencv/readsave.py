import cv2 

img = cv2.imread('data/loro.jpg')
cv2.imshow('prueba de imagen',img)
#si queremos guardar
# cv2.imwrite('copia.jpg',img)
cv2.waitKey(0)
cv2.destroyAllWindows()