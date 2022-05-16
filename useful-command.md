**hide current working directory in terminal temporarily**
```console
echo $PS1
export PS1="\u > "
export PS1="\u@\h$ "
```

**Open a software (like .pdf or .png etc) with the command line**
```console
xdg-open SoftwareName
```
**clean the powershell history**
```console
Remove-Item (Get-PSReadlineOption).HistorySavePath
```