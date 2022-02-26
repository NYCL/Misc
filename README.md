# Misc
Just a simple record of all useful commands


### Re-install all
```
rm -rf node_modules
npm install && npm run dev
rm -rf vendor
composer install
```

### Clean git branches only keep master and upstream/master
```
git checkout . && git clean -fd
git checkout master
git fetch origin
git branch -r | grep origin/ | grep -v 'master$' | grep -v HEAD | cut -d/ -f2 | while read line; do git push origin :$line; done;
git branch -r | grep -v HEAD | xargs git branch -dr
git branch | xargs git branch -D
git branch -dr origin/HEAD
git pull --rebase upstream master
git branch -a
```
