# python

## python-pip

```shell
sudo apt update
sudo apt install python3-pip
pip3 --version
```

Use a domestic source with parameter -i like：

```shell
pip install package -i https://pypi.tuna.tsinghua.edu.cn/simple
```

Change the download source permanently：

```shell
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple/
```

Check the installed list：

```shell
pip list
```
