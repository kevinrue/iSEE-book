#!/bin/bash

# Following the initial set described at: https://bookdown.org/yihui/bookdown/github.html
# Then run "bash _deploy.sh" to recompile the book and deploy it to GitHub Pages.

Rscript -e "rmarkdown::render_site(encoding = 'UTF-8')"
cd book-output
git checkout gh-pages
git pull
git rm -rf *
cp -r ../_book/* ./
git add --all *
git commit -m "Update the book"
git push -q origin gh-pages
