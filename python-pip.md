**set up python2-pip**
```console
$ sudo apt update
$ sudo apt install python3-pip
$ pip3 --version
```
**Use a domestic source with parameter -i like:**
```console
$ pip install package -i https://pypi.tuna.tsinghua.edu.cn/simple

Change the download source permanently:
$ pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple/
```

**Check the install list**
```console
$ pip list
```