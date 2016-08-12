#!/bin/bash -e

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

# redirect to the demo
echo "<META http-equiv=refresh content=\"0;URL=bower_components/$repo/demo/\">" > index.html

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
