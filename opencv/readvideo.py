import cv2 

capture = cv2.VideoCapture('Salida_video.mp4')

while (capture.isOpened()):
    response, imageArray = capture.read()
    print(response)
    print(imageArray)
    if response:
        cv2.imshow('video',imageArray)
        cv2.waitKey(60) # tiempo de visualización
    else:
        break

capture.release()
cv2.destroyAllWindows()
