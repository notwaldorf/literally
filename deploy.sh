#!/bin/bash -e
#
# @license
# Copyright (c) 2016 The Polymer Project Authors. All rights reserved.
# This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
# The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
# The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
# Code distributed by Google as part of the polymer project is also
# subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
#

## Use this to deploy to github pages

org=notwaldorf
repo=literally

# make temp folder
echo making temporary folder deploy-temp...
mkdir ./deploy-temp
cd deploy-temp
echo done

# make folder (same as input, no checking!)
echo "cloning https://github.com/$org/$repo.git..."
mkdir $repo
git clone https://github.com/$org/$repo.git --single-branch
echo done

# switch to gh-pages branch
echo switching to orphan gh-pages branch
pushd $repo >/dev/null
git checkout --orphan gh-pages

# remove all content
git rm -rf -q .
echo removed all content

# get things from bower
echo getting things from bower...
bower cache clean
bower install $org/$repo
echo done

# copy the index.html for the demo out here
cp bower_components/$repo/index.html .

echo pushing to gh-pages...
# send it all to github
git add -A .
git commit -am 'seed gh-pages'
git push -u origin gh-pages --force

echo done

popd >/dev/null

echo cleaning up...
cd ..
rm -rf ./deploy-temp
echo done
