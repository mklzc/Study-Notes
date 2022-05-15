**hide current working directory in terminal temporarily**
```console
echo $PS1
export PS1="\u > "
export PS1="\u@\h$ "
```