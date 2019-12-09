#!/bin/bash

# Following the initial set described at: https://bookdown.org/yihui/bookdown/github.html

cd book-output
git checkout gh-pages
git pull
git rm -rf *
cp -r ../_book/* ./
git add --all *
git commit -m "Update the book"
git push -q origin gh-pages
