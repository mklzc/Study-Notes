# Visual studio code problems

## No such file or directory(python)

When using python command like 'with open(file) as file_object', it is likely to return a error: 'No such file or directory'.

```text
Enabling the 'extensions > Python > Ececute in the file terminal' in the vs-code settings can fix the problem.
```

## import error in the virtual environment(python)

vs-code pylance extensions report an 'import error' hint when code in a virtual environment.

```text
search python.analysis.extraPaths in the settings.
Add venv/lib/……/site-packages to the list.
And then restart vs-code.
```

## vscode extension: Markdownlint configuration

The following is my configuration of vs-code extension: markdownlint.

```json
"markdownlint.config": {
        // Multiple headings with the same content: allow
        "MD024": false,
        // Inline html: allow
        "no-inline-html": false
    },
```
