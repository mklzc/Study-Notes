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

## clean the powershell history (Windows)

```ps1
Remove-Item (Get-PSReadlineOption).HistorySavePath
```

## Fix the problem of ScLk in Ubuntu

It's likely to get an error when opening the keyboard light.
Use the following command to fix the problem.

The first line is to open the keyboard light and the second is to close the keyboard light.

```sh
xset led named 'Scroll Lock'
xset -led named 'Scroll Lock'
```
