#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add .
git commit -m "New Deployment"

git push -f git@github.com:christophbrauer/movie-app-vue.git main:gh-pages

cd -