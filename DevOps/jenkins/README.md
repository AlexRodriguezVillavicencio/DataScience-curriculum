## Job de Jenkins:

- Permite ejecución de horas determinadas
- Mover, copiar, subir, descargar archivos de fuentes remotas
- Permite ejecución de horas determinadas
- Ejecución en base a eventos 
- Ejecución ditribuida en varias maquinas
- Realizar un backup
- Ejecutar smoking test
- Ejecutar test sobre una rama de código
- Permite interactuar con sistemas que tena CLI
- Permite compilar y desplegar código en ambientes



## Usando Jenkins desde el cli de doker:
```
sudo docker pull jenkins/jenkins:alpine
sudo docker run -d --name jenkinsAlex -p 8080:8080 -p 50000:50000 -v jenkins_home:var/jenkins_home jenkins/jenkins:alpine
```
- Ir al navegador : http://localhost:8080  (nos pide una contraseña)
- Entramos al contenedor para ver la contraseña que se nos asignó:
```
sudo docker exec jenkinsAlex cat /var/jenkins_home/secrets/initialAdminPassword
```

## Usando Jenkins con docker compose:
- Revisar los ejemplos

Referencia: 
[Tutorial Jenkins-Docker](https://aprendevops.com/instalar-jenkins-en-docker)
[curso jenkis](https://www.youtube.com/playlist?list=PLdOotbFwzDIiU4Hs8ySZr-phOeGMBY_3D)
