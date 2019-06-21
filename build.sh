#!/bin/bash
RELEASE_VERSION=$1
if [ "$RELEASE_VERSION" == "" ]; then
  echo "First argument must be release version to compile"; exit 1
fi
set -e

mkdir -p ~/rpmbuild/SOURCES

wget https://github.com/p-gen/smenu/archive/v${RELEASE_VERSION}.tar.gz -O ~/rpmbuild/SOURCES/v${RELEASE_VERSION}.tar.gz

if [ -f "smenu.spec" ]; then
  unlink smenu.spec
fi

cp smenu.spec.template .smenu.spec

sed -i "s/__RELEASE_VERSION__/${RELEASE_VERSION}/g" .smenu.spec


rpmbuild -bb .smenu.spec
