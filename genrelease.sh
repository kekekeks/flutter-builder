#!/bin/bash
set -x
set -e
git submodule status flutter
FLUTTER_ID=`git submodule status flutter|awk '{print $1}'|sed 's/-//'`
echo "Build for commit https://github.com/flutter/flutter/commit/$FLUTTER_ID" > release.txt  
echo "RELEASE_ID=$FLUTTER_ID" >> $GITHUB_ENV

mkdir files
for dir in artifacts/*; do
  cp `find $dir|grep .zip$` files/`basename $dir`.zip 
done

