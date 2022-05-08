```console
$ sudo docker run -it -d --name learninglog -p 80:8000 django_docker_img:v1
$ sudo docker ps
```
Type in to start the container and the project. 
```
$ sudo docker exec -it learninglog /bin/bash 
$ python3 manage.py runserver
```