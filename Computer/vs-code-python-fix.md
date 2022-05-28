# Fix python problems in the vs-code

## No such file or directory

When using python command like 'with open(file) as file_object', it is likely to return a error: 'No such file or directory'.

```text
Enabling the 'extensions > Python > Ececute in the file terminal' in the vs-code settings can fix the problem.
```

## import error in the virtual environment

vs-code pylance extensions report an 'import error' hint when code in a virtual environment.

```text
search python.analysis.extraPaths in the settings.
Add venv/lib/……/site-packages to the list.
And then restart vs-code.
```
