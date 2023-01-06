import cv2 

#0 nos indica la camara, si tendriamos otra usariamos 1 y así ....
capture = cv2.VideoCapture(0)
# configuramos la salida del video
# output = cv2.VideoWriter('Salida_video.mp4',cv2.VideoWriter_fourcc(*'XVID'),20,(640,480))

while (capture.isOpened()):
    response, imageArray = capture.read()
    print(response)
    print(imageArray)
    if response:
        cv2.imshow('video',imageArray)
        # output.write(imageArray) # guardamos el video
        # 0xFF : si estamos en una maquina de 64
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
    else:
        break

capture.release()
output.release()
cv2.destroyAllWindows()
