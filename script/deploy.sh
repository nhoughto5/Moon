#!/usr/bin/env bash

echo "===  DEPLOYING  ===="
#set -o errexit -o nounset
#echo $TRAVIS_BRANCH
#
#if [ "$TRAVIS_BRANCH" != "master" ]
#then
#  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
#  exit 0
#fi
#
#rev=$(git rev-parse --short HEAD)
#
#cd _site
#
#git init
#git config user.name "Nick Houghton"
#git config user.email "nhoughto5@gmail.com"
#
#git remote add upstream "https://$GH_TOKEN@github.com/nhoughto5/PhillsBlog.git"
#git fetch upstream
#git reset upstream/gh-pages
#
#echo "https://nhoughto5.github.io/PhillsBlog/" > CNAME
#
#touch .
#
#git add -A .
#git commit -m "rebuild pages at ${rev}"
#git push -q upstream HEAD:gh-pages
