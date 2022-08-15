#!/bin/bash
if [ ! -d "./.git" ]; then
    echo "No git Repo"
    exit 1
fi

default_branch=""

if [ -z "$1" ]; then
    default_branch=master
else
    default_branch=$1
fi

git checkout . && git clean -fd
git checkout $default_branch
git fetch origin
git branch -r | grep origin/ | grep -v $default_branch'$' | grep -v HEAD | cut -d/ -f2 | while read line; do git push origin :$line; done;
git branch -r | grep -v HEAD | xargs git branch -dr
git branch | xargs git branch -D
git branch -dr origin/HEAD
git pull --rebase upstream $default_branch
git branch -a

exit 0
