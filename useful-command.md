# useful commands

## hide current working directory in terminal temporarily

```sh
echo $PS1
export PS1="\u > "
export PS1="\u@\h$ "
```

## Open a software (like .pdf or .png etc) with the command line

```sh
xdg-open SoftwareName
```

## clean the powershell history

```ps1
Remove-Item (Get-PSReadlineOption).HistorySavePath
```
