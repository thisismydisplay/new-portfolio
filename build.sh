#!/bin/bash
set -exo pipefail

echo "$1"
if [[ -z "$1" ]]; then
    echo 'no version number specified'
    exit 1
fi

npm install
NODE_ENV=production npm run build
mv dist ..
git checkout gh-pages
rm -rf ./*
mv ../dist/* ./
git add .
git commit -m "$1"
git push
git checkout main
