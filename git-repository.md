# Git usage

## config user information

```sh
git config --global user.name "user"
git config --global user.email "userexample.com"
```

## open a remote repository

```sh
git remote add origin git@github.com:mklzc/mklzc.git
git fetch origin master
git merge FETCH_HEAD
git push origin master
```

## Commit a change

```sh
git add .
git commit -m 'message'
git checkout .
```
