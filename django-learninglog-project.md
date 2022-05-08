**set up django(build a virtual environment)**
```console
$ pip install --user virtualenv
$ mkdir learning-log
learning-log$ python3 -m virtualenv ll-env
$ source ll-env/bin/activate
(ll-env)learning-log$ pip install Django
(ll-env)learning-log$ django-admin startproject llog .
```
In Windows, you can allow run scripts by type in
```
$ Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```
**set up database**
```console
(ll-env)learning-log$ python3 manage.py migrate
(ll-env)learning-log$ python3 manage.py runserver
```
p.s The default port is 8000.
**set application**
Switch to another bash
```console
learning-log$ source ll-env/bin/activate
learning-log$ python3 manage.py startapp llogs
```
**update database**
After modifying managing data in models.py
```console
(ll-env)learning-log$ python3 manage.py makemigrations llogs
(ll-env)learning-log$ python3 manage.py migrate
```
**create super user**
```console
(ll-env)learning-log$ python3 manage.py createsuperuser
```
Then you can login in "127.0.0.1:8000/admin"
**Access to interactive terminals**
```console
(ll-env)learning-log$ python3 manage.py shell
```