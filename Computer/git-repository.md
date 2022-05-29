# Git usage

## Config user information

```sh
git config --global user.name "user"
git config --global user.email "userexample.com"
```

## Open a remote repository

```sh
git remote add origin git@github.com:mklzc/mklzc.git
git pull origin master
git push origin master
```

## Commit a change

```sh
git add .
git commit -m 'message'
git push origin master
```

## Configure a fork repository

```sh
git remote add upstream git@github.com:operapeking/blog-hexo.
git checkout master
git merge upstream/master
git push origin master
```
