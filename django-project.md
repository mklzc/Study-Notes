# My django project Learning-Log

## set up django(build a virtual environment)

```sh
pip install --user virtualenv
mkdir learning-log
learning-log$ python -m virtualenv ll-env
source ll-env/bin/activate
(ll-env)learning-log$ pip install Django
(ll-env)learning-log$ django-admin startproject llog .
```

In Windows, you can allow run scripts by type in

```sh
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

## set up database

```sh
(ll-env)learning-log$ python manage.py migrate
(ll-env)learning-log$ python manage.py runserver
```

p.s The default port is 8000.

## set application

Switch to another bash

```sh
learning-log$ source ll-env/bin/activate
learning-log$ python manage.py startapp llogs
```

## update database

After modifying managing data in models.py

```sh
(ll-env)learning-log$ python manage.py makemigrations llogs
(ll-env)learning-log$ python manage.py migrate
```

## create super user

```sh
(ll-env)learning-log$ python manage.py createsuperuser
```

Then you can login in "127.0.0.1:8000/admin"

## Access to interactive terminals

```sh
(ll-env)learning-log$ python manage.py shell
```

## Deploy by docker

```sh
sudo docker run -it -d --name learninglog -p 80:8000 django_docker_img:v1
sudo docker ps
```

Type in to start the container and the project.

```sh
sudo docker exec -it learninglog /bin/bash 
python manage.py runserver
```
