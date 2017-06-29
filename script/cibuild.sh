#!/usr/bin/env bash
echo "Running CIBuild.sh script"
echo "=== Execute Jekyll Contentful"
bundle exec jekyll contentful || echo "Failed to exec jekyll contentful"
echo "Execute postToData"
ruby script/postToData.rb || echo "Failed to run postToData"
echo "Finishd postToData"
bundle exec jekyll build
